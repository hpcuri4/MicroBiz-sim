<%@page contentType="text/html" pageEncoding="UTF-8"%>
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

            <div class="grid-container" style="padding: 0;">
                
                <div class="glass-card card-alianza" style="position: relative;">
                    <span style="position: absolute; top: 15px; right: 15px; background: #d1fae5; color: #065f46; padding: 4px 10px; border-radius: 20px; font-size: 11px; font-weight: 700;">Activo</span>
                    <h4 style="color: #111133; font-weight: 700; margin-bottom: 5px;"><i class="fa-solid fa-truck-fast"></i> Logística Express</h4>
                    <p style="font-size: 13px; color: #94a3b8; margin-bottom: 15px;">Contrato de Distribución Mayorista</p>
                    
                    <div class="progreso-container">
                        <div class="progreso-bar" style="width: 75%;"></div>
                    </div>
                    <p style="font-size: 12px; color: #64748b; font-weight: 600; text-align: right; margin: -10px 0 15px 0;">45 / 60 Clientes</p>

                    <div style="background: rgba(16, 185, 129, 0.08); border-radius: 12px; padding: 15px; border: 1px solid rgba(16, 185, 129, 0.2);">
                        <span style="font-size: 11px; color: #065f46; font-weight: 700; text-transform: uppercase;">EFECTO ACTUAL</span>
                        <p style="font-size: 14px; color: #065f46; margin: 5px 0 0 0; font-weight: 600;">
                            <i class="fa-solid fa-arrow-up"></i> +15% en Margen de Ventas
                        </p>
                    </div>

                    <div class="acciones-alianza" style="display: flex; justify-content: flex-end; gap: 8px; margin-top: 15px; border-top: 1px solid rgba(0,0,0,0.05); padding-top: 10px;">
                        <button type="button" class="btn-action" onclick="abrirModalEditar('1', '1', 'Logística Express', '60', 'beneficio')">
                            <i class="fa-solid fa-pen"></i>
                        </button>
                        <button type="button" class="btn-action delete" onclick="abrirModalEliminar('1', 'Logística Express')">
                           <i class="fa-solid fa-trash"></i>
                        </button>
                    </div>
                </div>

                <div class="glass-card card-alianza" style="position: relative;">
                    <span style="position: absolute; top: 15px; right: 15px; background: #fef3c7; color: #92400e; padding: 4px 10px; border-radius: 20px; font-size: 11px; font-weight: 700;">En Progreso</span>
                    <h4 style="color: #111133; font-weight: 700; margin-bottom: 5px;"><i class="fa-solid fa-shop"></i> Alianza Retail</h4>
                    <p style="font-size: 13px; color: #94a3b8; margin-bottom: 15px;">Socio de Punto de Venta Físico</p>
                    
                    <div class="progreso-container">
                        <div class="progreso-bar" style="width: 12%; background: #f59e0b;"></div>
                    </div>
                    <p style="font-size: 12px; color: #64748b; font-weight: 600; text-align: right; margin: -10px 0 15px 0;">12 / 100 Clientes</p>

                    <div style="background: rgba(245, 158, 11, 0.08); border-radius: 12px; padding: 15px; border: 1px solid rgba(245, 158, 11, 0.2);">
                        <span style="font-size: 11px; color: #92400e; font-weight: 700; text-transform: uppercase;">EFECTO AL CUMPLIR</span>
                        <p style="font-size: 14px; color: #92400e; margin: 5px 0 0 0; font-weight: 600;">
                            <i class="fa-solid fa-users-viewfinder"></i> Acceso a Segmento Premium
                        </p>
                    </div>

                    <div class="acciones-alianza" style="display: flex; justify-content: flex-end; gap: 8px; margin-top: 15px; border-top: 1px solid rgba(0,0,0,0.05); padding-top: 10px;">
                    <button type="button" class="btn-action" onclick="abrirModalEditar('2', '1', 'Alianza Retail', '100', 'reputacion')">
                        <i class="fa-solid fa-pen"></i>
                    </button>
                    <button type="button" class="btn-action delete" onclick="abrirModalEliminar('2', 'Alianza Retail')">
                          <i class="fa-solid fa-trash"></i>
                    </button>
                    </div>
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
 <!-- Modal crear contrato-->
<div id="modalAlianza" class="modal-overlay" style="display: none;">
    <div class="modal-contenido">
        <h3><i class="fa-solid fa-file-signature text-verde"></i> Firmar Nuevo Contrato</h3>
        
        <form action="GuardarAlianzaServlet" method="POST">
            <label>Seleccionar Unidad de Negocio</label>
            <select name="idNegocio" required>
                <option value="1">Tienda Física Centro</option>
                <option value="2">Plataforma E-commerce</option>
            </select>

            <label>Nombre del Socio / Alianza</label>
            <input type="text" name="nombreSocio" placeholder="Ej. Distribuidora del Norte" required>
            
            <label>Meta de Clientes Requerida</label>
            <input type="number" name="metaClientes" placeholder="Ej. 100" min="1" required>
            
            <label>Condición / Tipo de Impacto</label>
            <select name="tipoImpacto">
                <option value="beneficio">Beneficio de Ingresos (+ Ventas)</option>
                <option value="reduccion">Reducción de Costos Operativos (- Margen)</option>
                <option value="reputacion">Impacto Reputacional (+ Clientes)</option>
            </select>
            
            <div style="display: flex; gap: 12px; margin-top: 15px;">
                <button type="button" class="btn-action" style="flex: 1; background: #f1f5f9; color: #475569; font-weight: 600; padding: 12px; border-radius: 12px; cursor: pointer;" onclick="cerrarModal('modalAlianza')">Regresar</button>
                <button type="submit" class="btn-guardar" style="flex: 2; padding: 12px; border-radius: 12px; margin: 0; font-weight: 600; cursor: pointer;">Firmar Contrato</button>
            </div>
        </form>
    </div>
    
  
</div>
    <!-- Modal editar contrato -->
    <div id="modalEditarAlianza" class="modal-overlay" style="display: none;">
    <div class="modal-contenido">
        <h3><i class="fa-solid fa-pen-to-square text-verde"></i> Editar Contrato Estratégico</h3>
        
        <form action="EditarAlianzaServlet" method="POST">
            <input type="hidden" name="idAlianza" id="editarIdAlianza" value="">

            <label>Seleccionar Unidad de Negocio</label>
            <select name="idNegocio" id="editarIdNegocio" required>
                <option value="1">Tienda Física Centro</option>
                <option value="2">Plataforma E-commerce</option>
            </select>

            <label>Nombre del Socio / Alianza</label>
            <input type="text" name="nombreSocio" id="editarNombreSocio" placeholder="Ej. Distribuidora del Norte" required>
            
            <label>Meta de Clientes Requerida</label>
            <input type="number" name="metaClientes" id="editarMetaClientes" placeholder="Ej. 100" min="1" required>
            
            <label>Condición / Tipo de Impacto</label>
            <select name="tipoImpacto" id="editarTipoImpacto">
                <option value="beneficio">Beneficio de Ingresos (+ Ventas)</option>
                <option value="reduccion">Reducción de Costos Operativos (- Margen)</option>
                <option value="reputacion">Impacto Reputacional (+ Clientes)</option>
            </select>
            
            <div style="display: flex; gap: 12px; margin-top: 15px;">
                <button type="button" class="btn-action" style="flex: 1; background: #f1f5f9; color: #475569; font-weight: 600; padding: 12px; border-radius: 12px; cursor: pointer;" onclick="cerrarModal('modalEditarAlianza')">Regresar</button>
                <button type="submit" class="btn-guardar" style="flex: 2; padding: 12px; border-radius: 12px; margin: 0; font-weight: 600; cursor: pointer; background: #10B981;">Actualizar Contrato</button>
            </div>
        </form>
    </div>
</div>
    
   
<!-- Modal eliminar contrato -->

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
// ==========================================
// GLOBALES: ABRIR Y CERRAR MODALES
// ==========================================
function abrirModal(id) {
    var modal = document.getElementById(id);
    if (modal) {
        modal.style.setProperty('display', 'flex', 'important');
        document.body.style.overflow = 'hidden'; // Bloquea scroll de fondo
    }
}

function cerrarModal(id) {
    var modal = document.getElementById(id);
    if (modal) {
        modal.style.setProperty('display', 'none', 'important');
        document.body.style.overflow = 'auto'; // Devuelve scroll
    }
}

// ==========================================
// FUNCIÓN: PREPARAR Y ABRIR EDICIÓN
// ==========================================
function abrirModalEditar(idAlianza, idNegocio, nombre, meta, impacto) {
    // Verificamos en consola que entren los datos (puedes revisarlo con F12)
    console.log("Cargando datos para editar alianza:", idAlianza);
    
    // Inyectamos con cuidado los valores en los campos del formulario de edición
    if(document.getElementById('editarIdAlianza')) document.getElementById('editarIdAlianza').value = idAlianza;
    if(document.getElementById('editarIdNegocio')) document.getElementById('editarIdNegocio').value = idNegocio;
    if(document.getElementById('editarNombreSocio')) document.getElementById('editarNombreSocio').value = nombre;
    if(document.getElementById('editarMetaClientes')) document.getElementById('editarMetaClientes').value = meta;
    if(document.getElementById('editarTipoImpacto')) document.getElementById('editarTipoImpacto').value = impacto;
    
    // Abrimos el modal flotante de edición
    abrirModal('modalEditarAlianza');
}

// ==========================================
// FUNCIÓN: PREPARAR Y ABRIR ELIMINACIÓN
// ==========================================
function abrirModalEliminar(idAlianza, nombreSocio) {
    // Inyectamos el nombre de la empresa en el texto de advertencia
    if(document.getElementById('eliminarNombreSocio')) {
        document.getElementById('eliminarNombreSocio').innerText = nombreSocio;
    }
    
    // Cambiamos dinámicamente la ruta de acción del botón "Sí, Eliminar"
    if(document.getElementById('btnConfirmarEliminarUrl')) {
        document.getElementById('btnConfirmarEliminarUrl').href = "EliminarAlianzaServlet?id=" + idAlianza;
    }
    
    // Abrimos el modal flotante de advertencia roja
    abrirModal('modalEliminarAlianza');
}
</script>
</body>
</html>