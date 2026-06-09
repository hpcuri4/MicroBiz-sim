<%@page import="dao.MejoraTecnologiaDao"%>
<%@page import="model.MejoraTecnologia"%>
<%@page import="dao.NegocioDao"%>
<%@page import="model.negocio"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>MicroBiz Sim - Reasignar Área de Activos</title>
    
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <link rel="stylesheet" href="actualizar_mejora.css">
    <link rel="stylesheet" href="newcss.css">
    
    <style>
        .input-bloqueado {
            background: rgba(255, 255, 255, 0.03) !important;
            border: 1px solid rgba(255, 255, 255, 0.08) !important;
            color: #64748b !important;
            cursor: not-allowed;
            padding: 10px 14px;
            border-radius: 8px;
            font-family: monospace;
            width: 100%;
            box-sizing: border-box;
        }
        .msg-info-bloqueo {
            font-size: 0.75rem;
            color: #64748b;
            margin-top: 4px;
            display: block;
        }
        .divisor-pasos {
            border-top: 1px solid rgba(255, 255, 255, 0.05);
            margin: 20px 0;
            padding-top: 15px;
        }
    </style>
</head>
<body>

    <%
        // 1. CONTROL DE SESIÓN DINÁMICA
        int idUsuarioActivo = 0;
        Object sesionObj = session.getAttribute("usuarioLogueado");
        
        if (sesionObj != null) {
            try {
                model.usuario usr = (model.usuario) sesionObj;
                idUsuarioActivo = usr.getIdUsuario();
            } catch (Exception e) {
                System.out.println("❌ Error de casteo en actualizar_mejora: " + e.getMessage());
            }
        }

        if (idUsuarioActivo == 0) {
            response.sendRedirect("login.jsp?error=debes_iniciar_sesion");
            return;
        }

        // 2. CARGAR TODOS LOS NEGOCIOS DEL ALUMNO ACTUAL
        NegocioDao negocioDao = new NegocioDao();
        List<negocio> listaNegocios = negocioDao.listarPorUsuario(idUsuarioActivo);

        // 3. CAPTURAR FILTROS EN CASCADA (Negocio seleccionado y Mejora seleccionada)
        String idNegocioFiltro = request.getParameter("idNegocioFiltro");
        String idMejoraStr = request.getParameter("idMejoraEditar");
        
        List<MejoraTecnologia> mejorasDelNegocio = null;
        MejoraTecnologia mejoraSeleccionada = null;
        String nombreNegocioPertenece = "Ninguno seleccionado";

        // Si ya seleccionó un negocio, cargamos SOLO sus mejoras
        if (idNegocioFiltro != null && !idNegocioFiltro.isEmpty()) {
            int idNegocio = Integer.parseInt(idNegocioFiltro);
            MejoraTecnologiaDao mtDao = new MejoraTecnologiaDao();
            mejorasDelNegocio = mtDao.listarPorNegocio(idNegocio);
            
            // Buscamos su nombre para mostrarlo en el input estático bloqueado
            negocio neg = negocioDao.buscarPorId(idNegocio);
            if (neg != null) {
                nombreNegocioPertenece = neg.getNombreNegocio();
            }
            
            // Si además ya seleccionó la mejora específica, la buscamos
            if (idMejoraStr != null && !idMejoraStr.isEmpty()) {
                int idMejora = Integer.parseInt(idMejoraStr);
                mejoraSeleccionada = mtDao.buscarPorId(idMejora);
            }
        }
    %>

    <div class="contenedor-principal">
        
        <div class="barra-superior">
            <div class="logo">
                <i class="fa-solid fa-cubes-stacked"></i> MicroBiz
            </div>
            <div class="menu-navegacion">
                <div class="opcion"><a href="index.html"><i class="fa-solid fa-house"></i><span>Principal</span></a></div>
                <div class="opcion"><a href="negocio.jsp"><i class="fa-solid fa-briefcase"></i><span>Negocio</span></a></div>
                <div class="opcion"><a href="negocios_favoritos.jsp"><i class="fa-solid fa-heart"></i><span>Negocios Favoritos</span></a></div>
                <div class="opcion"><a href="credito.jsp"><i class="fa-solid fa-credit-card"></i><span>Crédito</span></a></div>
                <div class="opcion"><a href="simulacion.jsp"><i class="fa-solid fa-chart-line"></i><span>Simulación</span></a></div>
                <div class="opcion activa"><a href="MejorayTecnologia.jsp"><i class="fa-solid fa-computer"></i><span>Mejoras y tecnologia</span></a></div>
                <div class="opcion"><a href="Cliente.jsp"><i class="fa-solid fa-users"></i><span>Clientes</span></a></div>
                <div class="opcion"><a href="alianzas.jsp"><i class="fa-solid fa-handshake"></i><span>Alianzas Comerciales</span></a></div>
                <div class="opcion"><a href="configuracion.jsp"><i class="fa-solid fa-gear"></i><span>Configuración</span></a></div>
                <div class="opcion"><a href="PAyuda.jsp"><i class="fa-solid fa-circle-question"></i><span>Ayuda y Guía</span></a></div>
                <div class="opcion"><a href="Feedback.jsp"><i class="fa-solid fa-comments"></i><span>Feedback</span></a></div>
            </div>
        </div>

        <div class="contenido-pagina">
            <div class="dashboard-holografico-form">
                
                <div class="panel-diagnostico-form">
                    <div class="status-badge-morado">
                        <div class="dot-parpadeante"></div> SISTEMA DE EVOLUCIÓN
                    </div>
                    <div class="saldo-simulado">
                        <small>Gestión por Empresa</small>
                        Filtro Avanzado
                    </div>
                    <p class="descripcion-tech">
                        Selecciona el negocio y el activo tecnológico que deseas auditar. El núcleo operativo central garantiza que la inversión permanezca ligada a la empresa de origen.
                    </p>
                </div>

                <div class="panel-terminal-formulario">
                    <div class="header-formulario">
                        <h3>Modificar Despliegue</h3>
                        <p>Filtra por empresa para reubicar tus activos instalados.</p>
                    </div>

                    <%-- PASO 1: SELECCIONAR EL NEGOCIO --%>
                    <div class="grupo-input-tech">
                        <label><i class="fa-solid fa-briefcase"></i> 1. Selecciona la Empresa Propietaria</label>
                        <div class="wrapper-select-custom">
                            <select id="selectorNegocioFiltro" onchange="cambiarNegocioFiltro()">
                                <option value="" disabled <%= (idNegocioFiltro == null) ? "selected" : "" %>>Elige un negocio...</option>
                                <%
                                    if (listaNegocios != null) {
                                        for (negocio neg : listaNegocios) {
                                            boolean esMismoNeg = String.valueOf(neg.getIdNegocio()).equals(idNegocioFiltro);
                                %>
                                    <option value="<%= neg.getIdNegocio() %>" <%= esMismoNeg ? "selected" : "" %>>
                                        <%= neg.getNombreNegocio() %>
                                    </option>
                                <%
                                        }
                                    }
                                %>
                            </select>
                        </div>
                    </div>

                    <%-- PASO 2: SELECCIONAR LA MEJORA (Solo se activa si hay negocio seleccionado) --%>
                    <div class="grupo-input-tech">
                        <label><i class="fa-solid fa-microchip"></i> 2. Selecciona el Activo Tecnológico</label>
                        <div class="wrapper-select-custom">
                            <select id="selectorMejoraEditar" onchange="cambiarMejoraEditar()" <%= (idNegocioFiltro == null) ? "disabled" : "" %>>
                                <option value="" disabled <%= (mejoraSeleccionada == null) ? "selected" : "" %>>
                                    <%= (idNegocioFiltro == null) ? "Primero selecciona una empresa..." : "Elige un activo de esta empresa..." %>
                                </option>
                                <%
                                    if (mejorasDelNegocio != null) {
                                        for (MejoraTecnologia mt : mejorasDelNegocio) {
                                            boolean esMismaMej = String.valueOf(mt.getIdMejora()).equals(idMejoraStr);
                                %>
                                    <option value="<%= mt.getIdMejora() %>" <%= esMismaMej ? "selected" : "" %>>
                                        <%= mt.getNombreMejora() %> (Área: <%= mt.getAreaDespliegue() %>)
                                    </option>
                                <%
                                        }
                                    }
                                %>
                            </select>
                        </div>
                    </div>

                    <div class="divisor-pasos"></div>

                    <%-- FORMULARIO OPERATIVO FINAL (PASO 3) --%>
                    <form action="ActualizarMejoraServlet" method="POST" class="formulario-tech">
                        
                        <input type="hidden" name="idMejora" value="<%= (mejoraSeleccionada != null) ? mejoraSeleccionada.getIdMejora() : "" %>">
                        <input type="hidden" name="idNegocio" value="<%= idNegocioFiltro != null ? idNegocioFiltro : "" %>">
                        <input type="hidden" name="accion" value="modificarArea">

                        <div class="grupo-input-tech">
                            <label><i class="fa-solid fa-lock"></i> Empresa (Bloqueado)</label>
                            <input type="text" class="input-bloqueado" readonly value="<%= nombreNegocioPertenece %>">
                        </div>

                        <div class="grupo-input-tech">
                            <label><i class="fa-solid fa-lock"></i> Activo Tecnológico (Bloqueado)</label>
                            <input type="text" class="input-bloqueado" readonly 
                                   value="<%= (mejoraSeleccionada != null) ? mejoraSeleccionada.getNombreMejora() : "Ninguno seleccionado" %>">
                        </div>

                        <div class="grupo-input-tech">
                            <label><i class="fa-solid fa-network-wired"></i> 3. Reasignar Nueva Área Operativa</label>
                            <div class="wrapper-select-custom">
                                <select name="nuevaArea" required <%= (mejoraSeleccionada == null) ? "disabled" : "" %>>
                                    <%
                                        String areaActual = (mejoraSeleccionada != null) ? mejoraSeleccionada.getAreaDespliegue() : "";
                                    %>
                                    <option value="Papelería" <%= "Papelería".equals(areaActual) ? "selected" : "" %>>Papelería</option>
                                    <option value="Tienda de ropa" <%= "Tienda de ropa".equals(areaActual) ? "selected" : "" %>>Tienda de ropa</option>
                                    <option value="Comida rápida / Restaurante" <%= "Comida rápida / Restaurante".equals(areaActual) ? "selected" : "" %>>Comida rápida / Restaurante</option>
                                    <option value="Lavandería" <%= "Lavandería".equals(areaActual) ? "selected" : "" %>>Lavandería</option>
                                </select>
                            </div>
                            <span class="msg-info-bloqueo"><i class="fa-solid fa-circle-info"></i> Solo el área operativa es susceptible a cambios de configuración.</span>
                        </div>

                        <button type="submit" class="btn-actualizar-tech" <%= (mejoraSeleccionada == null) ? "disabled" : "" %>>
                            <i class="fa-solid fa-bolt"></i> GUARDAR CAMBIOS DE ÁREA
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

    <%-- JAVASCRIPT EN CASCADA --%>
    <script>
        // Al cambiar de empresa, limpiamos la mejora anterior porque ya no pertenece a este nuevo negocio
        function cambiarNegocioFiltro() {
            var idNegocio = document.getElementById("selectorNegocioFiltro").value;
            if (idNegocio) {
                window.location.href = "actualizar_mejora.jsp?idNegocioFiltro=" + idNegocio;
            }
        }

        // Al seleccionar la mejora, mantenemos la empresa fija en la URL y cargamos la mejora a editar
        function cambiarMejoraEditar() {
            var idNegocio = document.getElementById("selectorNegocioFiltro").value;
            var idMejora = document.getElementById("selectorMejoraEditar").value;
            if (idNegocio && idMejora) {
                window.location.href = "actualizar_mejora.jsp?idNegocioFiltro=" + idNegocio + "&idMejoraEditar=" + idMejora;
            }
        }
    </script>
</body>
</html>