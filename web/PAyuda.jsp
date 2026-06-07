<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>MicroBiz - Ayuda</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css"> 
        <link rel="stylesheet" href="newcss.css">
        <link rel="stylesheet" href="PAyuda.css">
    </head>
    <body>
        <div class="contenedor-principal">
            
            <!-- Barra Superior (Copiada de tu base) -->
            <div class="barra-superior">
                <div class="logo">
                    <i class="fa-solid fa-cubes-stacked"></i> MicroBiz
                </div>
                <div class="menu-navegacion">
                    <div class="opcion"><a href="index.html"><i class="fa-solid fa-house"></i><span>Principal</span></a></div>
                    <div class="opcion"><a href="negocio.jsp"><i class="fa-solid fa-briefcase"></i><span>Negocio</span></a></div>
                    <div class="opcion"><a href="negocios_favoritos.jsp"><i class="fa-solid fa-heart"></i><span>Negocios Favoritos</span></a></div>
                    <div class="opcion"><a href="credito.jsp"><i class="fa-solid fa-credit-card"></i><span>Crédito</span></a></div>
                    <div class="opcion"><a href="simulacion.jsp"><i class="fa-solid fa-chart-line"></i><span>Simulación</span></a></div>
                    <div class="opcion"><a href="MejorayTecnologia.jsp"><i class="fa-solid fa-computer"></i><span>Mejoras y tecnologia</span></a></div>
                    <div class="opcion"><a href="Cliente.jsp"><i class="fa-solid fa-users"></i><span>Clientes</span></a></div>
                    <div class="opcion"><a href="alianzas.jsp"><i class="fa-solid fa-handshake"></i><span>Alianzas Comerciales</span></a></div>
                    <div class="opcion"><a href="configuracion.jsp"><i class="fa-solid fa-gear"></i><span>Configuración</span></a></div>
                    <div class="opcion activa"><a href="PAyuda.jsp"><i class="fa-solid fa-circle-question"></i><span>Ayuda y Guía</span></a></div>
                    <div class="opcion"><a href="Feedback.jsp"><i class="fa-solid fa-comments"></i><span>Feedback</span></a></div>
                </div>
            </div>

            <!-- Contenido Específico de Ayuda -->
            <div class="contenido-pagina">
                <div class="faq-container">
                    <h2>Centro de Ayuda MicroBiz</h2>
                    
                    <details class="faq-item">
                        <summary>¿Cómo inicio mi primera partida?</summary>
                        <p>Selecciona "Negocio" en el menú principal, asígnale un nombre a tu negocio, tipo y monto inicial. Despues, ve a simulacion y empieza una nueva partida con ese negocio.</p>
                    </details>
                    
                    <details class="faq-item">
                        <summary>¿Cómo puedo mejorar el flujo de caja?</summary>
                        <p>Ajusta tus precios según la demanda, reduce gastos operativos innecesarios y mantén niveles de inventario óptimos para evitar costos de almacenamiento.</p>
                    </details>
                    
                    <details class="faq-item">
                        <summary>¿Cuándo es el momento adecuado para expandir?</summary>
                        <p>Se recomienda expandir cuando tu tasa de utilidad neta sea constante durante al menos tres periodos financieros seguidos.</p>
                    </details>
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