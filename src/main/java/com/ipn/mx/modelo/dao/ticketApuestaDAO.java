/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.ipn.mx.modelo.dao;

import com.ipn.mx.modelo.dto.ticketApuestaDTO;
import com.ipn.mx.modelo.entidades.ticketApuesta;
import com.ipn.mx.utilerias.HibernateUtil;
import java.util.ArrayList;
import java.util.List;
import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.query.Query;

/**
 *
 * @author Adrian
 */
public class ticketApuestaDAO {
    public void create(ticketApuestaDTO dto) {
        Session sesion = HibernateUtil.getSessionFactory().getCurrentSession();
        Transaction transaction = sesion.getTransaction();
        try {
            transaction.begin();
            sesion.save(dto.getEntidad());
            transaction.commit();
        } catch (HibernateException e) {
            if (transaction != null && transaction.isActive()) {
                transaction.rollback();
            }
        }
    }

    public void update(ticketApuestaDTO dto) {
        Session sesion = HibernateUtil.getSessionFactory().getCurrentSession();
        Transaction transaction = sesion.getTransaction();
        try {
            transaction.begin();
            sesion.update(dto.getEntidad());
            transaction.commit();
        } catch (HibernateException e) {
            if (transaction != null && transaction.isActive()) {
                transaction.rollback();
            }
        }
    }

    public void delete(ticketApuestaDTO dto) {
        Session sesion = HibernateUtil.getSessionFactory().getCurrentSession();
        Transaction transaction = sesion.getTransaction();
        try {
            transaction.begin();
            sesion.delete(dto.getEntidad());
            transaction.commit();
        } catch (HibernateException e) {
            if (transaction != null && transaction.isActive()) {
                transaction.rollback();
            }
        }
    }

    public ticketApuestaDTO read(ticketApuestaDTO dto) {
        Session sesion = HibernateUtil.getSessionFactory().getCurrentSession();
        Transaction transaction = sesion.getTransaction();
        try {
            transaction.begin();
            //select * from Usuario where IdUsuario= ?
            //dto.setEntidad(sesion.get(dto.getEntidad().getClass(), dto.getEntidad().getIdUsuario()));
            dto.setEntidad(sesion.get(dto.getEntidad().getClass(), dto.getEntidad().getIdTicket()));
            //dto.setEntidad(dto.getEntidad());

            transaction.commit();
        } catch (HibernateException e) {
            if (transaction != null && transaction.isActive()) {
                transaction.rollback();
            }
        }
        return dto;
    }

    public List readAll() {
        Session sesion = HibernateUtil.getSessionFactory().getCurrentSession();
        Transaction transaction = sesion.getTransaction();
        List lista = new ArrayList();
        try {
            transaction.begin();
            Query q = sesion.createQuery("from ticketApuesta u order by u.idTicket");
            for (ticketApuesta u : (List<ticketApuesta>) q.list()) {
                ticketApuestaDTO dto = new ticketApuestaDTO();
                dto.setEntidad(u);
                lista.add(dto);
            }

            transaction.commit();
        } catch (HibernateException e) {
            if (transaction != null && transaction.isActive()) {
                transaction.rollback();
            }
        }
        return lista;
    }
    
    public List readAllFromApuesta(int idApuesta) {
        Session sesion = HibernateUtil.getSessionFactory().getCurrentSession();
        Transaction transaction = sesion.getTransaction();
        List lista = new ArrayList();
        try {
            transaction.begin();
            Query q = sesion.createQuery("from ticketApuesta u where u.idApuesta=" + idApuesta + " order by u.idTicket");
            for (ticketApuesta u : (List<ticketApuesta>) q.list()) {
                ticketApuestaDTO dto = new ticketApuestaDTO();
                dto.setEntidad(u);
                lista.add(dto);
            }

            transaction.commit();
        } catch (HibernateException e) {
            if (transaction != null && transaction.isActive()) {
                transaction.rollback();
            }
        }
        return lista;
    }
    
    public List readAllUser(int idUser) {
        Session sesion = HibernateUtil.getSessionFactory().getCurrentSession();
        Transaction transaction = sesion.getTransaction();
        List lista = new ArrayList();
        try {
            transaction.begin();
            Query q = sesion.createQuery("from ticketApuesta u where u.idUsuario=" + idUser + " order by u.idTicket");
            for (ticketApuesta u : (List<ticketApuesta>) q.list()) {
                ticketApuestaDTO dto = new ticketApuestaDTO();
                System.out.println(u);
                dto.setEntidad(u);
                lista.add(dto);
            }

            transaction.commit();
        } catch (HibernateException e) {
            if (transaction != null && transaction.isActive()) {
                transaction.rollback();
            }
        }
        return lista;
    }

    public static void main(String[] args) {
        ticketApuestaDAO dao = new ticketApuestaDAO();
        ticketApuestaDTO dto = new ticketApuestaDTO();

        dto.getEntidad().setMonto((float) 100.0);
        dto.getEntidad().setIdApuesta(1);
        dto.getEntidad().setIdUsuario(2);        
        dto.getEntidad().setGanador("Barcelona");        
        dao.create(dto);
//        dto.getEntidad().setIdCategoria(3);
//        dto.getEntidad().setNombreCategoria("telefonos");
//        dto.getEntidad().setDescripcionCategoria("dispositivo movil");        
//        dao.update(dto);
//        dto.getEntidad().setIdCategoria(3);      
//        dao.delete(dto);
//        dto.getEntidad().setIdCategoria(2);
//        System.out.println(dao.read(dto));
//        System.out.println(dao.readAll());
        
        
        
        /*Usuario usuario = new Usuario();
        usuario.setNombre("Enrique");
        usuario.setPaterno("Alvarez");
//        usuario.setMaterno("Barajas");
        usuario.setEmail("enrique@gmail.com");
        usuario.setClaveUsuario("12345678");
        usuario.setNombreUsuario("Quiquiriquin");
        usuario.setTipoUsuario("ADMINISTRADOR");
        UsuarioDAO dao = new UsuarioDAO();
        UsuarioDTO dto = new UsuarioDTO();
        dto.setEntidad(usuario);
        dao.create(dto);*/
    }
}
