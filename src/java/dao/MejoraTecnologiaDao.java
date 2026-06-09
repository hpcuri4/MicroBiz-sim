package dao;

import config.ConexionBD;
import model.MejoraTecnologia;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class MejoraTecnologiaDao {

    // 1. READ: Listar las mejoras tecnológicas de un negocio en específico
    public List<MejoraTecnologia> listarPorNegocio(int idNegocio) {
        List<MejoraTecnologia> lista = new ArrayList<>();
        String sql = "SELECT * FROM Mejora_Tecnologia WHERE id_negocio = ?";
        
        try (Connection conn = ConexionBD.getConexion();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            
            ps.setInt(1, idNegocio);
            
            try (ResultSet rs = ps.executeQuery()) {
                while (rs.next()) {
                    MejoraTecnologia mt = new MejoraTecnologia();
                    mt.setIdMejora(rs.getInt("id_mejora"));
                    mt.setIdNegocio(rs.getInt("id_negocio"));
                    mt.setNombreMejora(rs.getString("nombre_mejora"));
                    mt.setAreaDespliegue(rs.getString("area_despliegue"));
                    mt.setImpactoOperacion(rs.getString("impacto_operacion"));
                    mt.setNivelOptimizacion(rs.getInt("nivel_optimizacion"));
                    mt.setCostoActualizacion(rs.getBigDecimal("costo_actualizacion"));
                    mt.setEstadoMejora(rs.getString("estado_mejora"));
                    lista.add(mt);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return lista;
    }

    // 2. CREATE: Adquirir / Registrar una nueva mejora tecnológica
    public boolean insertar(MejoraTecnologia mt) {
        String sql = "INSERT INTO Mejora_Tecnologia (id_negocio, nombre_mejora, area_despliegue, impacto_operacion, nivel_optimizacion, costo_actualizacion, estado_mejora) VALUES (?, ?, ?, ?, ?, ?, ?)";
        try (Connection conn = ConexionBD.getConexion();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            
            ps.setInt(1, mt.getIdNegocio());
            ps.setString(2, mt.getNombreMejora());
            ps.setString(3, mt.getAreaDespliegue());
            ps.setString(4, mt.getImpactoOperacion());
            ps.setInt(5, mt.getNivelOptimizacion()); // Por defecto inicia en 1 según tu BD, pero permite personalizarlo
            ps.setBigDecimal(6, mt.getCostoActualizacion());
            ps.setString(7, mt.getEstadoMejora() != null ? mt.getEstadoMejora() : "Activo");
            
            return ps.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    // 3. UPDATE: Actualizar los datos o subir el nivel de optimización de una mejora
    public boolean actualizar(MejoraTecnologia mt) {
        String sql = "UPDATE Mejora_Tecnologia SET id_negocio = ?, nombre_mejora = ?, area_despliegue = ?, impacto_operacion = ?, nivel_optimizacion = ?, costo_actualizacion = ?, estado_mejora = ? WHERE id_mejora = ?";
        try (Connection conn = ConexionBD.getConexion();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            
            ps.setInt(1, mt.getIdNegocio());
            ps.setString(2, mt.getNombreMejora());
            ps.setString(3, mt.getAreaDespliegue());
            ps.setString(4, mt.getImpactoOperacion());
            ps.setInt(5, mt.getNivelOptimizacion());
            ps.setBigDecimal(6, mt.getCostoActualizacion());
            ps.setString(7, mt.getEstadoMejora());
            ps.setInt(8, mt.getIdMejora()); // Filtro identificador
            
            return ps.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    // 4. DELETE: Desinstalar / Eliminar físicamente un registro de mejora
    public boolean eliminar(int idMejora) {
        String sql = "DELETE FROM Mejora_Tecnologia WHERE id_mejora = ?";
        try (Connection conn = ConexionBD.getConexion();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            
            ps.setInt(1, idMejora);
            
            return ps.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }
    
    public MejoraTecnologia buscarPorId(int idMejora) {
        String sql = "SELECT * FROM Mejora_Tecnologia WHERE id_mejora = ?";
        
        try (Connection conn = ConexionBD.getConexion();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            
            ps.setInt(1, idMejora);
            
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    MejoraTecnologia mt = new MejoraTecnologia();
                    mt.setIdMejora(rs.getInt("id_mejora"));
                    mt.setIdNegocio(rs.getInt("id_negocio"));
                    mt.setNombreMejora(rs.getString("nombre_mejora"));
                    mt.setAreaDespliegue(rs.getString("area_despliegue"));
                    mt.setImpactoOperacion(rs.getString("impacto_operacion"));
                    mt.setNivelOptimizacion(rs.getInt("nivel_optimizacion"));
                    mt.setCostoActualizacion(rs.getBigDecimal("costo_actualizacion"));
                    mt.setEstadoMejora(rs.getString("estado_mejora"));
                    return mt;
                }
            }
        } catch (SQLException e) {
            System.out.println("❌ Error en MejoraTecnologiaDao.buscarPorId: " + e.getMessage());
            e.printStackTrace();
        }
        return null;
    }
    
    
}