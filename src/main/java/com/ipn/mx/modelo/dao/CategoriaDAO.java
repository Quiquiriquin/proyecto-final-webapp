/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.ipn.mx.modelo.dao;

import com.ipn.mx.modelo.dto.CategoriaDTO;
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
public class CategoriaDAO {
    public void create(CategoriaDTO dto) {
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

    public void update(CategoriaDTO dto) {
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

    public void delete(CategoriaDTO dto) {
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

    public CategoriaDTO read(CategoriaDTO dto) {
        Session sesion = HibernateUtil.getSessionFactory().getCurrentSession();
        Transaction transaction = sesion.getTransaction();
        try {
            transaction.begin();
            //select * from Usuario where IdUsuario= ?
            //dto.setEntidad(sesion.get(dto.getEntidad().getClass(), dto.getEntidad().getIdUsuario()));
            dto.setEntidad(sesion.get(dto.getEntidad().getClass(), dto.getEntidad().getIdCategoria()));
//dto.setEntidad(dto.getEntidad());

            transaction.commit();
        } catch (HibernateException e) {
            if (transaction != null && transaction.isActive()) {
                transaction.rollback();
            }
        }
        return dto;
    }

    /*public CategoriaDTO readByEmailPassword(CategoriaDTO dto) {
        Session sesion = HibernateUtil.getSessionFactory().getCurrentSession();
        Transaction transaction = sesion.getTransaction();
        CategoriaDTO usuario = new CategoriaDTO();
        try {
            String email = dto.getEntidad().getEmail();
            String claveUsuario = dto.getEntidad().getClaveUsuario();
            transaction.begin();
            Query q = sesion.createQuery("from Usuario u where u.email=:email and claveUsuario=:claveUsuario");
            q.setParameter("email", email);
            q.setParameter("claveUsuario", claveUsuario);
            List list = q.list();
            if (list.size() > 0) {
                for (Usuario u : (List<Usuario>) q.list()) {
                    usuario.setEntidad(u);
                    usuario.toString();
                }
            }
            transaction.commit();
            return usuario;
        } catch (HibernateException e) {
            if (transaction != null && transaction.isActive()) {
                transaction.rollback();
            }
        }
        return dto;
    }
    */
    public List readAll() {
        Session sesion = HibernateUtil.getSessionFactory().getCurrentSession();
        Transaction transaction = sesion.getTransaction();
        List lista = new ArrayList();
        try {
            transaction.begin();
            Query q = sesion.createQuery("from Categoria u order by u.idCategoria");
            for (Categoria u : (List<Categoria>) q.list()) {
                CategoriaDTO dto = new CategoriaDTO();
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
        CategoriaDAO dao = new CategoriaDAO();
        CategoriaDTO dto = new CategoriaDTO();

        //dto.getEntidad().setIdCategoria(4);
//        dto.getEntidad().setNombreCategoria("Futbol Español");
//        dto.getEntidad().setDescripcionCategoria("La liga");        
//        dto.getEntidad().setDescripcionCategoria("La liga");        
//        dto.getEntidad().setDescripcionCategoria("La liga");        
//        dto.getEntidad().setDescripcionCategoria("La liga");        
//        dao.create(dto);
//        dto.getEntidad().setIdCategoria(3);
//        dto.getEntidad().setNombreCategoria("telefonos");
//        dto.getEntidad().setDescripcionCategoria("dispositivo movil");        
//        dao.update(dto);
//        dto.getEntidad().setIdCategoria(3);      
//        dao.delete(dto);
        dto.getEntidad().setIdCategoria(2);
        System.out.println(dao.read(dto));
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
