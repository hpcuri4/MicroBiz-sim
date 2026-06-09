package controller;

import dao.MejoraTecnologiaDao;
import model.MejoraTecnologia;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

// Esta línea es CRÍTICA. Mapea la URL exacta que pusiste en el 'action' del formulario JSP
@WebServlet("/ActualizarMejoraServlet")
public class ActualizarMejoraServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        // Forzar codificación UTF-8 para evitar problemas con acentos en "Producción" o "Logística"
        request.setCharacterEncoding("UTF-8");
        
        // 1. Recoger los parámetros ocultos y editables del formulario
        String idMejoraStr = request.getParameter("idMejora");
        String nuevaArea = request.getParameter("nuevaArea");
        String accion = request.getParameter("accion");

        // Validación rápida de seguridad
        if (idMejoraStr != null && !idMejoraStr.trim().isEmpty() && "modificarArea".equals(accion)) {
            try {
                int idMejora = Integer.parseInt(idMejoraStr);
                
                MejoraTecnologiaDao mtDao = new MejoraTecnologiaDao();
                
                // 2. Traer el activo actual directamente de la base de datos
                MejoraTecnologia mt = mtDao.buscarPorId(idMejora);
                
                if (mt != null) {
                    // 3. RESTRICCIÓN ESTRICTA: Mantenemos intacto el negocio, costo, nivel, etc.
                    // Únicamente alteramos la propiedad solicitada
                    mt.setAreaDespliegue(nuevaArea);
                    
                    // 4. Mandamos a actualizar la fila en la BD a través del UPDATE del DAO
                    boolean exito = mtDao.actualizar(mt);
                    
                    if (exito) {
                        // ¡Éxito total! Redireccionamos de vuelta con bandera de éxito
                        response.sendRedirect("actualizar_mejora.jsp?status=success");
                    } else {
                        // Falló la consulta SQL interna
                        response.sendRedirect("actualizar_mejora.jsp?error=sql_error");
                    }
                } else {
                    // El ID enviado no se encontró en el sistema
                    response.sendRedirect("actualizar_mejora.jsp?error=not_found");
                }
                
            } catch (Exception e) {
                System.out.println("❌ Error en ActualizarMejoraServlet: " + e.getMessage());
                e.printStackTrace();
                response.sendRedirect("actualizar_mejora.jsp?error=exception");
            }
        } else {
            // Campos vacíos o acción inválida
            response.sendRedirect("actualizar_mejora.jsp?error=invalid_params");
        }
    }
}