/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Modelo;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

/**
 *
 * @author Hp
 */
public class Usuario {
    
     private int id;
    private String nombre;
    private String parteno;
    private String materno;
    private String Email;
    private String pass;
    private String user;
    private int tipo;

    public Usuario(int id, String nombre, String parteno, String materno, String Email, String pass, String user, int tipo, Connection con, PreparedStatement ps, ResultSet rs, int r) {
        this.id = id;
        this.nombre = nombre;
        this.parteno = parteno;
        this.materno = materno;
        this.Email = Email;
        this.pass = pass;
        this.user = user;
        this.tipo = tipo;
        
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getParteno() {
        return parteno;
    }

    public void setParteno(String parteno) {
        this.parteno = parteno;
    }

    public String getMaterno() {
        return materno;
    }

    public void setMaterno(String materno) {
        this.materno = materno;
    }

    public String getEmail() {
        return Email;
    }

    public void setEmail(String Email) {
        this.Email = Email;
    }

    public String getPass() {
        return pass;
    }

    public void setPass(String pass) {
        this.pass = pass;
    }

    public String getUser() {
        return user;
    }

    public void setUser(String user) {
        this.user = user;
    }

    public int getTipo() {
        return tipo;
    }

    public void setTipo(int tipo) {
        this.tipo = tipo;
    }

   
    
   
     
    
}
