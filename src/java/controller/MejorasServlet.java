package controller;

import dao.MejoraTecnologiaDao;
import model.MejoraTecnologia;
import java.io.IOException;
import java.math.BigDecimal;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "MejorasServlet", urlPatterns = {"/MejorasServlet"})
public class MejorasServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        request.setCharacterEncoding("UTF-8");
        String accion = request.getParameter("accion");
        
        // Acceder a la sesión usando el nombre real de tu sistema
        javax.servlet.http.HttpSession session = request.getSession(true);
        Object sesionObj = session.getAttribute("usuarioLogueado");
        
        int idUsuarioLogueado = 1; // Respaldo para pruebas
        
        if (sesionObj != null) {
            try {
                idUsuarioLogueado = (Integer) sesionObj;
            } catch (Exception e) {
                // Si 'usuarioLogueado' es un objeto completo (ej. clase Usuario):
                // idUsuarioLogueado = ((model.Usuario) sesionObj).getIdUsuario();
            }
        }

        if (accion == null) {
            response.sendRedirect("MejorayTecnologia.jsp");
            return;
        }

        MejoraTecnologiaDao mtDao = new MejoraTecnologiaDao();
        boolean resultado = false;
        boolean yaExiste = false;
        String idNegocioStr = request.getParameter("idNegocio");

        if ("comprar".equals(accion)) {
            String idCatalogo = request.getParameter("idMejoraCatalogo");
            String areaMejora = request.getParameter("areaMejora");

            if (idNegocioStr != null && idCatalogo != null && areaMejora != null) {
                int idNegocio = Integer.parseInt(idNegocioStr);
                
                String nombreMejora = "";
                BigDecimal costo = BigDecimal.ZERO;
                String impacto = "";

                switch (idCatalogo) {
                    case "1":
                        nombreMejora = "Fotocopiadora e Impresora Láser Profesional";
                        costo = new BigDecimal("6000.00");
                        impacto = "Aumento de velocidad de producción (+Ventas)";
                        break;
                    case "2":
                        nombreMejora = "Sistema de Exhibición y Maniquíes Modernos";
                        costo = new BigDecimal("4500.00");
                        impacto = "Mejora de atractivo visual (+Clientes)";
                        break;
                    case "3":
                        nombreMejora = "Horno Convector / Freidora Industrial";
                        costo = new BigDecimal("12500.00");
                        impacto = "Reducción de tiempos de espera (-Costos)";
                        break;
                    case "4":
                        nombreMejora = "Lavadora Industrial de Carga Pesada";
                        costo = new BigDecimal("15000.00");
                        impacto = "Ahorro de insumos y agua (+Margen)";
                        break;
                }

                // Validación de seguridad en el servidor para evitar duplicados
                List<MejoraTecnologia> actuales = mtDao.listarPorNegocio(idNegocio);
                for (MejoraTecnologia mt : actuales) {
                    if (mt.getNombreMejora().equals(nombreMejora)) {
                        yaExiste = true;
                        break;
                    }
                }

                if (!yaExiste) {
                    MejoraTecnologia nuevaMejora = new MejoraTecnologia();
                    nuevaMejora.setIdNegocio(idNegocio);
                    nuevaMejora.setNombreMejora(nombreMejora);
                    nuevaMejora.setAreaDespliegue(areaMejora);
                    nuevaMejora.setImpactoOperacion(impacto);
                    nuevaMejora.setNivelOptimizacion(1);
                    nuevaMejora.setCostoActualizacion(costo);
                    nuevaMejora.setEstadoMejora("Activo");

                    resultado = mtDao.insertar(nuevaMejora);
                }
            }
        }

        // Al redireccionar de vuelta, mantenemos la persistencia visual del negocio que se estaba editando
        String redireccion = "comprar_mejora.jsp?idNegocioFiltro=" + idNegocioStr;
        if (yaExiste) {
            redireccion += "&mensaje=duplicado";
        } else if (resultado) {
            redireccion += "&mensaje=compra_exito";
        } else {
            redireccion += "&mensaje=compra_error";
        }
        
        response.sendRedirect(redireccion);
    }
}