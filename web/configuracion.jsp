<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css"> 
        <link rel="stylesheet" href="newcss.css">
        <!-- Estilos específicos para el tablero de opciones -->
        <link rel="stylesheet" href="configuracion.css">
        <title>Configuración - MicroBiz</title>
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
           

            <!-- Contenido Central: Panel de Opciones -->
            <br><br>
            <div class="contenido-pagina">
                <div class="hub-header">
                    <h2>Configuración de la Cuenta</h2>
                    <p>Selecciona una opción para gestionar tu perfil de simulación y datos de jugador.</p>
                </div>
<br><br><br><br>
                <!-- Tablero de 4 Tarjetas Estilo Hub -->
                <div class="grid-config-hub">
                    
                    <!-- Tarjeta 1: VER DATOS (La que programaremos primero) -->
                    <a href="C_ver_datos.jsp" class="card-hub-option btn-ver">
                        <div class="icon-wrapper">
                            <i class="fa-solid fa-eye"></i>
                        </div>
                        <h3>Ver Datos</h3>
                        <p>Visualiza tus estadísticas, rendimiento e historial de jugador.</p>
                    </a>

                    <!-- Tarjeta 2: EDITAR DATOS -->
                    <a href="C_editar_datos.jsp" class="card-hub-option btn-editar">
                        <div class="icon-wrapper">
                            <i class="fa-solid fa-user-pen"></i>
                        </div>
                        <h3>Modificar Perfil</h3>
                        <p>Actualiza tu nombre de usuario, correo y contraseña de acceso.</p>
                    </a>

                    <!-- Tarjeta 3: CREAR CUENTA -->
                    <a href="C_crear_cuenta.jsp" class="card-hub-option btn-crear">
                        <div class="icon-wrapper">
                            <i class="fa-solid fa-user-plus"></i>
                        </div>
                        <h3>Crear Cuenta</h3>
                        <p>Registra subcuentas secundarias para invitar socios a tu equipo.</p>
                    </a>

                    <!-- Tarjeta 4: ELIMINAR CUENTA -->
                    <a href="C_eliminar_cuenta.jsp" class="card-hub-option btn-eliminar">
                        <div class="icon-wrapper">
                            <i class="fa-solid fa-trash-can"></i>
                        </div>
                        <h3>Eliminar Cuenta</h3>
                        <p>Borra tu perfil permanentemente junto con todo tu progreso simulado.</p>
                    </a>
                    <!-- Tarjeta 5: LOG out-->
                    <a href="LogoutServlet" class="card-hub-option btn-hub-logout">
                        <div class="icon-wrapper">
                            <i class="fa-solid fa-right-from-bracket"></i>
                        </div>
                        <h3>Cerrar Sesión</h3>
                        <p>Salir de MicroBiz de forma segura y proteger los datos de tu sesión.</p>
                    </a>

                </div>
            </div>

            <!-- Pie de Página Fijo -->
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