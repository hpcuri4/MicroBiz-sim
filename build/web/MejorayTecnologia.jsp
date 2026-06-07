<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css"> 
        <link rel="stylesheet" href="newcss.css">
        <link rel="stylesheet" href="MejorayTecnologia.css">
        <title>Mejoras y Tecnología - MicroBiz</title>
    </head>
    <body>
        <div class="contenedor-principal">
            
            <!-- Barra Superior de Navegación -->
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
                    <div class="opcion activa">
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

            <!-- INTERFAZ COMPLETA DE TABLERO HOLOGRÁFICO -->
            <div class="contenido-pagina">
                <div class="dashboard-holografico">
                    
                    <!-- COLUNA IZQUIERDA: DIAGNÓSTICO DE TECNOLOGÍA -->
                    <div class="panel-diagnostico">
                        <h2>Mejoras y tecnología</h2>
                        <p class="descripcion-tech">Monitoreo de infraestructura simulada, optimización de algoritmos de venta y adquisición de activos de capital.</p>
                        
                        <!-- Gráfico decorativo de rendimiento empresarial (Puro CSS) -->
                        <div class="monitor-rendimiento">
                            <span class="label-grafico">EFICIENCIA GLOBAL</span>
                            <div class="barra-progreso-total"><div class="llenado-progreso" style="width: 75%;"></div></div>
                            <div class="metricas-rapidas">
                                <div><small>PROD</small> <span>+12%</span></div>
                                <div><small>TIEMPO</small> <span>-8%</span></div>
                            </div>
                        </div>
                    </div>

                    <!-- COLUMNA DERECHA: ACCIONES DEL CRUD ESTILO TERMINAL -->
                    <div class="panel-terminal-acciones">
                        
                        <!-- 1. COMPRAR MEJORA -->
                        <a href="comprar_mejora.jsp" class="fila-accion tech-verde">
                            <div class="icon-box-tech"><i class="fa-solid fa-cart-plus"></i></div>
                            <div class="info-accion">
                                <h3>Comprar mejora</h3>
                                <p>Adquirir nuevos activos e infraestructura.</p>
                            </div>
                            <div class="status-accion">DISPONIBLE <i class="fa-solid fa-chevron-right"></i></div>
                        </a>
                        <br>
                        <!-- 2. INVENTARIO DE ACTIVOS -->
                        <a href="inventario_activos.jsp" class="fila-accion tech-azul">
                            <div class="icon-box-tech"><i class="fa-solid fa-boxes-stacked"></i></div>
                            <div class="info-accion">
                                <h3>Inventario de activos</h3>
                                <p>Revisar tecnologías actualmente desplegadas.</p>
                            </div>
                            <div class="status-accion">VER <i class="fa-solid fa-chevron-right"></i></div>
                        </a>
                        <br>
                        <!-- 3. ACTUALIZAR MEJORAS -->
                        <a href="actualizar_mejora.jsp" class="fila-accion tech-morado">
                            <div class="icon-box-tech"><i class="fa-solid fa-arrow-up-from-ground-water"></i></div>
                            <div class="info-accion">
                                <h3>Actualizar mejoras</h3>
                                <p>Subir de nivel el software o maquinaria actual.</p>
                            </div>
                            <div class="status-accion">OPTIMIZAR <i class="fa-solid fa-chevron-right"></i></div>
                        </a>
                        <br>
                        <!-- 4. REMATAR MEJORA -->
                        <a href="rematar_mejora.jsp" class="fila-accion tech-rojo">
                            <div class="icon-box-tech"><i class="fa-solid fa-hand-holding-dollar"></i></div>
                            <div class="info-accion">
                                <h3>Rematar mejora</h3>
                                <p>Liquidar activos para recuperar fondos de emergencia.</p>
                            </div>
                            <div class="status-accion">LIQUIDAR <i class="fa-solid fa-chevron-right"></i></div>
                        </a>

                    </div>
                </div>
            </div>
            
            <!-- Pie de Página Stable -->
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