/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package obat;

import java.sql.*;
/**
 *
 * @author genz
 */
public class UpdateObat {
    //variable dokumen jsp
    public String idObat;
    public String namaObat;
    public String idKategori;
    public String idJenis;
    public String idStok;
    public int a;
    
    //variable dokumen search
    public String simpanNama;
    
    //variable database
    Connection conn;
    Statement stmt;
    ResultSet rs;
    
    public void run(){
        updateObat();
    }
    
    public void updateDetailObat(){
        try {
            Class.forName("com.mysql.jdbc.Driver");
            conn = DriverManager.getConnection("jdbc:mysql://localhost/farmasi","root","");
            stmt = conn.createStatement();
            String sql = "UPDATE detail_obat SET id_kategori='"+idKategori+"', id_jenis='"+idJenis+"', id_stok='"+idStok+"' WHERE id_obat='"+idObat+"'";
            int i = stmt.executeUpdate(sql);
            if (i > 0) {
                a = 1;
            } else {
                a = 2;
            }
            stmt.close();
            conn.close();
        } catch (Exception e){
            a = 2;
        }
    }
    
    public void updateObat(){
        try {
            Class.forName("com.mysql.jdbc.Driver");
            conn = DriverManager.getConnection("jdbc:mysql://localhost/farmasi","root","");
            stmt = conn.createStatement();
            String sql = "UPDATE obat SET nama_obat='"+namaObat+"' WHERE id_obat='"+idObat+"'";
            int i = stmt.executeUpdate(sql);
            if (i > 0) {
                updateDetailObat();
            }
            stmt.close();
            conn.close();
        } catch (Exception e){
            e.printStackTrace();
        }
    }
    
    
}
