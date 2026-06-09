package dao;

import config.ConexionBD;
import java.math.BigDecimal;
import model.Credito; // (Deberás crear este modelo clonando la estructura)
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class CreditoDao {

    // Cambia esto en tu CreditoDao
public List<Credito> listarPorNegocio(int idNegocio) {
    List<Credito> lista = new ArrayList<>();
    // AÑADIMOS: AND turnos_restantes > 0
    String sql = "SELECT * FROM Credito WHERE id_negocio = ? AND estado_credito = 'ACTIVO' AND turnos_restantes > 0";
    try (Connection conn = config.ConexionBD.getConexion();
         PreparedStatement ps = conn.prepareStatement(sql)) {
        
        ps.setInt(1, idNegocio);
        ResultSet rs = ps.executeQuery();
        
        while (rs.next()) {
            Credito c = new Credito();
            c.setIdCredito(rs.getInt("id_credito"));
            c.setIdNegocio(rs.getInt("id_negocio"));
            c.setNombrePrestamo(rs.getString("nombre_prestamo"));
            
            // --- BLINDAJE CONTRA NULLS ---
            // Si el valor en BD es NULL, asignamos BigDecimal.ZERO por defecto
            BigDecimal solicitado = rs.getBigDecimal("monto_solicitado");
            c.setMontoSolicitado(solicitado != null ? solicitado : BigDecimal.ZERO);
            
            BigDecimal restante = rs.getBigDecimal("monto_restante");
            c.setMontoRestante(restante != null ? restante : BigDecimal.ZERO);
            
            BigDecimal tasa = rs.getBigDecimal("tasa_interes");
            c.setTasaInteres(tasa != null ? tasa : BigDecimal.ZERO);
            // ------------------------------
            
            c.setPlazoTurnos(rs.getInt("plazo_turnos"));
            c.setTurnosRestantes(rs.getInt("turnos_restantes"));
            c.setEstadoCredito(rs.getString("estado_credito"));
            
            lista.add(c);
        }
    } catch (SQLException e) { 
        System.out.println("❌ Error crítico en listarPorNegocio: " + e.getMessage());
        e.printStackTrace(); 
    }
    return lista;
}
    // 🟢 CREATE: Solicitar préstamo (Inserta crédito e INYECTA dinero al negocio)
    public boolean solicitarPrestamo(int idNegocio, String nombre, double monto, double tasa, int turnos) {
        String sqlCredito = "INSERT INTO Credito (id_negocio, nombre_prestamo, monto_solicitado, monto_restante, tasa_interes, plazo_turnos, turnos_restantes, estado_credito) VALUES (?, ?, ?, ?, ?, ?, ?, 'ACTIVO')";
        String sqlNegocio = "UPDATE Negocio SET balance_actual = balance_actual + ? WHERE id_negocio = ?";
        
        Connection conn = null;
        try {
            conn = ConexionBD.getConexion();
            conn.setAutoCommit(false); // Transacción para asegurar ambas operaciones

            // 1. Insertar el Crédito
            try (PreparedStatement psC = conn.prepareStatement(sqlCredito)) {
                psC.setInt(1, idNegocio);
                psC.setString(2, nombre);
                psC.setDouble(3, monto);
                psC.setDouble(4, monto); // Al inicio, el restante es igual al solicitado
                psC.setDouble(5, tasa);
                psC.setInt(6, turnos);
                psC.setInt(7, turnos);
                psC.executeUpdate();
            }

            // 2. Sumar fondos al Negocio
            try (PreparedStatement psN = conn.prepareStatement(sqlNegocio)) {
                psN.setDouble(1, monto);
                psN.setInt(2, idNegocio);
                psN.executeUpdate();
            }

            conn.commit();
            return true;
        } catch (SQLException e) {
            if (conn != null) try { conn.rollback(); } catch (SQLException ex) { ex.printStackTrace(); }
            System.out.println("❌ Error en solicitarPrestamo: " + e.getMessage());
            return false;
        }
    }

   
    // 🟡 UPDATE: Pagar abono parcial o pago de turno (Resta del negocio y disminuye deuda)
    public boolean abonarA_Credito(int idCredito, int idNegocio, double abono, boolean esUltimo) {
    try (Connection conn = config.ConexionBD.getConexion()) {
        // 1. Primero verificamos cuántos turnos quedan
        String sqlCheck = "SELECT turnos_restantes FROM Credito WHERE id_credito = ?";
        PreparedStatement psCheck = conn.prepareStatement(sqlCheck);
        psCheck.setInt(1, idCredito);
        ResultSet rs = psCheck.executeQuery();
        
        if (rs.next()) {
            int turnosRestantes = rs.getInt("turnos_restantes");
            
            // 2. Si ya es 0 o menos, impedimos el pago
            if (turnosRestantes <= 0) {
                System.out.println("❌ Intento de pago en crédito ya finalizado.");
                return false; 
            }
        }

        // 3. Si llega aquí, es seguro descontar
        String sql = "UPDATE Credito SET monto_restante = monto_restante - ?, turnos_restantes = turnos_restantes - 1 WHERE id_credito = ?";
        PreparedStatement ps = conn.prepareStatement(sql);
        ps.setDouble(1, abono);
        ps.setInt(2, idCredito);
        return ps.executeUpdate() > 0;
        
    } catch (SQLException e) {
        e.printStackTrace();
        return false;
    }
}

    // 🔴 DELETE: Liquidar totalmente (Paga el monto restante de golpe y remueve o cierra el registro)
   public boolean liquidarTotalmente(int idCredito, int idNegocio) {
    // 1. SQL para obtener el monto que se debe antes de liquidar
    String sqlGetMonto = "SELECT monto_restante FROM Credito WHERE id_credito = ?";
    // 2. SQL para marcar crédito como pagado
    String sqlUpdateCredito = "UPDATE Credito SET estado_credito = 'PAGADO', monto_restante = 0, turnos_restantes = 0 WHERE id_credito = ?";
    // 3. SQL para restar el dinero al negocio
    String sqlUpdateNegocio = "UPDATE Negocio SET balance_actual = balance_actual - ? WHERE id_negocio = ?";
    
    double montoALiquidar = 0;

    try (Connection conn = config.ConexionBD.getConexion()) {
        conn.setAutoCommit(false); // Iniciamos transacción
        
        // Paso A: Obtener el monto actual del crédito
        try (PreparedStatement psGet = conn.prepareStatement(sqlGetMonto)) {
            psGet.setInt(1, idCredito);
            ResultSet rs = psGet.executeQuery();
            if (rs.next()) {
                montoALiquidar = rs.getDouble("monto_restante");
            }
        }
        
        // Paso B: Restar el dinero al negocio
        try (PreparedStatement psNeg = conn.prepareStatement(sqlUpdateNegocio)) {
            psNeg.setDouble(1, montoALiquidar);
            psNeg.setInt(2, idNegocio);
            psNeg.executeUpdate();
        }
        
        // Paso C: Marcar crédito como pagado
        try (PreparedStatement psCre = conn.prepareStatement(sqlUpdateCredito)) {
            psCre.setInt(1, idCredito);
            psCre.executeUpdate();
        }
        
        conn.commit(); // Confirmamos los cambios en ambos lados
        return true;
        
    } catch (SQLException e) {
        System.out.println("❌ Error en la liquidación: " + e.getMessage());
        return false;
    }
}
   
   public double obtenerMontoRestante(int idCredito) {
    String sql = "SELECT monto_restante FROM Credito WHERE id_credito = ?";
    try (Connection conn = config.ConexionBD.getConexion();
         PreparedStatement ps = conn.prepareStatement(sql)) {
        ps.setInt(1, idCredito);
        ResultSet rs = ps.executeQuery();
        if (rs.next()) return rs.getDouble("monto_restante");
    } catch (SQLException e) { e.printStackTrace(); }
    return 0;
}
}