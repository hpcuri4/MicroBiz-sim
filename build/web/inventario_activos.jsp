<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>MicroBiz Sim - Inventario de Activos</title>
    
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    
    <link rel="stylesheet" href="inventario_activos.css">
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
                    <div class="status-badge-verde">
                        <i class="fa-solid fa-box-archive"></i> ACTIVOS OPERATIVOS
                    </div>
                    <div class="saldo-simulado">
                        <small>Estado de Infraestructura</small>
                        Estable
                    </div>
                    <p class="descripcion-tech">
                        Consulta y administración de todas las patentes, equipos e infraestructura tecnológica adquirida para mitigar costos y potenciar la producción de la empresa.
                    </p>
                </div>

                <div class="panel-terminal-formulario">
                    <div class="header-formulario">
                        <h3>Inventario de Activos</h3>
                        <p>Monitoreo de rendimientos acumulados en el simulador.</p>
                    </div>
                    
                    <div class="tabla-contenedor">
                        <table class="tabla-tecnologia">
                            <thead>
                                <tr>
                                    <th>Código</th>
                                    <th>Activo Adquirido</th>
                                    <th>Impacto de Operación</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <td>#TEC-001</td>
                                    <td>Servidor Cloud Optimizado</td>
                                    <td><span class="impacto-positivo"><i class="fa-solid fa-arrow-trend-up"></i> +15% Eficiencia</span></td>
                                </tr>
                                <tr>
                                    <td>#TEC-002</td>
                                    <td>Licencia CRM Avanzado</td>
                                    <td><span class="impacto-positivo"><i class="fa-solid fa-arrow-trend-up"></i> -10% Costos de Clientes</span></td>
                                </tr>
                                <tr>
                                    <td>#TEC-003</td>
                                    <td>Automatización de Inventario v1</td>
                                    <td><span class="impacto-positivo"><i class="fa-solid fa-arrow-trend-up"></i> +5% Producción</span></td>
                                </tr>
                            </tbody>
                        </table>
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