<%@page import="dao.MejoraTecnologiaDao"%>
<%@page import="model.MejoraTecnologia"%>
<%@page import="dao.NegocioDao"%>
<%@page import="model.negocio"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css"> 
        <link rel="stylesheet" href="comprar_mejora.css">
        <link rel="stylesheet" href="newcss.css">
        <title>Comprar Mejora - MicroBiz</title>
        <style>
            .alerta-toast {
                position: fixed; top: 20px; right: 20px; padding: 16px 24px;
                border-radius: 12px; display: flex; align-items: center; gap: 12px;
                font-weight: 600; z-index: 1000; box-shadow: 0 8px 32px 0 rgba(0, 0, 0, 0.2);
                backdrop-filter: blur(10px); animation: slideIn 0.3s ease forwards;
            }
            .toast-exito { background: rgba(16, 185, 129, 0.2); border: 1px solid #10B981; color: #10B981; }
            .toast-error { background: rgba(239, 68, 68, 0.2); border: 1px solid #EF4444; color: #EF4444; }
            @keyframes slideIn { from { transform: translateX(120%); } to { transform: translateX(0); } }
        </style>
    </head>
    <body>
        
        <%-- DETECTOR DE MENSAJES DE RETROALIMENTACIÓN --%>
        <%
            String msg = request.getParameter("mensaje");
            if ("compra_exito".equals(msg)) {
        %>
            <div class="alerta-toast toast-exito" id="toastAlerta">
                <i class="fa-solid fa-circle-check fa-lg"></i>
                <span>¡Inversión autorizada! La mejora se desplegó con éxito.</span>
            </div>
        <% } else if ("duplicado".equals(msg)) { %>
            <div class="alerta-toast toast-error" id="toastAlerta">
                <i class="fa-solid fa-triangle-exclamation fa-lg"></i>
                <span>Operación denegada: Este negocio ya cuenta con este activo.</span>
            </div>
        <% } 
           if (msg != null) { %>
            <script>
                setTimeout(() => {
                    const toast = document.getElementById('toastAlerta');
                    if(toast) toast.style.display = 'none';
                }, 4000);
            </script>
        <% } %>

        <%
    int idUsuarioActivo = 0;
    Object sesionObj = session.getAttribute("usuarioLogueado");
    
    if (sesionObj != null) {
        try {
            model.usuario usr = (model.usuario) sesionObj;
            idUsuarioActivo = usr.getIdUsuario(); // Sincronizado con tu modelo de sesión
        } catch (Exception e) {
            System.out.println("❌ Error crítico al castear el usuario en comprar_mejora: " + e.getMessage());
        }
    }

    // Protección de pantalla
    if (idUsuarioActivo == 0) {
        response.sendRedirect("login.jsp?error=debes_iniciar_sesion");
        return;
    }

    // Cargar los negocios correspondientes al alumno logueado en este instante
    dao.NegocioDao negocioDao = new dao.NegocioDao();
    java.util.List<model.negocio> listaNegocios = negocioDao.listarPorUsuario(idUsuarioActivo);

    // Filtrado de candados para las mejoras del negocio seleccionado
    String idNegocioSeleccionado = request.getParameter("idNegocioFiltro");
    
    boolean tieneFotocopiadora = false;
    boolean tieneManiquies = false;
    boolean tieneHorno = false;
    boolean tieneLavadora = false;

    if (idNegocioSeleccionado != null && !idNegocioSeleccionado.isEmpty()) {
        int idNegocio = Integer.parseInt(idNegocioSeleccionado);
        dao.MejoraTecnologiaDao mtDao = new dao.MejoraTecnologiaDao();
        java.util.List<model.MejoraTecnologia> mejorasAdquiridas = mtDao.listarPorNegocio(idNegocio);

        if (mejorasAdquiridas != null) {
            for (model.MejoraTecnologia mt : mejorasAdquiridas) {
                String nombre = mt.getNombreMejora();
                if ("Fotocopiadora e Impresora Láser Profesional".equals(nombre)) tieneFotocopiadora = true;
                if ("Sistema de Exhibición y Maniquíes Modernos".equals(nombre)) tieneManiquies = true;
                if ("Horno Convector / Freidora Industrial".equals(nombre)) tieneHorno = true;
                if ("Lavadora Industrial de Carga Pesada".equals(nombre)) tieneLavadora = true;
            }
        }
    }
%>

        <div class="contenedor-principal">
            
            <div class="barra-superior">
                <div class="logo"><i class="fa-solid fa-cubes-stacked"></i> MicroBiz</div>
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
                        <div class="status-badge-verde"><i class="fa-solid fa-wallet"></i> MÓDULO DE INVERSIÓN</div>
                        <p class="descripcion-tech">Selecciona una de tus empresas activas para auditar su infraestructura actual y autorizar la adquisición de nuevo equipo de capital.</p>
                    </div>

                    <div class="panel-terminal-formulario">
                        <div class="header-formulario">
                            <h3>Módulo de Adquisición</h3>
                            <p>Asigna la infraestructura tecnológica al negocio correspondiente.</p>
                        </div>

                        <form action="MejorasServlet" method="POST" class="formulario-tech">
                            <input type="hidden" name="accion" value="comprar">

                            <%-- CASILLA 1: SELECCIONAR EL NEGOCIO DESTINO --%>
                            <%-- CASILLA 1: SELECCIONAR EL NEGOCIO DESTINO --%>
<div class="grupo-input-tech">
    <label><i class="fa-solid fa-briefcase"></i> Asignar al Negocio:</label>
    <div class="wrapper-select-custom">
        <select name="idNegocio" id="selectNegocio" required onchange="actualizarFiltroNegocio()">
            <option value="" disabled <%= (idNegocioSeleccionado == null) ? "selected" : "" %>>Selecciona una de tus empresas...</option>
            <%
                if (listaNegocios != null) {
                    // CORRECCIÓN 4: 'negocio' en minúscula para hacer match con tu modelo
                    for (negocio neg : listaNegocios) {
                        boolean esElSeleccionado = String.valueOf(neg.getIdNegocio()).equals(idNegocioSeleccionado);
            %>
                <option value="<%= neg.getIdNegocio() %>" <%= esElSeleccionado ? "selected" : "" %>>
                    <%-- CORRECCIÓN 5: Usamos getTipoNegocio() de acuerdo a tu esquema de BD --%>
                    <%= neg.getNombreNegocio() %> (<%= neg.getTipoNegocio() %>)
                </option>
            <%
                    }
                }
            %>
        </select>
    </div>
</div>

                            <%-- CASILLA 2: SELECCIONAR LA MEJORA (Sujeta al filtro del negocio seleccionado) --%>
                            <div class="grupo-input-tech">
                                <label><i class="fa-solid fa-microchip"></i> Seleccionar Activo / Mejora</label>
                                <div class="wrapper-select-custom">
                                    <select name="idMejoraCatalogo" required <%= (idNegocioSeleccionado == null) ? "disabled" : "" %>>
                                        <option value="" disabled selected>
                                            <%= (idNegocioSeleccionado == null) ? "← Primero selecciona un negocio" : "Elige una inversión..." %>
                                        </option>
                                        
                                        <option value="1" <%= tieneFotocopiadora ? "disabled style='color: #64748b; background: #f1f5f9;'" : "" %>>
                                            Fotocopiadora e Impresora Láser Profesional <%= tieneFotocopiadora ? "— [ADQUIRIDO]" : "— $6,000.00 MXN" %>
                                        </option>
                                        
                                        <option value="2" <%= tieneManiquies ? "disabled style='color: #64748b; background: #f1f5f9;'" : "" %>>
                                            Sistema de Exhibición y Maniquíes Modernos <%= tieneManiquies ? "— [ADQUIRIDO]" : "— $4,500.00 MXN" %>
                                        </option>
                                        
                                        <option value="3" <%= tieneHorno ? "disabled style='color: #64748b; background: #f1f5f9;'" : "" %>>
                                            Horno Convector / Freidora Industrial <%= tieneHorno ? "— [ADQUIRIDO]" : "— $12,500.00 MXN" %>
                                        </option>
                                        
                                        <option value="4" <%= tieneLavadora ? "disabled style='color: #64748b; background: #f1f5f9;'" : "" %>>
                                            Lavadora Industrial de Carga Pesada <%= tieneLavadora ? "— [ADQUIRIDO]" : "— $15,000.00 MXN" %>
                                        </option>
                                    </select>
                                </div>
                            </div>

                            <%-- CASILLA 3: GIRO COMERCIAL --%>
                            <div class="grupo-input-tech">
                                <label><i class="fa-solid fa-store"></i> Confirmar Sector del Área:</label>
                                <div class="wrapper-select-custom">
                                    <select name="areaMejora" required>
                                        <option value="Papelería">Papelería</option>
                                        <option value="Tienda de ropa">Tienda de ropa</option>
                                        <option value="Comida rápida / Restaurante">Comida rápida / Restaurante</option>
                                        <option value="Lavandería">Lavandería</option>
                                    </select>
                                </div>
                            </div>

                            <button type="submit" class="btn-comprar-tech" <%= (idNegocioSeleccionado == null) ? "disabled style='opacity:0.5; cursor:not-allowed;'" : "" %>>
                                <i class="fa-solid fa-cart-plus"></i> Autorizar Inversión Comercial
                            </button>
                        </form>
                    </div>

                </div>
            </div>
        </div>

        <%-- SCRIPT EN JAVASCRIPT PARA RECARGAR LA PÁGINA CUANDO CAMBIE EL NEGOCIO --%>
        <script>
            function actualizarFiltroNegocio() {
                var idNegocio = document.getElementById("selectNegocio").value;
                if(idNegocio) {
                    // Recarga la misma página pasándole el negocio para actualizar el dropdown de mejoras ya compradas
                    window.location.href = "comprar_mejora.jsp?idNegocioFiltro=" + idNegocio;
                }
            }
        </script>
            
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