<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>MicroBiz - Simulación</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
        <link rel="stylesheet" href="newcss.css">
        <link rel="stylesheet" href="CreditoySimulacion.css">
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
                    <div class="opcion activa">
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

            <div class="contenido-pagina" style="overflow: hidden !important;">
                
                <div class="simulacion-wrapper-interno" style="display: flex; flex-direction: column; height: 100%; justify-content: flex-start; gap: 10px;">

                    <section class="simulacion-encabezado" style="margin: 0; flex-shrink: 0;">
                        <div>
                            <span class="etiqueta-seccion">Panel de simulación</span>
                            <h1 style="font-size: 30px; margin: 0;">Simulación</h1>
                        </div>
                    </section>

                    <section class="alerta-evento" style="margin-bottom: 5px; flex-shrink: 0; padding: 10px 15px;">
                        <div class="icono-alerta">
                            <i class="fa-solid fa-triangle-exclamation" style="font-size: 30px;"></i>
                        </div>
                        <div class="texto-alerta">
                            <h2>Aumento de costos del proveedor</h2>
                            <p style="margin: 2px 0;">
                                Tu proveedor principal subió precios un 15% por escasez de componentes. Debes decidir cómo responde tu negocio este turno.
                            </p>
                            <span>Este evento afecta tu turno actual</span>
                        </div>
                    </section>

                    <section class="metricas-simulacion" style="margin-bottom: 8px; flex-shrink: 0; padding: 8px;">
                        <div class="metrica">
                            <i class="fa-solid fa-sack-dollar"></i>
                            <strong>40k</strong>
                            <span>Ingresos</span>
                        </div>
                        <div class="metrica">
                            <i class="fa-solid fa-dollar-sign"></i>
                            <strong>10k</strong>
                            <span>Ganancias</span>
                        </div>
                        <div class="metrica">
                            <i class="fa-solid fa-user-group"></i>
                            <strong>126</strong>
                            <span>Clientes</span>
                        </div>
                        <div class="metrica">
                            <i class="fa-solid fa-star"></i>
                            <strong>84%</strong>
                            <span>Reputación</span>
                        </div>
                    </section>

                    <section class="simulacion-grid" style="display: grid; grid-template-columns: 1fr 1.3fr; gap: 15px; flex: 1; min-height: 0; overflow: hidden; margin-bottom: 5px;">

                        <div class="panel-simulacion" style="display: flex; flex-direction: column; height: 100%; min-height: 0; box-sizing: border-box;">
                            <h2>Eventos del turno</h2>
                            
                            <div class="panel-scroll-interno" style="flex: 1; overflow-y: auto; display: flex; flex-direction: column; gap: 8px; padding-right: 4px;">
                                <article class="evento-card">
                                    <div>
                                        <h3>Aumento de costos de proveedor</h3>
                                        <p>Tu proveedor principal sube precios un 15% por escasez de chips. Afecta tu margen directamente.</p>
                                    </div>
                                    <strong>Impacto: -$1,800 en ganancias</strong>
                                </article>

                                <article class="evento-card">
                                    <div>
                                        <h3>Feria tecnológica regional</h3>
                                        <p>Hay una expo este fin de semana. Puedes participar para ganar visibilidad y nuevos clientes.</p>
                                    </div>
                                    <strong>Oportunidad: +30 a +50 clientes potenciales</strong>
                                </article>
                            </div>

                            <a href="detalles_evento.jsp" class="btn-secundario" style="flex-shrink: 0; margin-top: 8px;">
                                <i class="fa-solid fa-circle-info"></i> Ver detalles eventos
                            </a>
                        </div>

                        <div class="panel-simulacion panel-decision" style="display: flex; flex-direction: column; height: 100%; min-height: 0; box-sizing: border-box;">
                            <h2>Toma de decisión</h2>

                            <div class="panel-scroll-interno" style="flex: 1; overflow-y: auto; display: flex; flex-direction: column; gap: 8px; padding-right: 4px;">
                                <div class="decision-item">
                                    <article class="decision-card">
                                        <h3>Participar en la feria</h3>
                                        <p>Renta un stand y promociona tu tienda. Alto potencial de nuevos clientes, pero requiere inversión.</p>
                                    </article>
                                    <button class="btn-decision">Tomar decisión 1</button>
                                </div>

                                <div class="decision-item">
                                    <article class="decision-card">
                                        <h3>Buscar nuevo proveedor</h3>
                                        <p>Investiga alternativas para reducir el impacto del alza. Toma tiempo, pero puede mejorar márgenes a futuro.</p>
                                    </article>
                                    <button class="btn-decision">Tomar decisión 2</button>
                                </div>
                            </div>

                            <button class="btn-secundario btn-saltar" style="flex-shrink: 0; margin-top: 8px;">
                                <i class="fa-solid fa-forward"></i> Saltar turno
                            </button>
                        </div>

                    </section>
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