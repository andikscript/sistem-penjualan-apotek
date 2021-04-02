/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package penjualan;

import java.sql.*;
/**
 *
 * @author genz
 */
public class InsertPenjualan {
    //variable dokumen jsp
    public int a;
     
    // variable table penjualan dan detail_penjualan
    private String kodeTransaksi;
    public String idPelanggan;
    public String idPegawai;
    public String idObat;
    private String no;
    public int jumlah;
    private Double harga;
    private Double total;
    private int hitungKodeTransaksi;
    
    // variable table harga
    private String idHarga;
    private int hitungHarga;
    
    //variable penambahan stok
    public int stokLama;
    public int hasilStok;
    
    //variable untuk cek stok sebelum insert penjualan
    public int stokCek;
    public int stokLimit;
    public int stokBersih;
    public int nilaiStok;
    public int stokKurang;
    
    //variable database
    Connection conn;
    Statement stmt;
    ResultSet rs;
    
    public void run(){
        cekStokLimit();
        setNilaiStok();
        
        if (nilaiStok > 0) {
            cariHarga();
            hitungPenjualan();
            setKodeTransaksi();
            setNo();
            setTotal();
            insertPenjualan();
            a = 1;
        } else if (nilaiStok == 0) {
            cariHarga();
            hitungPenjualan();
            setKodeTransaksi();
            setNo();
            setTotal();
            insertPenjualan();
            a = 3;
        } else if (nilaiStok < 0) {
            a = 4;
        }
        
        
    }
    
    //cek stok pertama kali
    
    public void setNilaiStok(){
        stokBersih = stokCek - stokLimit;
        nilaiStok = stokBersih - jumlah;
    }
    
    public void cekStokLimit(){
         try {
            Class.forName("com.mysql.jdbc.Driver");
            conn = DriverManager.getConnection("jdbc:mysql://localhost/farmasi","root","");
            stmt = conn.createStatement();
            String sql = "select stok, stok_limit from stok where id_obat='"+idObat+"'";
            rs = stmt.executeQuery(sql);
            if (rs.next()) {
                stokCek = Integer.parseInt(rs.getString(1));
                stokLimit = Integer.parseInt(rs.getString(2));
            }
            stmt.close();
            conn.close();
        } catch (Exception e){
            e.printStackTrace();
        }
    }
    
    // update stok obat
    
    public void updateStokObat(){
        try {
            Class.forName("com.mysql.jdbc.Driver");
            conn = DriverManager.getConnection("jdbc:mysql://localhost/farmasi","root","");
            stmt = conn.createStatement();
            String sql = "UPDATE stok SET stok="+hasilStok+" WHERE id_obat='"+idObat+"'";
            stmt.executeUpdate(sql);
            stmt.close();
            conn.close();
        } catch (Exception e){
            a = 2;
            e.printStackTrace();
        }
    }
    
    public void cariStok(){
         try {
            Class.forName("com.mysql.jdbc.Driver");
            conn = DriverManager.getConnection("jdbc:mysql://localhost/farmasi","root","");
            stmt = conn.createStatement();
            String sql = "select stok from stok where id_obat='"+idObat+"'";
            rs = stmt.executeQuery(sql);
            if (rs.next()) {
                stokLama = Integer.parseInt(rs.getString(1));
            }
            hasilStok = stokLama - jumlah;
            updateStokObat();
            stmt.close();
            conn.close();
        } catch (Exception e){
            e.printStackTrace();
        }
    }   
    
    public void updateDetailPenjualan(){
        try {
            Class.forName("com.mysql.jdbc.Driver");
            conn = DriverManager.getConnection("jdbc:mysql://localhost/farmasi","root","");
            stmt = conn.createStatement();
            String sql = "UPDATE detail_penjualan SET kode_transaksi='"+kodeTransaksi+"', jumlah="+jumlah+",total="+total+" where no='"+no+"'";
            int i = stmt.executeUpdate(sql);
            cariStok();
            stmt.close();
            conn.close();
        } catch (Exception e){
            e.printStackTrace();
        }
    }
     
    
    public void insertPenjualan(){
        try {
            Class.forName("com.mysql.jdbc.Driver");
            conn = DriverManager.getConnection("jdbc:mysql://localhost/farmasi","root","");
            stmt = conn.createStatement();
            String sql1 = "INSERT INTO detail_penjualan(no) VALUES('"+no+"')";
            stmt.addBatch(sql1);
            String sql2 = "INSERT INTO penjualan(kode_transaksi,id_pelanggan,id_pegawai,id_obat,no) VALUES('"+kodeTransaksi+"','"+idPelanggan+"','"+idPegawai+"','"+idObat+"','"+no+"')";
            stmt.addBatch(sql2);
            stmt.executeBatch();
            updateDetailPenjualan();
            stmt.close();
            conn.close();
        } catch (Exception e){
            //JOptionPane.showMessageDialog(null, e.getMessage() + " insert penjualan" );
            e.printStackTrace();
        }
    }  
    
    //total
    
    public void setTotal(){
        total = harga * jumlah;
    } 
    
    // penjualan
    
    public void setNo(){
        if (hitungKodeTransaksi < 10) {
            no = "000"+String.valueOf(hitungKodeTransaksi);
        } else if (hitungKodeTransaksi < 100) {
            no = "00"+String.valueOf(hitungKodeTransaksi);
        } else if (hitungKodeTransaksi < 1000) {
            no = "0"+String.valueOf(hitungKodeTransaksi);
        } else if (hitungHarga >= 1000) {
            no = String.valueOf(hitungKodeTransaksi);
        }
    }
    
    public void setKodeTransaksi(){
        kodeTransaksi = "TJ"+hitungKodeTransaksi+idPelanggan.substring(0,4).toUpperCase()+idPegawai.substring(2,4).toUpperCase();
    }
    
    public void hitungPenjualan(){
        try {
            Class.forName("com.mysql.jdbc.Driver");
            conn = DriverManager.getConnection("jdbc:mysql://localhost/farmasi","root","");
            stmt = conn.createStatement();
            String sql = "select count(kode_transaksi) from penjualan";
            rs = stmt.executeQuery(sql);
            while (rs.next()) {
                hitungKodeTransaksi = Integer.parseInt(rs.getString("count(kode_transaksi)")) + 1;
            }
            stmt.close();
            conn.close();
        } catch (Exception e){
            //JOptionPane.showMessageDialog(null, e.getMessage() + " pembelian" );
            e.printStackTrace();
        }
    }
    
    // harga
    
    public void cariHarga(){
        try {
            Class.forName("com.mysql.jdbc.Driver");
            conn = DriverManager.getConnection("jdbc:mysql://localhost/farmasi","root","");
            stmt = conn.createStatement();
            String sql = "select harga from harga where id_obat='"+idObat+"' order by id_harga desc";
            rs = stmt.executeQuery(sql);
            for (int i = 0; i < 1; i++) {
                if (rs.next()) {
                    harga = Double.parseDouble(rs.getString("harga"));
                }
            }
            //JOptionPane.showMessageDialog(null, harga);
            stmt.close();
            conn.close();
        } catch (Exception e){
            e.printStackTrace();
        }
    }
}
