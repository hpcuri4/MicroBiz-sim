package controller;

import dao.NegocioDao;
import model.negocio;
import java.io.IOException;
import java.math.BigDecimal;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/ActualizarNegocioServlet")
public class ActualizarNegocioServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        // 1. Configurar codificación para caracteres especiales
        request.setCharacterEncoding("UTF-8");

        try {
            // 2. Captura de datos
            int id = Integer.parseInt(request.getParameter("id"));
            String nombre = request.getParameter("nombre");
            String tipo = request.getParameter("tipo");
            
            // Nota: Estos campos ahora vienen de inputs 'readonly' o hidden
            // Los parseamos para mantener el tipo de dato correcto
            BigDecimal capital = new BigDecimal(request.getParameter("capital"));
            BigDecimal balance = new BigDecimal(request.getParameter("balance"));
            
            // Estos son los que el usuario sí puede modificar en los selects
            BigDecimal ganancia = new BigDecimal(request.getParameter("ganancia"));
            String region = request.getParameter("region");
            String riesgo = request.getParameter("riesgo");

            // 3. Crear el objeto con la información actualizada
            negocio n = new negocio();
            n.setIdNegocio(id);
            n.setNombreNegocio(nombre);
            n.setTipoNegocio(tipo);
            n.setCapitalInicialInvertido(capital);
            n.setBalanceActual(balance);
            n.setGananciaEsperada(ganancia);
            n.setRegion(region);
            n.setNivelRiesgo(riesgo);

            // 4. Llamada al DAO
            NegocioDao dao = new NegocioDao();
            boolean actualizado = dao.actualizarNegocio(n);

            // 5. Redirección final
            if (actualizado) {
                // Éxito: volvemos al panel principal de negocios
                response.sendRedirect("negocio.jsp?status=success");
            } else {
                // Error: volvemos al formulario con un mensaje de fallo
                response.sendRedirect("modificar_negocio.jsp?id=" + id + "&error=fallo");
            }

        } catch (NumberFormatException e) {
            System.out.println("❌ Error de formato en el Servlet: " + e.getMessage());
            response.sendRedirect("modificar_negocio.jsp?id=" + request.getParameter("id") + "&error=formato_invalido");
        } catch (Exception e) {
            System.out.println("❌ Error inesperado en el Servlet: " + e.getMessage());
            e.printStackTrace();
            response.sendRedirect("modificar_negocio.jsp?id=" + request.getParameter("id") + "&error=excepcion");
        }
    }
}