package dao;

import config.ConexionBD;
import model.Alianza;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class AlianzaDao {

    // 1. READ: Listar alianzas de un negocio específico
    public List<Alianza> listarPorNegocio(int idNegocio) {
        List<Alianza> lista = new ArrayList<>();
        String sql = "SELECT * FROM Alianza WHERE id_negocio = ?";
        
        try (Connection conn = ConexionBD.getConexion();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            
            ps.setInt(1, idNegocio);
            
            try (ResultSet rs = ps.executeQuery()) {
                while (rs.next()) {
                    Alianza a = new Alianza();
                    a.setIdAlianza(rs.getInt("id_alianza"));
                    a.setIdNegocio(rs.getInt("id_negocio"));
                    a.setNombreAlianza(rs.getString("nombre_alianza"));
                    a.setTipoContrato(rs.getString("tipo_contrato"));
                    a.setMetaClientes(rs.getInt("meta_clientes"));
                    a.setClientesActuales(rs.getInt("clientes_actuales"));
                    a.setCondicionImpacto(rs.getString("condicion_impacto"));
                    a.setEstadoAlianza(rs.getString("estado_alianza"));
                    lista.add(a);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return lista;
    }
    
    // 2. CREATE: Insertar una nueva alianza
    public boolean insertar(Alianza a) {
        // CORREGIDO: Ahora sí inserta el 'tipoImpacto' (condicion_impacto) dinámico que viene del formulario
        String sql = "INSERT INTO Alianza (id_negocio, nombre_alianza, tipo_contrato, meta_clientes, clientes_actuales, condicion_impacto, estado_alianza) VALUES (?, ?, ?, ?, 0, ?, 'Activo')";
        try (Connection conn = ConexionBD.getConexion();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            
            ps.setInt(1, a.getIdNegocio());
            ps.setString(2, a.getNombreAlianza());
            ps.setString(3, "Contrato Estándar"); 
            ps.setInt(4, a.getMetaClientes());
            ps.setString(5, a.getCondicionImpacto()); // Mapea el impacto elegido por el usuario
            
            return ps.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    // 3. UPDATE: Modificar los datos de un contrato existente
    public boolean actualizar(Alianza a) {
        String sql = "UPDATE Alianza SET id_negocio = ?, nombre_alianza = ?, meta_clientes = ?, condicion_impacto = ? WHERE id_alianza = ?";
        try (Connection conn = ConexionBD.getConexion();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            
            ps.setInt(1, a.getIdNegocio());
            ps.setString(2, a.getNombreAlianza());
            ps.setInt(3, a.getMetaClientes());
            ps.setString(4, a.getCondicionImpacto());
            ps.setInt(5, a.getIdAlianza()); // Filtro clave para saber cuál modificar
            
            return ps.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    // 4. DELETE: Rescindir / Eliminar un contrato por su ID
    public boolean eliminar(int idAlianza) {
        String sql = "DELETE FROM Alianza WHERE id_alianza = ?";
        try (Connection conn = ConexionBD.getConexion();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            
            ps.setInt(1, idAlianza);
            
            return ps.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }
}