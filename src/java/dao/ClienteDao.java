package dao;

import config.ConexionBD;
import model.Cliente;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class ClienteDao {

    // 1. READ: Listar clientes de un negocio específico
    public List<Cliente> listarPorNegocio(int idNegocio) {
        List<Cliente> lista = new ArrayList<>();
        String sql = "SELECT * FROM Cliente WHERE id_negocio = ?";
        
        try (Connection conn = ConexionBD.getConexion();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            
            ps.setInt(1, idNegocio);
            try (ResultSet rs = ps.executeQuery()) {
                while (rs.next()) {
                    Cliente c = new Cliente();
                    c.setIdCliente(rs.getInt("id_cliente"));
                    c.setIdNegocio(rs.getInt("id_negocio"));
                    c.setNombreCliente(rs.getString("nombre_cliente"));
                    c.setCategoriaLealtad(rs.getString("categoria_lealtad"));
                    c.setNivelSatisfaccion(rs.getDouble("nivel_satisfaccion"));
                    c.setGastoPromedio(rs.getDouble("gasto_promedio"));
                    c.setFrecuencia(rs.getInt("frecuencia"));
                    lista.add(c);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return lista;
    }

    // 2. CREATE: Insertar nuevo cliente
    public boolean insertar(Cliente c) {
        String sql = "INSERT INTO Cliente (id_negocio, nombre_cliente, categoria_lealtad) VALUES (?, ?, ?)";
        try (Connection conn = ConexionBD.getConexion();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            
            ps.setInt(1, c.getIdNegocio());
            ps.setString(2, c.getNombreCliente());
            ps.setString(3, c.getCategoriaLealtad());
            
            return ps.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    // 3. UPDATE: Actualizar nombre y categoría
    public boolean editar(Cliente c) {
        String sql = "UPDATE Cliente SET nombre_cliente = ?, categoria_lealtad = ? WHERE id_cliente = ?";
        try (Connection conn = ConexionBD.getConexion();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            
            ps.setString(1, c.getNombreCliente());
            ps.setString(2, c.getCategoriaLealtad());
            ps.setInt(3, c.getIdCliente());
            
            return ps.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    // 4. DELETE: Eliminar cliente
    public boolean eliminar(int idCliente) {
        String sql = "DELETE FROM Cliente WHERE id_cliente = ?";
        try (Connection conn = ConexionBD.getConexion();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            
            ps.setInt(1, idCliente);
            return ps.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }
    
    
}