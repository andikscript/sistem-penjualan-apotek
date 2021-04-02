/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package obat;

import java.sql.*;
import javax.swing.JOptionPane;
/**
 *
 * @author genz
 */
public class InsertObat {
    //variable id database
    public String idObat;
    public String idDetailObat;
    public String idStok;
    
    //variable dokumen jsp
    public String namaObat;
    public String idKategori;
    public String idJenis;
    public int stok;
    public int stokLimit;
    
    //variable set idObat dan idDetailObat
    public int hitungObat;
    public int hitungDetail;
    public int hitungStok;
    public int a;
    
    //variable database
    Connection conn;
    Statement stmt;
    ResultSet rs;
    
    public void run(){
        hitungObat();
        setIdObat();
        hitungDetailObat();
        setIdDetailObat();
        hitungStok();
        setIdStok();
        insertObat();
    }
    
    public void insertDetailObat(){
        try {
            Class.forName("com.mysql.jdbc.Driver");
            conn = DriverManager.getConnection("jdbc:mysql://localhost/farmasi","root","");
            stmt = conn.createStatement();
            String sql= "INSERT INTO detail_obat(id_detail_obat,id_obat,id_kategori,id_jenis,id_stok) VALUES('"+idDetailObat+"','"+idObat+"','"+idKategori+"','"+idJenis+"','"+idStok+"')";
            stmt.execute(sql);
            a = 1;
            insertStok();
            stmt.close();
            conn.close();
        } catch (Exception e){
            //OptionPane.showMessageDialog(null, e.getMessage() + "detail ");
            a = 2;
            e.printStackTrace();
        }
    }
    
    public void insertStok(){
        try {
            Class.forName("com.mysql.jdbc.Driver");
            conn = DriverManager.getConnection("jdbc:mysql://localhost/farmasi","root","");
            stmt = conn.createStatement();
            String sql = "INSERT INTO stok(id_stok,stok,stok_limit, id_obat) VALUES('"+idStok+"',"+stok+","+stokLimit+",'"+idObat+"')";
            stmt.execute(sql);
            insertDetailObat();
            a = 1;
            stmt.close();
            conn.close();
        } catch (Exception e){
            //JOptionPane.showMessageDialog(null, e.getMessage() + " stok");
            a = 2;
            e.printStackTrace();
        }
    }
    
    public void insertObat(){
        try {
            Class.forName("com.mysql.jdbc.Driver");
            conn = DriverManager.getConnection("jdbc:mysql://localhost/farmasi","root","");
            stmt = conn.createStatement();
            String sql = "INSERT INTO obat(id_obat,nama_obat) VALUES('"+idObat+"','"+namaObat+"')";
            stmt.execute(sql);
            a = 1;
            insertStok();
            stmt.close();
            conn.close();
        } catch (Exception e){
            //JOptionPane.showMessageDialog(null, e.getMessage() + "obat " + idObat);
            a = 2;
            e.printStackTrace();
        }
    }
    
    //stok
    
    public void setIdStok(){
        if (hitungStok < 10) {
            idStok = "ST000"+String.valueOf(hitungStok)+namaObat.substring(0,2).toUpperCase();
        } else if (hitungStok < 100) {
            idStok = "ST00"+String.valueOf(hitungStok)+namaObat.substring(0,2).toUpperCase();
        } else if (hitungStok < 1000) {
            idStok = "ST0"+String.valueOf(hitungStok)+namaObat.substring(0,2).toUpperCase();
        } else if (hitungStok >= 1000) {
            idStok = "ST"+String.valueOf(hitungStok)+namaObat.substring(0,2).toUpperCase();
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
                hitungStok = Integer.parseInt(rs.getString("count(id_stok)")) + 1;
            }
            stmt.close();
            conn.close();
        } catch (Exception e){
            e.printStackTrace();
        }
    }
    
    //detail obat

    public void setIdDetailObat(){
        if (hitungDetail < 10) {
            idDetailObat = "DO000"+String.valueOf(hitungDetail)+namaObat.substring(0,2).toUpperCase();
        } else if (hitungDetail < 100) {
            idDetailObat = "DO00"+String.valueOf(hitungDetail)+namaObat.substring(0,2).toUpperCase();
        } else if (hitungDetail < 1000) {
            idDetailObat = "DO0"+String.valueOf(hitungDetail)+namaObat.substring(0,2).toUpperCase();
        } else if (hitungDetail >= 1000) {
            idDetailObat = "DO"+String.valueOf(hitungDetail)+namaObat.substring(0,2).toUpperCase();
        }
    }
    
    public void hitungDetailObat(){
        try {
            Class.forName("com.mysql.jdbc.Driver");
            conn = DriverManager.getConnection("jdbc:mysql://localhost/farmasi","root","");
            stmt = conn.createStatement();
            String sql = "select count(id_detail_obat) from detail_obat";
            rs = stmt.executeQuery(sql);
            while (rs.next()) {
                hitungDetail = Integer.parseInt(rs.getString("count(id_detail_obat)")) + 1;
            }
            stmt.close();
            conn.close();
        } catch (Exception e){
            e.printStackTrace();
        }
    }
    
    //obat
    
    public void setIdObat(){
        if (hitungObat < 10) {
            idObat = "OB000"+String.valueOf(hitungObat)+namaObat.substring(0,2).toUpperCase();
        } else if (hitungObat < 100) {
            idObat = "OB00"+String.valueOf(hitungObat)+namaObat.substring(0,2).toUpperCase();
        } else if (hitungObat < 1000) {
            idObat = "OB0"+String.valueOf(hitungObat)+namaObat.substring(0,2).toUpperCase();
        } else if (hitungObat >= 1000) {
            idObat = "OB"+String.valueOf(hitungObat)+namaObat.substring(0,2).toUpperCase();
        }
    }
    
    public void hitungObat(){
        try {
            Class.forName("com.mysql.jdbc.Driver");
            conn = DriverManager.getConnection("jdbc:mysql://localhost/farmasi","root","");
            stmt = conn.createStatement();
            String sql = "select count(id_obat) from obat";
            rs = stmt.executeQuery(sql);
            while (rs.next()) {
                hitungObat = Integer.parseInt(rs.getString("count(id_obat)")) + 1;
            }
            stmt.close();
            conn.close();
        } catch (Exception e){
            e.printStackTrace();
        }
    }
}
