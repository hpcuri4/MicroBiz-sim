package controller;

import dao.FavoritoDAO;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import model.Favorito;
import model.usuario; // Aseguramos el import de tu modelo en minúsculas
import dao.FavoritoDAO; // Aseguramos el import de tu modelo en minúsculas

@WebServlet("/AccionesFavoritosServlet")
public class AccionesFavoritosServlet extends HttpServlet {
    private FavoritoDAO favoritoDAO = new FavoritoDAO();

    protected void handleRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        // 1. 🛡️ CONTROL DE SESIÓN ESTRICTO (Igual al de tus JSPs)
        HttpSession sesionOk = request.getSession(false);
        usuario usuarioLogueado = null;
        
        if (sesionOk != null) {
            usuarioLogueado = (usuario) sesionOk.getAttribute("usuarioLogueado");
        }
        
        // Si el servlet no encuentra al usuario, imprimimos en consola para saberlo
        if (usuarioLogueado == null) {
            System.out.println("❌ [AccionesFavoritosServlet] Error: usuarioLogueado es NULL en el servlet.");
            response.sendRedirect("login.jsp?error=sessionExpired");
            return;
        }

        // 2. EXTRAER EL ID DEL USUARIO LOGUEADO
        int idUsuario = usuarioLogueado.getIdUsuario(); 

        // 3. PROCESAR ACCIONES
        String accion = request.getParameter("accion");

        if (accion != null) {
            switch (accion) {
                case "alta":
    String idNegocioParam = request.getParameter("id_negocio");
    String prioridad = request.getParameter("prioridad");

    if (idNegocioParam != null && !idNegocioParam.isEmpty()) {
        int idNegocio = Integer.parseInt(idNegocioParam);
        
        // 🛑 NUEVA VALIDACIÓN ANTI-DUPLICADOS
        if (!favoritoDAO.existeFavorito(idUsuario, idNegocio)) {
            Favorito nuevoFav = new Favorito();
            nuevoFav.setIdUsuario(idUsuario);
            nuevoFav.setIdNegocio(idNegocio);
            nuevoFav.setComicPrioridad(prioridad);

            favoritoDAO.agregarFavorito(nuevoFav);
        } else {
            System.out.println("⚠️ [MicroBiz] El negocio " + idNegocio + " ya está en favoritos de este usuario.");
            // Opcional: podrías adjuntar un mensaje de error a la sesión, 
            // pero el redireccionamiento simple previene el atasco de forma segura.
        }
    }
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
        }

        // 4. RETORNO LIMPIO AL JSP
        response.sendRedirect("negocios_favoritos.jsp");
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        handleRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        handleRequest(request, response);
    }
}