package controller;

import dao.UsuarioDao;
import model.usuario;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String correo = request.getParameter("correo_electronico");
        String pass = request.getParameter("contrasena");
        
        // Validación rápida de campos vacíos
        if (correo != null && pass != null && !correo.trim().isEmpty() && !pass.trim().isEmpty()) {
            
            UsuarioDao usuarioDao = new UsuarioDao();
            usuario usuarioValidado = usuarioDao.validarUsuario(correo, pass);
            
            if (usuarioValidado != null) {
                // ¡Éxito! Iniciamos sesión de usuario
                HttpSession session = request.getSession();
                session.setAttribute("usuarioLogueado", usuarioValidado);
                
                // Lo mandamos a la página principal del simulador (ejemplo: index.jsp o dashboard.jsp)
                response.sendRedirect("index.html");
            } else {
                // Credenciales incorrectas
                response.sendRedirect("login.jsp?error=invalidcreds");
            }
            
        } else {
            // Campos vacíos
            response.sendRedirect("login.jsp?error=emptyfields");
        }
    }
}