<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>MicroBiz Sim - Actualizar Mejoras</title>
    
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <link rel="stylesheet" href="actualizar_mejora.css">
    <link rel="stylesheet" href="newcss.css">
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
                    <div class="status-badge-morado">
                        <div class="dot-parpadeante"></div> SISTEMA DE EVOLUCIÓN
                    </div>
                    <div class="saldo-simulado">
                        <small>Presupuesto para I+D</small>
                        $45,200 <small>MXN</small>
                    </div>
                    <p class="descripcion-tech">
                        Eleva el nivel de tu infraestructura actual. Cada actualización reduce costos operativos permanentes y desbloquea multiplicadores de ventas.
                    </p>
                    
                    <div class="monitor-impacto">
                        <span class="label-grafico">ESTADO DE OPTIMIZACIÓN</span>
                        <div class="barra-progreso-total">
                            <div class="llenado-progreso" style="width: 60%;"></div>
                        </div>
                        <div class="indicadores-flex">
                            <div><i class="fa-solid fa-up-long style-v"></i> Nivel Promedio: <strong>LVL 3</strong></div>
                        </div>
                    </div>
                </div>

                <div class="panel-terminal-formulario">
                    <div class="header-formulario">
                        <h3>Optimizar Activo</h3>
                        <p>Selecciona una tecnología desplegada para mejorar su rendimiento.</p>
                    </div>

                    <form action="ActualizarMejoraServlet" method="POST" class="formulario-tech">
                        
                        <div class="grupo-input-tech">
                            <label><i class="fa-solid fa-list-check"></i> Activo a mejorar</label>
                            <div class="wrapper-select-custom">
                                <select name="idActivo" required>
                                    <option value="" disabled selected>Selecciona una tecnología...</option>
                                    <option value="1">Servidor Cloud Alfa (Nivel 1)</option>
                                    <option value="2">Algoritmo de Ventas Beta (Nivel 2)</option>
                                    <option value="3">Software de Logística (Nivel 1)</option>
                                </select>
                            </div>
                        </div>

                        <div class="info-costo-upgrade">
                            <div class="detalle-upgrade">
                                <span>Costo de Actualización:</span>
                                <strong>$12,500 MXN</strong>
                            </div>
                            <div class="detalle-upgrade">
                                <span>Nuevo Beneficio:</span>
                                <strong class="texto-positivo">+8% Eficiencia</strong>
                            </div>
                        </div>

                        <button type="submit" class="btn-actualizar-tech">
                            <i class="fa-solid fa-bolt"></i> CONFIRMAR ACTUALIZACIÓN
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