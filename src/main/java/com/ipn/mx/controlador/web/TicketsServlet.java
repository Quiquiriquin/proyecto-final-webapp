/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.ipn.mx.controlador.web;

import com.ipn.mx.modelo.dao.ApuestaDAO;
import com.ipn.mx.modelo.dao.ticketApuestaDAO;
import com.ipn.mx.modelo.dto.ticketApuestaDTO;
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
@WebServlet(name = "TicketsServlet", urlPatterns = {"/TicketsServlet"})
public class TicketsServlet extends HttpServlet {

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
                listarTickets(request, response);
                break;
            case "cerrar":
                cerrarTicket(request, response);
                break;
            case "anular":
                anularApuesta(request, response);
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

    private void listarTickets(HttpServletRequest request, HttpServletResponse response) {
        ticketApuestaDAO dao = new ticketApuestaDAO();
        ticketApuestaDTO dto = new ticketApuestaDTO();
        ApuestaDAO apuestaDao = new ApuestaDAO();

        List list = dao.readAll();
        List lista2 = apuestaDao.readAll();
        request.setAttribute("tickets", list);
        request.setAttribute("apuestas", lista2);
        RequestDispatcher rd = request.getRequestDispatcher("TicketsApuesta/Tickets.jsp");
        try {
            rd.forward(request, response);
        } catch (ServletException | IOException ex) {
            Logger.getLogger(TicketsServlet.class.getName()).log(Level.SEVERE, null, ex);
        }

    }

    private void cerrarTicket(HttpServletRequest request, HttpServletResponse response) {
        ticketApuestaDAO dao = new ticketApuestaDAO();
        ticketApuestaDTO dto = new ticketApuestaDTO();
        dto.getEntidad().setIdTicket(Integer.parseInt(request.getParameter("idTicket")));

        try {
            dto = dao.read(dto);
            dto.getEntidad().setDeterminada("CERRADA");
            dao.update(dto);
            response.sendRedirect("ApuestaServlet?action=lista");
        } catch (IOException ex) {
            Logger.getLogger(TicketsServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    private void anularApuesta(HttpServletRequest request, HttpServletResponse response) {
        ticketApuestaDAO dao = new ticketApuestaDAO();
        ticketApuestaDTO dto = new ticketApuestaDTO();
        dto.getEntidad().setIdApuesta(Integer.parseInt(request.getParameter("idTicket")));
        try {
            dao.delete(dto);
            response.sendRedirect("TicketsServlet?action=lista");
        } catch (IOException ex) {
            Logger.getLogger(TicketsServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

}
