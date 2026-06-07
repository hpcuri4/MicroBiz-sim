package controller;

import dao.NegocioDao;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/EliminarNegocioServlet")
public class EliminarNegocioServlet extends HttpServlet {
    // En tu EliminarNegocioServlet.java
protected void doPost(HttpServletRequest request, HttpServletResponse response) 
        throws ServletException, IOException {
    
    // Cambiamos a POST porque tu formulario es method="POST"
    int id = Integer.parseInt(request.getParameter("idNegocio"));
    NegocioDao dao = new NegocioDao();
    
    if (dao.eliminarNegocio(id)) {
        response.sendRedirect("negocio.jsp?status=deleted");
    } else {
        response.sendRedirect("eliminar_negocio.jsp?error=fail");
    }
}
}