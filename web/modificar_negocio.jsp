<%@page import="model.negocio"%>
<%@page import="dao.NegocioDao"%>
<%@page import="model.usuario"%>
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
%>

<!DOCTYPE html>
<html>
    <head>
        <title>MicroBiz - Principal</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css"> 
        <link rel="stylesheet" href="newcss.css">
        <link rel="stylesheet" href="negocio.css">
        <link rel="stylesheet" href="mod_negocio.css">
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
    <div class="form-wrapper">
        <div class="form-header">
            <h2>Modificar Negocio</h2>
            <p>Actualiza la información de tu empresa.</p>
        </div>
        
        <%
    // Lógica para recuperar el negocio a editar usando tu DAO actual
    int idEditar = Integer.parseInt(request.getParameter("id"));
    NegocioDao dao = new NegocioDao();
    usuario user = (usuario) session.getAttribute("usuarioLogueado");
    
    negocio n = null;
    for (negocio item : dao.listarNegociosPorUsuario(user.getIdUsuario())) {
        if (item.getIdNegocio() == idEditar) {
            n = item;
            break;
        }
    }
%>

<form action="ActualizarNegocioServlet" method="POST" class="card-form">
    <input type="hidden" name="id" value="<%= n.getIdNegocio() %>">

    <div class="input-group">
        <label>Nombre del Negocio</label>
        <input type="text" name="nombre" value="<%= n.getNombreNegocio() %>" required>
    </div>
    
    <div class="input-group">
    <label>Tipo de Negocio</label>
    <select name="tipo" required>
        <option value="Papeleria" <%= n.getTipoNegocio().equalsIgnoreCase("Papeleria") ? "selected" : "" %>>Papelería</option>
        <option value="Lavanderia" <%= n.getTipoNegocio().equalsIgnoreCase("Lavanderia") ? "selected" : "" %>>Lavandería</option>
        <option value="Comida Rapida/Restaurante" <%= n.getTipoNegocio().equalsIgnoreCase("Comida Rapida/Restaurante") ? "selected" : "" %>>Comida rápida / Restaurante</option>
        <option value="Tienda de Ropa" <%= n.getTipoNegocio().equalsIgnoreCase("Tienda de Ropa") ? "selected" : "" %>>Tienda de ropa</option>
    </select>
</div>

    <div class="input-group">
    <label>Capital Inicial (No editable)</label>
    <input type="number" name="capital" value="<%= n.getCapitalInicialInvertido() %>" readonly style="background-color: #f0f0f0;">
</div>
    <div class="input-group">
    <label>Balance Actual (No editable)</label>
    <input type="number" name="balance" value="<%= n.getBalanceActual() %>" readonly style="background-color: #f0f0f0; border: none; cursor: not-allowed;">
</div>
    <div class="input-group">
        <label>Ganancia Esperada</label>
        <input type="number" name="ganancia" step="0.01" value="<%= n.getGananciaEsperada() %>">
    </div>
    <div class="input-group">
    <label>Región</label>
    <select name="region" required>
        <option value="America" <%= n.getRegion().equalsIgnoreCase("America") ? "selected" : "" %>>América</option>
        <option value="Africa" <%= n.getRegion().equalsIgnoreCase("Africa") ? "selected" : "" %>>África</option>
        <option value="Asia" <%= n.getRegion().equalsIgnoreCase("Asia") ? "selected" : "" %>>Asia</option>
        <option value="Europa" <%= n.getRegion().equalsIgnoreCase("Europa") ? "selected" : "" %>>Europa</option>
    </select>
</div>
    <div class="input-group">
    <label>Nivel de Riesgo</label>
    <select name="riesgo" required>
        <option value="Bajo" <%= n.getNivelRiesgo().equalsIgnoreCase("Bajo") ? "selected" : "" %>>Bajo</option>
        <option value="Medio" <%= n.getNivelRiesgo().equalsIgnoreCase("Medio") ? "selected" : "" %>>Medio</option>
        <option value="Alto" <%= n.getNivelRiesgo().equalsIgnoreCase("Alto") ? "selected" : "" %>>Alto</option>
    </select>
</div>
    <div class="actions">
        <a href="negocio.jsp" class="btn-secondary">Cancelar</a>
        <button type="submit" class="btn-primary">Guardar Cambios</button>
    </div>
</form>

        
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