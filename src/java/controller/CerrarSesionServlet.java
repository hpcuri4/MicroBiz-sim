package controller;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet(name = "CerrarSesionServlet", urlPatterns = {"/CerrarSesionServlet"})
public class CerrarSesionServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        // 1. Obtenemos la sesión actual si existe
        HttpSession sesion = request.getSession(false);
        
        if (sesion != null) {
            // 2. 💥 Destruimos la sesión por completo en el servidor
            sesion.invalidate();
        }
        
        // 3. Redirigimos al Login con un mensaje opcional
        response.sendRedirect("login.jsp?msg=sesionCerrada");
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }
}