<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css"> 
        <link rel="stylesheet" href="newcss.css">
        <link rel="stylesheet" href="negocio.css">
        <title>NEGOCIOS</title>
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
                    
                    <div class="opcion activa">
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

            <div class="contenido-pagina">
                <br><br>
                <div class="modulo-header">
                    <h2>Negocio</h2>
                    <p>Gestiona los ciclos operativos, estatus y control de tu empresa simulada.</p>
                </div>
                <%
        if(request.getParameter("status") != null && request.getParameter("status").equals("success")) {
    %>
        <div style="background-color: #DEF7EC; color: #03543F; padding: 15px; border-radius: 8px; font-size: 14px; border-left: 5px solid #31C48D; max-width: 600px; margin: 0 auto 20px auto; text-align: left; box-shadow: 0 4px 6px -1px rgba(0,0,0,0.1);">
            <i class="fa-solid fa-circle-check" style="margin-right: 8px; color: #31C48D;"></i> 
            <strong>¡Excelente!</strong> Tu nuevo negocio ha sido creado y guardado con éxito en la simulación.
        </div>
    <%
        }
    %>
                <br><br><br><br>
                <div class="panel-control-negocio">
                    <a href="crear_negocio.jsp" class="tarjeta-control">
                        <i class="fa-solid fa-circle-plus" style="color: #10B981;"></i>
                        <span>Crear Negocio</span>
                    </a>

                    <a href="ver_negocio.jsp" class="tarjeta-control">
                        <i class="fa-solid fa-eye" style="color: #3B82F6;"></i>
                        <span>Ver Negocio</span>
                    </a>

                    <a href="buscar_para_modificar.jsp" class="tarjeta-control">
                        <i class="fa-solid fa-pen-to-square" style="color: #7C3AED;"></i>
                        <span>Modificar Negocio</span>
                    </a>

                    <a href="eliminar_negocio.jsp" class="tarjeta-control">
                        <i class="fa-solid fa-trash-can" style="color: #EF4444;"></i>
                        <span>Eliminar Negocio</span>
                    </a>
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