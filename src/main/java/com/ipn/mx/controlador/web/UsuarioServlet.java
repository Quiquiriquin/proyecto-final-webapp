/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.ipn.mx.controlador.web;

import com.ipn.mx.modelo.dao.CategoriaDAO;
import com.ipn.mx.modelo.dao.UsuarioDAO;
import com.ipn.mx.modelo.dto.CategoriaDTO;
import com.ipn.mx.modelo.dto.UsuarioDTO;
import com.ipn.mx.utilerias.CorreoUtil;
import com.ipn.mx.utilerias.LoginManager;
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
@WebServlet(name = "UsuarioServlet", urlPatterns = {"/UsuarioServlet"})
public class UsuarioServlet extends HttpServlet {

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
            case "ingresar":
                loginUsuario(request, response);
                break;
            case "login":
                iniciarSesion(request, response);
                break;
            case "logout":
                cerrarSesion(request, response);
                break;
            case "registrar":
                registrarUsuario(request, response);
                break;
            case "almacenar":
                almacenarUsuario(request, response);
                break;
            case "perfil":
                consultarUsuario(request, response);
                break;
            case "actualizar":
                actualizarUsuario(request, response);
                break;
            case "ver":
                mostrarUsuario(request, response);
                break;
            case "eliminar":
                eliminarUsuario(request, response);
                break;
            case "lista":
                listaDeUsuario(request, response);
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

    private void loginUsuario(HttpServletRequest request, HttpServletResponse response) {
        try {
            RequestDispatcher rd = request.getRequestDispatcher("Usuarios/Login.jsp");
            rd.forward(request, response);
        } catch (ServletException | IOException ex) {
            Logger.getLogger(UsuarioServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    private void registrarUsuario(HttpServletRequest request, HttpServletResponse response) {
        try {
            RequestDispatcher rd = request.getRequestDispatcher("Usuarios/Registrar.jsp");
            rd.forward(request, response);
        } catch (ServletException | IOException ex) {
            Logger.getLogger(UsuarioServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    private void almacenarUsuario(HttpServletRequest request, HttpServletResponse response) {
        UsuarioDAO dao = new UsuarioDAO();
        UsuarioDTO dto = new UsuarioDTO();
        CorreoUtil util = new CorreoUtil();
        String id = request.getParameter("idUsuario");
        dto.getEntidad().setNombre(request.getParameter("nombre"));
        dto.getEntidad().setPaterno(request.getParameter("paterno"));
        dto.getEntidad().setEmail(request.getParameter("email"));
        dto.getEntidad().setClaveUsuario(request.getParameter("claveUsuario"));
        dto.getEntidad().setNombreUsuario(request.getParameter("nombreUsuario"));
        dto.getEntidad().setTipoUsuario("JUGADOR");
        try {
            RequestDispatcher rd = request.getRequestDispatcher("Usuarios/Perfil.jsp");
            System.out.println(id);
            if (id != null) {
                dto.getEntidad().setIdUsuario(Integer.parseInt(id));
                dao.update(dto);
                request.setAttribute("usuario", dto);
                response.sendRedirect("UsuarioServlet?action=perfil");
            } else {
                dao.create(dto);
                String msg = "Bienvenido " + dto.getEntidad().getNombreUsuario()+  "! Gracias por registrarte en Bet.io";
                util.enviarCorreo(dto.getEntidad().getEmail(), "Bienvenido", msg);
                response.sendRedirect("UsuarioServlet?action=ingresar");
            }
        } catch (IOException ex) {
            Logger.getLogger(UsuarioServlet.class.getName()).log(Level.SEVERE, null, ex);
        }

    }

    private void iniciarSesion(HttpServletRequest request, HttpServletResponse response) {
        UsuarioDAO dao = new UsuarioDAO();
        UsuarioDTO dto = new UsuarioDTO();
        LoginManager manager = new LoginManager();
        dto.getEntidad().setEmail(request.getParameter("email"));
        dto.getEntidad().setClaveUsuario(request.getParameter("claveUsuario"));
        try {
            dto = dao.readByEmailPassword(dto);
            System.out.println(dto);
            if (dto == null) {
                response.sendRedirect("UsuarioServlet?action=ingresar");
            } else {
                manager.login(request, response,
                        dto.getEntidad().getNombreUsuario(),
                        dto.getEntidad().getEmail(),
                        dto.getEntidad().getTipoUsuario(), 
                        dto.getEntidad().getIdUsuario());
                response.sendRedirect("MainServlet?action=lista");
            }
        } catch (IOException ex) {
            Logger.getLogger(UsuarioServlet.class.getName()).log(Level.SEVERE, null, ex);
        }

    }

    private void consultarUsuario(HttpServletRequest request, HttpServletResponse response) {
        UsuarioDAO dao = new UsuarioDAO();
        UsuarioDTO dto = new UsuarioDTO();
        LoginManager manager = new LoginManager();
        int id = manager.getSessionId(request, response);
        dto.getEntidad().setIdUsuario(id);
        RequestDispatcher rd = request.getRequestDispatcher("Usuarios/Perfil.jsp");
        try {
            dto = dao.read(dto);
            request.setAttribute("usuario", dto);
            System.out.println(dto.toString());
            rd.forward(request, response);
        } catch (ServletException | IOException ex) {
            Logger.getLogger(UsuarioServlet.class.getName()).log(Level.SEVERE, null, ex);
        }

    }

    private void cerrarSesion(HttpServletRequest request, HttpServletResponse response) {
        try {
            LoginManager manager = new LoginManager();
            manager.logout(request, response);
            response.sendRedirect("/");
        } catch (IOException ex) {
            Logger.getLogger(UsuarioServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    private void actualizarUsuario(HttpServletRequest request, HttpServletResponse response) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    private void mostrarUsuario(HttpServletRequest request, HttpServletResponse response) {
        UsuarioDAO dao = new UsuarioDAO();
        UsuarioDTO dto = new UsuarioDTO();
        dto.getEntidad().setIdUsuario(Integer.parseInt(request.getParameter("idUsuario")));
        RequestDispatcher rd = request.getRequestDispatcher("Usuarios/ver.jsp");
        try {
            dto = dao.read(dto);
            request.setAttribute("cat", dto);
            rd.forward(request, response);
        } catch (ServletException | IOException ex) {
            Logger.getLogger(UsuarioServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    private void eliminarUsuario(HttpServletRequest request, HttpServletResponse response) {
        UsuarioDAO dao = new UsuarioDAO();
        UsuarioDTO dto = new UsuarioDTO();
        dto.getEntidad().setIdUsuario(Integer.parseInt(request.getParameter("idUsuario")));

        dao.delete(dto);
        try {
            response.sendRedirect("UsuarioServlet?action=lista");
        } catch (IOException ex) {
            Logger.getLogger(UsuarioServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    private void listaDeUsuario(HttpServletRequest request, HttpServletResponse response) {
        UsuarioDAO dao = new UsuarioDAO();

        try {
            List lista = dao.readAll();
            request.setAttribute("listaDeUsuarios", lista);
            //System.out.println("prueba4");
            RequestDispatcher vista = request.getRequestDispatcher("Usuarios/ListaUsuarios.jsp");
            vista.forward(request, response);
        } catch (ServletException | IOException ex) {
            Logger.getLogger(CategoriaServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

}
