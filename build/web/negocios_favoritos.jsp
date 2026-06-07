<%@page import="model.Favorito"%>
<%@page import="java.util.List"%>
<%@page import="dao.FavoritoDAO"%>
<%@page import="model.usuario"%>
<%-- NUEVOS IMPORTS PARA TRAER LOS NEGOCIOS DE LA BD --%>
<%@page import="model.negocio"%>
<%@page import="dao.NegocioDao"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    // 🛡️ CONTROL DINÁMICO ESTRICTO DE SESIÓN
    HttpSession sesionOk = request.getSession(false);
    usuario usuarioLogueado = null;
    
    if (sesionOk != null) {
        usuarioLogueado = (usuario) sesionOk.getAttribute("usuarioLogueado");
    }
    
    if (usuarioLogueado == null) {
        response.sendRedirect("login.jsp?error=sessionExpired");
        return;
    }

    int idUsuario = usuarioLogueado.getIdUsuario(); // Corregido según tu getter de la clase usuario

    // 1. CARGA DIRECTA DE FAVORITOS
    FavoritoDAO daoFavorito = new FavoritoDAO();
    List<Favorito> lista = daoFavorito.listarPorUsuario(idUsuario);

    // 2. CARGA DINÁMICA DE LOS NEGOCIOS REGISTRADOS POR EL USUARIO
    NegocioDao daoNegocio = new NegocioDao();
    List<negocio> listaNegociosUsuario = daoNegocio.listarPorUsuario(idUsuario);
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css"> 
        <link rel="stylesheet" href="negocios_favoritos.css">
        <link rel="stylesheet" href="newcss.css">
        <title>MicroBiz - Negocios Favoritos</title>
    </head>
    <body>
        <div class="contenedor-principal">
            
            <div class="barra-superior">
                <div class="logo"><i class="fa-solid fa-cubes-stacked"></i> MicroBiz</div>
                 <div class="menu-navegacion">
                    <div class="opcion">
                        <a href="index.html"><i class="fa-solid fa-house"></i><span>Principal</span></a>
                    </div>

                    <div class="opcion">
                        <a href="negocio.jsp"><i class="fa-solid fa-briefcase"></i><span>Negocio</span></a>
                    </div>
                    
                    <div class="opcion activa">
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
                <div class="header-favoritos">
                    <h2><i class="fa-solid fa-star" style="color: #FFD700;"></i> Mis Negocios Favoritos</h2>
                    <p>Monitorea y organiza los giros comerciales en los que planeas invertir.</p>
                </div>

                <div class="tarjeta-cristal-favorito" style="margin-bottom: 30px; padding: 20px;">
    <form action="AccionesFavoritosServlet" method="POST" style="display: flex; gap: 15px; align-items: flex-end;">
        <input type="hidden" name="accion" value="alta">
        
        <div style="display: flex; flex-direction: column; gap: 6px; flex: 1;">
            <label style="color: #A9A8F5; font-size: 13px;">Giro Comercial:</label>
            <select name="id_negocio" style="background: rgba(25, 22, 43, 0.6); color: white; padding: 10px; border-radius: 8px; border: 1px solid rgba(255,255,255,0.2); width: 100%;">
                <% 
                    if (listaNegociosUsuario != null && !listaNegociosUsuario.isEmpty()) {
                        for (negocio n : listaNegociosUsuario) { 
                %>
                            <option value="<%= n.getIdNegocio() %>">
                                🏢 <%= n.getNombreNegocio() %> (<%= n.getTipoNegocio() %>)
                            </option>
                <% 
                        }
                    } else { 
                %>
                        <option value="">⚠️ Primero registra un negocio en la sección "Negocio"</option>
                <% 
                    } 
                %>
            </select>
        </div>
        
        <div style="display: flex; flex-direction: column; gap: 6px; width: 180px;">
            <label style="color: #A9A8F5; font-size: 13px;">Prioridad:</label>
            <select name="prioridad" style="background: rgba(25, 22, 43, 0.6); color: white; padding: 10px; border-radius: 8px; border: 1px solid rgba(255,255,255,0.2);">
                <option value="Alta">🔥 Alta</option>
                <option value="Baja">🔭 En Radar</option>
            </select>
        </div>
        
        <button type="submit" <% if(listaNegociosUsuario == null || listaNegociosUsuario.isEmpty()){ %> disabled style="background: #475569; cursor: not-allowed;" <% } else { %> style="background: #22C55E; cursor: pointer;" <% } %> class="btn-añadir-fav">
            Añadir
        </button>
    </form>
</div>

                <div class="grid-favoritos">
                    
                    <div class="columna-favoritos">
                        <h3>🔥 Prioridad Alta</h3>
                        <div class="contenedor-tarjetas">
                            <% for (Favorito fav : lista) { 
                                if ("Alta".equals(fav.getComicPrioridad())) { %>
                                <div class="tarjeta-cristal-favorito">
                                    <h4><%= fav.getNombreNegocio() %></h4>
                                    <p>Giro: <%= fav.getTipoNegocio() %></p>
                                    <p>Inversión: $<%= fav.getCapitalInicialInvertido() %></p>
                                    <div class="acciones-tarjeta-fav">
                                        <a href="AccionesFavoritosServlet?accion=cambiar&id_favorito=<%= fav.getIdFavorito() %>&nueva_prioridad=Baja" class="btn-fav">Bajar Prioridad</a>
                                        <a href="AccionesFavoritosServlet?accion=baja&id_favorito=<%= fav.getIdFavorito() %>" class="btn-fav">Quitar</a>
                                    </div>
                                </div>
                            <% } } %>
                        </div>
                    </div>

                    <div class="columna-favoritos">
                        <h3>🔭 En Radar</h3>
                        <div class="contenedor-tarjetas">
                            <% for (Favorito fav : lista) { 
                                if ("Baja".equals(fav.getComicPrioridad())) { %>
                                <div class="tarjeta-cristal-favorito">
                                    <h4><%= fav.getNombreNegocio() %></h4>
                                    <p>Giro: <%= fav.getTipoNegocio() %></p>
                                    <p>Inversión: $<%= fav.getCapitalInicialInvertido() %></p>
                                    <div class="acciones-tarjeta-fav">
                                        <a href="AccionesFavoritosServlet?accion=cambiar&id_favorito=<%= fav.getIdFavorito() %>&nueva_prioridad=Alta" class="btn-fav">Subir Prioridad</a>
                                        <a href="AccionesFavoritosServlet?accion=baja&id_favorito=<%= fav.getIdFavorito() %>" class="btn-fav">Quitar</a>
                                    </div>
                                </div>
                            <% } } %>
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