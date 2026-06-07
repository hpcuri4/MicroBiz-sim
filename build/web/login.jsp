<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css"> 
        <link rel="stylesheet" href="newcss.css">
        <link rel="stylesheet" href="login.css">
        <title>Iniciar Sesión - MicroBiz</title>
    </head>
    <body>
        <div class="contenedor-principal">
            
            <div class="barra-superior">
                <div class="logo">
                    <i class="fa-solid fa-cubes-stacked"></i> MicroBiz
                </div>
            </div>

            <div class="contenido-pagina">
                <div class="form-wrapper">
                    <div class="form-header">
                        <h2>Iniciar Sesión</h2>
                        <p>Ingresa a tu cuenta para gestionar tus simulaciones.</p>
                    </div>
                    
                    
                    <%
                    // Detectar si venimos de un registro exitoso
                    if(request.getParameter("registro") != null) {
                    %>
                    <div style="background-color: #F0FDF4; color: #166534; padding: 12px; border-radius: 6px; font-size: 13px; border-left: 4px solid #22C55E; text-align: left; margin-bottom: 15px;">
                        <i class="fa-solid fa-circle-check"></i> ¡Cuenta creada con éxito! Ya puedes iniciar sesión.
                    </div>
                    <%
                    }
    
                    // Tu bloque anterior de error de contraseña se queda igual aquí abajo...
                    if(request.getParameter("error") != null) {
                    %>
                    <div style="background-color: #FEF2F2; color: #991B1B; padding: 12px; border-radius: 6px; font-size: 13px; border-left: 4px solid #EF4444; text-align: left; margin-bottom: 15px;">
                        <i class="fa-solid fa-triangle-exclamation"></i> Correo o contraseña incorrectos. Inténtalo de nuevo.
                    </div>
                    <%
                        }
                    %>

                    <form action="LoginServlet" method="POST" class="card-form">
                        
                        <div class="input-group">
                            <label>Correo Electrónico</label>
                            <div class="wrapper-input">
                                <i class="fa-solid fa-envelope"></i>
                                <input type="email" name="correo_electronico" placeholder="ejemplo@correo.com" required>
                            </div>
                        </div>
                        
                        <div class="input-group">
                            <label>Contraseña</label>
                            <div class="wrapper-input">
                                <i class="fa-solid fa-lock"></i>
                                <input type="password" name="contrasena" placeholder="********" required>
                            </div>
                        </div>
                        
                        <div class="login-footer-interface">
                            <p class="txt-registro">¿No tienes una cuenta? <a href="registro.jsp">¡Crea una!</a></p>
                            
                            <div class="actions">
                                <button type="submit" class="btn-primary">Ingresar</button>
                            </div>
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