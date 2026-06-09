package controller;

import dao.MejoraTecnologiaDao;
import dao.NegocioDao;
import model.MejoraTecnologia;
import model.negocio;

import java.io.IOException;
import java.math.BigDecimal;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "RematarMejoraServlet", urlPatterns = {"/RematarMejoraServlet"})
public class RematarMejoraServlet extends HttpServlet {

    @Override
protected void doPost(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {
    
    // 1. Obtener el usuario logueado desde la sesión
    model.usuario user = (model.usuario) request.getSession().getAttribute("usuarioLogueado");
    
    // Si no hay sesión, abortar inmediatamente
    if (user == null) {
        response.sendRedirect("login.jsp");
        return;
    }

    String idNegocioParam = request.getParameter("idNegocio");
    String idMejoraParam = request.getParameter("idMejora");

    if (idNegocioParam == null || idMejoraParam == null) {
        response.sendRedirect("rematar_mejora.jsp?error=MissingParameters");
        return;
    }

    try {
        int idNegocio = Integer.parseInt(idNegocioParam);
        int idMejora = Integer.parseInt(idMejoraParam);

        NegocioDao negDao = new NegocioDao();
        MejoraTecnologiaDao mtDao = new MejoraTecnologiaDao();

        // 2. BUSCAR NEGOCIO Y VALIDAR PROPIEDAD
        negocio emp = negDao.buscarPorId(idNegocio);
        
        // ¡ESTO ES LO QUE TE FALTABA!
        // Comprobamos que el negocio realmente pertenezca al usuario de la sesión
        if (emp == null || emp.getIdUsuario() != user.getIdUsuario()) {
            System.out.println("❌ Intento de acceso no autorizado: Usuario " + user.getIdUsuario() + " intentó modificar negocio " + idNegocio);
            response.sendRedirect("error_acceso.jsp"); // O redirigir a donde prefieras
            return;
        }

        // 3. Procede con la lógica de remate solo si pasó la validación
        MejoraTecnologia mt = mtDao.buscarPorId(idMejora); 

        if (mt != null && mt.getIdNegocio() == idNegocio) { // Doble validación: ¿La mejora pertenece a este negocio?
            // ... (resto de tu lógica de cálculo y actualización)
            
            BigDecimal costoOriginal = (mt.getCostoActualizacion() != null) ? mt.getCostoActualizacion() : BigDecimal.ZERO;
            BigDecimal valorRetorno = costoOriginal.divide(new BigDecimal("2"));

            emp.setBalanceActual(emp.getBalanceActual().add(valorRetorno));

            if (negDao.actualizarNegocio(emp) && mtDao.eliminar(idMejora)) {
                response.sendRedirect("rematar_mejora.jsp?status=success&idNegocio=" + idNegocio);
            } else {
                response.sendRedirect("rematar_mejora.jsp?error=DbTransactionFailed&idNegocio=" + idNegocio);
            }
        } else {
            response.sendRedirect("rematar_mejora.jsp?error=NotFoundOrUnauthorized");
        }

    } catch (Exception e) {
        e.printStackTrace();
        response.sendRedirect("rematar_mejora.jsp?error=ExceptionOccurred");
    }
}
}