<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="model.usuario"%>
<%@page import="model.feedback"%>
<%@page import="dao.FeedbackDao"%>
<%@page import="java.util.List"%>

<%
    // 1. Intentamos obtener la sesión real de Tomcat sin crear una nueva
    HttpSession sesionOk = request.getSession(false);
    usuario usuarioLogueado = null;
    
    if (sesionOk != null) {
        usuarioLogueado = (usuario) sesionOk.getAttribute("usuarioLogueado");
    }
    
    // 2. 🛡️ CONTROL DINÁMICO ESTRICTO: 
    // Si la sesión expiró o el usuario intenta entrar directo por URL sin loguearse,
    // lo redirigimos de inmediato al login para evitar errores de puntero nulo (NullPointerException).
    if (usuarioLogueado == null) {
        response.sendRedirect("login.jsp?error=sessionExpired");
        return; // Detiene por completo la ejecución del resto del JSP
    }
%>

<!DOCTYPE html>
<html>
    <head>
        <title>MicroBiz - Feedback</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css"> 
        <link rel="stylesheet" href="newcss.css">
        <link rel="stylesheet" href="feedback.css">
    </head>
    <body>
        <div class="contenedor-principal">
            
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
                    <div class="opcion"><a href="PAyuda.jsp"><i class="fa-solid fa-circle-question"></i><span>Ayuda y Guía</span></a></div>
                    <div class="opcion activa"><a href="Feedback.jsp"><i class="fa-solid fa-comments"></i><span>Feedback</span></a></div>
                </div>
            </div>

            <div class="contenido-pagina">
                <div class="feedback-container">
                    <h2>Bienvenido, <%= usuarioLogueado.getNombreCompleto() %> 👋</h2>
                    
                    <%
                        if(request.getParameter("status") != null && request.getParameter("status").equals("success")) {
                    %>
                        <div style="background-color: #DEF7EC; color: #03543F; padding: 12px; border-radius: 6px; font-size: 13px; border-left: 4px solid #31C48D; margin-bottom: 15px;">
                            <i class="fa-solid fa-circle-check"></i> ¡Reseña guardada con éxito en la base de datos!
                        </div>
                    <%
                        }
                        if(request.getParameter("error") != null && request.getParameter("error").equals("dberror")) {
                    %>
                        <div style="background-color: #FEF2F2; color: #991B1B; padding: 12px; border-radius: 6px; font-size: 13px; border-left: 4px solid #EF4444; margin-bottom: 15px;">
                            <i class="fa-solid fa-triangle-exclamation"></i> Hubo un problema al procesar la solicitud en la base de datos.
                        </div>
                    <%
                        }
                    %>

                    <div class="card">
                        <h3>Enviar nueva reseña</h3>
                        <form action="FeedbackServlet" method="POST">
                            <input type="hidden" name="action" value="insert">
                            
                            <textarea name="comentario" placeholder="¿Qué te ha parecido la simulación?" rows="4" required></textarea>
                            <button type="submit" class="btn-primary">Enviar Reseña</button>
                        </form>
                    </div>

                    <div class="card">
                        <h3>Tus encuestas enviadas</h3>
                        <table>
                            <thead>
                                <tr>
                                    <th>Fecha</th>
                                    <th>Comentario</th>
                                    <th>Acciones</th>
                                </tr>
                            </thead>
                            <tbody>
                                <%
                                    FeedbackDao fbkDao = new FeedbackDao();
                                    
                                    // 🔄 CONSULTA DINÁMICA: Filtra estrictamente por el ID de la sesión actual
                                    List<feedback> lista = fbkDao.listarPorUsuario(usuarioLogueado.getIdUsuario());
                                    
                                    if(lista == null || lista.isEmpty()) {
                                %>
                                    <tr>
                                        <td colspan="3" style="text-align: center; color: #6B7280; padding: 20px;">Aún no has enviado ningún comentario.</td>
                                    </tr>
                                <%
                                    } else {
                                        for(feedback f : lista) {
                                %>
                                    <tr>
                                        <td><%= String.valueOf(f.getFechaEnvio()) %></td>
                                        <td><%= f.getComentario() %></td>
                                        <td>
                                            <button class="btn-icon" onclick="openEditModal(<%= f.getIdFeedback() %>, '<%= f.getComentario().replace("'", "\\'") %>')">
                                                <i class="fa-solid fa-pen"></i>
                                            </button>
                                            <button class="btn-icon danger" onclick="openDeleteModal(<%= f.getIdFeedback() %>)">
                                                <i class="fa-solid fa-trash"></i>
                                            </button>
                                        </td>
                                    </tr>
                                <%
                                        }
                                    }
                                %>
                            </tbody>
                        </table>
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

        <div id="modal-editar" class="modal" style="display: none;">
            <div class="modal-content">
                <h3>Editar Reseña</h3>
                <form action="FeedbackServlet" method="POST">
                    <input type="hidden" name="action" value="update">
                    <input type="hidden" id="edit-id" name="idFeedback">
                    
                    <textarea id="edit-comentario" name="comentario" rows="4" required></textarea>
                    
                    <div class="modal-actions">
                        <button type="button" onclick="closeModal('modal-editar')" class="btn-secondary">Cancelar</button>
                        <button type="submit" class="btn-primary">Guardar Cambios</button>
                    </div>
                </form>
            </div>
        </div>

        <div id="modal-eliminar" class="modal" style="display: none;">
            <div class="modal-content">
                <h3>¿Eliminar reseña?</h3>
                <p>Esta acción removerá el comentario permanentemente de la base de datos.</p>
                <form action="FeedbackServlet" method="POST">
                    <input type="hidden" name="action" value="delete">
                    <input type="hidden" id="delete-id" name="idFeedback">
                    
                    <div class="modal-actions">
                        <button type="button" onclick="closeModal('modal-eliminar')" class="btn-secondary">Cancelar</button>
                        <button type="submit" class="btn-danger">Eliminar</button>
                    </div>
                </form>
            </div>
        </div>

        <script>
            function openModal(id) { 
                document.getElementById(id).style.display = 'flex'; 
            }
            function closeModal(id) { 
                document.getElementById(id).style.display = 'none'; 
            }
            
            function openEditModal(id, comentario) {
                document.getElementById('edit-id').value = id;
                document.getElementById('edit-comentario').value = comentario;
                openModal('modal-editar');
            }
            
            function openDeleteModal(id) {
                document.getElementById('delete-id').value = id;
                openModal('modal-eliminar');
            }
        </script>
    </body>
</html>