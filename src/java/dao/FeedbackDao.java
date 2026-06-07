package dao;

import config.ConexionBD;
import model.feedback;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class FeedbackDao {

    // C - CREATE: Insertar una nueva reseña
    public boolean insertarFeedback(feedback fbk) {
        Connection conn = null;
        PreparedStatement ps = null;
        // En el SQL usamos los nombres de las columnas de tu BD (id_usuario, comentario, fecha_envio)
        String sql = "INSERT INTO Feedback (id_usuario, comentario, fecha_envio) VALUES (?, ?, NOW())";
        
        try {
            conn = ConexionBD.getConexion();
            if (conn == null) {
                System.out.println("⚠️ [FeedbackDao] Error: La conexión con la BD es nula.");
                return false;
            }
            
            ps = conn.prepareStatement(sql);
            ps.setInt(1, fbk.getIdUsuario());
            ps.setString(2, fbk.getComentario());
            
            int filasAffected = ps.executeUpdate();
            return filasAffected > 0;
            
        } catch (SQLException e) {
            System.out.println("⚠️ [FeedbackDao] Error al insertar en la base de datos: " + e.getMessage());
            e.printStackTrace();
            return false;
        } finally {
            cerrarRecursos(null, ps, conn);
        }
    }

    // R - READ: Listar los comentarios específicos de un usuario logueado
    public List<feedback> listarPorUsuario(int idUsuario) {
        List<feedback> lista = new ArrayList<>();
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        String sql = "SELECT * FROM Feedback WHERE id_usuario = ? ORDER BY fecha_envio DESC";
        
        try {
            conn = ConexionBD.getConexion();
            if (conn == null) return lista;
            
            ps = conn.prepareStatement(sql);
            ps.setInt(1, idUsuario);
            rs = ps.executeQuery();
            
            while (rs.next()) {
                feedback f = new feedback();
                f.setIdFeedback(rs.getInt("id_feedback"));
                
                
                f.setIdUsuario(rs.getInt("id_usuario"));
                
                f.setComentario(rs.getString("comentario"));
                f.setFechaEnvio(rs.getTimestamp("fecha_envio")); 
                lista.add(f);
            }
        } catch (SQLException e) {
            System.out.println("⚠️ [FeedbackDao] Error al listar comentarios: " + e.getMessage());
            e.printStackTrace();
        } finally {
            cerrarRecursos(rs, ps, conn);
        }
        return lista;
    }

    private void cerrarRecursos(ResultSet rs, PreparedStatement ps, Connection conn) {
        try {
            if (rs != null) rs.close();
            if (ps != null) ps.close();
            if (conn != null) conn.close();
        } catch (SQLException ex) {
            System.out.println("⚠️ Error al cerrar recursos de BD: " + ex.getMessage());
        }
    }
    
    // U - UPDATE: Modificar el texto de un comentario existente
public boolean actualizarFeedback(int idFeedback, String nuevoComentario) {
    Connection conn = null;
    PreparedStatement ps = null;
    String sql = "UPDATE Feedback SET comentario = ?, fecha_envio = NOW() WHERE id_feedback = ?";
    
    try {
        conn = ConexionBD.getConexion();
        if (conn == null) return false;
        
        ps = conn.prepareStatement(sql);
        ps.setString(1, nuevoComentario);
        ps.setInt(2, idFeedback);
        
        return ps.executeUpdate() > 0;
    } catch (SQLException e) {
        System.out.println("⚠️ [FeedbackDao] Error al actualizar reseña: " + e.getMessage());
        e.printStackTrace();
        return false;
    } finally {
        cerrarRecursos(null, ps, conn);
    }
}

// D - DELETE: Eliminar por completo una reseña de la base de datos
public boolean eliminarFeedback(int idFeedback) {
    Connection conn = null;
    PreparedStatement ps = null;
    String sql = "DELETE FROM Feedback WHERE id_feedback = ?";
    
    try {
        conn = ConexionBD.getConexion();
        if (conn == null) return false;
        
        ps = conn.prepareStatement(sql);
        ps.setInt(1, idFeedback);
        
        return ps.executeUpdate() > 0;
    } catch (SQLException e) {
        System.out.println("⚠️ [FeedbackDao] Error al eliminar reseña: " + e.getMessage());
        e.printStackTrace();
        return false;
    } finally {
        cerrarRecursos(null, ps, conn);
    }
}
}