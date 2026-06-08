<%@page import="model.usuario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    // 🛡️ CONTROL DE SESIÓN: Evita accesos anónimos al Hub
    HttpSession sesionOk = request.getSession(false);
    usuario usuarioLogueado = null;
    
    if (sesionOk != null) {
        usuarioLogueado = (usuario) sesionOk.getAttribute("usuarioLogueado");
    }
    
    if (usuarioLogueado == null) {
        response.sendRedirect("login.jsp?error=sessionExpired");
        return; // Detiene la carga por completo
    }
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css"> 
        <link rel="stylesheet" href="newcss.css">
        <link rel="stylesheet" href="configuracion.css">
        <title>Configuración - MicroBiz</title>
        <style>
            /* Pequeño estilo rápido para tus alertas flotantes */
            .alerta-config {
                padding: 12px 20px;
                border-radius: 8px;
                margin: 15px auto;
                max-width: 600px;
                text-align: center;
                font-family: sans-serif;
                font-weight: bold;
            }
            .alerta-exito { background-color: #d4edda; color: #155724; border: 1px solid #c3e6cb; }
            .alerta-error { background-color: #f8d7da; color: #721c24; border: 1px solid #f5c6cb; }
        </style>
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
            

            <br><br>
            <div class="contenido-pagina">
                <div class="hub-header">
                    <h2>Configuración de la Cuenta</h2>
                    <p>Selecciona una opción para gestionar tu perfil de simulación y datos de jugador.</p>
                </div>

                <%
                    String msgSuccess = request.getParameter("success");
                    String msgError = request.getParameter("error");
                    if("socioRegistrado".equals(msgSuccess)) {
                %>
                    <div class="alerta-config alerta-exito">
                        <i class="fa-solid fa-circle-check"></i> ¡Jugador dado de alta correctamente!
                    </div>
                <% } if("updateFailed".equals(msgError)) { %>
                    <div class="alerta-config alerta-error">
                        <i class="fa-solid fa-circle-xmark"></i> Hubo un problema al procesar la solicitud en la base de datos.
                    </div>
                <% } %>

                <br><br>
                <div class="grid-config-hub">
                    
                    <a href="C_ver_datos.jsp" class="card-hub-option btn-ver">
                        <div class="icon-wrapper">
                            <i class="fa-solid fa-eye"></i>
                        </div>
                        <h3>Ver Datos</h3>
                        <p>Visualiza tus estadísticas, rendimiento e historial de jugador.</p>
                    </a>

                    <a href="C_editar_datos.jsp" class="card-hub-option btn-editar">
                        <div class="icon-wrapper">
                            <i class="fa-solid fa-user-pen"></i>
                        </div>
                        <h3>Modificar Perfil</h3>
                        <p>Actualiza tu nombre de usuario, correo y contraseña de acceso.</p>
                    </a>

                    <a href="C_crear_cuenta.jsp" class="card-hub-option btn-crear">
                        <div class="icon-wrapper">
                            <i class="fa-solid fa-user-plus"></i>
                        </div>
                        <h3>Crear Cuenta</h3>
                        <p>Registra subcuentas secundarias para invitar socios a tu equipo.</p>
                    </a>

                    <a href="C_eliminar_cuenta.jsp" class="card-hub-option btn-eliminar">
                        <div class="icon-wrapper">
                            <i class="fa-solid fa-trash-can"></i>
                        </div>
                        <h3>Eliminar Cuenta</h3>
                        <p>Borra tu perfil permanentemente junto con todo tu progreso simulado.</p>
                    </a>

                    <a href="ConfiguracionServlet?accion=cerrarSesion" 
   class="card-hub-option btn-hub-logout" 
   onclick="return confirm('¿Estás seguro que deseas cerrar tu sesión en MicroBiz?');">
    <div class="icon-wrapper">
        <i class="fa-solid fa-right-from-bracket"></i>
    </div>
    <h3>Cerrar Sesión</h3>
    <p>Salir de MicroBiz de forma segura y proteger los datos de tu sesión.</p>
</a>

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