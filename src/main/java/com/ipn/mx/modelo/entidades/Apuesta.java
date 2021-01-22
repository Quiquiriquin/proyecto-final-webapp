/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.ipn.mx.modelo.entidades;

import java.util.Date;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
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
@Table(name="Apuesta", schema="public")
public class Apuesta {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int idApuesta;
    private String nombreApuesta;
    private String descripcionApuesta;
    private int idCategoria;
    private String status;
    private Date fecha;
}
