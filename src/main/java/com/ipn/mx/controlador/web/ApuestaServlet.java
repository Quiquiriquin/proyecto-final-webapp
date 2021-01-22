/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.ipn.mx.controlador.web;

import com.ipn.mx.modelo.dao.ApuestaDAO;
import com.ipn.mx.modelo.dao.CategoriaDAO;
import com.ipn.mx.modelo.dao.GraficaDAO;
import com.ipn.mx.modelo.dao.ticketApuestaDAO;
import com.ipn.mx.modelo.dto.ApuestaDTO;
import com.ipn.mx.modelo.dto.CategoriaDTO;
import com.ipn.mx.modelo.dto.GraficaDTO;
import com.ipn.mx.modelo.dto.ticketApuestaDTO;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.List;
import java.util.Locale;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
//import net.sf.jasperreports.engine.JRException;
//import net.sf.jasperreports.engine.JasperRunManager;
import org.jfree.chart.ChartFactory;
import org.jfree.chart.ChartUtils;
import org.jfree.chart.JFreeChart;
import org.jfree.data.general.DefaultPieDataset;
import org.jfree.data.general.PieDataset;

/**
 *
 * @author Adrian
 */
@WebServlet(name = "ApuestaServlet", urlPatterns = {"/ApuestaServlet"})
public class ApuestaServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

        String accion = request.getParameter("accion");

        if (accion.equals("listaDeApuestas")) {
            listaDeApuesta(request, response);
        } else {
            if (accion.equals("nuevo")) {
                nuevaApuesta(request, response);
            } else {
                if (accion.equals("eliminar")) {
                    eliminarApuesta(request, response);
                } else {
                    if (accion.equals("actualizar")) {
                        actualizarApuesta(request, response);
                    } else {
                        if (accion.equals("guardar")) {
                            almacenarApuesta(request, response);
                        } else {
                            if (accion.equals("verAdmin")) {
                                mostrarApuestaAdmin(request, response);
                            } else {
                                if (accion.equals("graficar")) {
                                    graficar(request, response);
                                } else {
                                    if (accion.equals("verPDF")) {
                                        verPDF(request, response);
                                    } else {
                                        if (accion.equals("ApostarAqui")) {
                                            ApostarAqui(request, response);
                                        } else {
                                            if (accion.equals("verUsuario")) {
                                                mostrarApuestaUsuario(request, response);
                                            } else {
                                                if (accion.equals("hacerApuesta")) {
                                                    hacerApuesta(request, response);
                                                } else {
                                                    if (accion.equals("apostar")) {
                                                        apostar(request, response);
                                                    }
                                                }
                                            }
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

    private void listaDeApuesta(HttpServletRequest request, HttpServletResponse response) {
        System.out.println("prueba33");
        ApuestaDAO dao = new ApuestaDAO();

        try {
            System.out.println("prueba233");
            System.out.println(dao.readAll());
            System.out.println("prueba34");
            List lista = dao.readAll();
            //System.out.println("prueba3");
            request.setAttribute("listaDeApuestas", lista);
            //System.out.println("prueba4");
            RequestDispatcher vista = request.getRequestDispatcher("Apuestas/listaApuestas.jsp");
            vista.forward(request, response);
        } catch (ServletException | IOException ex) {
            Logger.getLogger(ApuestaServlet.class.getName()).log(Level.SEVERE, null, ex);
        }

    }

    private void nuevaApuesta(HttpServletRequest request, HttpServletResponse response) {
        System.out.println("pruebanueva");
        CategoriaDAO dao = new CategoriaDAO();
        List categorias;
        RequestDispatcher rd = request.getRequestDispatcher("Apuestas/apuestaForm.jsp");
        try {
            categorias = dao.readAll();
            request.setAttribute("categorias", categorias);
            rd.forward(request, response);
        } catch (ServletException | IOException ex) {
            Logger.getLogger(ApuestaServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    private void eliminarApuesta(HttpServletRequest request, HttpServletResponse response) {
        ApuestaDAO dao = new ApuestaDAO();
        ApuestaDTO dto = new ApuestaDTO();
        dto.getEntidad().setIdApuesta(Integer.parseInt(request.getParameter("idApuesta")));

        dao.delete(dto);
        listaDeApuesta(request, response);
    }

    private void actualizarApuesta(HttpServletRequest request, HttpServletResponse response) {
        ApuestaDAO dao = new ApuestaDAO();
        ApuestaDTO dto = new ApuestaDTO();
        dto.getEntidad().setIdApuesta(Integer.parseInt(request.getParameter("idApuesta")));

        try {
            dto = dao.read(dto);
            request.setAttribute("dto", dto);
            RequestDispatcher rd = request.getRequestDispatcher("Apuestas/apuestaForm.jsp");
            rd.forward(request, response);
        } catch (ServletException | IOException ex) {
            Logger.getLogger(ApuestaServlet.class.getName()).log(Level.SEVERE, null, ex);
        }

    }

    private void almacenarApuesta(HttpServletRequest request, HttpServletResponse response) {
        System.out.println("Debug 1");
        ApuestaDAO dao = new ApuestaDAO();
        ApuestaDTO dto = new ApuestaDTO();

        if (request.getParameter("idApuesta") == null || request.getParameter("idApuesta").isEmpty()) {
            System.out.println("Debug 2");
//            dto.getEntidad().setIdCategoria(Integer.parseInt(request.getParameter("id")));
            dto.getEntidad().setNombreApuesta(request.getParameter("nombreApuesta"));
            dto.getEntidad().setDescripcionApuesta(request.getParameter("descripcionApuesta"));
            dto.getEntidad().setIdCategoria(Integer.parseInt(request.getParameter("idCategoria")));
            dto.getEntidad().setStatus(request.getParameter("status"));
//            SimpleDateFormat formatter = new SimpleDateFormat("dd-MMM-yyyy");
//            dto.getEntidad().setFecha(formatter.parse(request.getParameter("fecha")));

            dao.create(dto);
            listaDeApuesta(request, response);

        } else {
            System.out.println("Debug 3.1");
            dto.getEntidad().setIdApuesta(Integer.parseInt(request.getParameter("idApuesta")));
            dto.getEntidad().setNombreApuesta(request.getParameter("nombreApuesta"));
            dto.getEntidad().setDescripcionApuesta(request.getParameter("descripcionApuesta"));
            dto.getEntidad().setIdCategoria(Integer.parseInt(request.getParameter("idCategoria")));
            dto.getEntidad().setStatus(request.getParameter("status"));
//            SimpleDateFormat formatter = new SimpleDateFormat("dd-MMM-yyyy");
//            dto.getEntidad().setFecha(formatter.parse(request.getParameter("fecha")));

            dao.update(dto);
            listaDeApuesta(request, response);
        }

    }

    private void mostrarApuestaAdmin(HttpServletRequest request, HttpServletResponse response) {
        ApuestaDAO dao = new ApuestaDAO();
        ApuestaDTO dto = new ApuestaDTO();
        dto.getEntidad().setIdApuesta(Integer.parseInt(request.getParameter("idApuesta")));
        RequestDispatcher rd = request.getRequestDispatcher("Apuestas/verAdmin.jsp");
        try {
            dto = dao.read(dto);
            request.setAttribute("cat", dto);
            rd.forward(request, response);
        } catch (ServletException | IOException ex) {
            Logger.getLogger(ApuestaServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    private void mostrarApuestaUsuario(HttpServletRequest request, HttpServletResponse response) {
        ApuestaDAO dao = new ApuestaDAO();
        ApuestaDTO dto = new ApuestaDTO();
        dto.getEntidad().setIdApuesta(Integer.parseInt(request.getParameter("idApuesta")));
        RequestDispatcher rd = request.getRequestDispatcher("Apuestas/verUsuario.jsp");
        try {
            dto = dao.read(dto);
            request.setAttribute("cat", dto);
            rd.forward(request, response);
        } catch (ServletException | IOException ex) {
            Logger.getLogger(ApuestaServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    private void graficar(HttpServletRequest request, HttpServletResponse response) {
        JFreeChart grafica = ChartFactory.createPieChart3D("productos por Categoria",
                getGraficaProductos(), true, true, Locale.getDefault());
        //i10N o l10N
        String archivo = getServletConfig().getServletContext().getRealPath("/grafica.png");
        try {
            ChartUtils.saveChartAsPNG(new File(archivo), grafica, 500, 500);
            RequestDispatcher rd = request.getRequestDispatcher("Grafica.jsp");
            rd.forward(request, response);

        } catch (IOException | ServletException ex) {
            Logger.getLogger(ApuestaServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    private PieDataset getGraficaProductos() {
        DefaultPieDataset pie3d = new DefaultPieDataset();
        GraficaDAO gDAO = new GraficaDAO();
        try {
            List datos = gDAO.grafica();
            for (int i = 0; i < datos.size(); i++) {
                GraficaDTO dto = (GraficaDTO) datos.get(i);
                pie3d.setValue(dto.getNombre(), dto.getCantidad());
            }
        } catch (SQLException ex) {
            Logger.getLogger(ApuestaServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
        return pie3d;
    }

    private void verPDF(HttpServletRequest request, HttpServletResponse response) {
//        CategoriaDAO dao = new CategoriaDAO();
//        CategoriaDTO dto = new CategoriaDTO();
//        try {
//            ServletOutputStream sos = response.getOutputStream();
//            File reporte = new File(getServletConfig().getServletContext().getRealPath("/reportes/Grafica.jasper"));
//            byte[] bytes = JasperRunManager.runReportToPdf(reporte.getPath(), null, dao.obtenerConexion());
//            response.setContentType("application/pdf");
//            response.setContentLength(bytes.length);
//
//            sos.write(bytes, 0, bytes.length);
//            sos.flush();
//            sos.close();
//        } catch (IOException | JRException ex) {
//            Logger.getLogger(ApuestaServlet.class.getName()).log(Level.SEVERE, null, ex);
//        }
    }

    private void ApostarAqui(HttpServletRequest request, HttpServletResponse response) {
        System.out.println("prueba33");
        ApuestaDAO dao = new ApuestaDAO();

        try {
            System.out.println("prueba233");
            System.out.println(dao.readApuestAbierta());
            System.out.println("prueba34");
            List lista = dao.readApuestAbierta();
            //System.out.println("prueba3");
            request.setAttribute("listaDeApuestas", lista);
            //System.out.println("prueba4");
            RequestDispatcher vista = request.getRequestDispatcher("Apuestas/apuestaAqui.jsp");
            vista.forward(request, response);
        } catch (ServletException | IOException ex) {
            Logger.getLogger(ApuestaServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    private void hacerApuesta(HttpServletRequest request, HttpServletResponse response) {
        System.out.println("pruebaHacerApuesta");
        ApuestaDAO dao = new ApuestaDAO();
        ApuestaDTO dto = new ApuestaDTO();
        dto.getEntidad().setIdApuesta(Integer.parseInt(request.getParameter("idApuesta")));
        RequestDispatcher rd = request.getRequestDispatcher("Apuestas/hacerApuesta.jsp");
        try {
            dto = dao.read(dto);
            request.setAttribute("ap", dto);
            rd.forward(request, response);
        } catch (ServletException | IOException ex) {
            Logger.getLogger(ApuestaServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    private void apostar(HttpServletRequest request, HttpServletResponse response) {
        ticketApuestaDTO dto = new ticketApuestaDTO();
        ticketApuestaDAO dao = new ticketApuestaDAO();

        dto.getEntidad().setMonto(Float.parseFloat(request.getParameter("monto")));
        dto.getEntidad().setIdApuesta(Integer.parseInt(request.getParameter("idApuesta")));
        dto.getEntidad().setIdApuesta(1);
        dto.getEntidad().setGanador(request.getParameter("ganador"));
        
        dao.create(dto);
    }

}

package com.ipn.mx.controlador.web;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import com.ipn.mx.modelo.dao.ApuestaDAO;
import com.ipn.mx.modelo.dto.ApuestaDTO;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author enrique
 */
@WebServlet(urlPatterns = {"/ApuestaServlet"})
public class ApuestaServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String action = request.getParameter("action");

        switch (action) {
            case "lista":
                listarApuestas(request, response);
                break;
            default:
                break;
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

    private void listarApuestas(HttpServletRequest request, HttpServletResponse response) {
        ApuestaDAO dao = new ApuestaDAO();
        ApuestaDTO dto = new ApuestaDTO();
        List list = dao.readAll();
        RequestDispatcher rd = request.getRequestDispatcher("Apuestas/Apuestas.jsp");
        try {
            request.setAttribute("apuestas", list);
            request.setAttribute("apuesta", null);
            rd.forward(request, response);
        } catch (ServletException | IOException ex) {
            Logger.getLogger(ApuestaServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

}
