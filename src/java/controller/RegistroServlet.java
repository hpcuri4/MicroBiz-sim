package controller;

import dao.UsuarioDao;
import model.usuario;
import java.io.IOException;

// Y PEGA ESTAS EN SU LUGAR:
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

// La URL con la que el formulario JSP invocará este Servlet
@WebServlet("/RegistroServlet")
public class RegistroServlet extends HttpServlet {

    @Override
protected void doPost(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {
    
    String nombre = request.getParameter("nombre_completo");
    String correo = request.getParameter("correo_electronico");
    String pass = request.getParameter("contrasena");
    
    if (nombre != null && correo != null && pass != null && !nombre.trim().isEmpty()) {
        
        usuario nuevoUsuario = new usuario(nombre, correo, pass);
        UsuarioDao usuarioDao = new UsuarioDao();
        
        // --- AQUÍ ESTÁ EL CAMBIO PARA AUDITORÍA ---
        try {
            // Intentamos registrar
            boolean exito = usuarioDao.registrarUsuario(nuevoUsuario);
            
            if (exito) {
                response.sendRedirect("login.jsp?registro=success");
            } else {
                // Si el DAO nos devuelve false sin lanzar excepción
                response.setContentType("text/html;charset=UTF-8");
                response.getWriter().println("<h3>Error: El DAO devolvió FALSE. Revisa si las credenciales de tu ConexionBD.java coinciden con tu MySQL (User, Password, Puerto).</h3>");
            }
        } catch (Exception e) {
            // ¡Si el código truena, esto te lo va a escupir en el navegador!
            response.setContentType("text/html;charset=UTF-8");
            response.getWriter().println("<h2>⚠️ Se detectó un error en el Backend:</h2>");
            response.getWriter().println("<pre>");
            e.printStackTrace(response.getWriter());
            response.getWriter().println("</pre>");
        }
        // ------------------------------------------
        
    } else {
        response.sendRedirect("registro.jsp?error=emptyfields");
    }
}
}
