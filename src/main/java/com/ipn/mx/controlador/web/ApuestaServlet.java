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
import com.ipn.mx.modelo.entidades.Apuesta;
import com.ipn.mx.utilerias.HibernateUtil;
import com.ipn.mx.utilerias.LoginManager;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
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
import net.sf.jasperreports.engine.JRException;
import net.sf.jasperreports.engine.JasperRunManager;
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

        String action = request.getParameter("action");
        switch (action) {
            case "lista":
                listarApuestas(request, response);
                break;
            case "nuevo":
                nuevaApuesta(request, response);
                break;
            case "eliminar":
                eliminarApuesta(request, response);
                break;
            case "actualizar":
                actualizarApuesta(request, response);
                break;
            case "guardar":
                almacenarApuesta(request, response);
                break;
            case "verAdmin":
                mostrarApuestaAdmin(request, response);
                break;
            case "graficar":
                graficar(request, response);
                break;
            case "verPDF":
                verPDF(request, response);
                break;
            case "ApostarAqui":
                ApostarAqui(request, response);
                break;
            case "verUsuario":
                mostrarApuestaUsuario(request, response);
                break;
            case "hacerApuesta":
                hacerApuesta(request, response);
                break;
            case "apostar":
                apostar(request, response);
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

    private void listaDeApuesta(HttpServletRequest request, HttpServletResponse response) {
        ApuestaDAO dao = new ApuestaDAO();

        try {
            System.out.println(dao.readAll());
            List lista = dao.readAll();
            request.setAttribute("listaDeApuestas", lista);
            RequestDispatcher vista = request.getRequestDispatcher("Apuestas/listaApuestas.jsp");
            vista.forward(request, response);
        } catch (ServletException | IOException ex) {
            Logger.getLogger(ApuestaServlet.class.getName()).log(Level.SEVERE, null, ex);
        }

    }

    private void nuevaApuesta(HttpServletRequest request, HttpServletResponse response) {
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
        try {
            response.sendRedirect("ApuestaServlet?action=lista");
        } catch (IOException ex) {
            Logger.getLogger(ApuestaServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
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
        ApuestaDAO dao = new ApuestaDAO();
        ApuestaDTO dto = new ApuestaDTO();
        
        if (request.getParameter("idApuesta") == null || request.getParameter("idApuesta").isEmpty()) {
            dto.getEntidad().setNombreApuesta(request.getParameter("nombreApuesta"));
            dto.getEntidad().setDescripcionApuesta(request.getParameter("descripcionApuesta"));
            dto.getEntidad().setIdCategoria(Integer.parseInt(request.getParameter("idCategoria")));
            dto.getEntidad().setStatus("ABIERTA");
            dto.getEntidad().setEquipo1(request.getParameter("equipo1"));
            dto.getEntidad().setEquipo2(request.getParameter("equipo2"));
            dto.getEntidad().setMomio(Float.parseFloat(request.getParameter("momio")));
            dao.create(dto);
            try {
                response.sendRedirect("ApuestaServlet?action=lista");
            } catch (IOException ex) {
                Logger.getLogger(ApuestaServlet.class.getName()).log(Level.SEVERE, null, ex);
            }
        } else {
            dto.getEntidad().setIdApuesta(Integer.parseInt(request.getParameter("idApuesta")));
            dto.getEntidad().setNombreApuesta(request.getParameter("nombreApuesta"));
            dto.getEntidad().setDescripcionApuesta(request.getParameter("descripcionApuesta"));
            dto.getEntidad().setIdCategoria(Integer.parseInt(request.getParameter("idCategoria")));
            dto.getEntidad().setStatus(request.getParameter("status"));
            dto.getEntidad().setEquipo1(request.getParameter("equipo1"));
            dto.getEntidad().setEquipo2(request.getParameter("equipo2"));
            dto.getEntidad().setMomio(Float.parseFloat(request.getParameter("momio")));
            dto.getEntidad().setGanador(request.getParameter("ganador"));
            dao.update(dto);
            try {
                response.sendRedirect("ApuestaServlet?action=lista");
            } catch (IOException ex) {
                Logger.getLogger(ApuestaServlet.class.getName()).log(Level.SEVERE, null, ex);
            }
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
        JFreeChart grafica = ChartFactory.createPieChart3D("Resumen categorias Apuestas",
                getGraficaApuestas(), true, true, Locale.getDefault());
        //i10N o l10N
        String archivo = getServletConfig().getServletContext().getRealPath("/grafica.png");
        try {
            ChartUtils.saveChartAsPNG(new File(archivo), grafica, 500, 500);
            RequestDispatcher rd = request.getRequestDispatcher("index.jsp");
//            rd.forward(request, response);
            response.sendRedirect("/ProyectoFinal/MainServlet?action=lista");
        } catch (IOException ex) {
            Logger.getLogger(CategoriaServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    private PieDataset getGraficaApuestas() {
        DefaultPieDataset pie3d = new DefaultPieDataset();
        GraficaDAO gDAO = new GraficaDAO();
        try {
            List datos = gDAO.grafica();
            for (int i = 0; i < datos.size(); i++) {
                GraficaDTO dto = (GraficaDTO) datos.get(i);
                pie3d.setValue(dto.getNombre(), dto.getCantidad());
            }
        } catch (SQLException ex) {
            Logger.getLogger(CategoriaServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
        return pie3d;
    }

    private void verPDF(HttpServletRequest request, HttpServletResponse response) {
        ApuestaDAO dao = new ApuestaDAO();
//        ApuestaDTO dto = new ApuestaDTO();
//        HibernateUtil conexion = new HibernateUtil();
        try {
            ServletOutputStream sos = response.getOutputStream();
            File reporte = new File(getServletConfig().getServletContext().getRealPath("/Reportes/Apuestas.jasper"));
            byte[] bytes = JasperRunManager.runReportToPdf(reporte.getPath(), null, dao.obtenerConexion());
            response.setContentType("application/pdf");
            response.setContentLength(bytes.length);

            sos.write(bytes, 0, bytes.length);
            sos.flush();
            sos.close();
        } catch (IOException | JRException ex) {
            Logger.getLogger(ApuestaServlet.class.getName()).log(Level.SEVERE, null, ex);
        }

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
        ApuestaDAO dao = new ApuestaDAO();
        ApuestaDTO dto = new ApuestaDTO();
        dto.getEntidad().setIdApuesta(Integer.parseInt(request.getParameter("idApuesta")));
        RequestDispatcher rd = request.getRequestDispatcher("Apuestas/HacerApuesta.jsp");
        try {
            dto = dao.read(dto);
            request.setAttribute("apuesta", dto);
            rd.forward(request, response);
        } catch (ServletException | IOException ex) {
            Logger.getLogger(ApuestaServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    private void apostar(HttpServletRequest request, HttpServletResponse response) {
        try {
            ticketApuestaDTO dto = new ticketApuestaDTO();
            ticketApuestaDAO dao = new ticketApuestaDAO();
            LoginManager manager = new LoginManager();
            int idUser = manager.getSessionId(request, response);
            dto.getEntidad().setMonto(Float.parseFloat(request.getParameter("montoApuesta")));
            dto.getEntidad().setIdApuesta(Integer.parseInt(request.getParameter("idApuesta")));
            dto.getEntidad().setGanador(request.getParameter("ganador"));
            dto.getEntidad().setDeterminada("PENDIENTE");
            dto.getEntidad().setIdUsuario(idUser);
            dao.create(dto);
            response.sendRedirect("/ProyectoFinal/ApuestaServlet?action=lista");
        } catch (IOException ex) {
            Logger.getLogger(ApuestaServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    private void listarApuestas(HttpServletRequest request, HttpServletResponse response) {
        ApuestaDAO dao = new ApuestaDAO();
        ApuestaDTO dto = new ApuestaDTO();
        ticketApuestaDAO tdao = new ticketApuestaDAO();
        LoginManager manager = new LoginManager();
        int idUser = manager.getSessionId(request, response);
        List lista2 = new ArrayList();
        List nombreEvento = new ArrayList();
        RequestDispatcher rd = request.getRequestDispatcher("Apuestas/Apuestas.jsp");
        try {
            List list = dao.readAll();
            lista2 = tdao.readAllUser(idUser);
            System.out.println(list);
            request.setAttribute("apuestas", list);
            request.setAttribute("apuesta", null);
            request.setAttribute("apuestasUsuario", lista2);
            rd.forward(request, response);
        } catch (ServletException | IOException ex) {
            Logger.getLogger(ApuestaServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

//    public user getCurrentUser(String user_name, String password){
//        
//    }
}
