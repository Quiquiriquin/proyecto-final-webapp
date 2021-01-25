/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.ipn.mx.utilerias;

import java.util.Properties;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

/**
 *
 * @author enrique
 */
public class CorreoUtil {
    public void enviarCorreo(String destinatario, String asunto, String mensaje) {
        try {
            Properties p = new Properties();
            p.setProperty("mail.smtp.host", "smtp.gmail.com");
            p.setProperty("mail.smtp.starttls.enable", "true");
            p.setProperty("mail.smtp.port", "587");
            p.setProperty("mail.smtp.auth", "true");
            p.setProperty("mail.smtp.user", "betio.webapp@gmail.com");
            
            Session session = Session.getDefaultInstance(p);
            MimeMessage message = new MimeMessage(session);
            message.addRecipient(Message.RecipientType.TO, new InternetAddress(destinatario));
            message.setSubject(asunto);
            message.setText(mensaje);
            Transport t = session.getTransport("smtp");
            t.connect(p.getProperty("mail.smtp.user"), "webappapuestas");
            t.sendMessage(message, message.getAllRecipients());
            t.close();
        } catch (AddressException ex) {
            Logger.getLogger(CorreoUtil.class.getName()).log(Level.SEVERE, null, ex);
        } catch (MessagingException ex) {
            Logger.getLogger(CorreoUtil.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    
    public static void main (String [] args) {
        CorreoUtil email = new CorreoUtil();
        String destinatario = "alvarez.barajas.enrique@gmail.com";
        String asunto = "Hola prueba!";
        String texto = "Este es un mensaje de prueba";
        email.enviarCorreo(destinatario, asunto, texto);
    }
}
