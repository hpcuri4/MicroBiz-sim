package dao;

import config.ConexionBD;
import model.usuario;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.ResultSet;

public class UsuarioDao {

    // Método para registrar / dar de alta un nuevo usuario (Socio)
  // ⚠️ Fíjate bien aquí: "usuario" debe ir en minúsculas para que coincida con tu molde
public boolean registrarUsuario(usuario usr) { 
    Connection conn = null;
    PreparedStatement ps = null;
    String sql = "INSERT INTO Usuario (nombre_completo, correo_electronico, contrasena) VALUES (?, ?, ?)";
    
    try {
        conn = ConexionBD.getConexion();
        
        if (conn == null) {
            return false;
        }
        
        conn.setAutoCommit(true); // Para asegurar que impacte en MySQL inmediatamente
        
        ps = conn.prepareStatement(sql);
        
        // ¡Ahora sí, estas líneas se pondrán en verde/negro y sin errores!
        ps.setString(1, usr.getNombreCompleto());
        ps.setString(2, usr.getCorreoElectronico());
        ps.setString(3, usr.getContrasena());
        
        int filasInsertadas = ps.executeUpdate();
        System.out.println("Filas insertadas reales: " + filasInsertadas);
        
        return filasInsertadas > 0;
        
    } catch (SQLException e) {
        System.out.println("Error en UsuarioDAO al registrar: " + e.getMessage());
        e.printStackTrace();
        return false;
    } finally {
        try {
            if (ps != null) ps.close();
            if (conn != null) conn.close();
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
    }
}

public usuario validarUsuario(String correo, String contrasena) {
    Connection conn = null;
    PreparedStatement ps = null;
    ResultSet rs = null;
    usuario usr = null;
    
    String sql = "SELECT * FROM Usuario WHERE correo_electronico = ? AND contrasena = ?";
    
    try {
        conn = ConexionBD.getConexion();
        if (conn == null) {
            System.out.println("⚠️ [UsuarioDao] Error: Conexión nula al validar.");
            return null;
        }
        
        ps = conn.prepareStatement(sql);
        ps.setString(1, correo);
        ps.setString(2, contrasena);
        
        rs = ps.executeQuery();
        
        if (rs.next()) {
    usr = new usuario();
    
    // 🔎 RASTREO EN CONSOLA ACTUALIZADO
    System.out.println("=== [UsuarioDao] ¡Usuario encontrado en la BD! ===");
    
    // ⚠️ CORRECCIÓN AQUÍ: Cambiamos "idUsuario" por "id_usuario"
    usr.setIdUsuario(rs.getInt("id_usuario")); 
    
    usr.setNombreCompleto(rs.getString("nombre_completo"));
    usr.setCorreoElectronico(rs.getString("correo_electronico"));
    
} else {
            System.out.println("⚠️ [UsuarioDao] No se encontró ningún usuario con esas credenciales.");
        }
        
    } catch (SQLException e) {
        System.out.println("⚠️ [UsuarioDao] Error en la consulta SQL: " + e.getMessage());
        e.printStackTrace();
    } finally {
        try {
            if (rs != null) rs.close();
            if (ps != null) ps.close();
            if (conn != null) conn.close();
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
    }
    return usr; 
}



}