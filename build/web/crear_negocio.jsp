<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="model.usuario"%>

<%
    HttpSession sesionOk = request.getSession(false);
    usuario usuarioLogueado = null;
    
    if (sesionOk != null) {
        usuarioLogueado = (usuario) sesionOk.getAttribute("usuarioLogueado");
    }
    
    if (usuarioLogueado == null) {
        response.sendRedirect("login.jsp?error=sessionExpired");
        return;
    }
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css"> 
        <link rel="stylesheet" href="crear_negocio.css">
        <title>EMPIEZA TU NEGOCIO</title>
    </head>
    <body>
        <div class="contenedor-principal">
            
            <div class="barra-superior">
                <div class="logo">
                    <i class="fa-solid fa-cubes-stacked"></i> MicroBiz
                </div>
                
                <div class="menu-navegacion">
                    <div class="opcion"><a href="index.html"><i class="fa-solid fa-house"></i><span>Principal</span></a></div>
                    <div class="opcion activa"><a href="negocio.jsp"><i class="fa-solid fa-briefcase"></i><span>Negocio</span></a></div>    
                    <div class="opcion"><a href="negocios_favoritos.jsp"><i class="fa-solid fa-heart"></i><span>Negocios Favoritos</span></a></div>
                    <div class="opcion"><a href="credito.jsp"><i class="fa-solid fa-credit-card"></i><span>Crédito</span></a></div>
                    <div class="opcion"><a href="simulacion.jsp"><i class="fa-solid fa-chart-line"></i><span>Simulación</span></a></div>
                    <div class="opcion"><a href="MejorayTecnologia.jsp"><i class="fa-solid fa-computer"></i><span>Mejoras y tecnologia</span></a></div>
                    <div class="opcion"><a href="Cliente.jsp"><i class="fa-solid fa-users"></i><span>Clientes</span></a></div>
                    <div class="opcion"><a href="alianzas.jsp"><i class="fa-solid fa-handshake"></i><span>Alianzas Comerciales</span></a></div>
                    <div class="opcion"><a href="configuracion.jsp"><i class="fa-solid fa-gear"></i><span>Configuración</span></a></div>
                    <div class="opcion"><a href="PAyuda.jsp"><i class="fa-solid fa-circle-question"></i><span>Ayuda y Guía</span></a></div>
                    <div class="opcion"><a href="Feedback.jsp"><i class="fa-solid fa-comments"></i><span>Feedback</span></a></div>
                </div>
            </div>

            <div class="contenido-pagina">
                <div class="contenedor-crear-negocio">
    
                    <div class="encabezado-seccion">
                        <h1 class="titulo-seccion">Crear Negocio</h1>
                        <div class="badge-fecha">
                            <span class="fecha-dia">03/06/26</span>
                            <span class="fecha-texto">Miércoles</span>
                        </div>
                    </div>

                    <% if(request.getParameter("error") != null) { %>
                        <div style="background-color: #FEF2F2; color: #991B1B; padding: 12px; border-radius: 6px; font-size: 13px; border-left: 4px solid #EF4444; margin-bottom: 15px;">
                            <i class="fa-solid fa-triangle-exclamation"></i> No se pudo crear el negocio. Verifica los datos e intenta de nuevo.
                        </div>
                    <% } %>

                    <form action="GuardarNegocioServlet" method="POST" class="tarjeta-formulario-glass">
                        
                        <div class="columnas-formulario">
                            <div class="columna-campos">
                                <div class="grupo-campo">
                                    <label for="nombreNegocio">Nombre del negocio</label>
                                    <div class="wrapper-input">
                                        <i class="fa-solid fa-building"></i>
                                        <input type="text" id="nombreNegocio" name="nombre" placeholder="Mi Empresa Sim" required>
                                    </div>
                                </div>

                                <div class="grupo-campo">
                                    <label for="capitalInicial">Capital inicial (Rango: $5,000 - $15,000)</label>
                                        <div class="wrapper-input">
                                        <i class="fa-solid fa-dollar-sign"></i>
                                        <input type="number" step="0.01" min="5000" max="15000" id="capitalInicial" name="capital" placeholder="5000.00" required>
                                    </div>
                                </div>

                                <div class="grupo-campo">
                                    <label for="gananciaEsperada">Ganancia esperada</label>
                                    <div class="wrapper-input">
                                        <i class="fa-solid fa-chart-line"></i>
                                        <input type="number" step="0.01" id="gananciaEsperada" name="ganancia" placeholder="0.00" required>
                                    </div>
                                </div>
                            </div>

                            <div class="columna-campos">
                                <div class="grupo-campo" style="display: flex; flex-direction: column; gap: 8px;">
    <label for="tiempoEstimado" style="font-weight: 600; font-size: 14px;">Tiempo estimado (Días fijos)</label>
    <div class="wrapper-input" style="background-color: rgba(0, 0, 0, 0.05); cursor: not-allowed; display: flex; align-items: center; padding: 10px 15px; border-radius: 8px; border: 1px solid rgba(0, 0, 0, 0.1);">
        <i class="fa-solid fa-clock" style="opacity: 0.5; margin-right: 10px; font-size: 16px;"></i>
        <input type="number" id="tiempoEstimado" name="tiempo" value="24" readonly 
               style="cursor: not-allowed; color: #555555; font-weight: bold; background: transparent; border: none; width: 100%; outline: none; font-size: 14px;">
    </div>
</div>
                             

                                <div class="grupo-campo">
                                    <label for="tipoNegocio">Tipo de negocio</label>
                                    <div class="wrapper-input">
                                        <i class="fa-solid fa-folder"></i>
                                        <select id="tipoNegocio" name="tipo" required>
                                            <option value="" disabled selected hidden>Selecciona un tipo</option>
                                            <option value="Papelería">Papelería</option>
                                            <option value="Tiendita de abarrotes">Lavanderia</option>
                                            <option value="Tienda de ropa">Tienda de ropa</option>
                                            <option value="Comida rápida / Restaurante">Comida rápida / Restaurante</option>
                                        </select>
                                        <i class="fa-solid fa-chevron-down icono-dropdown"></i>
                                    </div>
                                </div>

                                <div class="grupo-campo">
                                    <label>Región</label>
                                    <div class="selector-region-interactivo">
                                        <input type="radio" id="regAmerica" name="region" value="América" checked hidden>
                                        <label for="regAmerica" class="opcion-reg">América</label>

                                        <input type="radio" id="regEuropa" name="region" value="Europa" hidden>
                                        <label for="regEuropa" class="opcion-reg">Europa</label>

                                        <input type="radio" id="regAsia" name="region" value="Asia" hidden>
                                        <label for="regAsia" class="opcion-reg">Asia</label>

                                        <input type="radio" id="regAfrica" name="region" value="África" hidden>
                                        <label for="regAfrica" class="opcion-reg">África</label>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="grupo-campo-completo">
                            <label for="nivelRiesgo">Nivel de riesgo</label>
                            <div class="contenedor-slider">
                                <input type="range" id="nivelRiesgo" name="riesgo" min="1" max="3" value="2" step="1">
                                <div class="etiquetas-slider">
                                    <span class="etiqueta-riesgo" data-index="1">Bajo</span>
                                    <span class="etiqueta-riesgo activa" data-index="2">Medio</span>
                                    <span class="etiqueta-riesgo" data-index="3">Alto</span>
                                </div>
                            </div>
                        </div>

                        <div class="fila-botones-accion">
                            <a href="negocio.jsp" class="btn-formulario btn-cancelar">Cancelar</a>
                            <button type="submit" class="btn-formulario btn-crear">Crear negocio</button>
                        </div>

                    </form>

                    <script>
                        const slider = document.getElementById('nivelRiesgo');
                        const etiquetas = document.querySelectorAll('.etiqueta-riesgo');

                        slider.addEventListener('input', () => {
                            const valorActual = slider.value;
                            etiquetas.forEach(etiqueta => {
                                etiqueta.classList.remove('activa');
                                if(etiqueta.getAttribute('data-index') === valorActual) {
                                    etiqueta.classList.add('activa');
                                }
                            });
                        });
                    </script>
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