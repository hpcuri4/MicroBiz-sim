package controller;

import dao.FeedbackDao;
import model.feedback;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/FeedbackServlet")
public class FeedbackServlet extends HttpServlet {

   @Override
protected void doPost(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {
    
    
    request.setCharacterEncoding("UTF-8");
    String accion = request.getParameter("action");
    FeedbackDao feedbackDao = new FeedbackDao();
    
    if (accion == null) {
        response.sendRedirect("Feedback.jsp");
        return;
    }
    
    switch (accion) {
        case "insert":
    String txtComentario = request.getParameter("comentario");
    if (txtComentario != null && !txtComentario.trim().isEmpty()) {
        
        // 1. Intentamos recuperar la sesión actual sin crear una nueva
        HttpSession session = request.getSession(false);
        model.usuario usr = (session != null) ? (model.usuario) session.getAttribute("usuarioLogueado") : null;
        
        // 2. 🛡️ CONTROL DINÁMICO REAL:
        // Si no hay usuario activo en la sesión, lo pateamos al Login
        if (usr == null) {
            response.sendRedirect("login.jsp?error=sessionExpired");
            return;
        }
        
        // 3. Si todo está bien, extraemos su ID actual de forma dinámica
        int idUsuarioActual = usr.getIdUsuario(); 
        
        model.feedback nuevoFeedback = new model.feedback(idUsuarioActual, txtComentario);
        
        if (feedbackDao.insertarFeedback(nuevoFeedback)) {
            response.sendRedirect("Feedback.jsp?status=success");
        } else {
            response.sendRedirect("Feedback.jsp?error=dberror");
        }
    } else {
        response.sendRedirect("Feedback.jsp?error=empty");
    }
    break;
            
        case "update":
            String idEditStr = request.getParameter("idFeedback");
            String comentarioEditado = request.getParameter("comentario");
            
            if (idEditStr != null && comentarioEditado != null && !comentarioEditado.trim().isEmpty()) {
                int idFeedback = Integer.parseInt(idEditStr);
                
                if (feedbackDao.actualizarFeedback(idFeedback, comentarioEditado)) {
                    response.sendRedirect("Feedback.jsp?status=success");
                } else {
                    response.sendRedirect("Feedback.jsp?error=dberror");
                }
            } else {
                response.sendRedirect("Feedback.jsp?error=empty");
            }
            break;
            
        case "delete":
            String idDeleteStr = request.getParameter("idFeedback");
            
            if (idDeleteStr != null) {
                int idFeedback = Integer.parseInt(idDeleteStr);
                
                if (feedbackDao.eliminarFeedback(idFeedback)) {
                    response.sendRedirect("Feedback.jsp?status=success");
                } else {
                    response.sendRedirect("Feedback.jsp?error=dberror");
                }
            }
            break;
            
        default:
            response.sendRedirect("Feedback.jsp");
            break;
    }

}}