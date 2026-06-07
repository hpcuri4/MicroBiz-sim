package controller;

import dao.FavoritoDAO;
import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import model.Favorito;

@WebServlet("/ControladorWatchlist")
public class ControladorWatchlist extends HttpServlet {
    private FavoritoDAO favoritoDAO = new FavoritoDAO();

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        HttpSession session = request.getSession();
        Integer idUsuario = (Integer) session.getAttribute("id_usuario");

        // Bloque de seguridad estricto
        if (idUsuario == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        String accion = request.getParameter("accion");

        // SECCIÓN DE ESCRITURA (ALTA/BAJA/CAMBIO)
        if (accion != null && !accion.trim().isEmpty()) {
            switch (accion) {
                case "alta":
                    int idNegocio = Integer.parseInt(request.getParameter("id_negocio"));
                    String prioridad = request.getParameter("prioridad");

                    Favorito nuevoFav = new Favorito();
                    nuevoFav.setIdUsuario(idUsuario);
                    nuevoFav.setIdNegocio(idNegocio);
                    nuevoFav.setComicPrioridad(prioridad);

                    favoritoDAO.agregarFavorito(nuevoFav);
                    break;

                case "cambiar":
                    int idFavCambiar = Integer.parseInt(request.getParameter("id_favorito"));
                    String nuevaPrioridad = request.getParameter("nueva_prioridad");
                    
                    favoritoDAO.actualizarPrioridad(idFavCambiar, nuevaPrioridad);
                    break;

                case "baja":
                    int idFavEliminar = Integer.parseInt(request.getParameter("id_favorito"));
                    
                    favoritoDAO.eliminarFavorito(idFavEliminar);
                    break;
            }
            // REDIRECCIÓN LIMPIA: Le dice al navegador que recargue el servlet SIN parámetros de acciones.
            response.sendRedirect("ControladorWatchlist");
            return;
        }

        // SECCIÓN DE LECTURA (Aquí entra cuando solo quieres ver la página)
        // Buscamos los datos frescos en la base de datos
        List<Favorito> listaActualizada = favoritoDAO.listarPorUsuario(idUsuario);
        
        // Se los pasamos a la petición
        request.setAttribute("listaFavoritos", listaActualizada);
        
        // Empujamos de forma interna al JSP. Cero redirecciones externas, cero bucles.
        request.getRequestDispatcher("negocios_favoritos.jsp").forward(request, response);
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }
}