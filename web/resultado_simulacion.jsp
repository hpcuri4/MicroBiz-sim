<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
    <head>
        <title>MicroBiz - Resultados de la Simulación</title>
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
                        <h1 class="titulo-seccion">Reporte de Rendimiento Económico</h1>
                    </div>

                    <div class="tarjeta-bienvenida-glass" style="border-left: 5px solid #10B981;">
                        <div class="info-jugador">
                            <h2><i class="fa-solid fa-circle-check" style="color: #10B981;"></i> Turno Concluido exitosamente</h2>
                            <p>${sessionScope.mensajeSimulacion != null ? sessionScope.mensajeSimulacion : 'Las variables del mercado se han calculado con base en las tendencias del mercado global.'}</p>
                        </div>
                    </div>

                    <div class="tarjeta-simulacion">
                        <h2><i class="fa-solid fa-receipt"></i> Estado de Resultados Simulados</h2>
                        
                        <div class="tabla-simulacion-wrapper" style="overflow-x: auto; margin-top: 10px;">
                            <table class="tabla-simulacion">
                                <thead>
                                    <tr>
                                        <th>Concepto Operativo</th>
                                        <th>Monto Previo</th>
                                        <th>Impacto del Turno</th>
                                        <th>Balance Final</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <td>Capital de Reinversión</td>
                                        <td>$150,000.00</td>
                                        <td style="color: #b91c1c; font-weight: 600;">-$25,000.00</td>
                                        <td>$125,000.00</td>
                                    </tr>
                                    <tr>
                                        <td>Rendimiento de Mercado</td>
                                        <td>$0.00</td>
                                        <td style="color: #166534; font-weight: 600;">
                                            +$${sessionScope.ultimoRendimiento != null ? sessionScope.ultimoRendimiento : '28,750.00'}
                                        </td>
                                        <td style="color: #166534; font-weight: 600;">
                                            $${sessionScope.ultimoRendimiento != null ? sessionScope.ultimoRendimiento : '28,750.00'}
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>Impuestos y Operación (TIE)</td>
                                        <td>$0.00</td>
                                        <td style="color: #b91c1c; font-weight: 600;">-$3,100.00</td>
                                        <td>-$3,100.00</td>
                                    </tr>
                                </tbody>
                             </table>
                        </div>

                        <div style="margin-top: 25px; display: flex; gap: 15px;">
                            <a href="simulacion_normal.jsp" class="btn-sim-crear" style="text-decoration: none; text-align: center;">
                                <i class="fa-solid fa-arrow-right"></i> Configurar Siguiente Turno
                            </a>
                            <a href="index.html" class="btn-sim-crear" style="background-color: transparent; border: 1px solid #7C3AED; color: #7C3AED; box-shadow: none; text-decoration: none; text-align: center;">
                                <i class="fa-solid fa-chart-pie"></i> Volver al Panel
                            </a>
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