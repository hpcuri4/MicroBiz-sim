package controller;

import dao.NegocioDao;
import java.io.IOException;
import java.math.BigDecimal;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.negocio;
import model.usuario;

@WebServlet(name = "GuardarNegocioServlet", urlPatterns = {"/GuardarNegocioServlet"})
public class GuardarNegocioServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        // 1. 🛡️ EVITAR CARACTERES RAROS (Acentos y Ñ)
        request.setCharacterEncoding("UTF-8");

        // 2. 🛡️ VALIDACIÓN DE SESIÓN (Escudo anti-Error 500)
        HttpSession session = request.getSession(false);
        usuario usr = (session != null) ? (usuario) session.getAttribute("usuarioLogueado") : null;
        
        if (usr == null) {
            // Si la sesión expiró, lo mandamos al login de inmediato
            response.sendRedirect("login.jsp?error=sessionExpired");
            return; // ⛔ IMPORTANTE: Detiene la ejecución aquí para que no truene abajo
        }

        try {
            // 3. Recuperar parámetros del formulario
            String nombre = request.getParameter("nombre");
            String tipo = request.getParameter("tipo");
            String region = request.getParameter("region");
            String riesgoParam = request.getParameter("riesgo"); // Recibe "1", "2" o "3"
            
            BigDecimal capital = new BigDecimal(request.getParameter("capital"));
            BigDecimal ganancia = new BigDecimal(request.getParameter("ganancia"));
            
            // 🔒 VALIDACIÓN DE RANGO FINANCIERO ($5,000 - $15,000)
            if (capital.compareTo(new BigDecimal("5000")) < 0 || capital.compareTo(new BigDecimal("15000")) > 0) {
                response.sendRedirect("crear_negocio.jsp?error=invalidRange");
                return;
            }

            // 4. LÓGICA AUTOMÁTICA
            // El balance inicial siempre es igual al capital invertido al arrancar
            BigDecimal balanceActual = capital; 

            // Traducir el slider (1, 2, 3) a texto para la DB
            String nivelRiesgo = "Medio"; 
            if ("1".equals(riesgoParam)) nivelRiesgo = "Bajo";
            else if ("3".equals(riesgoParam)) nivelRiesgo = "Alto";

            // 5. CREAR OBJETO Y GUARDAR
            // Usamos usr.getIdUsuario() que ya es 100% seguro porque validamos la sesión arriba
            negocio nuevo = new negocio(usr.getIdUsuario(), nombre, tipo, capital, balanceActual, ganancia, region, nivelRiesgo);

            NegocioDao dao = new NegocioDao();
            if (dao.insertarNegocio(nuevo)) {
                // Éxito: Vamos al panel principal con el mensaje verde
                response.sendRedirect("negocio.jsp?status=success");
            } else {
                // Error de Base de Datos
                response.sendRedirect("crear_negocio.jsp?error=dberror");
            }
            
        } catch (Exception e) {
            System.out.println("❌ Error en GuardarNegocioServlet: " + e.getMessage());
            e.printStackTrace();
            response.sendRedirect("crear_negocio.jsp?error=invalidData");
        }
    }
}