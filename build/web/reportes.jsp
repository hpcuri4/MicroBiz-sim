<!DOCTYPE html>
<html>
    <head>
        <title>MicroBiz - Principal</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css"> 
        <link rel="stylesheet" href="newcss.css">
        <link rel="stylesheet" href="reportes.css">
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
                        <a href="credito.jsp"><i class="fa-solid fa-credit-card"></i><span>Crédito</span></a>
                    </div>
                    
                    <div class="opcion">
                        <a href="simulacion.jsp"><i class="fa-solid fa-chart-line"></i><span>Simulación</span></a>
                    </div>
                    
                    <div class="opcion activa">
                        <a href="reportes.jsp"><i class="fa-solid fa-file-invoice-dollar"></i><span>Reportes</span></a>
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
    <div class="reportes-container">
        <h2>Reportes Financieros</h2>
        <br>
        <p>Selecciona un negocio para visualizar su rendimiento detallado:</p>
        <br>
        <div class="negocios-list">
            <!-- Cada tarjeta es un acceso directo a su reporte -->
            <div class="card card-negocio">
                <div class="info">
                    <h3>Tienda de Electrónica</h3>
                    <span class="status-activo">Activo</span>
                </div>
                <a href="ver_reportes.jsp" class="btn-primary">Ver Reporte Detallado</a>
            </div>
            <br>
            <div class="card card-negocio">
                <div class="info">
                    <h3>Cafetería Central</h3>
                    <span class="status-activo">Activo</span>
                </div>
                <a href="ver_reportes.jsp" class="btn-primary">Ver Reporte Detallado</a>
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