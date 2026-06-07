<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css"> 
        <link rel="stylesheet" href="newcss.css">
        <link rel="stylesheet" href="registro.css">
        <title>Crear Cuenta - MicroBiz</title>
    </head>
    <body>
        <div class="contenedor-principal">
            
            <!-- Barra Superior Simplificada (Logo Corporativo) -->
            <div class="barra-superior">
                <div class="logo">
                    <i class="fa-solid fa-cubes-stacked"></i> MicroBiz
                </div>
            </div>

            <!-- Contenido Central -->
            <div class="contenido-pagina">
                <div class="form-wrapper">
                    <div class="form-header">
                        <h2>Crear Cuenta</h2>
                        <p>Regístrate para comenzar a gestionar tus propias empresas simuladas.</p>
                    </div>
                        <%
                        if(request.getParameter("error") != null) {
                        %>
                        <div style="background-color: #FEF2F2; color: #991B1B; padding: 12px; border-radius: 6px; font-size: 13px; border-left: 4px solid #EF4444; text-align: left; margin-bottom: 15px;">
                            <i class="fa-solid fa-triangle-exclamation"></i> El correo electrónico ya se encuentra registrado.
                        </div>
                        <%
                            }
                        %>

                    <!-- Tarjeta del Formulario de Registro -->
                    <form action="RegistroServlet" method="POST" class="card-form">
                        
                        <!-- Campo: Nombre Completo -->
                        <div class="input-group">
                            <label>Nombre Completo</label>
                            <div class="wrapper-input">
                                <i class="fa-solid fa-user"></i>
                                <input type="text" name="nombre_completo" placeholder="Tu nombre y apellidos" required>
                            </div>
                        </div>

                        <!-- Campo: Correo Electrónico -->
                        <div class="input-group">
                            <label>Correo Electrónico</label>
                            <div class="wrapper-input">
                                <i class="fa-solid fa-envelope"></i>
                                <input type="email" name="correo_electronico" placeholder="ejemplo@correo.com" required>
                            </div>
                        </div>
                        
                        <!-- Campo: Contraseña -->
                        <div class="input-group">
                            <label>Contraseña</label>
                            <div class="wrapper-input">
                                <i class="fa-solid fa-lock"></i>
                                <input type="password" name="contrasena" placeholder="Crea una contraseña segura" required>
                            </div>
                        </div>
                        
                        <!-- Interfaz inferior: Enlace de retorno y botón de acción -->
                        <div class="registro-footer-interface">
                            <p class="txt-login">¿Ya tienes cuenta? <a href="login.jsp">Inicia sesión</a></p>
                            
                            <div class="actions">
                                <button type="submit" class="btn-primary">Registrarse</button>
                            </div>
                        </div>
                    </form>
                </div>
            </div>

            <!-- Pie de Página Estable (Amarrado al fondo) -->
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