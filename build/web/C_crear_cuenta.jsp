<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css"> 
        <link rel="stylesheet" href="newcss.css">
        <!-- Archivo exclusivo para los estilos de esta pantalla -->
        <link rel="stylesheet" href="C_crear_cuenta.css">
        <title>Registrar Socio - MicroBiz</title>
    </head>
    <body>
        <div class="contenedor-principal">
            
            <!-- Barra Superior con retorno al Hub de Configuración -->
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

            <!-- Contenido Central -->
            <div class="contenido-pagina">
                <div class="create-wrapper">
                    
                    <div class="create-header">
                        <h2>Crear una nueva cuenta</h2>
                        <p>Registra a un nuevo integrante para la toma de decisiones en tu simulación de negocios.</p>
                    </div>

                    <%
                        if(request.getParameter("registro") != null && "ok".equals(request.getParameter("registro"))) {
                    %>
                        <div class="alert-success">
                            <i class="fa-solid fa-circle-check"></i> ¡Cuenta registrado con éxito! Se ha dado de alta.
                        </div>
                    <%
                        }
                    %>

                    <!-- Tarjeta del Formulario de Alta -->
                    <form action="ConfiguracionServlet" method="POST" class="card-create-form">
                        <!-- Input oculto para indicarle la acción al Servlet -->
                        <input type="hidden" name="accion" value="crear">

                        <!-- Campo: Nombre del Socio -->
                        <div class="input-group">
                            <label>Nombre Completo</label>
                            <div class="wrapper-input">
                                <i class="fa-solid fa-user-plus"></i>
                                <input type="text" name="nombreNCuenta" placeholder="Ej. Juan Pérez" required>
                            </div>
                        </div>

                        <!-- Campo: Correo del Socio -->
                        <div class="input-group">
                            <label>Correo Electrónico</label>
                            <div class="wrapper-input">
                                <i class="fa-solid fa-envelope"></i>
                                <input type="email" name="correoNCuenta" placeholder="socio@correo.com" required>
                            </div>
                        </div>
                        
                        
                        <!-- Campo: Contraseña Inicial -->
                        <div class="input-group">
                            <label>Contraseña</label>
                            <div class="wrapper-input">
                                <i class="fa-solid fa-key"></i>
                                <input type="password" name="contraseniaNCuenta" placeholder="Asigna una clave" required>
                            </div>
                            <span class="input-help">Puedes modificar esta contraseña más tarde desde su propio panel de perfil.</span>
                        </div>
                        
                        <!-- Botón de acción con estilo verde -->
                        <div class="form-actions">
                            <button type="submit" class="btn-submit-create">Dar de Alta Socio</button>
                        </div>
                    </form>

                </div>
            </div>

            <!-- Pie de Página Estable -->
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