<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.List"%>
<%@page import="model.Alianza"%>
<%@page import="dao.AlianzaDao"%>
<%@page import="model.negocio"%> 
<%@page import="dao.NegocioDao"%>
<%@page import="model.usuario"%>

<%
    // 1. Obtenemos el objeto de usuario desde la sesión
    model.usuario u = (model.usuario) session.getAttribute("usuarioLogueado");
    
    // 2. Validación de seguridad
    if (u == null) {
        response.sendRedirect("login.jsp?error=sesion_expirada");
        return; 
    }
    
    // 3. Extraer el ID del objeto usuario
    int idUsuario = u.getIdUsuario();
    
    // 4. Instanciar DAOs primero para validar flujos
    AlianzaDao aDao = new AlianzaDao();
    NegocioDao nDao = new NegocioDao();
    
    // 5. Obtener los negocios que pertenecen al usuario activo
    List<negocio> listaNegocios = nDao.listarPorUsuario(idUsuario);

    // 6. Obtener el idNegocio de la URL (si existe)
    String idNegocioParam = request.getParameter("idNegocio");
    int idNegocioActivo = (idNegocioParam != null) ? Integer.parseInt(idNegocioParam) : 0;

    // Lógica auto-select: Si no viene un idNegocio en la URL, toma el primero de la lista
    if (idNegocioActivo == 0 && listaNegocios != null && !listaNegocios.isEmpty()) {
        idNegocioActivo = listaNegocios.get(0).getIdNegocio();
    }
    
    // 7. Obtener las alianzas del negocio que quedó seleccionado y activo
    List<Alianza> listaAlianzas = aDao.listarPorNegocio(idNegocioActivo);
%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Alianzas Comerciales - MicroBiz</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <link rel="stylesheet" href="newcss.css"> 
    <link rel="stylesheet" href="alianzas.css"> 
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
            <div class="opcion activa">
                <a href="alianzas.jsp"><i class="fa-solid fa-handshake"></i><span>Alianzas Comerciales</span></a>
            </div>
            <div class="opcion">
                <a href="configuracion.jsp"><i class="fa-solid fa-gear"></i><span>Configuración</span></a>
            </div>
            <div class="opcion">
                <a href="ayuda.jsp"><i class="fa-solid fa-circle-question"></i><span>Ayuda y Guía</span></a>
            </div>
            <div class="opcion">
                <a href="feedback.jsp"><i class="fa-solid fa-comments"></i><span>Feedback</span></a>
            </div>
        </div>
    </div>

    <div class="contenido-pagina">
        <div class="perfil-wrapper">
            
            <div class="perfil-header" style="display: flex; justify-content: space-between; align-items: center; border:none; padding:0; margin-bottom: 20px;">
                <div class="perfil-titulo" style="text-align: left;">
                    <h2 style="font-size: 28px; font-weight: 800; color: #111133;"><i class="fa-solid fa-handshake text-verde" style="font-size: 24px;"></i> Alianzas Comerciales</h2>
                    <p style="color: #64748b; font-size: 14px;">Gestiona tus contratos estratégicos y beneficios.</p>
                </div>
                <button type="button" class="btn-guardar" style="width: auto; padding: 12px 25px; margin: 0; cursor: pointer;" onclick="abrirModal('modalAlianza')">
                    <i class="fa-solid fa-plus"></i> NUEVO CONTRATO
                </button>
            </div>

            <div style="margin-bottom: 25px; background: rgba(255,255,255,0.6); padding: 15px; border-radius: 12px; display: flex; align-items: center; gap: 15px;">
                <label style="font-weight: 700; color: #111133;"><i class="fa-solid fa-filter"></i> Ver Alianzas del Negocio:</label>
                <select style="padding: 8px 15px; border-radius: 8px; border: 1px solid #cbd5e1; outline: none; background: white; min-width: 250px;" onchange="window.location.href='alianzas.jsp?idNegocio=' + this.value;">
                    <% 
                        if (listaNegocios != null && !listaNegocios.isEmpty()) {
                            for(negocio n : listaNegocios) { 
                    %>
                        <option value="<%= n.getIdNegocio() %>" <%= (n.getIdNegocio() == idNegocioActivo) ? "selected" : "" %>>
                            <%= n.getNombreNegocio() %>
                        </option>
                    <% 
                            }
                        } else {
                    %>
                        <option value="0">No tienes negocios registrados</option>
                    <% } %>
                </select>
            </div>

            <div class="grid-container" style="padding: 0;">
                <% 
                    if (listaAlianzas != null && !listaAlianzas.isEmpty()) {
                        for (Alianza a : listaAlianzas) { 
                            int meta = a.getMetaClientes();
                            int actuales = a.getClientesActuales();
                            int porcentaje = (meta > 0) ? (actuales * 100 / meta) : 0;
                            if (porcentaje > 100) porcentaje = 100;
                %>
                            <div class="glass-card card-alianza" style="position: relative;">
                                <span style="position: absolute; top: 15px; right: 15px; background: #d1fae5; color: #065f46; padding: 4px 10px; border-radius: 20px; font-size: 11px; font-weight: 700;">
                                    <%= a.getEstadoAlianza() %>
                                </span>
                                
                                <h4 style="color: #111133; font-weight: 700; margin-bottom: 5px;">
                                    <i class="fa-solid fa-handshake"></i> <%= a.getNombreAlianza() %>
                                </h4>
                                <p style="font-size: 13px; color: #94a3b8; margin-bottom: 15px;"><%= a.getTipoContrato() %></p>
                                
                                <div class="progreso-container">
                                    <div class="progreso-bar" style="width: <%= porcentaje %>%;"></div>
                                </div>
                                <p style="font-size: 12px; color: #64748b; font-weight: 600; text-align: right; margin: -10px 0 15px 0;">
                                    <%= a.getClientesActuales() %> / <%= a.getMetaClientes() %> Clientes
                                </p>

                                <div style="background: rgba(16, 185, 129, 0.08); border-radius: 12px; padding: 15px; border: 1px solid rgba(16, 185, 129, 0.2);">
                                    <span style="font-size: 11px; color: #065f46; font-weight: 700; text-transform: uppercase;">IMPACTO</span>
                                    <p style="font-size: 14px; color: #065f46; margin: 5px 0 0 0; font-weight: 600;">
                                        <%= a.getCondicionImpacto() %>
                                    </p>
                                </div>

                                <div class="acciones-alianza" style="display: flex; justify-content: flex-end; gap: 8px; margin-top: 15px; border-top: 1px solid rgba(0,0,0,0.05); padding-top: 10px;">
                                    <button type="button" class="btn-action" onclick="abrirModalEditar('<%= a.getIdAlianza() %>', '<%= a.getIdNegocio() %>', '<%= a.getNombreAlianza() %>', '<%= a.getMetaClientes() %>', '<%= a.getCondicionImpacto() %>')">
                                        <i class="fa-solid fa-pen"></i>
                                    </button>
                                    <button type="button" class="btn-action delete" onclick="abrirModalEliminar('<%= a.getIdAlianza() %>', '<%= a.getNombreAlianza() %>')">
                                         <i class="fa-solid fa-trash"></i>
                                    </button>
                                </div>
                            </div>
                <% 
                        }
                    } else {
                %>
                        <div style="grid-column: 1 / -1; text-align: center; padding: 40px; background: rgba(255,255,255,0.5); border-radius: 12px; border: 1px dashed #cbd5e1;">
                            <i class="fa-solid fa-folder-open" style="font-size: 36px; color: #94a3b8; margin-bottom: 10px;"></i>
                            <p style="color: #64748b; font-size: 15px; font-weight: 500; margin: 0;">No hay alianzas comerciales registradas para este negocio.</p>
                        </div>
                <% 
                    } 
                %>
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

<div id="modalAlianza" class="modal-overlay" style="display: none;">
    <div class="modal-contenido">
        <h3><i class="fa-solid fa-file-signature text-verde"></i> Firmar Nuevo Contrato</h3>
        
        <form action="GuardarAlianzaServlet" method="POST">
            <input type="hidden" name="accion" value="guardar">
            
            <label>Seleccionar Unidad de Negocio</label>
            <select name="idNegocio" required>
                <% 
                    if (listaNegocios != null && !listaNegocios.isEmpty()) {
                        for(negocio n : listaNegocios) { 
                %>
                    <option value="<%= n.getIdNegocio() %>" <%= (n.getIdNegocio() == idNegocioActivo) ? "selected" : "" %>>
                        <%= n.getNombreNegocio() %>
                    </option>
                <% 
                        }
                    } else {
                %>
                    <option value="0">No tienes negocios registrados</option>
                <% } %>
            </select>

            <label>Nombre del Socio / Alianza</label>
            <input type="text" name="nombreSocio" placeholder="Ej. Distribuidora del Norte" required>
            
            <label>Meta de Clientes Requerida</label>
            <input type="number" name="metaClientes" placeholder="Ej. 100" min="100" required>
            
            <label>Condición / Tipo de Impacto</label>
            <select name="tipoImpacto">
                <option value="Beneficio de Ingresos (+ Ventas)">Beneficio de Ingresos (+ Ventas)</option>
                <option value="Reducción de Costos Operativos (- Margen)">Reducción de Costos Operativos (- Margen)</option>
                <option value="Impacto Reputacional (+ Clientes)">Impacto Reputacional (+ Clientes)</option>
            </select>
            
            <input type="hidden" name="estadoAlianza" value="Activo">
            
            <div style="display: flex; gap: 12px; margin-top: 15px;">
                <button type="button" class="btn-action" onclick="cerrarModal('modalAlianza')">Regresar</button>
                <button type="submit" class="btn-guardar">Firmar Contrato</button>
            </div>
        </form>
    </div>
</div>

<div id="modalEditarAlianza" class="modal-overlay" style="display: none;">
    <div class="modal-contenido">
        <h3><i class="fa-solid fa-pen-to-square text-verde"></i> Editar Contrato Estratégico</h3>
        
        <form action="GuardarAlianzaServlet" method="POST">
            <input type="hidden" name="accion" value="editar">
            <input type="hidden" name="idAlianza" id="editarIdAlianza" value="">
            
            <input type="hidden" name="idNegocio" id="editarIdNegocioHidden" value="">
            <input type="hidden" name="metaClientes" id="editarMetaClientesHidden" value="">

            <label>Unidad de Negocio (No modificable)</label>
            <select id="editarIdNegocio" disabled style="background: #e2e8f0; cursor: not-allowed;">
                <% 
                    if (listaNegocios != null && !listaNegocios.isEmpty()) {
                        for(negocio n : listaNegocios) { 
                %>
                    <option value="<%= n.getIdNegocio() %>">
                        <%= n.getNombreNegocio() %>
                    </option>
                <% 
                        }
                    } 
                %>
            </select>

            <label>Nombre del Socio / Alianza</label>
            <input type="text" name="nombreSocio" id="editarNombreSocio" required>
            
            <label>Meta de Clientes Requerida (No modificable)</label>
            <input type="number" id="editarMetaClientes" disabled style="background: #e2e8f0; cursor: not-allowed;">
            
            <label>Condición / Tipo de Impacto</label>
            <select name="tipoImpacto" id="editarTipoImpacto" required>
                <option value="Beneficio de Ingresos (+ Ventas)">Beneficio de Ingresos (+ Ventas)</option>
                <option value="Reducción de Costos Operativos (- Margen)">Reducción de Costos Operativos (- Margen)</option>
                <option value="Impacto Reputacional (+ Clientes)">Impacto Reputacional (+ Clientes)</option>
            </select>
            
            <div style="display: flex; gap: 12px; margin-top: 15px;">
                <button type="button" class="btn-action" style="flex: 1; background: #f1f5f9; color: #475569; font-weight: 600; padding: 12px; border-radius: 12px; cursor: pointer;" onclick="cerrarModal('modalEditarAlianza')">Regresar</button>
                <button type="submit" class="btn-guardar" style="flex: 2; padding: 12px; border-radius: 12px; margin: 0; font-weight: 600; cursor: pointer; background: #10B981;">Actualizar Contrato</button>
            </div>
        </form>
    </div>
</div>
    
<div id="modalEliminarAlianza" class="modal-overlay" style="display: none;">
    <div class="modal-contenido" style="max-width: 400px; text-align: center;">
        <h3 style="justify-content: center; color: #ef4444 !important;">
            <i class="fa-solid fa-triangle-exclamation"></i> ¿Rescindir Contrato?
        </h3>
        
        <p style="color: #64748b; font-size: 14px; margin: 10px 0 20px 0; line-height: 1.5;">
            Estás a punto de cancelar la alianza con <strong id="eliminarNombreSocio" style="color: #1e293b;"></strong>.<br>
            <span style="color: #b91c1c; font-size: 12px; font-weight: 600;">Esta acción no se puede deshacer y perderás sus beneficios actuales.</span>
        </p>
        
        <div style="display: flex; gap: 12px;">
            <button type="button" class="btn-action" style="flex: 1; background: #f1f5f9; color: #475569; font-weight: 600; padding: 12px; border-radius: 12px; cursor: pointer;" onclick="cerrarModal('modalEliminarAlianza')">
                Cancelar
            </button>
            <a id="btnConfirmarEliminarUrl" href="#" class="btn-guardar" style="flex: 1; padding: 12px; border-radius: 12px; margin: 0; font-weight: 600; text-align: center; text-decoration: none; background: #ef4444; color: white; display: block;">
                Sí, Eliminar
            </a>
        </div>
    </div>
</div>

<script>
function abrirModal(id) {
    var modal = document.getElementById(id);
    if (modal) {
        modal.style.setProperty('display', 'flex', 'important');
        document.body.style.overflow = 'hidden';
    }
}

function cerrarModal(id) {
    var modal = document.getElementById(id);
    if (modal) {
        modal.style.setProperty('display', 'none', 'important');
        document.body.style.overflow = 'auto';
    }
}

function abrirModalEditar(idAlianza, idNegocio, nombre, meta, impacto) {
    console.log("Cargando datos para editar alianza ID:", idAlianza);
    
    // Inyectar IDs principales
    if(document.getElementById('editarIdAlianza')) document.getElementById('editarIdAlianza').value = idAlianza;
    
    // Asignar al select visible (bloqueado) y al input oculto que viaja al Servlet
    if(document.getElementById('editarIdNegocio')) document.getElementById('editarIdNegocio').value = idNegocio;
    if(document.getElementById('editarIdNegocioHidden')) document.getElementById('editarIdNegocioHidden').value = idNegocio;
    
    // Asignar nombre
    if(document.getElementById('editarNombreSocio')) document.getElementById('editarNombreSocio').value = nombre;
    
    // Asignar a la meta visible (bloqueada) y al input oculto
    if(document.getElementById('editarMetaClientes')) document.getElementById('editarMetaClientes').value = meta;
    if(document.getElementById('editarMetaClientesHidden')) document.getElementById('editarMetaClientesHidden').value = meta;
    
    // CORRECCIÓN CLAVE: Seleccionar la opción de impacto correcta en el dropdown
    var selectImpacto = document.getElementById('editarTipoImpacto');
    if(selectImpacto) {
        selectImpacto.value = impacto;
    }
    
    abrirModal('modalEditarAlianza');
}

function abrirModalEliminar(idAlianza, nombreSocio) {
    if(document.getElementById('eliminarNombreSocio')) {
        document.getElementById('eliminarNombreSocio').innerText = nombreSocio;
    }
    // CORREGIDO: Ahora envía los parámetros correctos de acción y id a GuardarAlianzaServlet
    if(document.getElementById('btnConfirmarEliminarUrl')) {
        document.getElementById('btnConfirmarEliminarUrl').href = "GuardarAlianzaServlet?accion=eliminar&idAlianza=" + idAlianza;
    }
    abrirModal('modalEliminarAlianza');
}
</script>
<script>
    const urlParams = new URLSearchParams(window.location.search);
    const mensaje = urlParams.get('mensaje');
    
    if (mensaje === 'exito') {
        alert("¡Operación realizada exitosamente!");
    } else if (mensaje === 'error') {
        alert("Hubo un problema al procesar la solicitud. Intenta de nuevo.");
    }
</script>
</body>
</html>