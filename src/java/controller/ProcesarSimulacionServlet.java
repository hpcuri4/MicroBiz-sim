package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet que procesa el avance de turno del simulador económico MicroBiz.
 * Utiliza javax.servlet para garantizar compatibilidad con servidores Tomcat 9 e inferiores.
 */
@WebServlet("/ProcesarSimulacionServlet")
public class ProcesarSimulacionServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public ProcesarSimulacionServlet() {
        super();
    }

    /**
     * Procesa las peticiones HTTP POST enviadas por el formulario de simulación.
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        // 1. Establecer codificación de caracteres para evitar problemas con acentos
        request.setCharacterEncoding("UTF-8");
        
        // 2. Recuperar los parámetros enviados desde simulacion_normal.jsp
        String estrategia = request.getParameter("estrategia");
        String montoInversionStr = request.getParameter("montoInversion");
        
        double montoInversion = 0.0;
        if (montoInversionStr != null && !montoInversionStr.isEmpty()) {
            try {
                montoInversion = Double.parseDouble(montoInversionStr);
            } catch (NumberFormatException e) {
                montoInversion = 0.0; // Manejo básico en caso de error numérico
            }
        }

        // 3. Obtener o validar la sesión del usuario
        HttpSession session = request.getSession();
        
        // --- AQUÍ VA TU LÓGICA DE NEGOCIO / ANÁLISIS ---
        // Ejemplo conceptual de simulación para actualizar el estado del juego:
        Integer turnoActual = (Integer) session.getAttribute("turnoActual");
        if (turnoActual == null) {
            turnoActual = 1;
        }
        
        // Procesamos el avance del turno
        turnoActual++;
        
        // Simulamos un impacto en el rendimiento financiero según la estrategia elegida
        double factorRendimiento = 1.0;
        if ("agresiva".equals(estrategia)) {
            factorRendimiento = 1.25; // Mayor ganancia potencial o mayor riesgo
        } else if ("conservadora".equals(estrategia)) {
            factorRendimiento = 1.05; // Crecimiento seguro pero bajo
        } else {
            factorRendimiento = 1.15; // Moderado
        }
        
        double resultadoCalculado = montoInversion * factorRendimiento;

        // 4. Guardar los nuevos estados en la sesión para que los lea el JSP
        session.setAttribute("turnoActual", turnoActual);
        session.setAttribute("ultimoRendimiento", resultadoCalculado);
        session.setAttribute("mensajeSimulacion", "¡Turno procesado con éxito con la estrategia " + estrategia + "!");

        // 5. Redireccionar de vuelta a la página del simulador para actualizar la vista
        // Se usa sendRedirect para evitar que el usuario duplique la petición al recargar la página
        // Cambia la redirección al final del doPost para que apunte a la página de resultados
response.sendRedirect(request.getContextPath() + "/resultado_simulacion.jsp");
    }

    /**
     * En caso de recibir una petición GET, redirige al flujo principal de simulación.
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        response.sendRedirect(request.getContextPath() + "/simulacion_normal.jsp");
    }
}