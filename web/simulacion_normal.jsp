<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
    <head>
        <title>MicroBiz - Simulación de Mercado</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css"> 
        <link rel="stylesheet" href="newcss.css">
        <link rel="stylesheet" href="dashboard.css">
    </head>
    <body>
        <div class="contenedor-principal">
            
            <div class="barra-superior">
                <div class="logo">
                    <i class="fa-solid fa-cubes-stacked"></i> MicroBiz
                </div>
                
                <div class="menu-navegacion">
                    <div class="opcion"><a href="index.html"><i class="fa-solid fa-house"></i><span>Principal</span></a></div>
                    <div class="opcion"><a href="negocio.jsp"><i class="fa-solid fa-briefcase"></i><span>Negocio</span></a></div>
                    <div class="opcion"><a href="negocios_favoritos.jsp"><i class="fa-solid fa-heart"></i><span>Negocios Favoritos</span></a></div>
                    <div class="opcion"><a href="credito.jsp"><i class="fa-solid fa-credit-card"></i><span>Crédito</span></a></div>
                    <div class="opcion activa"><a href="simulacion.jsp"><i class="fa-solid fa-chart-line"></i><span>Simulación</span></a></div>
                    <div class="opcion"><a href="MejorayTecnologia.jsp"><i class="fa-solid fa-computer"></i><span>Mejoras y tecnologia</span></a></div>
                    <div class="opcion"><a href="Cliente.jsp"><i class="fa-solid fa-users"></i><span>Clientes</span></a></div>
                    <div class="opcion"><a href="alianzas.jsp"><i class="fa-solid fa-handshake"></i><span>Alianzas Comerciales</span></a></div>
                    <div class="opcion"><a href="configuracion.jsp"><i class="fa-solid fa-gear"></i><span>Configuración</span></a></div>
                    <div class="opcion"><a href="PAyuda.jsp"><i class="fa-solid fa-circle-question"></i><span>Ayuda y Guía</span></a></div>
                    <div class="opcion"><a href="Feedback.jsp"><i class="fa-solid fa-comments"></i><span>Feedback</span></a></div>
                </div>
            </div>

            <div class="contenido-pagina">
                <div class="contenedor-dashboard">
                    
                    <div class="encabezado-seccion">
                        <h1 class="titulo-seccion">Simulador de Entorno Económico</h1>
                    </div>

                    <div class="tarjeta-bienvenida-glass">
                        <div class="info-jugador" style="width: 100%;">
                            <h2><i class="fa-solid fa-hourglass-half"></i> Turno Actual: Cuatrimestre 1</h2>
                            <p>Modifica las variables de inversión, evalúa las proyecciones financieras y procesa el escenario para observar el impacto en tus empresas ficticias.</p>
                        </div>
                    </div>

                    <div class="tarjeta-simulacion">
                        <h2><i class="fa-solid fa-sliders"></i> Parámetros de Operación</h2>
                        <form action="ProcesarSimulacionServlet" method="POST" style="display: flex; flex-direction: column; gap: 15px;">
                            
                            <div style="display: flex; flex-wrap: wrap; gap: 20px; align-items: center;">
                                <div style="display: flex; flex-direction: column; gap: 5px;">
                                    <label for="estrategia">Estrategia Comercial:</label>
                                    <select name="estrategia" id="estrategia">
                                        <option value="agresiva">Expansión Agresiva (Mayor riesgo)</option>
                                        <option value="moderada" selected>Crecimiento Sostenido (Moderado)</option>
                                        <option value="conservadora">Consolidación de Capital (Bajo riesgo)</option>
                                    </select>
                                </div>

                                <div style="display: flex; flex-direction: column; gap: 5px;">
                                    <label for="montoInversion">Monto a Reinvertir ($):</label>
                                    <select name="montoInversion" id="montoInversion">
                                        <option value="10000">$10,000 (Capital inicial mínimo)</option>
                                        <option value="25000">$25,000 (Inversión estándar)</option>
                                        <option value="50000">$50,000 (Inversión de alto impacto)</option>
                                    </select>
                                </div>
                            </div>

                            <div style="margin-top: 10px;">
                                <button type="submit" class="btn-sim-crear">
                                    <i class="fa-solid fa-play"></i> Ejecutar Siguiente Turno
                                </button>
                            </div>
                        </form>
                    </div>

                    <h3 class="subtitulo-dashboard">Métricas del Escenario</h3>
                    <div class="grid-resumen-kpi">
                        <div class="tarjeta-kpi-boton" style="cursor: default;">
                            <div class="kpi-icono color-azul">
                                <i class="fa-solid fa-arrow-trend-up"></i>
                            </div>
                            <div class="kpi-info">
                                <h3>+ 4.5%</h3>
                                <p>Inflación proyectada del mercado</p>
                            </div>
                        </div>

                        <div class="tarjeta-kpi-boton" style="cursor: default;">
                            <div class="kpi-icono color-rojo">
                                <i class="fa-solid fa-percentage"></i>
                            </div>
                            <div class="kpi-info">
                                <h3>12.0%</h3>
                                <p>Tasa de interés interbancaria de préstamos</p>
                            </div>
                        </div>

                        <div class="tarjeta-kpi-boton" style="cursor: default;">
                            <div class="kpi-icono color-oro">
                                <i class="fa-solid fa-users-gear"></i>
                            </div>
                            <div class="kpi-info">
                                <h3>Alta</h3>
                                <p>Demanda estimada de clientes</p>
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