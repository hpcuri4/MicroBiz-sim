package controller;

import dao.SimulacionDao;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "SimulacionServlet", urlPatterns = {"/SimulacionServlet"})
public class SimulacionServlet extends HttpServlet {

    private final SimulacionDao simulacionDao = new SimulacionDao();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        procesarPeticion(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        procesarPeticion(request, response);
    }

    private void procesarPeticion(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        // Evitamos problemas con caracteres especiales y eñes
        request.setCharacterEncoding("UTF-8");
        
        String accion = request.getParameter("accion");
        String idSimStr = request.getParameter("idSimulacion");
        String idNegStr = request.getParameter("idNegocio");
        
        int idSimulacion = (idSimStr != null && !idSimStr.isEmpty()) ? Integer.parseInt(idSimStr) : 0;
        int idNegocio = (idNegStr != null && !idNegStr.isEmpty()) ? Integer.parseInt(idNegStr) : 0;

        try {
            // =================================================================
            // 1. CREATE: Iniciar una nueva partida desde el panel
            // =================================================================
            if ("crear".equals(accion)) {
                boolean creado = simulacionDao.crearNuevaSimulacion(idNegocio);
                if (creado) {
                    response.sendRedirect("simulacion.jsp?status=partidaCreada");
                } else {
                    response.sendRedirect("simulacion.jsp?error=errorCreacion");
                }

            // =================================================================
            // 2. DELETE: Eliminar por completo una simulación guardada
            // =================================================================
            } else if ("eliminar".equals(accion)) {
                boolean eliminado = simulacionDao.eliminarSimulacion(idSimulacion);
                if (eliminado) {
                    response.sendRedirect("simulacion.jsp?status=partidaElimitada");
                } else {
                    response.sendRedirect("simulacion.jsp?error=errorEliminacion");
                }

            // =================================================================
            // 3. UPDATE: Alterar métricas manualmente (Modo desarrollador/test)
            // =================================================================
            } else if ("actualizarMetricas".equals(accion)) {
                int nuevoTurno = Integer.parseInt(request.getParameter("nuevoTurno"));
                double nuevaRep = Double.parseDouble(request.getParameter("nuevaReputacion"));
                
                boolean actualizado = simulacionDao.actualizarMetricasManual(idSimulacion, nuevoTurno, nuevaRep);
                if (actualizado) {
                    response.sendRedirect("simulacion.jsp?status=metricasAlteradas");
                } else {
                    response.sendRedirect("simulacion.jsp?error=errorMétricas");
                }

            // =================================================================
            // 4. READ / CONTROLADOR DE FLUJO: Cargar tablero de juego
            // =================================================================
            } else if ("cargarTablero".equals(accion)) {
                // Evaluamos si el turno arranca limpio o con crisis pendientes
                String tipoEvento = simulacionDao.verificarEventoPendiente(idSimulacion);
                
                switch (tipoEvento) {
                    case "FINANCIERO":
                        response.sendRedirect("simulacion_evento_financiero.jsp?idSimulacion=" + idSimulacion + "&idNegocio=" + idNegocio);
                        break;
                    case "REPUTACION":
                        response.sendRedirect("simulacion_evento_reputacion.jsp?idSimulacion=" + idSimulacion + "&idNegocio=" + idNegocio);
                        break;
                    default:
                        // Si devuelve "NINGUNO", va a la interfaz de juego normal
                        response.sendRedirect("simulacion_normal.jsp?idSimulacion=" + idSimulacion + "&idNegocio=" + idNegocio);
                        break;
                }

            // =================================================================
            // 5. MOTOR DE TURNO: Procesar cambios de mes/semana
            // =================================================================
            } else if ("avanzarTurno".equals(accion)) {
                boolean turnoProcesado = simulacionDao.avanzarTurno(idSimulacion, idNegocio);
                
                if (turnoProcesado) {
                    // Al avanzar con éxito, volvemos a pasar por cargarTablero para ver si el nuevo turno trae evento
                    response.sendRedirect("SimulacionServlet?accion=cargarTablero&idSimulacion=" + idSimulacion + "&idNegocio=" + idNegocio);
                } else {
                    response.sendRedirect("simulacion_normal.jsp?idSimulacion=" + idSimulacion + "&idNegocio=" + idNegocio + "&error=falloMotor");
                }
                
            } else {
                // Redirección de seguridad al menú por si mandan una acción vacía
                response.sendRedirect("simulacion.jsp");
            }
            
        } catch (Exception e) {
            System.out.println("❌ Excepción en SimulacionServlet: " + e.getMessage());
            e.printStackTrace();
            response.sendRedirect("simulacion.jsp?error=critical");
        }
    }
}