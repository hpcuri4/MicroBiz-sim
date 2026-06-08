package controller;

import dao.UsuarioDao;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import model.usuario;
import javax.servlet.http.HttpSession;

@WebServlet("/ConfiguracionServlet")
public class ConfiguracionServlet extends HttpServlet {
    private UsuarioDao usuarioDao = new UsuarioDao();

    protected void handleRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        // Control estricto de sesión
        HttpSession session = request.getSession(false);
        usuario usuarioLogueado = (session != null) ? (usuario) session.getAttribute("usuarioLogueado") : null;
        
        if (usuarioLogueado == null) {
            response.sendRedirect("login.jsp?error=sessionExpired");
            return;
        }

        String accion = request.getParameter("accion");
        int idUsuario = usuarioLogueado.getIdUsuario();

        if (accion == null) {
            response.sendRedirect("configuracion.jsp");
            return;
        }

        switch (accion) {
            case "registrarSocio":
    // Capturamos los datos usando los name exactos de tu JSP
    String nombreSocio = request.getParameter("nombreNCuenta");
    String correoSocio = request.getParameter("correoNCuenta");
    String passSocio = request.getParameter("contraseniaNCuenta");

    if (nombreSocio != null && correoSocio != null && passSocio != null) {
        usuario nuevoSocio = new usuario();
        nuevoSocio.setNombreCompleto(nombreSocio);
        nuevoSocio.setCorreoElectronico(correoSocio);
        nuevoSocio.setContrasena(passSocio);

        boolean registroExitoso = usuarioDao.registrarUsuario(nuevoSocio);

        if (registroExitoso) {
            // Te regresa al Hub principal de configuración mostrando el banner verde de éxito
            response.sendRedirect("configuracion.jsp?success=socioRegistrado");
        } else {
            response.sendRedirect("C_crear_cuenta.jsp?error=registrationFailed");
        }
    } else {
        response.sendRedirect("C_crear_cuenta.jsp?error=emptyFields");
    }
    break;
            case "editarPerfil":
    String nuevoNombre = request.getParameter("nombre");
    String nuevaContrasenia = request.getParameter("contrasenia");

    if (nuevoNombre != null && !nuevoNombre.trim().isEmpty()) {
        usuario uActualizado = new usuario();
        uActualizado.setIdUsuario(idUsuario);
        uActualizado.setNombreCompleto(nuevoNombre);
        
        boolean cambiarPass = (nuevaContrasenia != null && !nuevaContrasenia.trim().isEmpty());
        if (cambiarPass) {
            uActualizado.setContrasena(nuevaContrasenia);
        }

        // Llamamos al DAO mandándole el flag de la contraseña
        if (usuarioDao.actualizarPerfil(uActualizado, cambiarPass)) {
            // Actualizamos inmediatamente el objeto de la sesión para que toda la barra superior cambie
            usuarioLogueado.setNombreCompleto(nuevoNombre);
            if (cambiarPass) {
                usuarioLogueado.setContrasena(nuevaContrasenia);
            }
            session.setAttribute("usuarioLogueado", usuarioLogueado);
            
            // Redirige de vuelta a la edición con el mensaje de éxito estructurado en tu JSP
            response.sendRedirect("C_editar_datos.jsp?cambio=ok");
        } else {
            response.sendRedirect("C_editar_datos.jsp?error=true");
        }
    } else {
        response.sendRedirect("C_editar_datos.jsp?error=emptyFields");
    }
    break;

           case "eliminarPerfil":
    // El ID lo obtenemos directo de la sesión que validamos al inicio del servlet
    if (idUsuario > 0) {
        boolean eliminadoOk = usuarioDao.eliminarUsuario(idUsuario);

        if (eliminadoOk) {
            // 💥 Destruimos la sesión por completo dado que el usuario ya no existe
            session.invalidate();
            
            // Redirigimos al login con un parámetro informando el suceso
            response.sendRedirect("login.jsp?success=accountDeleted");
        } else {
            // Si falla (por ejemplo por restricciones de llave foránea), regresa con error
            response.sendRedirect("C_eliminar_cuenta.jsp?error=true");
        }
    } else {
        response.sendRedirect("login.jsp?error=invalidSession");
    }
    break;
            case "cerrarSesion":
    // Invalidamos la sesión directamente a través del request
    if (request.getSession(false) != null) {
        request.getSession(false).invalidate();
    }
    
    // Redirigimos al login
    response.sendRedirect("login.jsp?msg=sesionCerrada");
    break;
        }
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