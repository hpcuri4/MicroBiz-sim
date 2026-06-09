package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import model.negocio;
import config.ConexionBD; // Asegúrate de que apunte a tu clase de conexión real

public class NegocioDao {

    // 🟢 CREATE: Insertar un nuevo negocio
    public boolean insertarNegocio(negocio n) {
        String sql = "INSERT INTO Negocio (id_usuario, nombre_negocio, tipo_negocio, capital_inicial_invertido, balance_actual, ganancia_esperada, region, nivel_riesgo) VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
        try (Connection conn = ConexionBD.getConexion();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            
            ps.setInt(1, n.getIdUsuario());
            ps.setString(2, n.getNombreNegocio());
            ps.setString(3, n.getTipoNegocio());
            ps.setBigDecimal(4, n.getCapitalInicialInvertido());
            ps.setBigDecimal(5, n.getBalanceActual());
            ps.setBigDecimal(6, n.getGananciaEsperada());
            ps.setString(7, n.getRegion());
            ps.setString(8, n.getNivelRiesgo());
            
            return ps.executeUpdate() > 0;
        } catch (SQLException e) {
            System.out.println("❌ Error al insertar negocio: " + e.getMessage());
            e.printStackTrace();
            return false;
        }
    }

    // 🔵 READ: Listar los negocios del usuario activo (Estricto por ID)
    public List<negocio> listarPorUsuario(int idUsuario) {
        List<negocio> lista = new ArrayList<>();
        String sql = "SELECT id_negocio, id_usuario, nombre_negocio, tipo_negocio, capital_inicial_invertido, balance_actual, ganancia_esperada, region, nivel_riesgo, tiempo_activo_dias FROM Negocio WHERE id_usuario = ? ORDER BY id_negocio DESC";
        
        try (Connection conn = ConexionBD.getConexion();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            
            ps.setInt(1, idUsuario);
            try (ResultSet rs = ps.executeQuery()) {
                while (rs.next()) {
                    negocio n = new negocio();
                    n.setIdNegocio(rs.getInt("id_negocio"));
                    n.setIdUsuario(rs.getInt("id_usuario"));
                    n.setNombreNegocio(rs.getString("nombre_negocio"));
                    n.setTipoNegocio(rs.getString("tipo_negocio"));
                    n.setCapitalInicialInvertido(rs.getBigDecimal("capital_inicial_invertido"));
                    n.setBalanceActual(rs.getBigDecimal("balance_actual"));
                    n.setGananciaEsperada(rs.getBigDecimal("ganancia_esperada"));
                    n.setRegion(rs.getString("region"));
                    n.setNivelRiesgo(rs.getString("nivel_riesgo"));
                    n.setTiempoActivoDias(rs.getInt("tiempo_activo_dias"));
                    lista.add(n);
                }
            }
        } catch (SQLException e) {
            System.out.println("❌ Error al listar negocios: " + e.getMessage());
            e.printStackTrace();
        }
        return lista;
    }

    // 🟡 UPDATE: Modificar datos principales del negocio (Nombre, Tipo, Capital, Balance, Ganancia, Región y Riesgo)
    public boolean actualizarNegocio(negocio n) {
        String sql = "UPDATE Negocio SET nombre_negocio = ?, tipo_negocio = ?, capital_inicial_invertido = ?, balance_actual = ?, ganancia_esperada = ?, region = ?, nivel_riesgo = ? WHERE id_negocio = ?";
        try (Connection conn = ConexionBD.getConexion();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            
            ps.setString(1, n.getNombreNegocio());
            ps.setString(2, n.getTipoNegocio());
            ps.setBigDecimal(3, n.getCapitalInicialInvertido());
            ps.setBigDecimal(4, n.getBalanceActual());
            ps.setBigDecimal(5, n.getGananciaEsperada());
            ps.setString(6, n.getRegion());
            ps.setString(7, n.getNivelRiesgo());
            ps.setInt(8, n.getIdNegocio());
            
            return ps.executeUpdate() > 0;
        } catch (SQLException e) {
            System.out.println("❌ Error al actualizar negocio: " + e.getMessage());
            e.printStackTrace();
            return false;
        }
    }

    // 🔴 DELETE: Eliminar un negocio por completo
    public boolean eliminarNegocio(int idNegocio) {
        String sql = "DELETE FROM Negocio WHERE id_negocio = ?";
        try (Connection conn = ConexionBD.getConexion();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            
            ps.setInt(1, idNegocio);
            return ps.executeUpdate() > 0;
        } catch (SQLException e) {
            System.out.println("❌ Error al eliminar negocio: " + e.getMessage());
            e.printStackTrace();
            return false;
        }
    }
    
    public List<negocio> listarNegociosPorUsuario(int idUsuario) {
        List<negocio> lista = new ArrayList<>();
        String sql = "SELECT * FROM negocio WHERE id_usuario = ?";
        
        // Ajusta "Conexion.getConexion()" al nombre real de tu clase de conexión externa
        try (Connection con = ConexionBD.getConexion(); 
             PreparedStatement ps = con.prepareStatement(sql)) {
            
            ps.setInt(1, idUsuario);
            try (ResultSet rs = ps.executeQuery()) {
                while (rs.next()) {
                    negocio n = new negocio();
                    n.setIdNegocio(rs.getInt("id_negocio"));
                    n.setIdUsuario(rs.getInt("id_usuario"));
                    n.setNombreNegocio(rs.getString("nombre_negocio"));
                    n.setTipoNegocio(rs.getString("tipo_negocio"));
                    n.setCapitalInicialInvertido(rs.getBigDecimal("capital_inicial_invertido")); 
                    n.setBalanceActual(rs.getBigDecimal("balance_actual"));
                    n.setGananciaEsperada(rs.getBigDecimal("ganancia_esperada"));
                    n.setRegion(rs.getString("region"));
                    n.setNivelRiesgo(rs.getString("nivel_riesgo"));
                    n.setTiempoActivoDias(rs.getInt("tiempo_activo_dias"));
                    
                    lista.add(n);
                }
            }
        } catch (Exception e) {
            System.out.println("❌ Error en NegocioDao.listarNegociosPorUsuario: " + e.getMessage());
            e.printStackTrace();
        }
        return lista;
    }
    
    public List<negocio> listarTodosLosNegociosTest() {
    List<negocio> lista = new ArrayList<>();
    // Usamos 'negocio' en minúsculas por si acaso
    String sql = "SELECT * FROM negocio"; 
    
    try (Connection conn = ConexionBD.getConexion();
         PreparedStatement ps = conn.prepareStatement(sql);
         ResultSet rs = ps.executeQuery()) {
        
        while (rs.next()) {
            negocio n = new negocio();
            n.setIdNegocio(rs.getInt("id_negocio"));
            n.setNombreNegocio(rs.getString("nombre_negocio"));
            
            // Usamos un bloque try-catch interno para cada columna delicada.
            // Si 'tipo_negocio' o el capital fallan, ¡el negocio se agregará de todos modos!
            try {
                n.setTipoNegocio(rs.getString("tipo_negocio"));
            } catch (Exception e) {
                n.setTipoNegocio("Desconocido");
            }
            
            lista.add(n);
        }
    } catch (SQLException e) {
        System.out.println("❌ ERROR CRÍTICO EN TEST: " + e.getMessage());
        e.printStackTrace();
    }
    return lista;
}
    
 // 🔍 NUEVO MÉTODO SELECT POR ID (Faltante para resolver tu error)
    public negocio buscarPorId(int idNegocio) {
        String sql = "SELECT * FROM Negocio WHERE id_negocio = ?";
        try (Connection conn = ConexionBD.getConexion();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            
            ps.setInt(1, idNegocio);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    negocio n = new negocio();
                    n.setIdNegocio(rs.getInt("id_negocio"));
                    n.setIdUsuario(rs.getInt("id_usuario"));
                    n.setNombreNegocio(rs.getString("nombre_negocio"));
                    n.setTipoNegocio(rs.getString("tipo_negocio"));
                    n.setCapitalInicialInvertido(rs.getBigDecimal("capital_inicial_invertido"));
                    n.setBalanceActual(rs.getBigDecimal("balance_actual"));
                    n.setGananciaEsperada(rs.getBigDecimal("ganancia_esperada"));
                    n.setRegion(rs.getString("region"));
                    n.setNivelRiesgo(rs.getString("nivel_riesgo"));
                    n.setTiempoActivoDias(rs.getInt("tiempo_activo_dias"));
                    return n; // Retorna el negocio encontrado
                }
            }
        } catch (SQLException e) {
            System.out.println("❌ Error en NegocioDao.buscarPorId: " + e.getMessage());
            e.printStackTrace();
        }
        return null; // Si no lo encuentra, retorna null de forma segura
    }
}
    
