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
    <title>MicroBiz Sim - Inventario de Activos</title>
    
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <link rel="stylesheet" href="inventario_activos.css">
    <link rel="stylesheet" href="newcss.css">
    
    <%-- Estilos rápidos para el selector integrado y estados vacíos --%>
    <style>
        .grupo-filtro-inventario {
            margin-bottom: 20px;
            background: rgba(255, 255, 255, 0.05);
            padding: 12px 20px;
            border-radius: 10px;
            border: 1px solid rgba(255, 255, 255, 0.1);
        }
        .grupo-filtro-inventario label {
            font-size: 0.85rem;
            color: #94a3b8;
            text-transform: uppercase;
            letter-spacing: 1px;
            display: block;
            margin-bottom: 6px;
        }
        .sin-activos {
            text-align: center;
            padding: 30px !important;
            color: #64748b;
            font-style: italic;
        }
        .sin-activos i {
            display: block;
            margin-bottom: 10px;
            font-size: 1.5rem;
            color: #475569;
        }
    </style>
</head>
<body>

    <%
    // 1. Inicializamos la bandera del ID en 0
    int idUsuarioActivo = 0; 
    
    // 2. Recuperamos el objeto genérico de la sesión
    Object sesionObj = session.getAttribute("usuarioLogueado");
    
    if (sesionObj != null) {
        try {
            // CONEXIÓN DINÁMICA: Casteamos el objeto al modelo real 'usuario' en minúsculas
            model.usuario usr = (model.usuario) sesionObj;
            
            // Extraemos su ID real en tiempo de ejecución. 
            // NOTA: Si en tu modelo el método se llama "getId()" en vez de "getIdUsuario()", cámbialo aquí abajo.
            idUsuarioActivo = usr.getIdUsuario(); 
            
        } catch (Exception e) {
            System.out.println("❌ Error crítico al castear el usuario en inventario_activos: " + e.getMessage());
            e.printStackTrace();
        }
    }

    // CONTROL DE SEGURIDAD: Si no hay sesión válida o real, se le expulsa de inmediato
    if (idUsuarioActivo == 0) {
        response.sendRedirect("login.jsp?error=debes_iniciar_sesion");
        return; 
    }

    // 3. Cargar los negocios pertenecientes AL ALUMNO ACTUAL REAL
    dao.NegocioDao negocioDao = new dao.NegocioDao();
    java.util.List<model.negocio> listaNegocios = negocioDao.listarPorUsuario(idUsuarioActivo);

    // 4. Capturar el filtro del negocio seleccionado para armar la tabla
    String idNegocioSeleccionado = request.getParameter("idNegocioFiltro");
    java.util.List<model.MejoraTecnologia> mejorasAdquiridas = null;

    if (idNegocioSeleccionado != null && !idNegocioSeleccionado.isEmpty()) {
        int idNegocio = Integer.parseInt(idNegocioSeleccionado);
        dao.MejoraTecnologiaDao mtDao = new dao.MejoraTecnologiaDao();
        mejorasAdquiridas = mtDao.listarPorNegocio(idNegocio);
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
                    <div class="status-badge-verde">
                        <i class="fa-solid fa-box-archive"></i> ACTIVOS OPERATIVOS
                    </div>
                    <div class="saldo-simulado">
                        <small>Estado de Infraestructura</small>
                        <%= (mejorasAdquiridas != null && !mejorasAdquiridas.isEmpty()) ? "Estable" : "Sin Inversiones" %>
                    </div>
                    <p class="descripcion-tech">
                        Consulta y administración de todas las patentes, equipos e infraestructura tecnológica adquirida para mitigar costos y potenciar la producción de la empresa.
                    </p>
                </div>

                <div class="panel-terminal-formulario">
    <div class="header-formulario">
        <h3>Inventario de Activos</h3>
        <p>Monitoreo de rendimientos acumulados en el simulador.</p>
    </div>
    
    <%-- SELECTOR DINÁMICO DE NEGOCIO --%>
    <div class="grupo-filtro-inventario">
        <label for="selectInventarioNegocio"><i class="fa-solid fa-shuffle"></i> Cambiar de Empresa:</label>
        <div class="wrapper-select-custom">
            <select id="selectInventarioNegocio" onchange="cambiarEmpresaInventario()">
                <option value="" disabled <%= (idNegocioSeleccionado == null) ? "selected" : "" %>>Selecciona un negocio para auditar...</option>
                <%
                    if (listaNegocios != null) {
                        for (negocio neg : listaNegocios) {
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
    
    <%-- TABLA DE ACTIVOS DINÁMICA --%>
    <div class="tabla-contenedor">
        <table class="tabla-tecnologia">
            <thead>
                <tr>
                    <th>Código</th>
                    <th>Activo Adquirido</th>
                    <th>Área de Despliegue</th> <%-- 👈 Nueva Columna Añadida --%>
                    <th>Impacto de Operación</th>
                </tr>
            </thead>
            <tbody>
                <%
                    // 1. Validar si no se ha seleccionado ninguna empresa (Se cambia colspan a 4)
                    if (idNegocioSeleccionado == null || idNegocioSeleccionado.isEmpty()) {
                %>
                    <tr>
                        <td colspan="4" class="sin-activos">
                            <i class="fa-solid fa-arrow-pointer"></i> Por favor, selecciona un negocio arriba para cargar el inventario.
                        </td>
                    </tr>
                <%
                    // 2. Validar si la lista de activos está vacía (Se cambia colspan a 4)
                    } else if (mejorasAdquiridas == null || mejorasAdquiridas.isEmpty()) {
                %>
                    <tr>
                        <td colspan="4" class="sin-activos">
                            <i class="fa-solid fa-microchip"></i> Este negocio no cuenta con activos tecnológicos instalados aún.
                        </td>
                    </tr>
                <%
                    // 3. Renderizado de filas del inventario real
                    } else {
                        for (MejoraTecnologia mt : mejorasAdquiridas) {
                            // Convertimos a minúsculas y limpiamos espacios para armar clases CSS dinámicas estables (producción, ventas, logística)
                            String areaClase = (mt.getAreaDespliegue() != null) ? mt.getAreaDespliegue().toLowerCase().trim() : "general";
                %>
                    <tr>
                        <td>#TEC-00<%= mt.getIdMejora() %></td>
                        <td><strong><%= mt.getNombreMejora() %></strong></td>
                        
                        <%-- 👈 Nueva Celda con Badge Holográfico según el Área --%>
                        <td>
                            <span class="badge-area badge-<%= areaClase %>">
                                <% if(areaClase.contains("prod")){ %>
                                    <i class="fa-solid fa-industry"></i>
                                <% } else if(areaClase.contains("vent") || areaClase.contains("mark")){ %>
                                    <i class="fa-solid fa-store"></i>
                                <% } else { %>
                                    <i class="fa-solid fa-truck-ramp-box"></i>
                                <% } %>
                                <%= mt.getAreaDespliegue() %>
                            </span>
                        </td>
                        
                        <td>
                            <span class="impacto-positivo">
                                <i class="fa-solid fa-arrow-trend-up"></i> <%= mt.getImpactoOperacion() %>
                            </span>
                        </td>
                    </tr>
                <%
                        }
                    }
                %>
            </tbody>
        </table>
    </div>
    
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

    <%-- SCRIPT JAVASCRIPT PARA RECARGAR EL INVENTARIO --%>
    <script>
        function cambiarEmpresaInventario() {
            var idNegocio = document.getElementById("selectInventarioNegocio").value;
            if (idNegocio) {
                window.location.href = "inventario_activos.jsp?idNegocioFiltro=" + idNegocio;
            }
        }
    </script>
</body>
</html>