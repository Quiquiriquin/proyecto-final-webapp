/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.ipn.mx.utilerias;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author enrique
 */
public class LoginManager {
    private final static String LOGIN_NAME_SESSION_ATTRIBUTE = "nombreUsuario";
    private final static String LOGIN_EMAIL_SESSION_ATTRIBUTE = "email";
    private final static String LOGIN_TYPE_SESSION_ATTRIBUTE = "tipoUsuario";
    
    public void login (HttpServletRequest request, HttpServletResponse response, String nombreUsuario, String email, String tipoUsuario) {
        HttpSession session = request.getSession(true);
        session.setAttribute(LOGIN_NAME_SESSION_ATTRIBUTE, nombreUsuario);
        session.setAttribute(LOGIN_EMAIL_SESSION_ATTRIBUTE, email);
        session.setAttribute(LOGIN_TYPE_SESSION_ATTRIBUTE, tipoUsuario);
    }
    
    public void logout(HttpServletRequest request, HttpServletResponse response) {
        HttpSession session = request.getSession(false);
        session.removeAttribute("nombre");
        if (session != null) {
            session.invalidate();
        }
    }
    
    public boolean getLoginname (HttpServletRequest request, HttpServletResponse response) {
        HttpSession session = request.getSession(false);
        if (session == null) {
            return false;
        } else {
            return session.getAttribute(LOGIN_NAME_SESSION_ATTRIBUTE) != null;
        }
    }
}
