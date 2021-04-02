/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package pembelian;

import java.sql.*;
/**
 *
 * @author genz
 */
public class DeletePembelian {
    //variable dokumen jsp 
    public int a;
    
    //variable tabel stok
    public String idObat;
    private int stokLama;
    private int stokBaru;
    public int jumlahPembelian;
    
    //variable hapus
    public String kodeTransaksi;
    
    //variable database
    Connection conn;
    Statement stmt;
    ResultSet rs;
    
    public void run(){
        getStokLama();
        setStokBaru();
        deletePembelian();
    }

    public void deletePembelian(){
        try {
            Class.forName("com.mysql.jdbc.Driver");
            conn = DriverManager.getConnection("jdbc:mysql://localhost/farmasi","root","");
            stmt = conn.createStatement();
            String sql = "DELETE FROM pembelian where kode_transaksi='"+kodeTransaksi+"'";
            stmt.execute(sql);
            updateStokBaru();
            a = 1;
            stmt.close();
            conn.close();
        } catch (Exception e){
            a = 2;
            e.printStackTrace();
        }
    }
    
    public void updateStokBaru(){
        try {
            Class.forName("com.mysql.jdbc.Driver");
            conn = DriverManager.getConnection("jdbc:mysql://localhost/farmasi","root","");
            stmt = conn.createStatement();
            String sql = "UPDATE stok set stok="+stokBaru+" where id_obat='"+idObat+"'";
            stmt.execute(sql);
            stmt.close();
            conn.close();
        } catch (Exception e){
            e.printStackTrace();
        }
    }
    
    public void setStokBaru(){
        if (String.valueOf(jumlahPembelian) == null) {
            jumlahPembelian = 0;
            stokBaru = stokLama - jumlahPembelian;
        } else {
            stokBaru = stokLama - jumlahPembelian;
        }        
    }
    
    public void getStokLama(){
        try {
            Class.forName("com.mysql.jdbc.Driver");
            conn = DriverManager.getConnection("jdbc:mysql://localhost/farmasi","root","");
            stmt = conn.createStatement();
            String sql = "select stok from stok where id_obat='"+idObat+"'";
            rs = stmt.executeQuery(sql);
            if (rs.next()) {
                if (rs.getString(1) != null) {
                    stokLama = Integer.parseInt(rs.getString(1));
                }
            }
            stmt.close();
            conn.close();
        } catch (Exception e){
            e.printStackTrace();
        }        
    }
}
