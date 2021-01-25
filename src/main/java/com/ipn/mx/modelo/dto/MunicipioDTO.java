/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.ipn.mx.modelo.dto;
import com.ipn.mx.modelo.entidades.Municipio;
/**
 *
 * @author enrique
 */
public class MunicipioDTO {
    private Municipio entidad;

    public MunicipioDTO() {
        entidad = new Municipio();
    }

    public MunicipioDTO(Municipio entidad) {
        this.entidad = entidad;
    }

    public Municipio getEntidad() {
        return entidad;
    }

    public void setEntidad(Municipio entidad) {
        this.entidad = entidad;
    }
}
