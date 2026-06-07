package dao;

import config.ConexionBD;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import model.Favorito;

public class FavoritoDAO {

    public List<Favorito> listarPorUsuario(int idUsuario) {
        List<Favorito> lista = new ArrayList<>();
        String sql = "SELECT f.id_favorito, f.id_usuario, f.id_negocio, f.prioridad, "
                   + "n.nombre_negocio, n.tipo_negocio, n.capital_inicial_invertido, n.nivel_riesgo "
                   + "FROM Negocio_Favorito f "
                   + "JOIN Negocio n ON f.id_negocio = n.id_negocio "
                   + "WHERE f.id_usuario = ?";
        
        try (Connection con = ConexionBD.getConexion();
             PreparedStatement ps = con.prepareStatement(sql)) {
            
            ps.setInt(1, idUsuario);
            try (ResultSet rs = ps.executeQuery()) {
                while (rs.next()) {
                    Favorito fav = new Favorito();
                    fav.setIdFavorito(rs.getInt("id_favorito"));
                    fav.setIdUsuario(rs.getInt("id_usuario"));
                    fav.setIdNegocio(rs.getInt("id_negocio"));
                    fav.setComicPrioridad(rs.getString("prioridad"));
                    fav.setNombreNegocio(rs.getString("nombre_negocio"));
                    fav.setTipoNegocio(rs.getString("tipo_negocio"));
                    fav.setCapitalInicialInvertido(rs.getDouble("capital_inicial_invertido"));
                    fav.setNivelRiesgo(rs.getString("nivel_riesgo"));
                    lista.add(fav);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return lista;
    }

    public boolean agregarFavorito(Favorito fav) {
        String sql = "INSERT INTO Negocio_Favorito (id_usuario, id_negocio, prioridad) VALUES (?, ?, ?)";
        try (Connection con = ConexionBD.getConexion();
             PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setInt(1, fav.getIdUsuario());
            ps.setInt(2, fav.getIdNegocio());
            ps.setString(3, fav.getComicPrioridad());
            return ps.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    public boolean actualizarPrioridad(int idFavorito, String nuevaPrioridad) {
        String sql = "UPDATE Negocio_Favorito SET prioridad = ? WHERE id_favorito = ?";
        try (Connection con = ConexionBD.getConexion();
             PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setString(1, nuevaPrioridad);
            ps.setInt(2, idFavorito);
            return ps.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    public boolean eliminarFavorito(int idFavorito) {
        String sql = "DELETE FROM Negocio_Favorito WHERE id_favorito = ?";
        try (Connection con = ConexionBD.getConexion();
             PreparedStatement ps = con.prepareStatement(sql)) {
            
            ps.setInt(1, idFavorito); // Índice corregido a 1
            return ps.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }
    
       // VALIDACIÓN: Verificar si el negocio ya fue agregado a favoritos por este usuario
public boolean existeFavorito(int idUsuario, int idNegocio) {
    String sql = "SELECT COUNT(*) FROM Negocio_Favorito WHERE id_usuario = ? AND id_negocio = ?";
    try (Connection con = config.ConexionBD.getConexion();
         PreparedStatement ps = con.prepareStatement(sql)) {
        
        ps.setInt(1, idUsuario);
        ps.setInt(2, idNegocio);
        
        try (ResultSet rs = ps.executeQuery()) {
            if (rs.next()) {
                return rs.getInt(1) > 0; // Retorna true si encontró coincidencias
            }
        }
    } catch (SQLException e) {
        e.printStackTrace();
    }
    return false;
}
}