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

// ==========================================================================
// NUEVOS MÉTODOS PARA EL CRUD DE CONFIGURACIÓN DE LA CUENTA
// ==========================================================================

// 🔵 READ: Obtener los datos más frescos del usuario activo por su ID
public usuario obtenerPorId(int idUsuario) {
    Connection conn = null;
    PreparedStatement ps = null;
    ResultSet rs = null;
    usuario usr = null;
    String sql = "SELECT id_usuario, nombre_completo, correo_electronico, contrasena FROM Usuario WHERE id_usuario = ?";
    
    try {
        conn = ConexionBD.getConexion();
        if (conn != null) {
            ps = conn.prepareStatement(sql);
            ps.setInt(1, idUsuario);
            rs = ps.executeQuery();
            
            if (rs.next()) {
                usr = new usuario();
                usr.setIdUsuario(rs.getInt("id_usuario"));
                usr.setNombreCompleto(rs.getString("nombre_completo"));
                usr.setCorreoElectronico(rs.getString("correo_electronico"));
                usr.setContrasena(rs.getString("contrasena"));
            }
        }
    } catch (SQLException e) {
        System.out.println("Error en UsuarioDao al obtenerPorId: " + e.getMessage());
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

// 🟡 UPDATE: Modificar Perfil (Nombre Completo y Correo Electrónico)
// 🟡 UPDATE: Modificar Perfil manejando cambio de contraseña opcional
public boolean actualizarPerfil(usuario usr, boolean actualizarPassword) {
    Connection conn = null;
    PreparedStatement ps = null;
    String sql;
    
    if (actualizarPassword) {
        sql = "UPDATE Usuario SET nombre_completo = ?, contrasena = ? WHERE id_usuario = ?";
    } else {
        sql = "UPDATE Usuario SET nombre_completo = ? WHERE id_usuario = ?";
    }
    
    try {
        conn = ConexionBD.getConexion();
        if (conn == null) return false;
        
        ps = conn.prepareStatement(sql);
        
        if (actualizarPassword) {
            ps.setString(1, usr.getNombreCompleto());
            ps.setString(2, usr.getContrasena());
            ps.setInt(3, usr.getIdUsuario());
        } else {
            ps.setString(1, usr.getNombreCompleto());
            ps.setInt(2, usr.getIdUsuario());
        }
        
        int filasAfectadas = ps.executeUpdate();
        return filasAfectadas > 0;
        
    } catch (SQLException e) {
        System.out.println("Error en UsuarioDao al actualizarPerfil: " + e.getMessage());
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

// 🔴 DELETE: Eliminar la cuenta del jugador por completo
public boolean eliminarUsuario(int idUsuario) {
    Connection conn = null;
    PreparedStatement ps = null;
    String sql = "DELETE FROM Usuario WHERE id_usuario = ?";
    
    try {
        conn = ConexionBD.getConexion();
        if (conn == null) return false;
        
        ps = conn.prepareStatement(sql);
        ps.setInt(1, idUsuario);
        
        int filasAfectadas = ps.executeUpdate();
        return filasAfectadas > 0;
        
    } catch (SQLException e) {
        System.out.println("Error en UsuarioDao al eliminarUsuario: " + e.getMessage());
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



}