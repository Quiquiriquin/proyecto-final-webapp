/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.ipn.mx.modelo.dto;

import com.ipn.mx.modelo.entidades.Apuesta;
import java.io.Serializable;

/**
 *
 * @author Adrian
 */
public class ApuestaDTO implements Serializable {
    private Apuesta entidad;

    public ApuestaDTO() {
        entidad = new Apuesta();
    }

    public ApuestaDTO(Apuesta entidad) {
        this.entidad = entidad;
    }

    public Apuesta getEntidad() {
        return entidad;
    }

    public void setEntidad(Apuesta entidad) {
        this.entidad = entidad;
    }
    
    /*@Override
    public String toString() {
        StringBuilder sb = new StringBuilder();
        sb.append("idApuesta: ").append(getEntidad().getIdApuesta()).append("\n");
        sb.append("nombreApuesta: ").append(getEntidad().getNombreApuesta()).append("\n");
        sb.append("descripcionApuesta: ").append(getEntidad().getDescripcionApuesta()).append("\n");
        sb.append("idCategoria: ").append(getEntidad().getIdCategoria()).append("\n");
        sb.append("status: ").append(getEntidad().getStatus()).append("\n");
        sb.append("Equipo1: ").append(getEntidad().getEquipo1()).append("\n");
        sb.append("Equipo2: ").append(getEntidad().getEquipo2()).append("\n");
       
        return sb.toString();
    }*/
}
