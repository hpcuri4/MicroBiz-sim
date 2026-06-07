<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>MicroBiz Sim - Rematar Mejoras</title>
    
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    
    <link rel="stylesheet" href="rematar_mejora.css">
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
                    <div class="status-badge-rojo">
                        <div class="dot-parpadeante-rojo"></div> LIQUIDACIÓN DE ACTIVOS
                    </div>
                    <div class="saldo-simulado">
                        <small>Recuperación Estimada</small>
                        Valor Variable
                    </div>
                    <p class="descripcion-tech">
                        ¿Necesitas liquidez inmediata? Rematar un activo te devolverá un porcentaje del capital invertido originalmente, pero perderás los bonos de producción asociados de forma permanente.
                    </p>
                    
                    <div class="monitor-riesgo">
                        <span class="label-grafico"><i class="fa-solid fa-triangle-exclamation"></i> ALERTA DE ESTRATEGIA</span>
                        <p class="advertencia-texto">Vender infraestructura crítica puede estancar el crecimiento operativo de tu empresa a mediano plazo.</p>
                    </div>
                </div>

                <div class="panel-terminal-formulario">
                    <div class="header-formulario">
                        <h3>Rematar Infraestructura</h3>
                        <p>Selecciona el activo que deseas dar de baja del sistema financiero.</p>
                    </div>

                    <form action="RematarMejoraServlet" method="POST" class="formulario-tech">
                        
                        <div class="grupo-input-tech">
                            <label><i class="fa-solid fa-boxes-stacked"></i> Activo en posesión</label>
                            <div class="wrapper-select-custom">
                                <select name="idActivo" required>
                                    <option value="" disabled selected>Selecciona un activo para liquidar...</option>
                                    <option value="1">Servidor Cloud Alfa (Retorno: $5,000 MXN)</option>
                                    <option value="2">Algoritmo de Ventas Beta (Retorno: $8,500 MXN)</option>
                                    <option value="3">Software de Logística (Retorno: $3,200 MXN)</option>
                                </select>
                            </div>
                        </div>

                        <div class="cuadro-aviso-peligro">
                            <div class="icono-aviso">
                                <i class="fa-solid fa-circle-exclamation"></i>
                            </div>
                            <div class="texto-aviso">
                                <strong>Acción Irreversible</strong>
                                <p>Al confirmar, el activo se eliminará de tu inventario y el dinero se sumará a tu balance general de inmediato.</p>
                            </div>
                        </div>

                        <button type="submit" class="btn-rematar-tech">
                            <i class="fa-solid fa-hand-holding-dollar"></i> CONFIRMAR VENTA DE ACTIVO
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