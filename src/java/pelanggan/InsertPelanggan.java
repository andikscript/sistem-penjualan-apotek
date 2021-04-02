/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package pelanggan;

import java.sql.*;
/**
 *
 * @author genz
 */
public class InsertPelanggan {
    //variable untuk dokumen jsp
    public String idPelanggan;
    public String namaPelanggan;
    public String alamat;
    public String noHp;
    public String email;
    public int a;
    public int hitung;
    public String nilaiString;
    
    //variable konek database
    Connection conn;
    Statement stmt;
    ResultSet rs;
    
    public void run(){
        setIdPelanggan();
        insertPelanggan();
    }
    
    public void setIdPelanggan(){
        idPelanggan = "P"+namaPelanggan.substring(0,2).toUpperCase() + noHp.substring(0,3)+ email.substring(0,2).toUpperCase();
    }
    
    public void insertPelanggan(){
        try {
            Class.forName("com.mysql.jdbc.Driver");
            conn = DriverManager.getConnection("jdbc:mysql://localhost/farmasi","root","");
            stmt = conn.createStatement();
            String sql = "INSERT INTO pelanggan(id_pelanggan,nama_pelanggan,alamat,no_hp,email) VALUES('"+idPelanggan+"','"+namaPelanggan+"','"+alamat+"','"+noHp+"','"+email+"')";
            stmt.execute(sql);
            a = 1;
            stmt.close();
            conn.close();
        } catch (Exception e){
            a = 2;
        }
    }
}
