package controller;

import dao.ClienteDao;
import model.Cliente;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "ClienteServlet", urlPatterns = {"/ClienteServlet"})
public class ClienteServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String accion = request.getParameter("accion");
        ClienteDao dao = new ClienteDao();

        switch (accion) {
            case "agregar":
                int idNegocioAdd = Integer.parseInt(request.getParameter("idNegocio"));
                String nombreAdd = request.getParameter("nombre");
                String segmentoAdd = request.getParameter("segmento");
                
                Cliente nuevo = new Cliente();
                nuevo.setIdNegocio(idNegocioAdd);
                nuevo.setNombreCliente(nombreAdd);
                nuevo.setCategoriaLealtad(segmentoAdd);
                
                dao.insertar(nuevo);
                response.sendRedirect("Cliente.jsp?idNegocio=" + idNegocioAdd);
                break;

            case "editar":
    int idEdit = Integer.parseInt(request.getParameter("idCliente"));
    String nombreEdit = request.getParameter("nombre");
    String segmentoEdit = request.getParameter("segmento");
    int idNegocioEdit = Integer.parseInt(request.getParameter("idNegocio"));
    
    Cliente editado = new Cliente();
    editado.setIdCliente(idEdit);
    editado.setNombreCliente(nombreEdit);
    editado.setCategoriaLealtad(segmentoEdit);
    
    // Llamamos al DAO que ya creamos antes
    dao.editar(editado);
    
    // Regresamos a la página del negocio específico
    response.sendRedirect("Cliente.jsp?idNegocio=" + idNegocioEdit);
    break;

            case "eliminar":
                int idDel = Integer.parseInt(request.getParameter("idCliente"));
                int idNegocioDel = Integer.parseInt(request.getParameter("idNegocio"));
                
                dao.eliminar(idDel);
                response.sendRedirect("Cliente.jsp?idNegocio=" + idNegocioDel);
                break;
        }
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