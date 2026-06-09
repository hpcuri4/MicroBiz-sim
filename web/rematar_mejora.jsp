<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="dao.MejoraTecnologiaDao"%>
<%@page import="model.MejoraTecnologia"%>
<%-- Asumiendo que tu modelo de negocio se llama 'negocio' en minúsculas según tu código --%>
<%@page import="model.negocio"%> 
<%@page import="dao.NegocioDao"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.math.BigDecimal"%>

<%
    // 1. Inicializar los DAOs requeridos
    MejoraTecnologiaDao mtDao = new MejoraTecnologiaDao();
    dao.NegocioDao negDao = new dao.NegocioDao();
    
    // Recuperar el idUsuario de la sesión activa
    int idUsuarioActivo = 0; 
    if (session.getAttribute("idUsuario") != null) {
        idUsuarioActivo = (Integer) session.getAttribute("idUsuario");
    }
    
    // Declaramos la lista usando la clase exacta de tu modelo en minúsculas: 'model.negocio'
    List<model.negocio> listaNegocios = new java.util.ArrayList<>();
    
    try {
        // Intentamos cargar primero los negocios específicos del usuario usando tu método real
        if (idUsuarioActivo > 0) {
            listaNegocios = negDao.listarPorUsuario(idUsuarioActivo);
        }
        
        // 🚨 SALVAVIDAS DE EMERGENCIA: Si la lista sigue vacía (por pruebas locales sin Login),
        // usamos tu método alternativo del DAO para que nunca se quede vacío el select
        if (listaNegocios == null || listaNegocios.isEmpty()) {
            System.out.println("⚠️ Sesión vacía o sin negocios para ID " + idUsuarioActivo + ". Usando listarTodosLosNegociosTest().");
            listaNegocios = negDao.listarTodosLosNegociosTest();
        }
        
        if (listaNegocios != null) {
            System.out.println("✅ ÉXITO [Rematar]: Se cargaron " + listaNegocios.size() + " empresas al selector.");
        }
    } catch (Exception e) {
        System.out.println("❌ ERROR Crítico en la carga del JSP: " + e.getMessage());
        e.printStackTrace();
    }

    // 2. Capturar el negocio seleccionado para filtrar sus mejoras adquiridas
    String idNegocioSeleccionado = request.getParameter("idNegocio");
    List<MejoraTecnologia> mejorasAdquiridas = new java.util.ArrayList<>();
    
    if (idNegocioSeleccionado != null && !idNegocioSeleccionado.trim().isEmpty()) {
        try {
            int idNegocio = Integer.parseInt(idNegocioSeleccionado);
            mejorasAdquiridas = mtDao.listarPorNegocio(idNegocio);
        } catch (Exception e) {
            System.out.println("❌ ERROR al filtrar mejoras: " + e.getMessage());
        }
    }
%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>MicroBiz Sim - Rematar Mejoras</title>
    
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <link rel="stylesheet" href="rematar_mejora.css">
    <link rel="stylesheet" href="newcss.css">
    
    <script>
        // Función interactiva para recargar la página al cambiar de empresa
        function cambiarEmpresaLiquidacion() {
            var idNegocio = document.getElementById("selectLiquidacionNegocio").value;
            if (idNegocio) {
                window.location.href = "rematar_mejora.jsp?idNegocio=" + idNegocio;
            }
        }
    </script>
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
                <div class="opcion">
                    <a href="simulacion.jsp"><i class="fa-solid fa-chart-line"></i><span>Simulación</span></a>
                </div>
                <div class="opcion activa">
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

        <div class="contenido-pagina">
            <div class="dashboard-holografico-form">
                
                <div class="panel-diagnostico-form">
                    <div class="status-badge-rojo">
                        <div class="dot-parpadeante-rojo"></div> LIQUIDACIÓN DE ACTIVOS
                    </div>
                    <div class="saldo-simulado">
                        <small>Recuperación Estimada</small>
                        50% del Valor original
                    </div>
                    <p class="descripcion-tech">
                        ¿Necesitas liquidez inmediata? Rematar un activo te devolverá un porcentaje del capital invertido originalmente, pero perderás los bonos de producción asociados de forma permanente.
                    </p>
                    
                    <div class="monitor-riesgo">
                        <span class="label-grafico"><i class="fa-solid fa-triangle-exclamation"></i> ALERTA DE ESTRATEGIA</span>
                        <p class="advertencia-texto">Vender infraestructura crítica puede estancar el crecimiento operativo de tu empresa a mediano plazo.</p>
                    </div>
                </div>

                <div class="panel-terminal-formulario">
                    
                    <%-- NOTIFICACIÓN DE ÉXITO ESTILIZADA E INTEGRADA --%>
                    <% if("success".equals(request.getParameter("status"))) { %>
                        <div class="cuadro-aviso-exito" style="background: rgba(16, 185, 129, 0.1); border: 1px solid rgba(16, 185, 129, 0.3); color: #10b981; padding: 12px 15px; border-radius: 8px; margin-bottom: 15px; font-size: 0.9rem; display: flex; align-items: center; gap: 10px;">
                            <i class="fa-solid fa-circle-check" style="font-size: 1.1rem;"></i>
                            <span><strong>¡Operación Exitosa!</strong> Fondo de recuperación transferido al balance general.</span>
                        </div>
                    <% } %>

                    <%-- NOTIFICACIÓN DE ERROR ESTILIZADA E INTEGRADA --%>
                    <% if(request.getParameter("error") != null) { %>
                        <div class="cuadro-aviso-error" style="background: rgba(239, 68, 68, 0.1); border: 1px solid rgba(239, 68, 68, 0.3); color: #ef4444; padding: 12px 15px; border-radius: 8px; margin-bottom: 15px; font-size: 0.9rem; display: flex; align-items: center; gap: 10px;">
                            <i class="fa-solid fa-circle-xmark" style="font-size: 1.1rem;"></i>
                            <span><strong>Error de Sistema:</strong> No se pudo procesar la liquidación. Revisa la consola.</span>
                        </div>
                    <% } %>

                    <div class="header-formulario">
                        <h3>Rematar Infraestructura</h3>
                        <p>Selecciona el activo que deseas dar de baja del sistema financiero.</p>
                    </div>

                    <form action="RematarMejoraServlet" method="POST" class="formulario-tech">
                        
                        <%-- 1. SELECTOR DEL NEGOCIO / EMPRESA --%>
                        <div class="grupo-input-tech">
                            <label for="selectLiquidacionNegocio"><i class="fa-solid fa-briefcase"></i> Empresa afectada</label>
                            <div class="wrapper-select-custom">
                                <select id="selectLiquidacionNegocio" name="idNegocio" required onchange="cambiarEmpresaLiquidacion()">
    <option value="" disabled <%= (idNegocioSeleccionado == null) ? "selected" : "" %>>Selecciona la empresa...</option>
    <%
        if (listaNegocios != null) {
            // Aseguramos que use 'model.negocio' tal como se llama tu archivo
            for (model.negocio neg : listaNegocios) {
                boolean esMismo = String.valueOf(neg.getIdNegocio()).equals(idNegocioSeleccionado);
    %>
        <option value="<%= neg.getIdNegocio() %>" <%= esMismo ? "selected" : "" %>>
            <%= neg.getNombreNegocio() %> (<%= neg.getTipoNegocio() %>)
        </option>
    <%
            }
        }
    %>
</select>
                            </div>
                        </div>

                        <%-- 2. SELECTOR DE LA MEJORA FILTRADA --%>
                        <div class="grupo-input-tech">
                            <label><i class="fa-solid fa-boxes-stacked"></i> Activo en posesión</label>
                            <div class="wrapper-select-custom">
                                <select name="idMejora" required <%= (idNegocioSeleccionado == null || mejorasAdquiridas.isEmpty()) ? "disabled" : "" %>>
                                    <% if (idNegocioSeleccionado == null) { %>
                                        <option value="" disabled selected>Por favor, primero selecciona una empresa...</option>
                                    <% } else if (mejorasAdquiridas.isEmpty()) { %>
                                        <option value="" disabled selected>No hay activos tecnológicos en esta empresa para rematar.</option>
                                    <% } else { %>
                                        <option value="" disabled selected>Selecciona un activo para liquidar...</option>
                                        <%
                                            for (MejoraTecnologia mt : mejorasAdquiridas) {
                                                // Calculamos el valor de liquidación (Costo / 2)
                                                BigDecimal costoOriginal = mt.getCostoActualizacion();
                                                BigDecimal valorRetorno = (costoOriginal != null) ? costoOriginal.divide(new java.math.BigDecimal("2")) : java.math.BigDecimal.ZERO;
                                        %>
                                            <option value="<%= mt.getIdMejora() %>">
                                                <%= mt.getNombreMejora() %> (Retorno: $<%= valorRetorno %> MXN)
                                            </option>
                                        <%
                                            }
                                        }
                                    %>
                                </select>
                            </div>
                        </div>

                        <div class="cuadro-aviso-peligro">
                            <div class="icono-aviso">
                                <i class="fa-solid fa-circle-exclamation"></i>
                            </div>
                            <div class="texto-aviso">
                                <strong>Acción Irreversible</strong>
                                <p>Al confirmar, el activo se eliminará de tu inventario de forma permanente y el dinero se sumará al balance general de tu negocio de inmediato.</p>
                            </div>
                        </div>

                        <%-- Botón deshabilitado hasta que haya algo real seleccionado para vender --%>
                        <button type="submit" class="btn-rematar-tech" <%= (idNegocioSeleccionado == null || mejorasAdquiridas.isEmpty()) ? "disabled style='opacity:0.5; cursor:not-allowed;'" : "" %>>
                            <i class="fa-solid fa-hand-holding-dollar"></i> CONFIRMAR VENTA DE ACTIVO
                        </button>
                    </form>
                </div>
                
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

</body>
</html>