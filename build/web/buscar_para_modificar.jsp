<%@page import="model.negocio"%>
<%@page import="dao.NegocioDao"%>
<%@page import="model.usuario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    // Lógica de búsqueda (idéntica a ver_negocio)
    String nombreBuscar = request.getParameter("nombre");
    boolean busquedaRealizada = (nombreBuscar != null && !nombreBuscar.isEmpty());
    negocio nEncontrado = null;
    usuario user = (usuario) session.getAttribute("usuarioLogueado");

    if (busquedaRealizada && user != null) {
        NegocioDao dao = new NegocioDao();
        for (negocio n : dao.listarNegociosPorUsuario(user.getIdUsuario())) {
            if (n.getNombreNegocio().equalsIgnoreCase(nombreBuscar)) {
                nEncontrado = n;
                break;
            }
        }
    }
%>
<!DOCTYPE html>
<html>
<head>
    <title>Buscar para Modificar</title>
            <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css"> 
    <link rel="stylesheet" href="newcss.css">
    <link rel="stylesheet" href="buscar_para_modificar.css">
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
                <br><br><br><br><br><br><br>
        <h2>Modificar Negocio</h2>
        <form method="GET">
            <input type="text" name="nombre" placeholder="Nombre del negocio a buscar..." value="<%= (nombreBuscar != null ? nombreBuscar : "") %>">
            <button type="submit">Buscar</button>
        </form>

        <% if (busquedaRealizada) { %>
            <% if (nEncontrado != null) { %>
                <div class="tarjeta-negocio">
                    <h3><%= nEncontrado.getNombreNegocio() %></h3>
                    <p>Tipo: <%= nEncontrado.getTipoNegocio() %></p>
                    
                    <a href="modificar_negocio.jsp?id=<%= nEncontrado.getIdNegocio() %>" class="btn-primary">
                        Modificar este negocio
                    </a>
                </div>
            <% } else { %>
                <p>No se encontró el negocio.</p>
            <% } %>
        <% } %>
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
