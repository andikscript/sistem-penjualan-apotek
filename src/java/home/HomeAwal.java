/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package home;

import java.sql.*;
/**
 *
 * @author genz
 */
public class HomeAwal {
    //variable dokumen jsp
    public int jumlahPenjualan;
    public int jumlahPembelian;
    public int jumlahUser;
    public int totalTransaksi;
    
    //variable database
    Connection conn;
    Statement stmt;
    ResultSet rs;

    public void run(){
        setJumlahPenjualan();
        setJumlahPembelian();
        setTotalTransaksi();
        setJumlahUser();
    }
    
    public void setTotalTransaksi(){
        this.totalTransaksi = jumlahPenjualan + jumlahPembelian;
    }
    
    public void setJumlahPenjualan(){
        try {
            Class.forName("com.mysql.jdbc.Driver");
            conn = DriverManager.getConnection("jdbc:mysql://localhost/farmasi","root","");
            stmt = conn.createStatement();
            String sql = "select count(kode_transaksi) from penjualan";
            rs = stmt.executeQuery(sql);
            while (rs.next()) {
                jumlahPenjualan = Integer.parseInt(rs.getString("count(kode_transaksi)"));
            }
            stmt.close();
            conn.close();
        } catch (Exception e){
            e.printStackTrace();
        }
    }
    
    public void setJumlahPembelian(){
        try {
            Class.forName("com.mysql.jdbc.Driver");
            conn = DriverManager.getConnection("jdbc:mysql://localhost/farmasi","root","");
            stmt = conn.createStatement();
            String sql = "select count(kode_transaksi) from pembelian";
            rs = stmt.executeQuery(sql);
            while (rs.next()) {
                jumlahPembelian = Integer.parseInt(rs.getString("count(kode_transaksi)"));
            }
            stmt.close();
            conn.close();
        } catch (Exception e){
            e.printStackTrace();
        }
    }
    
    public void setJumlahUser(){
        try {
            Class.forName("com.mysql.jdbc.Driver");
            conn = DriverManager.getConnection("jdbc:mysql://localhost/farmasi","root","");
            stmt = conn.createStatement();
            String sql = "select count(id_pegawai) from pegawai"; //pegawai nanti diubah
            rs = stmt.executeQuery(sql);
            while (rs.next()) {
                jumlahUser = Integer.parseInt(rs.getString("count(id_pegawai)"));
            }
            stmt.close();
            conn.close();
        } catch (Exception e){
            e.printStackTrace();
        }
    }
    
}
