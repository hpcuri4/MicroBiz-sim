package controller; // Asegúrate de que coincida con tu estructura de paquetes actual

import dao.AlianzaDao;
import model.Alianza;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "GuardarAlianzaServlet", urlPatterns = {"/GuardarAlianzaServlet"})
public class GuardarAlianzaServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Redirige las peticiones GET (como el botón eliminar) al doPost para usar el mismo switch
        doPost(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        request.setCharacterEncoding("UTF-8");
        String accion = request.getParameter("accion");
        
        // Si no se envía ninguna acción, asumimos que viene del formulario de creación estándar
        if (accion == null) {
            accion = "guardar";
        }

        AlianzaDao aDao = new AlianzaDao();
        boolean resultado = false;
        int idNegocioRedireccion = 0;

        try {
            switch (accion) {
                case "guardar":
    String idNegocioStr = request.getParameter("idNegocio");
    String nombreSocio = request.getParameter("nombreSocio");
    String metaClientesStr = request.getParameter("metaClientes");
    String tipoImpacto = request.getParameter("tipoImpacto");

    if (idNegocioStr != null && metaClientesStr != null) {
        idNegocioRedireccion = Integer.parseInt(idNegocioStr);
        
        // Convertimos la meta a entero
        int meta = Integer.parseInt(metaClientesStr);
        
        // REGLA DE NEGOCIO: Validamos que sea mínimo 100
        if (meta < 100) {
            meta = 100; // Si envían algo menor, lo forzamos a 100
        }
        
        Alianza nuevaAlianza = new Alianza();
        nuevaAlianza.setIdNegocio(idNegocioRedireccion);
        nuevaAlianza.setNombreAlianza(nombreSocio);
        nuevaAlianza.setMetaClientes(meta); // Usamos la meta validada
        nuevaAlianza.setCondicionImpacto(tipoImpacto);

        resultado = aDao.insertar(nuevaAlianza);
    }
    break;

                case "editar":
                    String idAlianzaEditStr = request.getParameter("idAlianza");
                    String idNegocioEditStr = request.getParameter("idNegocio");
                    String nombreSocioEdit = request.getParameter("nombreSocio");
                    String metaClientesEditStr = request.getParameter("metaClientes");
                    String tipoImpactoEdit = request.getParameter("tipoImpacto");

                    if (idAlianzaEditStr != null && idNegocioEditStr != null) {
                        idNegocioRedireccion = Integer.parseInt(idNegocioEditStr);
                        
                        Alianza alianzaEditada = new Alianza();
                        alianzaEditada.setIdAlianza(Integer.parseInt(idAlianzaEditStr));
                        alianzaEditada.setIdNegocio(idNegocioRedireccion);
                        alianzaEditada.setNombreAlianza(nombreSocioEdit);
                        alianzaEditada.setMetaClientes(Integer.parseInt(metaClientesEditStr));
                        alianzaEditada.setCondicionImpacto(tipoImpactoEdit);

                        resultado = aDao.actualizar(alianzaEditada);
                    }
                    break;

                case "eliminar":
                    String idAlianzaDelStr = request.getParameter("idAlianza");
                    // Intentamos recuperar el idNegocio de la URL para mantener el filtro visual al volver
                    String idNegocioDelStr = request.getParameter("idNegocio");
                    if (idNegocioDelStr != null) {
                        idNegocioRedireccion = Integer.parseInt(idNegocioDelStr);
                    }

                    if (idAlianzaDelStr != null) {
                        int idAlianza = Integer.parseInt(idAlianzaDelStr);
                        resultado = aDao.eliminar(idAlianza);
                    }
                    break;
            }
        } catch (NumberFormatException e) {
            e.printStackTrace();
            resultado = false;
        }

        // Construcción de la redirección para no romper la experiencia de usuario
        String urlRedireccion = "alianzas.jsp";
        if (idNegocioRedireccion > 0) {
            urlRedireccion += "?idNegocio=" + idNegocioRedireccion;
            urlRedireccion += "&mensaje=" + (resultado ? "exito" : "error");
        } else {
            urlRedireccion += "?mensaje=" + (resultado ? "exito" : "error");
        }

        response.sendRedirect(urlRedireccion);
    }
}