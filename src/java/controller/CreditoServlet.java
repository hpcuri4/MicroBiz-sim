package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import dao.CreditoDao;

@WebServlet("/CreditoServlet")
public class CreditoServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private final CreditoDao creDao = new CreditoDao();

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        request.setCharacterEncoding("UTF-8");
        String accion = request.getParameter("accion");
        int idNegocio = Integer.parseInt(request.getParameter("idNegocio"));

        if ("solicitar".equals(accion)) {
            double monto = Double.parseDouble(request.getParameter("monto"));
            String nombrePrestamo = request.getParameter("nombrePrestamo");
            String[] partes = request.getParameter("plazo_y_tasa").split("\\|");
            int turnos = Integer.parseInt(partes[0]);
            double tasa = Double.parseDouble(partes[1]);

            creDao.solicitarPrestamo(idNegocio, nombrePrestamo, monto, tasa, turnos);
        }

        response.sendRedirect(request.getContextPath() + "/credito.jsp?idNegocio=" + idNegocio);
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        String accion = request.getParameter("accion");
        int idCredito = Integer.parseInt(request.getParameter("idCredito"));
        int idNegocio = Integer.parseInt(request.getParameter("idNegocio"));

        if ("abonar".equals(accion)) {
            double abonoUsuario = Double.parseDouble(request.getParameter("montoAbono"));
            
            // 1. OBTENEMOS LA DEUDA REAL ACTUAL
            double deudaActual = creDao.obtenerMontoRestante(idCredito);
            
            // 2. VALIDACIÓN DE SEGURIDAD: No permitir abonos mayores a la deuda
            double montoFinalAbono = (abonoUsuario > deudaActual) ? deudaActual : abonoUsuario;
            
            // 3. EJECUTAMOS EL ABONO AJUSTADO
            creDao.abonarA_Credito(idCredito, idNegocio, montoFinalAbono, false);
            
            // 4. SI EL ABONO LIQUIDÓ EL TOTAL, MARCAMOS COMO PAGADO
            if (montoFinalAbono >= deudaActual) {
                creDao.liquidarTotalmente(idCredito, idNegocio);
            }
        } 
        else if ("liquidar".equals(accion)) {
            creDao.liquidarTotalmente(idCredito, idNegocio);
        }

        response.sendRedirect(request.getContextPath() + "/credito.jsp?idNegocio=" + idNegocio);
    }
}