<%@page import="model.negocio"%>
<%@page import="dao.NegocioDao"%>
<%@page import="model.usuario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>MicroBiz Sim - Consultar Negocio</title>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
        <link rel="stylesheet" href="newcss.css">
        <link rel="stylesheet" href="ver_negocio.css">
        <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
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
        <div class="opcion activa">   
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
            
            

            <div class="contenido-pagina">
                <div class="contenedor-ver-negocios">
    <%
    // 1. 🛡️ FILTRO DE SEGURIDAD (Validar sesión)
    HttpSession sess = request.getSession(false);
    usuario usr = (sess != null) ? (usuario) sess.getAttribute("usuarioLogueado") : null;
    if (usr == null) { response.sendRedirect("login.jsp?error=sessionExpired"); return; }

    // 2. Lógica de búsqueda
    String nombreBuscar = request.getParameter("nombreBusqueda");
    negocio nEncontrado = null;
    boolean busquedaRealizada = (nombreBuscar != null && !nombreBuscar.trim().isEmpty());

    if (busquedaRealizada) {
        NegocioDao dao = new NegocioDao();
        for (negocio n : dao.listarNegociosPorUsuario(usr.getIdUsuario())) {
            if (n.getNombreNegocio().equalsIgnoreCase(nombreBuscar.trim())) {
                nEncontrado = n;
                break;
            }
        }
    }
%>
    <div class="encabezado-seccion">
        <br><br><br>
    <h1 class="titulo-seccion">Consultar Negocio</h1>
    <p>Escribe el nombre de tu empresa para ver sus métricas.</p>
</div>

<div class="tarjeta-formulario-glass" style="margin-bottom: 30px; padding: 20px; background: rgba(255,255,255,0.1); border-radius: 12px;">
    <form action="ver_negocio.jsp" method="GET" style="display: flex; gap: 10px;">
        <input type="text" name="nombreBusqueda" placeholder="Nombre del negocio..." 
               value="<%= (nombreBuscar != null) ? nombreBuscar : "" %>" required
               style="flex: 1; padding: 10px; border-radius: 6px; border: 1px solid #ccc;">
        <button type="submit" class="btn-crear">Buscar</button>
    </form>
</div>

<% if (busquedaRealizada) { %>
    <% if (nEncontrado != null) { %>
        <div class="tarjeta-negocio">
            <h2 class="nombre-principal" style="margin-top: 0;"><%= nEncontrado.getNombreNegocio() %></h2>
            
            <div class="datos-negocio">
                <div class="columna-datos">
                    <div class="grupo-campo">
                        <label>Balance Actual (Capital + Ganancia)</label>
                        <div class="input-falso"><i class="fa-solid fa-wallet"></i> $<%= nEncontrado.getBalanceActual() %></div>
                    </div>
                    <div class="grupo-campo">
                        <label>Capital Inicial Invertido</label>
                        <div class="input-falso"><i class="fa-solid fa-vault"></i> $<%= nEncontrado.getCapitalInicialInvertido() %></div>
                    </div>
                    <div class="grupo-campo">
                        <label>Ganancia Esperada</label>
                        <div class="input-falso"><i class="fa-solid fa-chart-line"></i> $<%= nEncontrado.getGananciaEsperada() %></div>
                    </div>
                </div>

                <div class="columna-grafica">
                    <div class="grupo-campo">
                        <label>Tipo de negocio</label>
                        <div class="input-falso"><i class="fa-solid fa-briefcase"></i> <%= nEncontrado.getTipoNegocio() %></div>
                    </div>
                    <div class="grupo-campo">
                        <label>Nivel de Riesgo</label>
                        <div class="input-falso"><i class="fa-solid fa-triangle-exclamation"></i> <%= nEncontrado.getNivelRiesgo() %></div>
                    </div>
                    <div class="grupo-campo">
                        <label>Región y Tiempo</label>
                        <div class="input-falso">
                            <i class="fa-solid fa-earth-americas"></i> <%= nEncontrado.getRegion() %> 
                            | <i class="fa-solid fa-clock"></i> <%= nEncontrado.getTiempoActivoDias() %> días activo
                        </div>
                    </div>
                </div>
            </div>

            <div style="text-align: right; margin-top: 20px;">
                <a href="simulacion.jsp?id=<%= nEncontrado.getIdNegocio() %>" class="btn-crear">
                    <i class="fa-solid fa-rocket"></i> Operar Negocio
                </a>
            </div>
        </div>
    <% } else { %>
        <div style="text-align:center; padding:20px; color:#991B1B; background:#FEF2F2; border-radius:8px; border: 1px solid #FCA5A5;">
            <i class="fa-solid fa-circle-xmark"></i> No se encontró el negocio: "<%= nombreBuscar %>".
        </div>
    <% } %>
<% } %>
    

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
