<%@page import="model.Simulacion"%>
<%@page import="model.negocio"%>
<%@page import="model.usuario"%> <%-- Importamos tu clase usuario --%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    // 🛡️ CONTROL DINÁMICO ESTRICTO DE SESIÓN
    HttpSession sesionOk = request.getSession(false);
    usuario usuarioLogueado = null;
    
    if (sesionOk != null) {
        usuarioLogueado = (usuario) sesionOk.getAttribute("usuarioLogueado");
    }
    
    if (usuarioLogueado == null) {
        response.sendRedirect("login.jsp?error=sessionExpired");
        return; // Detiene por completo la carga si no hay sesión
    }

    // =====================================================================
    // CARGA DE DATOS BASADA EN EL USUARIO LOGUEADO
    // =====================================================================
    
    // 1. Instancia y carga de simulaciones generales
    dao.SimulacionDao simDao = new dao.SimulacionDao();
    List<Simulacion> listaSimulaciones = simDao.listarTodasLasSimulaciones();
    
    // 2. Extraemos el ID del objeto que recuperamos de tu sesión
    int idUsuarioActivo = usuarioLogueado.getIdUsuario(); 
    
    // 3. Instancia del DAO de negocios y filtrado real por el ID del usuario
    dao.NegocioDao negDao = new dao.NegocioDao(); 
    List<negocio> listaNegocios = negDao.listarNegociosPorUsuario(idUsuarioActivo);
%>
<!DOCTYPE html>
<html>
    <head>
        <title>MicroBiz - Principal</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css"> 
        <link rel="stylesheet" href="newcss.css">
        <link rel="stylesheet" href="principal.css">
    </head>
    <body>
        <div class="contenedor-principal">
            
            <div class="barra-superior">
                <div class="logo">
                    <i class="fa-solid fa-cubes-stacked"></i> MicroBiz
                </div>
                
                <div class="menu-navegacion">
                    <div class="opcion">
                        <a href="index.html"><i class="fa-solid fa-house"></i><span>Principal</span></a>
                    </div>
                    <div class="opcion">
                        <a href="negocio.jsp"><i class="fa-solid fa-briefcase"></i><span>Negocio</span></a>
                    </div>
                    <div class="opcion">
                        <a href="negocios_favoritos.jsp"><i class="fa-solid fa-heart"></i><span>Negocios Favoritos</span></a>
                    </div>
                    <div class="opcion">
                        <a href="credito.jsp"><i class="fa-solid fa-credit-card"></i><span>Crédito</span></a>
                    </div>
                    <div class="opcion activa">
                        <a href="simulacion.jsp"><i class="fa-solid fa-chart-line"></i><span>Simulación</span></a>
                    </div>
                    <div class="opcion">
                        <a href="MejorayTecnologia.jsp"><i class="fa-solid fa-computer"></i><span>Mejoras y tecnologia</span></a>
                    </div>
                    <div class="opcion">
                        <a href="Cliente.jsp"><i class="fa-solid fa-users"></i><span>Clientes</span></a>
                    </div>
                    <div class="opcion">
                        <a href="alianzas.jsp"><i class="fa-solid fa-handshake"></i><span>Alianzas Comerciales</span></a>
                    </div>
                    <div class="opcion">
                        <a href="configuracion.jsp"><i class="fa-solid fa-gear"></i><span>Configuración</span></a>
                    </div>
                    <div class="opcion">
                        <a href="PAyuda.jsp"><i class="fa-solid fa-circle-question"></i><span>Ayuda y Guía</span></a>
                    </div>
                    <div class="opcion">
                        <a href="Feedback.jsp"><i class="fa-solid fa-comments"></i><span>Feedback</span></a>
                    </div>
                </div>
            </div>

            <div class="seccion-simulador">
                <h1>🎮 Panel Principal de Simulaciones</h1>
                <%-- 🟢 CORREGIDO: Usamos getNombreCompleto() mapeado a tu columna de la BD --%>
                <p>Bienvenido, <strong><%= usuarioLogueado.getNombreCompleto() %></strong>. Gestiona tus partidas guardadas o inicia nuevos retos.</p>
                
                <br>

                <div class="tarjeta-simulacion">
                    <h2>✨ Iniciar Nueva Partida</h2>
                    <form action="SimulacionServlet" method="POST" style="display: flex; flex-direction: column; gap: 5px;">
                        <input type="hidden" name="accion" value="crear">
                        
                        <label for="idNegocio">Selecciona el Negocio para la Simulación:</label>
                        <div style="display: flex; gap: 15px; align-items: center; flex-wrap: wrap;">
                            
                            <select name="idNegocio" id="idNegocio" required style="margin-bottom: 0;">
                                <% if (listaNegocios != null && !listaNegocios.isEmpty()) { %>
                                    <option value="">-- Selecciona uno de tus negocios --</option>
                                    <% for (negocio neg : listaNegocios) { %>
                                        <option value="<%= neg.getIdNegocio() %>">
                                            <%= neg.getNombreNegocio() %> (ID: <%= neg.getIdNegocio() %>)
                                        </option>
                                    <% } %>
                                <% } else { %>
                                    <option value="">⚠️ No tienes negocios registrados todavía</option>
                                <% } %>
                            </select>
                            
                            <button type="submit" class="btn-sim-crear" <%=(listaNegocios == null || listaNegocios.isEmpty()) ? "disabled" : ""%>>
                                + Crear Nueva Simulación
                            </button>
                        </div>
                    </form>
                </div>
                                
                <h2>💾 Partidas Guardadas (Simulaciones Activas)</h2>
                <div class="tabla-simulacion-wrapper">
                    <table class="tabla-simulacion">
                        <thead>
                            <tr>
                                <th>ID Sim</th>
                                <th>ID Negocio</th>
                                <th>Turno</th>
                                <th>Ingresos</th>
                                <th>Costos Operativos</th>
                                <th>Ganancias Netas</th>
                                <th>Reputación</th>
                                <th>Acciones del Jugador</th>
                            </tr>
                        </thead>
                        <tbody>
                            <% if (listaSimulaciones != null && !listaSimulaciones.isEmpty()) { 
                                for (Simulacion sim : listaSimulaciones) { %>
                                <tr>
                                    <td><%= sim.getIdSimulacion() %></td>
                                    <td><%= sim.getIdNegocio() %></td>
                                    <td><strong style="color: #7a40f2;"><%= sim.getTurnoActual() %></strong></td>
                                    <td>$<%= sim.getIngresos() %></td>
                                    <td>$<%= sim.getCostosOperativos() %></td>
                                    <td>$<%= sim.getGananciasNetas() %></td>
                                    <td><%= sim.getReputacion() %>%</td>
                                    <td>
                                        <button class="btn-tabla-jugar" onclick="jugarPartida(<%= sim.getIdSimulacion() %>, <%= sim.getIdNegocio() %>)">
                                            ▶️ Jugar
                                        </button>

                                        <button class="btn-tabla-alterar" onclick="modificarMetricas(<%= sim.getIdSimulacion() %>, <%= sim.getReputacion() %>, <%= sim.getTurnoActual() %>)">
                                            🛠️ Alterar
                                        </button>

                                        <button class="btn-tabla-borrar" onclick="eliminarSimulacion(<%= sim.getIdSimulacion() %>)">
                                            ❌ Borrar
                                        </button>
                                    </td>
                                </tr>
                            <% } } else { %>
                                <tr>
                                    <td colspan="8" style="text-align: center; color: #5c5e75;">No tienes simulaciones creadas. ¡Inicia una arriba!</td>
                                </tr>
                            <% } %>
                        </tbody>
                    </table>
                </div>
            </div>
            
            <div class="pie-pagina">
                <div class="contenido-pie">
                    <div class="pie-izquierdo">
                        <strong>Sobre nosotros</strong><br>
                        Correo electrónico: <span class="correo-pie">microbizsim@gmail.com</span>
                    </div>
                    <div class="pie-derecho">
                        © 2026 FutureMind México. Todos los derechos reservados.
                    </div>
                </div>
            </div>

        </div> 
        
        <script>
            function jugarPartida(idSimulacion, idNegocio) {
                window.location.href = "SimulacionServlet?accion=cargarTablero&idSimulacion=" + idSimulacion + "&idNegocio=" + idNegocio;
            }

            function eliminarSimulacion(idSimulacion) {
                if (confirm("¿Estás completamente seguro de borrar esta partida? Perderás todo el historial de turnos.")) {
                    window.location.href = "SimulacionServlet?accion=eliminar&idSimulacion=" + idSimulacion;
                }
            }

            function modificarMetricas(idSimulacion, repActual, turnoActual) {
                const nuevaRep = prompt("Modificar reputación (0 - 100):", repActual);
                const nuevoTurno = prompt("Modificar turno actual:", turnoActual);
                
                if (nuevaRep !== null && nuevoTurno !== null) {
                    window.location.href = "SimulacionServlet?accion=actualizarMetricas&idSimulacion=" + idSimulacion + 
                                           "&nuevaReputacion=" + nuevaRep + "&nuevoTurno=" + nuevoTurno;
                }
            }
        </script>
    </body>
</html>