/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.ipn.mx.modelo.dao;

import com.ipn.mx.modelo.dto.ApuestaDTO;
import com.ipn.mx.modelo.entidades.Apuesta;
import com.ipn.mx.modelo.entidades.Categoria;
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
public class ApuestaDAO {
    public void create(ApuestaDTO dto) {
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

    public void update(ApuestaDTO dto) {
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

    public void delete(ApuestaDTO dto) {
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

    public ApuestaDTO read(ApuestaDTO dto) {
        Session sesion = HibernateUtil.getSessionFactory().getCurrentSession();
        Transaction transaction = sesion.getTransaction();
        try {
            transaction.begin();
            dto.setEntidad(sesion.get(dto.getEntidad().getClass(), dto.getEntidad().getIdApuesta()));
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
            Query q = sesion.createQuery("from Apuesta u order by u.idApuesta");
            for (Apuesta u : (List<Apuesta>) q.list()) {
                ApuestaDTO dto = new ApuestaDTO();
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
    public List readApuestAbierta() {
        Session sesion = HibernateUtil.getSessionFactory().getCurrentSession();
        Transaction transaction = sesion.getTransaction();
        List lista = new ArrayList();
        try {
            transaction.begin();
            Query q = sesion.createQuery("from Apuesta u where u.status='ABIERTA' order by u.idApuesta");
            for (Apuesta u : (List<Apuesta>) q.list()) {
                ApuestaDTO dto = new ApuestaDTO();
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
        ApuestaDAO dao = new ApuestaDAO();
        ApuestaDTO dto = new ApuestaDTO();

        dto.getEntidad().setIdCategoria(4);
        dto.getEntidad().setNombreApuesta("Barcelona vs Valencia");
        dto.getEntidad().setDescripcionApuesta("Supercopa Final");        
        dto.getEntidad().setIdCategoria(1); 
        dto.getEntidad().setEquipo1("Barcelona");
        dto.getEntidad().setEquipo2("Valencia");
        dao.create(dto);
//        dto.getEntidad().setIdApuesta(5);
//        dto.getEntidad().setNombreApuesta("Torneo de FORTNITE");
//        dto.getEntidad().setDescripcionApuesta("Yeadasdh"); 
//        dto.getEntidad().setIdCategoria(1);
//        dto.getEntidad().setStatus("Cerrado");
//        dao.update(dto);
//        dto.getEntidad().setIdCategoria(3);      
//        dao.delete(dto);
//        dto.getEntidad().setIdCategoria(2);
//        System.out.println(dao.read(dto));
                
    }
}
