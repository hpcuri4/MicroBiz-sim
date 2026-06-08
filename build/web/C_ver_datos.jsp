<%@page import="dao.UsuarioDao"%> <%@page import="model.usuario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    HttpSession sesionOk = request.getSession(false);
    usuario usuarioSesion = null;
    usuario usuarioLogueado = null; // Este será el que tenga los datos frescos
    
    if (sesionOk != null) {
        usuarioSesion = (usuario) sesionOk.getAttribute("usuarioLogueado");
    }
    
    if (usuarioSesion == null) {
        response.sendRedirect("login.jsp?error=sessionExpired");
        return;
    } else {
        // 🔄 Usamos tu método obtenerPorId para traer los datos limpios y completos de la BD
        UsuarioDao usuarioDao = new UsuarioDao();
        usuarioLogueado = usuarioDao.obtenerPorId(usuarioSesion.getIdUsuario());
    }
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css"> 
        <link rel="stylesheet" href="newcss.css">
        <link rel="stylesheet" href="C_ver_datos.css">
        <title>Mi Perfil - MicroBiz</title>
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
                <div class="profile-wrapper">
                    
                    <div class="profile-header">
                        <h2>Información de tu Cuenta</h2>
                        <p>Consulta tus credenciales registradas y el estatus actual de tu perfil en el simulador.</p>
                    </div>

                    <div class="card-profile">
                        
                        <div class="profile-avatar-section">
                            <div class="avatar-icon-box">
                                <i class="fa-solid fa-user-tie"></i>
                            </div>
                            <div class="avatar-text">
                                <h3><%= usuarioLogueado.getNombreCompleto() %></h3>
                                <span class="badge-role">Jugador empresario</span>
                            </div>
                        </div>

                        <hr class="divider">

                        <div class="profile-details-grid">
                            
                            <div class="info-tile">
                                <div class="tile-icon"><i class="fa-solid fa-id-badge"></i></div>
                                <div class="tile-content">
                                    <label>ID de Registro</label>
                                    <p>#<%= usuarioLogueado.getIdUsuario() %></p>
                                </div>
                            </div>

                            <div class="info-tile">
                                <div class="tile-icon"><i class="fa-solid fa-signature"></i></div>
                                <div class="tile-content">
                                    <label>Nombre Completo</label>
                                    <p><%= usuarioLogueado.getNombreCompleto() %></p>
                                </div>
                            </div>

                            <div class="info-tile">
                                <div class="tile-icon"><i class="fa-solid fa-envelope-open-text"></i></div>
                                <div class="tile-content">
                                    <label>Correo Electrónico</label>
                                    <p><%= usuarioLogueado.getCorreoElectronico() %></p>
                                </div>
                            </div>

                            <div class="info-tile">
                                <div class="tile-icon"><i class="fa-solid fa-shield-halved"></i></div>
                                <div class="tile-content">
                                    <label>Estatus del Sistema</label>
                                    <p class="status-active">Conectado / Verificado</p>
                                </div>
                            </div>
                                
                                <div class="info-tile">
    <div class="tile-icon"><i class="fa-solid fa-key"></i></div>
    <div class="tile-content" style="display: flex; flex-direction: column; width: 100%;">
        <label>CONTRASEÑA ACTUAL</label>
        <div style="display: flex; justify-content: space-between; align-items: center; width: 100%; margin-top: 5px;">
            
            <span id="txtPassword" data-pass="<%= usuarioLogueado.getContrasena() != null ? usuarioLogueado.getContrasena() : "123456" %>" style="font-size: 15px; color: #2c3e50; font-weight: 500;">••••••••</span>
            
            <button type="button" id="btnTogglePass" onclick="togglePassword();" style="background: none; border: none; color: #7f8c8d; cursor: pointer; font-size: 16px; padding: 0 10px;">
                <i class="fa-solid fa-eye-slash" id="eyeIcon"></i>
            </button>
        </div>
    </div>
</div>

                        </div>
                                
                                

                        <div class="profile-actions-nav">
                            <a href="C_editar_datos.jsp" class="btn-nav-edit">
                                <i class="fa-solid fa-user-pen"></i> Modificar Mis Datos
                            </a>
                            <a href="configuracion.jsp" class="btn-nav-back">
                                <i class="fa-solid fa-arrow-left"></i> Volver al Panel
                            </a>
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
            
           <script>
    function togglePassword() {
        var txtPass = document.getElementById("txtPassword");
        var eyeIcon = document.getElementById("eyeIcon");
        var realPassword = txtPass.getAttribute("data-pass");
        
        // Comparamos si actualmente tiene los puntitos ocultos
        if (txtPass.innerText === "••••••••") {
            // Mostramos el texto de la contraseña real
            txtPass.innerText = realPassword;
            
            // Cambiamos el icono para mostrar el ojo abierto (remover tachado)
            eyeIcon.classList.remove("fa-eye-slash");
            eyeIcon.classList.add("fa-eye");
        } else {
            // Volvemos a ocultar con los puntitos
            txtPass.innerText = "••••••••";
            
            // Restauramos el icono al ojo tachado
            eyeIcon.classList.remove("fa-eye");
            eyeIcon.classList.add("fa-eye-slash");
        }
    }
</script>
    </body>
</html>