/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.ipn.mx.modelo.entidades;

import java.io.Serializable;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;
import javax.persistence.Table;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 *
 * @author Adrian
 */
@Data
@AllArgsConstructor
@NoArgsConstructor
@Entity
@Table(name="ticketApuesta", schema="public")
public class ticketApuesta implements Serializable{
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int idTicket;
    private float monto;
    private int idApuesta;
    private int idUsuario;
    private String ganador;
    private String determinada;
    private int idApuesta_idApuesta;
    private int Apuesta_idApuesta;
}
