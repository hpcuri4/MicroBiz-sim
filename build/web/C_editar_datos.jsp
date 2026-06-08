<%@page import="model.usuario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    // 🛡️ CONTROL DE SESIÓN: Evita accesos anónimos directos
    HttpSession sesionOk = request.getSession(false);
    usuario usuarioLogueado = null;
    
    if (sesionOk != null) {
        usuarioLogueado = (usuario) sesionOk.getAttribute("usuarioLogueado");
    }
    
    if (usuarioLogueado == null) {
        response.sendRedirect("login.jsp?error=sessionExpired");
        return;
    }
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css"> 
        <link rel="stylesheet" href="newcss.css">
        <link rel="stylesheet" href="C_editar_datos.css">
        <title>Modificar Perfil - MicroBiz</title>
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
                    <div class="opcion">
                        <a href="MejorayTecnologia.jsp"><i class="fa-solid fa-computer"></i><span>Mejoras y tecnologia</span></a>
                    </div>
                    <div class="opcion">
                        <a href="Cliente.jsp"><i class="fa-solid fa-users"></i><span>Clientes</span></a>
                    </div>
                    <div class="opcion">
                        <a href="alianzas.jsp"><i class="fa-solid fa-handshake"></i><span>Alianzas Comerciales</span></a>
                    </div>
                    <div class="opcion activa">
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
                <div class="edit-wrapper">
                    
                    <div class="edit-header">
                        <h2>Modificar Perfil</h2>
                        <p>Actualiza tu identidad en el simulador o cambia tus credenciales de acceso de forma segura.</p>
                    </div>

                    <%
                        if(request.getParameter("cambio") != null && "ok".equals(request.getParameter("cambio"))) {
                    %>
                        <div class="alert-success">
                            <i class="fa-solid fa-circle-check"></i> ¡Perfil actualizado con éxito!
                        </div>
                    <%
                        } else if(request.getParameter("error") != null) {
                    %>
                        <div class="alert-error" style="background-color: #f8d7da; color: #721c24; padding: 15px; border-radius: 8px; margin-bottom: 20px;">
                            <i class="fa-solid fa-circle-xmark"></i> No se pudieron guardar los cambios. Inténtalo de nuevo.
                        </div>
                    <%
                        }
                    %>

                    <form action="ConfiguracionServlet" method="POST" class="card-edit-form">
                        
                        <input type="hidden" name="accion" value="editarPerfil">

                        <div class="input-group">
                            <label>Nombre Completo</label>
                            <div class="wrapper-input">
                                <i class="fa-solid fa-user"></i>
                                <input type="text" name="nombre" value="<%= usuarioLogueado.getNombreCompleto() %>" required>
                            </div>
                        </div>

                        <div class="input-group">
                            <label>Correo Electrónico (No modificable)</label>
                            <div class="wrapper-input disabled-input" style="background-color: #f0f0f0; opacity: 0.8;">
                                <i class="fa-solid fa-envelope"></i>
                                <input type="email" value="<%= usuarioLogueado.getCorreoElectronico() %>" readonly style="background: transparent; border: none;">
                            </div>
                            <span class="input-help">El correo está amarrado a tu cuenta de simulación institucional.</span>
                        </div>
                        
                        <div class="input-group">
                            <label>Nueva Contraseña</label>
                            <div class="wrapper-input">
                                <i class="fa-solid fa-lock"></i>
                                <input type="password" name="contrasenia" placeholder="Escribe una nueva contraseña si deseas cambiarla">
                            </div>
                            <span class="input-help">Deja este espacio en blanco si prefieres conservar tu contraseña actual.</span>
                        </div>
                        
                        <div class="form-actions">
                            <button type="submit" class="btn-submit-edit">Guardar Cambios</button>
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