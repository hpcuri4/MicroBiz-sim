<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css"> 
        <link rel="stylesheet" href="newcss.css">
        <link rel="stylesheet" href="C_eliminar_cuenta.css">
        <title>Eliminar Cuenta - MicroBiz</title>
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
                    
                    <div class="opcion">
                        <a href="MejorayTecnologia.jsp"><i class="fa-solid fa-computer"></i><span>Mejoras y tecnologia</span></a>
                    </div>
                    
                    <div class="opcion">
                        <a href="Cliente.jsp"><i class="fa-solid fa-users"></i><span>Clientes</span></a>
                    </div>
                    
                    <div class="opcion">
                        <a href="alianzas.jsp"><i class="fa-solid fa-handshake"></i><span>Alianzas Comerciales</span></a>
                    </div>
                    
                    <div class="opcion activa">
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
                <div class="delete-wrapper">
                    
                    <div class="delete-header">
                        <h2>Eliminar Cuenta definitivamente</h2>
                        <p>Por favor lee con atención las consecuencias de esta acción antes de continuar.</p>
                    </div>

                    <div class="card-delete-form">
                        
                        <div class="danger-banner">
                            <div class="danger-icon-box">
                                <i class="fa-solid fa-triangle-exclamation"></i>
                            </div>
                            <div class="danger-text">
                                <h4>¡Zona de Peligro!</h4>
                                <p>Esta acción es completamente irreversible. Al borrar tu cuenta perderás de forma permanente todo tu progreso, empresas creadas, historial de transacciones y logs dentro de la simulación de MicroBiz.</p>
                            </div>
                        </div>

                        <form action="ConfiguracionServlet" method="POST" id="formEliminar" onsubmit="return confirmarEliminacion();">
                            <input type="hidden" name="accion" value="eliminar">

                            <div class="verification-box">
                                <label for="confirmacionInput">Para confirmar la acción, escribe la palabra <strong>ELIMINAR</strong> a continuación:</label>
                                <div class="wrapper-input">
                                    <i class="fa-solid fa-keyboard"></i>
                                    <input type="text" id="confirmacionInput" placeholder="Escribe ELIMINAR en mayúsculas" autocomplete="off" oninput="validarPalabra();" required>
                                </div>
                            </div>

                            <div class="form-actions">
                                <button type="submit" id="btnEliminar" class="btn-submit-delete" disabled>
                                    <i class="fa-solid fa-trash-can"></i> Entiendo las consecuencias, borrar cuenta
                                </button>
                            </div>
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

        <script>
            function validarPalabra() {
                var input = document.getElementById("confirmacionInput").value;
                var btn = document.getElementById("btnEliminar");
                
                if (input === "ELIMINAR") {
                    btn.removeAttribute("disabled");
                } else {
                    btn.setAttribute("disabled", "true");
                }
            }

            function confirmarEliminacion() {
                return confirm("¿Estás absolutamente seguro? Esta es la última advertencia: se borrarán todas tus métricas de simulación.");
            }
        </script>
    </body>
</html>