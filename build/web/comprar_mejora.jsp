<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css"> 
        <link rel="stylesheet" href="comprar_mejora.css">
        <link rel="stylesheet" href="newcss.css">
        <title>Comprar Mejora - MicroBiz</title>
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

            <div class="contenido-pagina">
                <div class="dashboard-holografico-form">
                    
                    <div class="panel-diagnostico-form">
                        <div class="status-badge-verde"><i class="fa-solid fa-wallet"></i> CAPITAL DISPONIBLE</div>
                        <div class="saldo-simulado">$45,000.00 <small>MXN</small></div>
                        
                        <p class="descripcion-tech">Al adquirir un activo tecnológico, los fondos se deducirán inmediatamente de tu cuenta. Las mejoras incrementan la productividad o reducen costes en la siguiente simulación.</p>
                        
                        <div class="monitor-impacto">
                            <span class="label-grafico">PREVISIÓN DE IMPACTO</span>
                            <div class="indicadores-flex">
                                <div><i class="fa-solid fa-chart-line style-v"></i> <small>Ventas:</small> <strong>+15% Max</strong></div>
                                <div><i class="fa-solid fa-gauge-high style-a"></i> <small>Eficiencia:</small> <strong>+10%</strong></div>
                            </div>
                        </div>
                    </div>

                    <div class="panel-terminal-formulario">
                        <div class="header-formulario">
                            <h3>Módulo de Adquisición</h3>
                            <p>Selecciona un elemento de la infraestructura disponible en el catálogo de simulación.</p>
                        </div>

                        <form action="MejorasServlet" method="POST" class="formulario-tech">
                            <input type="hidden" name="accion" value="comprar">

                            <div class="grupo-input-tech">
                                <label><i class="fa-solid fa-microchip"></i> Seleccionar Tecnología</label>
                                <div class="wrapper-select-custom">
                                    <select name="idMejoraCatalogo" required>
                                        <option value="" disabled selected>Elige una mejora para tu empresa...</option>
                                        <option value="1">Software CRM Avanzado — $5,000.00 MXN</option>
                                        <option value="2">Servidores Cloud Escalables — $8,500.00 MXN</option>
                                        <option value="3">Maquinaria Semiautomatizada — $12,000.00 MXN</option>
                                        <option value="4">Terminales Punto de Venta (TPV) — $3,500.00 MXN</option>
                                    </select>
                                </div>
                            </div>

                            <div class="grupo-input-tech">
                                <label><i class="fa-solid fa-network-wired"></i> Desplegar en el Área de:</label>
                                <div class="wrapper-select-custom">
                                    <select name="areaMejora" required>
                                        <option value="Marketing">Ventas y Marketing Digital</option>
                                        <option value="Producción">Producción y Logística de Planta</option>
                                        <option value="Sistemas">Sistemas y Soporte Técnico</option>
                                    </select>
                                </div>
                            </div>

                            <button type="submit" class="btn-comprar-tech">
                                <i class="fa-solid fa-cart-plus"></i> Autorizar Inversión Comercial
                            </button>
                        </form>
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