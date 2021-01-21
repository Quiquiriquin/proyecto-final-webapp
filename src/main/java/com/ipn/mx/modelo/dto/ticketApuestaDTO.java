/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.ipn.mx.modelo.dto;

import com.ipn.mx.modelo.entidades.ticketApuesta;
import java.io.Serializable;

/**
 *
 * @author Adrian
 */
public class ticketApuestaDTO implements Serializable{
    private ticketApuesta entidad;

    public ticketApuestaDTO() {
        entidad = new ticketApuesta();
    }

    public ticketApuestaDTO(ticketApuesta entidad) {
        this.entidad = entidad;
    }

    public ticketApuesta getEntidad() {
        return entidad;
    }

    public void setEntidad(ticketApuesta entidad) {
        this.entidad = entidad;
    }
    
    @Override
    public String toString() {
        StringBuilder sb = new StringBuilder();
        sb.append("idticketApuesta: ").append(getEntidad().getIdTicket()).append("\n");
        sb.append("monto: ").append(getEntidad().getMonto()).append("\n");
        sb.append("idApuesta: ").append(getEntidad().getIdApuesta()).append("\n");
        sb.append("idUsuario: ").append(getEntidad().getIdUsuario()).append("\n");
        sb.append("ganador: ").append(getEntidad().getGanador()).append("\n");
       
        return sb.toString();
    }
}
