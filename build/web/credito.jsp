<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="dao.NegocioDao"%>
<%@page import="dao.CreditoDao"%>
<%@page import="model.negocio"%>
<%@page import="model.Credito"%>
<%@page import="java.util.List"%>
<%@page import="java.math.BigDecimal"%>
<%@page import="java.math.RoundingMode"%>

<%
    
    
    // Cambiamos 'idUsuario' por 'usuarioLogueado' para coincidir con tu LoginServlet
    // Suponiendo que 'usuarioLogueado' guarda un objeto Usuario, extraemos el ID
    model.usuario user = (model.usuario) session.getAttribute("usuarioLogueado");

    if (user == null) {
        response.sendRedirect("login.jsp");
        return;
    }
    
    int idUsuario = user.getIdUsuario(); // O como se llame el método para obtener el ID
    
    // ... el resto de tu código sigue igual
    
    // 2. Inicialización de DAOs
    NegocioDao negDao = new NegocioDao();
    CreditoDao creDao = new CreditoDao();
    
    // 3. Cargar negocios del usuario REAL
    List<model.negocio> listaNegocios = negDao.listarPorUsuario(idUsuario);
    
    // Debug para verificar
    System.out.println("DEBUG: Usuario logueado ID: " + idUsuario);
    System.out.println("DEBUG: Negocios encontrados: " + (listaNegocios != null ? listaNegocios.size() : 0));
 
    
    // 3. Capturar negocio seleccionado
    String idNegParam = request.getParameter("idNegocio");
    model.negocio negocioSeleccionado = null;
    List<Credito> listaCreditos = null;

    // Variables para los stats
    BigDecimal deudaTotal = BigDecimal.ZERO;
    BigDecimal interesPromedio = BigDecimal.ZERO;
    int prestamosActivosCount = 0;

    if (idNegParam != null && !idNegParam.isEmpty()) {
        try {
            int idNeg = Integer.parseInt(idNegParam);
            negocioSeleccionado = negDao.buscarPorId(idNeg);
            
            // Aquí cargamos los créditos de ESE negocio específico
            listaCreditos = creDao.listarPorNegocio(idNeg); 

            if (listaCreditos != null && !listaCreditos.isEmpty()) {
                prestamosActivosCount = listaCreditos.size();
                BigDecimal sumaInteres = BigDecimal.ZERO;
                for (Credito c : listaCreditos) {
                    deudaTotal = deudaTotal.add(c.getMontoRestante());
                    sumaInteres = sumaInteres.add(c.getTasaInteres());
                }
                interesPromedio = sumaInteres.divide(new BigDecimal(prestamosActivosCount), 2, RoundingMode.HALF_UP);
            }
        } catch (NumberFormatException e) {
            System.out.println("Error al procesar ID de negocio: " + e.getMessage());
        }
    }
    System.out.println("DEBUG: Negocios cargados: " + (listaNegocios != null ? listaNegocios.size() : "NULL"));
    System.out.println("DEBUG: ID Usuario en sesión: " + idUsuario);
%>
<!DOCTYPE html>
<html>
    <head>
        <title>MicroBiz - Crédito</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
        <link rel="stylesheet" href="newcss.css"> <link rel="stylesheet" href="Credito.css"> 
        <script>
    function cambiarNegocio() {
        const id = document.getElementById("selNegocio").value;
        window.location.href = "credito.jsp?idNegocio=" + id;
    }

    // CORRECCIÓN en tu script dentro de credito.jsp
function pagarParcial(idCredito) {
    const idNeg = "<%= idNegParam %>";
    
    // Pedimos al usuario que ingrese el monto
    const monto = prompt("¿Cuánto deseas abonar a este crédito?", "100");
    
    // Si el usuario presiona "Cancelar" o deja el campo vacío, no hacemos nada
    if (monto !== null && monto !== "") {
        window.location.href = "CreditoServlet?accion=abonar&idCredito=" + idCredito + 
                               "&idNegocio=" + idNeg + 
                               "&montoAbono=" + monto;
    }
}

function liquidar(idCredito) {
    if(confirm("¿Estás seguro de que deseas liquidar este crédito totalmente?")) {
        const idNeg = "<%= idNegParam %>";
        window.location.href = "CreditoServlet?accion=liquidar&idCredito=" + idCredito + "&idNegocio=" + idNeg;
    }
}
</script>
    </head>
    <body>
        <div class="contenedor-principal">
            <div class="barra-superior" style="height: 75px; flex-shrink: 0;">
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
                    <div class="opcion activa">
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
            
            <div class="contenedor-stats-credito">
                <div class="card-stat">
                    <small>Saldo actual</small>
                    <h2 class="<%= (negocioSeleccionado != null && negocioSeleccionado.getBalanceActual().doubleValue() < 0) ? "texto-rojo" : "texto-verde" %>">
                        $<%= (negocioSeleccionado != null) ? negocioSeleccionado.getBalanceActual() : "0.00" %>
                    </h2>
                </div>
                <div class="card-stat">
                    <small>Deuda total</small>
                    <h2 class="texto-naranja">$<%= deudaTotal %></h2>
                </div>
                <div class="card-stat">
                    <small>Préstamos pedidos</small>
                    <h2><%= prestamosActivosCount %></h2>
                </div>
                <div class="card-stat">
                    <small>Interés promedio</small>
                    <h2 class="texto-azul"><%= interesPromedio %>%</h2>
                </div>
            </div>

            <div class="dashboard-grid">
                
                <div class="panel-lateral">
                    <div class="panel-holografico">
                        <h3><i class="fa-solid fa-briefcase"></i> Negocio Activo</h3>
                        <form action="credito.jsp" method="GET">
    <select name="idNegocio" onchange="this.form.submit()" class="select-tech">
        <option value="">Selecciona una empresa...</option>
        <% 
        if(listaNegocios != null) {
            for(model.negocio n : listaNegocios) {
                String selected = (idNegParam != null && idNegParam.equals(String.valueOf(n.getIdNegocio()))) ? "selected" : "";
        %>
                <option value="<%= n.getIdNegocio() %>" <%= selected %>>
                    <%= n.getNombreNegocio() %>
                </option>
        <% 
            } 
        } 
        %>
    </select>
</form>
                    </div>

                    <div class="panel-holografico margin-top">
                        <h3>Solicitar préstamo</h3>
                        <% if(negocioSeleccionado != null && negocioSeleccionado.getBalanceActual().doubleValue() < 0) { %>
                            <div class="alerta-negativa">
                                <i class="fa-solid fa-circle-exclamation"></i> Tu saldo es negativo. ¡Pide un crédito para sobrevivir!
                            </div>
                        <% } %>

                        <form action="CreditoServlet" method="POST" class="form-credito">
                            <input type="hidden" name="accion" value="solicitar">
                            <input type="hidden" name="idNegocio" value="<%= (negocioSeleccionado != null) ? negocioSeleccionado.getIdNegocio() : "" %>">
                            
                            <label>Monto solicitado</label>
                            <input type="number" name="monto" placeholder="Ej. 5000" required <%= (negocioSeleccionado == null) ? "disabled" : "" %>>
                            
                            <label>Plazo y tasa de interés</label>
<select name="plazo_y_tasa" <%= (negocioSeleccionado == null) ? "disabled" : "" %>>
    <option value="5|10.0">5 Turnos (10% Interés)</option>
    <option value="10|15.0">10 Turnos (15% Interés)</option>
    <option value="20|25.0">20 Turnos (25% Interés)</option>
</select>
                            <input type="hidden" name="tasa" value="15.0"> <label>Motivo del préstamo</label>
                            <input type="text" name="nombrePrestamo" placeholder="Ej. Compra de inventario" required <%= (negocioSeleccionado == null) ? "disabled" : "" %>>

                            <button type="submit" class="btn-primary" <%= (negocioSeleccionado == null) ? "disabled" : "" %>>
                                <i class="fa-solid fa-plus"></i> Crear préstamo
                            </button>
                        </form>
                    </div>
                </div>

                <div class="panel-principal">
    <h3>Préstamos Activos</h3>
    
    <%-- Si la lista está vacía, mostramos un mensaje estético --%>
    <% if(listaCreditos == null || listaCreditos.isEmpty()) { %>
        <div class="aviso-vacio">
            <i class="fa-solid fa-circle-info"></i>
            <p>No hay créditos activos asociados a este negocio.</p>
        </div>
    <% } else { 
        for(Credito c : listaCreditos) { %>
            <div class="tarjeta-prestamo">
                <div class="info-prestamo">
                    <h4><%= c.getNombrePrestamo() %></h4>
                    <span class="monto-restante">$<%= c.getMontoRestante() %></span>
                    <p>de $<%= c.getMontoSolicitado() %> original</p>
                </div>
                
                <div class="detalles-tecnicos">
                    <small>Interés: <%= c.getTasaInteres() %>%</small>
                    <small>Turnos: <%= c.getTurnosRestantes() %> / <%= c.getPlazoTurnos() %></small>
                </div>

                <%-- Dentro de tu bucle for(Credito c : listaCreditos) --%>
<div class="acciones-prestamo">
    <% if(c.getTurnosRestantes() > 0) { %>
        <button class="btn-secundario" onclick="pagarParcial(<%= c.getIdCredito() %>)">Pagar Parte</button>
        <button class="btn-primario" onclick="liquidar(<%= c.getIdCredito() %>)">Liquidar</button>
    <% } else { %>
        <span class="texto-verde">Crédito liquidado</span>
    <% } %>
</div>
            </div>
    <%  } 
    } %>
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