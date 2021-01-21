/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.ipn.mx.modelo.dao;

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

/**
 *
 * @author Adrian
 */
public class GraficaDAO {
    private static final String SQL_GRAFICAR=
            "Select c.nombreCategoria as categoria,count(*) as productos "
            +" from Producto p inner join Categoria c on  p.idCategoria=c.idcategoria group by categoria";
    private Connection con;

    private void obtenerConexion() {
        String user = "cfdqqoktpianbj";
        String pwd = "6dc1dc6d2b83748142a47ba4cfc474bd6ce768c2904c997efc1779e93737b80b";
        String url = "jdbc:postgresql://ec2-23-23-88-216.compute-1.amazonaws.com:5432/d53g1u191loed8?sslmode=require"; /* */
        //String url = "jdbc:postgresql://ec2-3-231-48-230.compute-1.amazonaws.com:5432/ddq19vu0cdtdtp?sslmode=require";
        


        //String url = "jdbc:mysql://localhost:3306/3CM9?allowPublicKeyRetrieval=true"; Con este hay que modificar mysql con SET GLOBAL time_zone = '-3:00';
        //String url = "jdbc:mysql://localhost:3306/3CM9?serverTimezone=America/Mexico_City&useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&useSSL=false?allowPublicKeyRetrieval=true";
        String driverMySql = "org.postgresql.Driver";

        try {
            Class.forName(driverMySql);
            con = DriverManager.getConnection(url, user, pwd);
        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(CategoriaDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    public List grafica() throws SQLException{
        obtenerConexion();
        PreparedStatement ps =null;
        ResultSet rs = null;
        List lista = new ArrayList();
        try {
            ps=con.prepareStatement(SQL_GRAFICAR);
            rs=ps.executeQuery();
            while(rs.next()){
                GraficaDTO dto = new GraficaDTO();
                dto.setNombre(rs.getString("categoria"));
                dto.setCantidad(rs.getInt("productos"));
                lista.add(dto);
            }
        } finally {
            if(rs!=null){
                rs.close();
            }
            if(ps!=null){
                ps.close();
            }
            if(con!=null){
                con.close();
            }
        }
                
        return lista;
    }
}
