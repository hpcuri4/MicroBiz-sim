<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="model.negocio"%>
<%@page import="dao.NegocioDao"%>
<%@page import="model.usuario"%>
<%@page import="java.util.List"%>
<%
    // Asegurar sesión
    usuario user = (usuario) session.getAttribute("usuarioLogueado");
    if (user == null) { response.sendRedirect("login.jsp"); return; }
    
    // Obtener lista dinámica
    NegocioDao dao = new NegocioDao();
    List<negocio> misNegocios = dao.listarNegociosPorUsuario(user.getIdUsuario());
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css"> 
        <link rel="stylesheet" href="negocio.css">
        <link rel="stylesheet" href="newcss.css">
        <link rel="stylesheet" href="eliminar_negocio.css">
        <title>Eliminar Negocio</title>
    </head>
    <body>
        <div class="contenedor-principal">
            <div class="barra-superior">
                <div class="logo">
                    <i class="fa-solid fa-cubes-stacked"></i> MicroBiz
                </div>
                <div class="menu-navegacion">
                    <div class="opcion"><a href="index.html"><i class="fa-solid fa-house"></i><span>Principal</span></a></div>
                    <div class="opcion activa"><a href="negocio.jsp"><i class="fa-solid fa-briefcase"></i><span>Negocio</span></a></div>
                    <div class="opcion"><a href="negocios_favoritos.jsp"><i class="fa-solid fa-heart"></i><span>Negocios Favoritos</span></a></div>
                    <div class="opcion"><a href="credito.jsp"><i class="fa-solid fa-credit-card"></i><span>Crédito</span></a></div>
                    <div class="opcion"><a href="simulacion.jsp"><i class="fa-solid fa-chart-line"></i><span>Simulación</span></a></div>
                    <div class="opcion"><a href="MejorayTecnologia.jsp"><i class="fa-solid fa-computer"></i><span>Mejoras y tecnologia</span></a></div>
                    <div class="opcion"><a href="Cliente.jsp"><i class="fa-solid fa-users"></i><span>Clientes</span></a></div>
                    <div class="opcion"><a href="alianzas.jsp"><i class="fa-solid fa-handshake"></i><span>Alianzas Comerciales</span></a></div>
                    <div class="opcion"><a href="configuracion.jsp"><i class="fa-solid fa-gear"></i><span>Configuración</span></a></div>
                    <div class="opcion"><a href="PAyuda.jsp"><i class="fa-solid fa-circle-question"></i><span>Ayuda y Guía</span></a></div>
                    <div class="opcion"><a href="Feedback.jsp"><i class="fa-solid fa-comments"></i><span>Feedback</span></a></div>
                </div>
            </div>

            <div class="contenido-pagina">
    <div class="form-wrapper">
        <div class="form-header">
            <h2>Eliminar Negocio</h2>
            <p>Ten cuidado. Esta acción no se puede deshacer.</p>
        </div>

        <form action="EliminarNegocioServlet" method="POST" class="card-form border-danger">
            
            <div class="warning-icon-container">
                <i class="fa-solid fa-triangle-exclamation"></i>
            </div>

            <div class="input-group">
    <label>Selecciona el Negocio a Eliminar</label>
    <select name="idNegocio" required>
        <option value="" disabled selected>-- Elige una de tus empresas --</option>
        <%
            for (negocio n : misNegocios) {
        %>
            <option value="<%= n.getIdNegocio() %>"><%= n.getNombreNegocio() %></option>
        <%
            }
        %>
    </select>
</div>

            <div class="warning-text">
                Al confirmar, se perderán de forma permanente todos los registros financieros, reportes e historial de simulación asociados a este negocio.
            </div>
            
            <div class="actions">
                <a href="negocio.jsp" class="btn-secondary">Cancelar</a>
                <button type="submit" class="btn-danger">Eliminar Permanentemente</button>
            </div>
        </form>
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