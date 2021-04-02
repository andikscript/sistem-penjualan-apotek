/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package stokharga;

import javax.swing.*;
import java.sql.*;
/**
 *
 * @author anon
 */
public class stokharga {
    //variable input database
    private String idStok;
    public String idObat;
    public int stok;
    public int stokLimit;
    public int a;
    
    //variable untuk set idStok dan idObat
    private int hitung;
    private int hitungObat;
    
    //variable database
    Connection conn;
    Statement stmt;
    ResultSet rs;
    
    public void run(){
        hitungStok();
        setIdStok();
        insertStok();
    }
    
    public void insertStok(){
        try {
            Class.forName("com.mysql.jdbc.Driver");
            conn = DriverManager.getConnection("jdbc:mysql://localhost/farmasi","root","");
            stmt = conn.createStatement();
            String sql = "INSERT INTO stok(id_stok,id_obat,stok,stok_limit) VALUES('"+idStok+"','"+idObat+"',"+stok+","+stokLimit+")";
            stmt.executeUpdate(sql);
            JOptionPane.showMessageDialog(null, "OK ");
            a = 1;
            stmt.close();
            conn.close();
        } catch (Exception e){
            JOptionPane.showMessageDialog(null, e.getMessage() + " " + idObat);
            a = 2;
            e.printStackTrace();
        }
    }
    
    public void setIdStok(){
        if (hitung < 10) {
            idObat = "ST000"+String.valueOf(hitung)+idObat.substring(6,8).toUpperCase();
        } else if (hitung < 100) {
            idObat = "ST00"+String.valueOf(hitung)+idObat.substring(6,8).toUpperCase();
        } else if (hitung < 1000) {
            idObat = "ST0"+String.valueOf(hitung)+idObat.substring(6,8).toUpperCase();
        } else if (hitung >= 1000) {
            idObat = "ST"+String.valueOf(hitung)+idObat.substring(6,8).toUpperCase();
        }
    }
    
    public void hitungStok(){
        try {
            Class.forName("com.mysql.jdbc.Driver");
            conn = DriverManager.getConnection("jdbc:mysql://localhost/farmasi","root","");
            stmt = conn.createStatement();
            String sql = "select count(id_stok) from stok";
            rs = stmt.executeQuery(sql);
            while (rs.next()) {
                hitung = Integer.parseInt(rs.getString("count(id_stok)")) + 1;
            }
            stmt.close();
            conn.close();
        } catch (Exception e){
            e.printStackTrace();
        }
    }
}
