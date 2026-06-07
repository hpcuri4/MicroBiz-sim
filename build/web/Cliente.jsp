<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>MicroBiz Sim - Estrategia de Clientes</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <link rel="stylesheet" href="Cliente.css">
    <link rel="stylesheet" href="newcss.css">
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
                <a href="MejorayTecnologia.jsp"><i class="fa-solid fa-computer"></i><span>Mejoras y tecnología</span></a>
            </div>
            <div class="opcion activa">
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
        <div class="selector-negocio-bar">
            <label><i class="fa-solid fa-briefcase"></i> Seleccionar Unidad de Negocio:</label>
            <select name="negocio" onchange="cargarClientes(this.value)">
                <option value="1">Tienda Física Centro</option>
                <option value="2">Plataforma E-commerce</option>
                <option value="3">Distribuidora Mayorista</option>
            </select>
        </div>

        <div class="grid-cartera-clientes">
            <div class="columna-segmento favorable">
                <h3><i class="fa-solid fa-star"></i> Favorables</h3>
                <div class="lista-items">
                    <div class="tarjeta-cliente">
                        <span>Cliente Premium A</span>
                        <div class="acciones">
                            <button title="Editar" onclick="abrirModalEditar(1, 'Cliente Premium A', 'favorable')">
                                <i class="fa-solid fa-pen"></i>
                            </button>
                            <button class="delete" title="Eliminar" onclick="abrirModalEliminar(101)">
                                <i class="fa-solid fa-trash"></i>
                            </button>
                        </div>
                    </div>
                </div>
            </div>

            <div class="columna-segmento variado">
                <h3><i class="fa-solid fa-shuffle"></i> Variados</h3>
                <div class="lista-items"></div>
            </div>

            <div class="columna-segmento no-favorable">
                <h3><i class="fa-solid fa-ban"></i> No Favorables</h3>
                <div class="lista-items"></div>
            </div>
        </div>

        <button class="btn-agregar-cliente" onclick="abrirModal()">
            <i class="fa-solid fa-plus"></i> ASIGNAR NUEVO CLIENTE
        </button>
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
<!-- Agregar cliente -->
    <div id="modalCliente" class="modal-overlay" style="display:none;">
    <div class="modal-contenido">
        <h3><i class="fa-solid fa-user-plus"></i> Registrar Nuevo Cliente</h3>
        <form action="AgregarClienteServlet" method="POST">
            <div class="grupo-input">
                <label>Nombre del Cliente</label>
                <input type="text" name="nombre" required placeholder="Ej. Juan Pérez">
            </div>
            <div class="grupo-input">
                <label>Categoría</label>
                <select name="segmento">
                    <option value="favorable">Favorables</option>
                    <option value="variado">Variados</option>
                    <option value="no-favorable">No Favorables</option>
                </select>
            </div>
            <div class="modal-acciones">
                <button type="button" class="btn-cancelar" onclick="cerrarModal()">Cancelar</button>
                <button type="submit" class="btn-guardar">Guardar Cliente</button>
            </div>
        </form>
    </div>
</div>

<!-- editar cliente -->
<div id="modalEditarCliente" class="modal-overlay" style="display:none;">
    <div class="modal-contenido">
        <h3><i class="fa-solid fa-pen-to-square"></i> Editar Cliente</h3>
        <form action="EditarClienteServlet" method="POST">
            <input type="hidden" name="idCliente" id="editIdCliente">
            
            <div class="grupo-input">
                <label>Nombre del Cliente</label>
                <input type="text" name="nombre" id="editNombre" required>
            </div>
            <div class="grupo-input">
                <label>Categoría</label>
                <select name="segmento" id="editSegmento">
                    <option value="favorable">Favorables</option>
                    <option value="variado">Variados</option>
                    <option value="no-favorable">No Favorables</option>
                </select>
            </div>
            <div class="modal-acciones">
                <button type="button" class="btn-cancelar" onclick="cerrarModalEditar()">Cancelar</button>
                <button type="submit" class="btn-guardar">Actualizar</button>
            </div>
        </form>
    </div>
</div>

<!-- Eliminar cliente --> 
<div id="modalEliminar" class="modal-overlay" style="display:none;">
    <div class="modal-contenido">
        <h3 style="color: #EF4444;"><i class="fa-solid fa-triangle-exclamation"></i> ¿Estás seguro?</h3>
        <p style="margin: 15px 0; font-size: 14px; color: #475569;">
            Esta acción eliminará permanentemente al cliente de esta unidad de negocio. ¿Deseas continuar?
        </p>
        <div class="modal-acciones">
            <button type="button" class="btn-cancelar" onclick="cerrarModalEliminar()">Cancelar</button>
            <button type="button" class="btn-eliminar" onclick="ejecutarEliminacion()">Confirmar Eliminación</button>
        </div>
    </div>
</div>
<!-- Script de los modales --> 
<script>
    // 1. Agregar Cliente
    function abrirModal() {
        document.getElementById('modalCliente').style.display = 'flex';
    }
    function cerrarModal() {
        document.getElementById('modalCliente').style.display = 'none';
    }

    // 2. Editar Cliente
    function abrirModalEditar(id, nombre, segmento) {
        document.getElementById('editIdCliente').value = id;
        document.getElementById('editNombre').value = nombre;
        document.getElementById('editSegmento').value = segmento;
        document.getElementById('modalEditarCliente').style.display = 'flex';
    }
    function cerrarModalEditar() {
        document.getElementById('modalEditarCliente').style.display = 'none';
    }

    // 3. Eliminar Cliente
    let idClienteAEliminar = null;
    function abrirModalEliminar(id) {
        idClienteAEliminar = id;
        document.getElementById('modalEliminar').style.display = 'flex';
    }
    function cerrarModalEliminar() {
        document.getElementById('modalEliminar').style.display = 'none';
    }
    function ejecutarEliminacion() {
        if (idClienteAEliminar !== null) {
            window.location.href = "EliminarClienteServlet?idCliente=" + idClienteAEliminar;
        }
    }
</script>

</body>
</html>