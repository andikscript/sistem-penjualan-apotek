/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package pembelian;

import java.sql.*;
import javax.swing.JOptionPane;
/**
 *
 * @author genz
 */
public class InsertPembelian {
    //variable dokumen jsp
    public int a;
     
    // variable table pembelian dan detail_pembelian
    private String kodeTransaksi;
    public String idDistributor;
    public String idPegawai;
    public String idObat;
    public String no;
    public int jumlah;
    public Double hargaPembelian;
    public Double harga;
    public Double total;
    private int hitungKodeTransaksi;
    
    // variable table harga
    private String idHarga;
    private int hitungHarga;
    
    //variable penambahan stok
    public int stokLama;
    public int hasilStok;
    
    //variable database
    Connection conn;
    Statement stmt;
    ResultSet rs;
    
    public void run(){
        hitungHarga();
        setIdHarga();
        setHarga();
        hitungPembelian();
        setKodeTransaksi();
        setNo();
        setTotal();
        insertPembelian();
    }
    
    // update stok obat
    
    public void updateStokObat(){
        try {
            Class.forName("com.mysql.jdbc.Driver");
            conn = DriverManager.getConnection("jdbc:mysql://localhost/farmasi","root","");
            stmt = conn.createStatement();
            String sql = "UPDATE stok SET stok="+hasilStok+" WHERE id_obat='"+idObat+"'";
            stmt.executeUpdate(sql);
            a = 1;
            insertHarga();
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
            hasilStok = stokLama + jumlah;
            a = 1;
            updateStokObat();
            stmt.close();
            conn.close();
        } catch (Exception e){
            a = 2;
            e.printStackTrace();
        }
    }   
    
    public void updateDetailPembelian(){
        try {
            Class.forName("com.mysql.jdbc.Driver");
            conn = DriverManager.getConnection("jdbc:mysql://localhost/farmasi","root","");
            stmt = conn.createStatement();
            String sql = "UPDATE detail_pembelian SET kode_transaksi='"+kodeTransaksi+"', jumlah="+jumlah+",total="+total+" where no='"+no+"'";
            int i = stmt.executeUpdate(sql);
            a = 1;
            cariStok();
            stmt.close();
            conn.close();
        } catch (Exception e){
            a = 2;
            //JOptionPane.showMessageDialog(null, e.getMessage() + " update detail pembelian" );
            e.printStackTrace();
        }
    }
     
    
    public void insertPembelian(){
        try {
            Class.forName("com.mysql.jdbc.Driver");
            conn = DriverManager.getConnection("jdbc:mysql://localhost/farmasi","root","");
            stmt = conn.createStatement();
            String sql1 = "INSERT INTO detail_pembelian(no) VALUES('"+no+"')";
            stmt.addBatch(sql1);
            String sql2 = "INSERT INTO pembelian(kode_transaksi,id_distributor,id_pegawai,id_obat,no) VALUES('"+kodeTransaksi+"','"+idDistributor+"','"+idPegawai+"','"+idObat+"','"+no+"')";
            stmt.addBatch(sql2);
            stmt.executeBatch();
            a = 1;
            updateDetailPembelian();
            stmt.close();
            conn.close();
        } catch (Exception e){
            a = 2;
            //JOptionPane.showMessageDialog(null, e.getMessage() + " insert pembelian" );
            e.printStackTrace();
        }
    }  
    
    //total
    
    public void setTotal(){
        total = hargaPembelian * jumlah;
    } 
    
    // pembelian
    
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
        kodeTransaksi = "TB"+hitungKodeTransaksi+idDistributor.substring(0,4).toUpperCase()+idPegawai.substring(2,4).toUpperCase();
    }
    
    public void hitungPembelian(){
        try {
            Class.forName("com.mysql.jdbc.Driver");
            conn = DriverManager.getConnection("jdbc:mysql://localhost/farmasi","root","");
            stmt = conn.createStatement();
            String sql = "select count(kode_transaksi) from pembelian";
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
    
    //ini masih dalam proses pertimbangan
    public void updateHarga(){
        try {
            Class.forName("com.mysql.jdbc.Driver");
            conn = DriverManager.getConnection("jdbc:mysql://localhost/farmasi","root","");
            stmt = conn.createStatement();
            String sql = "UPDATE harga SET harga="+harga+" WHERE kode_transaksi='"+kodeTransaksi+"'";
            stmt.executeUpdate(sql);
            a = 1;
            stmt.close();
            conn.close();
        } catch (Exception e){
            a = 2;
            //JOptionPane.showMessageDialog(null, e.getMessage() + " update harga");
            e.printStackTrace();
        }
    }
    
    public void insertHarga(){
        try {
            Class.forName("com.mysql.jdbc.Driver");
            conn = DriverManager.getConnection("jdbc:mysql://localhost/farmasi","root","");
            stmt = conn.createStatement();
            String sql = "INSERT INTO harga(id_harga,id_obat,harga,kode_transaksi) VALUES('"+idHarga+"','"+idObat+"',"+harga+",'"+kodeTransaksi+"')";
            stmt.execute(sql);
            a = 1;
            stmt.close();
            conn.close();
        } catch (Exception e){
            a = 2;
            //JOptionPane.showMessageDialog(null, e.getMessage() + " insert harga" );
            e.printStackTrace();
        }
    }
    
    public void setHarga(){
        harga = hargaPembelian + (hargaPembelian * 10 /100) + (hargaPembelian * 15 / 100);
    }
    
    public void setIdHarga(){
        if (hitungHarga < 10) {
            idHarga = "HB000"+String.valueOf(hitungHarga)+idObat.substring(6,8).toUpperCase();
        } else if (hitungHarga < 100) {
            idHarga = "HB00"+String.valueOf(hitungHarga)+idObat.substring(6,8).toUpperCase();
        } else if (hitungHarga < 1000) {
            idHarga = "HB0"+String.valueOf(hitungHarga)+idObat.substring(6,8).toUpperCase();
        } else if (hitungHarga >= 1000) {
            idHarga = "HB"+String.valueOf(hitungHarga)+idObat.substring(6,8).toUpperCase();
        }
    }
    
    public void hitungHarga(){
        try {
            Class.forName("com.mysql.jdbc.Driver");
            conn = DriverManager.getConnection("jdbc:mysql://localhost/farmasi","root","");
            stmt = conn.createStatement();
            String sql = "select count(id_harga) from harga";
            rs = stmt.executeQuery(sql);
            while (rs.next()) {
                hitungHarga = Integer.parseInt(rs.getString("count(id_harga)")) + 1;
            }
            stmt.close();
            conn.close();
        } catch (Exception e){
            e.printStackTrace();
        }
    }
}
