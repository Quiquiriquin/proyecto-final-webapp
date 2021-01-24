/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.ipn.mx.modelo.dao;

/**
 *
 * @author Adrian
 */

import com.ipn.mx.modelo.dto.CategoriaDTO;
import com.ipn.mx.modelo.dto.GraficaDTO;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

/**
 *
 * @author enrique
 */
public class GraficaDAO {

    private static final String SQL_GRAFICAR
            = "Select c.nombreCategoria as categoria,count(*) as Apuestas" +
                    " from apuesta a inner join Categoria c on  a.idCategoria=c.idcategoria group by categoria";
    private Connection con;

    public Connection obtenerConexion() {
        String user = "cfdqqoktpianbj";
        String password = "6dc1dc6d2b83748142a47ba4cfc474bd6ce768c2904c997efc1779e93737b80b";
        String url = "jdbc:postgresql://ec2-23-23-88-216.compute-1.amazonaws.com:5432/d53g1u191loed8?sslmode=require";
        String postgreSQLDriver = "org.postgresql.Driver";
        try {
            Class.forName(postgreSQLDriver);
            con = DriverManager.getConnection(url, user, password);
        } catch (SQLException | ClassNotFoundException ex) {
            Logger.getLogger(CategoriaDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return con;
    }

    public List grafica() throws SQLException {
        obtenerConexion();
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {
            ps = con.prepareStatement(SQL_GRAFICAR);
            rs = ps.executeQuery();
            List resultados = obtenerResultados(rs);
            if (resultados.size() > 0) {
                return resultados;
            } else {
                return null;
            }
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (ps != null) {
                ps.close();
            }
            if (con != null) {
                con.close();
            }
        }
    }
    
    public static void main (String [] args) {
        try {
            GraficaDAO dao = new GraficaDAO();
            List ans = dao.grafica();
            for (int i = 0; i < ans.size(); i++) {
                GraficaDTO dto = (GraficaDTO) ans.get(i);
                
                System.out.println(ans.get(i));
            }
        } catch (SQLException ex) {
            Logger.getLogger(GraficaDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    
        private List obtenerResultados(ResultSet rs) throws SQLException {
        List resultados = new ArrayList();

        while (rs.next()) {
            
            GraficaDTO dto = new GraficaDTO();
            dto.setCantidad(rs.getInt("Apuestas"));
            dto.setNombre(rs.getString("categoria"));
            resultados.add(dto);
        }

        return resultados;
    }
}