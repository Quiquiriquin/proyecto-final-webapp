/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.ipn.mx.controlador.web;

import com.ipn.mx.modelo.dao.GraficaDAO;
import com.ipn.mx.modelo.dao.UsuarioDAO;
import com.ipn.mx.modelo.dao.ticketApuestaDAO;
import com.ipn.mx.modelo.dto.GraficaDTO;
import com.ipn.mx.modelo.dto.UsuarioDTO;
import com.ipn.mx.modelo.dto.ticketApuestaDTO;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.List;
import java.util.Locale;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.jfree.chart.ChartFactory;
import org.jfree.chart.ChartUtils;
import org.jfree.chart.JFreeChart;
import org.jfree.data.general.DefaultPieDataset;
import org.jfree.data.general.PieDataset;

/**
 *
 * @author enrique
 */
@WebServlet(name = "MainServlet", urlPatterns = {"/MainServlet"})
public class MainServlet extends HttpServlet {

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
                informacionPrincipal(request, response);
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

    private void informacionPrincipal(HttpServletRequest request, HttpServletResponse response) {
        ticketApuestaDAO ticketDao = new ticketApuestaDAO();
        UsuarioDAO usuarioDao = new UsuarioDAO();
        List usuarios = usuarioDao.readAll();
        List tickets = ticketDao.readAll();
        Float totalApostado = new Float(0);
        int ganadas = 0;
        int perdidas = 0;
        int usuariosTotales = usuarios.size();
        for(int i = 0; i < tickets.size(); i ++) {
            ticketApuestaDTO dto = (ticketApuestaDTO) tickets.get(i);
            totalApostado += dto.getEntidad().getMonto();
            if ("GANADA".equals(dto.getEntidad().getDeterminada())) {
                ganadas += 1;
            }
            if ("PERDIDA".equals(dto.getEntidad().getDeterminada())) {
                perdidas += 1;
            }
        }
        RequestDispatcher rd = request.getRequestDispatcher("index.jsp");
        request.setAttribute("totalApostado",totalApostado);
        request.setAttribute("usuariosTotales", usuariosTotales);
        request.setAttribute("ganadas", ganadas);
        request.setAttribute("perdidas", perdidas);

        try {
            rd.forward(request, response);
        } catch (IOException | ServletException ex) {
            Logger.getLogger(MainServlet.class.getName()).log(Level.SEVERE, null, ex);
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
            response.sendRedirect("MainServlet?action=lista");
        } catch (IOException ex) {
            Logger.getLogger(CategoriaServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    private PieDataset getGraficaApuestas() {
        DefaultPieDataset pie3d = new DefaultPieDataset();
        GraficaDAO gDAO = new GraficaDAO();
        try {
            List datos = gDAO.grafica();
            System.out.println(datos);
            for (int i = 0; i < datos.size(); i++) {
                GraficaDTO dto = (GraficaDTO) datos.get(i);
                pie3d.setValue(dto.getNombre(), dto.getCantidad());
            }
        } catch (SQLException ex) {
            Logger.getLogger(CategoriaServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
        return pie3d;
    }

}
