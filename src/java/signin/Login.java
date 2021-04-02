/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package signin;

import java.sql.*;
import javax.swing.JOptionPane;
/**
 *
 * @author genz
 */
public class Login {
    // variable login
    private String username;
    private String password;
    
    //variable dokumen jsp
    private String user;
    private String pass;
    
    // variable tampil di dokumen jsp
    private String email;
    private String namaPegawai;
    private String idPegawai;
    
    // variable validasi
    private String validUser;
    private String validPass;
    
    //variable database
    Connection conn;
    Statement stmt;
    ResultSet rs;
    
    public void run(){
        cekUsername();
    }
    
    public String getIdPegawai(){
        return idPegawai;
    }
    
    public String getNamaPegawai(){
        return namaPegawai;
    }
    
    public String getEmail(){
        return email;
    }
    
    public String getValidUser(){
        return validUser;
    }
    
    public String getValidPass(){
        return validPass;
    }
    
    public void setUser(String user){
        this.user = user;
    }
    
    public void setPass(String pass){
        this.pass = pass;
    }
    
    public void login(){
        if (username != null && password != null) {
            this.validUser = username;
            this.validPass = password;
        } else {
            this.validUser = null;
            this.validPass = null;
        }
    }
    
    void setNama(){
        try {
            Class.forName("com.mysql.jdbc.Driver");
            conn = DriverManager.getConnection("jdbc:mysql://localhost/farmasi","root","");
            stmt = conn.createStatement();
            String sql = "select nama_pegawai, email, pegawai.id_pegawai from user INNER JOIN pegawai USING (id_pegawai) where username='"+user+"' AND password='"+pass+"'";
            rs = stmt.executeQuery(sql);
            if (rs.next()) {
                if (rs.getString(1) != null) {
                    namaPegawai = rs.getString(1);
                    email = rs.getString(2);
                    idPegawai = rs.getString(3);
                    login();
                }
            }
            stmt.close();
            conn.close();
        } catch (Exception e){
            e.printStackTrace();
        }
    }

    void cekPassword(){
        try {
            Class.forName("com.mysql.jdbc.Driver");
            conn = DriverManager.getConnection("jdbc:mysql://localhost/farmasi","root","");
            stmt = conn.createStatement();
            String sql = "select password from user where password='"+pass+"'";
            rs = stmt.executeQuery(sql);
            if (rs.next()) {
                if (rs.getString(1) != null) {
                    password = rs.getString(1);
                    setNama();
                }
            }
            stmt.close();
            conn.close();
        } catch (Exception e){
            e.printStackTrace();
        }
    }
    
    void cekUsername(){
        try {
            Class.forName("com.mysql.jdbc.Driver");
            conn = DriverManager.getConnection("jdbc:mysql://localhost/farmasi","root","");
            stmt = conn.createStatement();
            String sql = "select username from user where username='"+user+"'";
            rs = stmt.executeQuery(sql);
            if (rs.next()) {
                if (rs.getString(1) != null) {
                    username = rs.getString(1);
                    cekPassword();
                }
            }
            stmt.close();
            conn.close();
        } catch (Exception e){
            e.printStackTrace();
        }
    }
}
