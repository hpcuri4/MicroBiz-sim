package dao;

import java.math.BigDecimal;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import model.Simulacion;

public class SimulacionDao {
    
    public List<Simulacion> listarTodasLasSimulaciones() {
    List<Simulacion> lista = new ArrayList<>();
    String sql = "SELECT * FROM Simulacion ORDER BY id_simulacion DESC";
    try (Connection conn = config.ConexionBD.getConexion();
         PreparedStatement ps = conn.prepareStatement(sql);
         ResultSet rs = ps.executeQuery()) {
        while (rs.next()) {
            Simulacion sim = new Simulacion();
            sim.setIdSimulacion(rs.getInt("id_simulacion"));
            sim.setIdNegocio(rs.getInt("id_negocio"));
            sim.setTurnoActual(rs.getInt("turno_actual"));
            sim.setIngresos(rs.getBigDecimal("ingresos"));
            sim.setCostosOperativos(rs.getBigDecimal("costos_operativos"));
            sim.setGananciasNetas(rs.getBigDecimal("ganancias_netas"));
            sim.setClientesGanados(rs.getInt("clientes_ganados"));
            sim.setReputacion(rs.getBigDecimal("reputacion"));
            lista.add(sim);
        }
    } catch (SQLException e) { e.printStackTrace(); }
    return lista;
}

    // 1. OBTENER EL ESTADO ACTUAL DE LA SIMULACIÓN
    public Simulacion obtenerSimulacionActual(int idNegocio) {
        String sql = "SELECT * FROM Simulacion WHERE id_negocio = ? ORDER BY id_simulacion DESC LIMIT 1";
        try (Connection conn = config.ConexionBD.getConexion();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            
            ps.setInt(1, idNegocio);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    Simulacion sim = new Simulacion();
                    sim.setIdSimulacion(rs.getInt("id_simulacion"));
                    sim.setIdNegocio(rs.getInt("id_negocio"));
                    sim.setTurnoActual(rs.getInt("turno_actual"));
                    sim.setIngresos(rs.getBigDecimal("ingresos"));
                    sim.setCostosOperativos(rs.getBigDecimal("costos_operativos"));
                    sim.setGananciasNetas(rs.getBigDecimal("ganancias_netas"));
                    sim.setClientesGanados(rs.getInt("clientes_ganados"));
                    sim.setReputacion(rs.getBigDecimal("reputacion"));
                    return sim;
                }
            }
        } catch (SQLException e) {
            System.out.println("❌ Error al obtener simulación: " + e.getMessage());
        }
        return null;
    }

    // 2. MOTOR DE AVANCE DE TURNO (Cierre mensual/semanal)
    public boolean avanzarTurno(int idSimulacion, int idNegocio) {
        Connection conn = null;
        try {
            conn = config.ConexionBD.getConexion();
            conn.setAutoCommit(false); // Iniciamos transacción para que no se cobren cosas a medias

            // --- PASO A: PROCESAR DECISIONES PENDIENTES ---
            // Restamos el costo de las decisiones tomadas al balance del negocio
            String sqlDecisiones = "UPDATE Negocio n " +
                                   "JOIN Decision_Jugador dj ON dj.id_simulacion = ? " +
                                   "SET n.balance_actual = n.balance_actual - dj.costo_decision " +
                                   "WHERE n.id_negocio = ? AND dj.ejecutada = FALSE";
            try (PreparedStatement ps = conn.prepareStatement(sqlDecisiones)) {
                ps.setInt(1, idSimulacion);
                ps.setInt(2, idNegocio);
                ps.executeUpdate();
            }

            // Marcar esas decisiones como ya ejecutadas para que no vuelvan a cobrar el siguiente turno
            String sqlMarcarDecisiones = "UPDATE Decision_Jugador SET ejecutada = TRUE WHERE id_simulacion = ? AND ejecutada = FALSE";
            try (PreparedStatement ps = conn.prepareStatement(sqlMarcarDecisiones)) {
                ps.setInt(1, idSimulacion);
                ps.executeUpdate();
            }

            // --- PASO B: EVENTO ALEATORIO TURNERO ---
            // Buscamos un evento pendiente de forma aleatoria (RAND())
            String sqlBuscarEvento = "SELECT * FROM Evento_Turno WHERE id_simulacion = ? AND estado_evento = 'PENDIENTE' ORDER BY RAND() LIMIT 1";
            int idEvento = 0;
            BigDecimal impactoFinanciero = BigDecimal.ZERO;

            try (PreparedStatement ps = conn.prepareStatement(sqlBuscarEvento)) {
                ps.setInt(1, idSimulacion);
                try (ResultSet rs = ps.executeQuery()) {
                    if (rs.next()) {
                        idEvento = rs.getInt("id_evento_instancia");
                        impactoFinanciero = rs.getBigDecimal("impacto_financiero");
                    }
                }
            }

            // Si encontramos un evento, impactamos el negocio y cerramos el evento
            if (idEvento != 0) {
                String sqlAplicarEvento = "UPDATE Negocio SET balance_actual = balance_actual + ? WHERE id_negocio = ?";
                try (PreparedStatement ps = conn.prepareStatement(sqlAplicarEvento)) {
                    ps.setBigDecimal(1, impactoFinanciero);
                    ps.setInt(2, idNegocio);
                    ps.executeUpdate();
                }

                String sqlCerrarEvento = "UPDATE Evento_Turno SET estado_evento = 'LANZADO' WHERE id_evento_instancia = ?";
                try (PreparedStatement ps = conn.prepareStatement(sqlCerrarEvento)) {
                    ps.setInt(1, idEvento);
                    ps.executeUpdate();
                }
            }

            // --- PASO C: AVANZAR CONTADOR DE TURNO ---
            String sqlIncrementarTurno = "UPDATE Simulacion SET turno_actual = turno_actual + 1 WHERE id_simulacion = ?";
            try (PreparedStatement ps = conn.prepareStatement(sqlIncrementarTurno)) {
                ps.setInt(1, idSimulacion);
                ps.executeUpdate();
            }

            conn.commit(); // Si todo corrió bien, guardamos los datos permanentemente
            return true;

        } catch (SQLException e) {
            if (conn != null) {
                try { conn.rollback(); } catch (SQLException ex) { ex.printStackTrace(); }
            }
            System.out.println("❌ Error crítico en el avance de turno: " + e.getMessage());
            return false;
        } finally {
            if (conn != null) {
                try { conn.close(); } catch (SQLException e) { e.printStackTrace(); }
            }
        }
    }
    
    // 1. READ: Obtener todas las simulaciones de la BD para la tabla del jugador

// 2. CREATE: Insertar una simulación limpia desde cero
public boolean crearNuevaSimulacion(int idNegocio) {
    String sql = "INSERT INTO Simulacion (id_negocio, turno_actual, ingresos, costos_operativos, ganancias_netas, clientes_ganados, reputacion) " +
                 "VALUES (?, 1, 0.00, 0.00, 0.00, 0, 100.00)";
    try (Connection conn = config.ConexionBD.getConexion();
         PreparedStatement ps = conn.prepareStatement(sql)) {
        ps.setInt(1, idNegocio);
        return ps.executeUpdate() > 0;
    } catch (SQLException e) { e.printStackTrace(); return false; }
}

// 3. DELETE: Eliminar la partida seleccionada
public boolean eliminarSimulacion(int idSimulacion) {
    String sql = "DELETE FROM Simulacion WHERE id_simulacion = ?";
    try (Connection conn = config.ConexionBD.getConexion();
         PreparedStatement ps = conn.prepareStatement(sql)) {
        ps.setInt(1, idSimulacion);
        return ps.executeUpdate() > 0;
    } catch (SQLException e) { e.printStackTrace(); return false; }
}

// 4. UPDATE: Modificar métricas manualmente desde el prompt
public boolean actualizarMetricasManual(int idSimulacion, int turno, double reputacion) {
    String sql = "UPDATE Simulacion SET turno_actual = ?, reputacion = ? WHERE id_simulacion = ?";
    try (Connection conn = config.ConexionBD.getConexion();
         PreparedStatement ps = conn.prepareStatement(sql)) {
        ps.setInt(1, turno);
        ps.setDouble(2, reputacion);
        ps.setInt(3, idSimulacion);
        return ps.executeUpdate() > 0;
    } catch (SQLException e) { e.printStackTrace(); return false; }
}

// 5. CONTROLADOR DE FLUJO: Revisa si hay eventos 'PENDIENTE' asociados a la simulación
public String verificarEventoPendiente(int idSimulacion) {
    String sql = "SELECT tipo_evento FROM Evento_Turno WHERE id_simulacion = ? AND estado_evento = 'PENDIENTE' LIMIT 1";
    try (Connection conn = config.ConexionBD.getConexion();
         PreparedStatement ps = conn.prepareStatement(sql)) {
        ps.setInt(1, idSimulacion);
        try (ResultSet rs = ps.executeQuery()) {
            if (rs.next()) {
                return rs.getString("tipo_evento"); // Puede devolver "FINANCIERO" o "REPUTACION"
            }
        }
    } catch (SQLException e) { e.printStackTrace(); }
    return "NINGUNO"; 
}
}