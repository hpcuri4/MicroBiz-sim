<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css"> 
        <link rel="stylesheet" href="newcss.css">
        <link rel="stylesheet" href="C_ver_datos.css">
        <title>Mi Perfil de Jugador - MicroBiz</title>
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
                <div class="perfil-wrapper">
                    
                    <div class="perfil-header">
                        <div class="avatar-grande">
                            <i class="fa-solid fa-user-astronaut"></i>
                        </div>
                        <div class="perfil-titulo">
                            <h2>Expediente del Jugador</h2>
                            <p>Consulta el estado general de tu cuenta y tus avances en el simulador.</p>
                        </div>
                    </div>

                    <div class="seccion-perfil">
                        <h3 class="titulo-seccion"><i class="fa-solid fa-id-card-clip text-azul"></i> Identificación General</h3>
                        <div class="grid-datos-jugador">
                            <div class="caja-dato">
                                <span class="label-dato">Nombre de Usuario</span>
                                <span class="valor-dato">Halid Kiray</span>
                            </div>
                            <div class="caja-dato">
                                <span class="label-dato">Correo Electrónico</span>
                                <span class="valor-dato">correo@gmail.com</span>
                            </div>
                            <div class="caja-dato">
                                <span class="label-dato">Cantidad de dinero</span>
                                <span class="valor-dato badge-rol">42000</span>
                            </div>
                        </div>
                    </div>

                    <div class="seccion-perfil">
                        <h3 class="titulo-seccion"><i class="fa-solid fa-chart-line text-morado"></i> Rendimiento en el Mercado</h3>
                        <div class="grid-stats-jugador">
                            <div class="card-stat">
                                <i class="fa-solid fa-building-columns stat-icon color-1"></i>
                                <div class="stat-info">
                                    <h4>Empresas Creadas</h4>
                                    <p class="stat-numero">3 Activas</p>
                                </div>
                            </div>
                            <div class="card-stat">
                                <i class="fa-solid fa-hourglass-half stat-icon color-2"></i>
                                <div class="stat-info">
                                    <h4>Tiempo Invertido</h4>
                                    <p class="stat-numero">14.5 Horas</p>
                                </div>
                            </div>
                            <div class="card-stat">
                                <i class="fa-solid fa-award stat-icon color-3"></i>
                                <div class="stat-info">
                                    <h4>Puntuación Total</h4>
                                    <p class="stat-numero">850 Puntos</p>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="seccion-perfil">
                        <h3 class="titulo-seccion"><i class="fa-solid fa-medal text-verde"></i> Insignias Obtenidas</h3>
                        <div class="grid-insignias">
                            
                            <div class="badge-item obtenido">
                                <div class="badge-icon"><i class="fa-solid fa-seedling"></i></div>
                                <h5>Primeros Pasos</h5>
                                <p>Completaste con éxito tu primer registro de negocio.</p>
                            </div>

                            <div class="badge-item obtenido">
                                <div class="badge-icon"><i class="fa-solid fa-scale-balanced"></i></div>
                                <h5>Balance Perfecto</h5>
                                <p>Mantuviste un estado financiero libre de pérdidas una ronda entera.</p>
                            </div>

                            <div class="badge-item bloqueado">
                                <div class="badge-icon"><i class="fa-solid fa-lock"></i></div>
                                <h5>Magnate de MicroBiz</h5>
                                <p>Alcanza una puntuación superior a los 950 puntos.</p>
                            </div>

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
    </body>
</html>