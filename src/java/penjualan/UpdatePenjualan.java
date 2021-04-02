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
public class UpdatePenjualan {
    //variable dokumen jsp 
    public String kodeTransaksi;
    public String idPelanggan;
    public String namaSales;    
    public String idPegawai;
    public String idObat;
    public int jumlah;
    public Double harga;
    public Double total;
    public int a;
    
    //variable untuk stok obat lama
    public int stokObatLama;
    public int jumlahPenjualanLama;
    public int stokBaruObatLama;  
    public String idObatLama;
    public String cek;
    
    //variable stok
    public int stok;
    public int hasilStok;
    
    //variable untuk input ke database
    public String namaPelanggan;
    public String namaPegawai;
    public String namaObat;
    
    //variable database
    Connection conn;
    Statement stmt;
    ResultSet rs;

    
    public void run(){
        cekIdPelanggan();
        cekIdPegawai();
        cekIdObat();
        updatePenjualanPertama();
    }

    public void updatePenjualanPertama(){
        try {
            Class.forName("com.mysql.jdbc.Driver");
            conn = DriverManager.getConnection("jdbc:mysql://localhost/farmasi","root","");
            stmt = conn.createStatement();
            String sql = "UPDATE penjualan set id_pelanggan='"+idPelanggan+"', id_pegawai='"+idPegawai+"', id_obat='"+idObat+"', total="+total+" where kode_transaksi='"+kodeTransaksi+"'";
            int i = stmt.executeUpdate(sql);
            setUlangNilaiStokObatLama();
            if (i > 0) {
                updatePenjualanKedua();
            } else {
                a = 2;
            }
            stmt.close();
            conn.close();
        } catch (Exception e){
            a = 2;
        }
    }
    
    public void updatePenjualanKedua(){
        try {
            Class.forName("com.mysql.jdbc.Driver");
            conn = DriverManager.getConnection("jdbc:mysql://localhost/farmasi","root","");
            stmt = conn.createStatement();
            String sql = "UPDATE detail_penjualan set nama_pelanggan='"+namaPelanggan+"', nama_sales='"+namaSales+"', nama_pegawai='"+namaPegawai+"', nama_obat='"+namaObat+"', jumlah="+jumlah+", harga="+harga+", total="+total+" where kode_transaksi='"+kodeTransaksi+"'";
            int i = stmt.executeUpdate(sql);
            if (i > 0) {
                setUlangNilaiStokObatLama();
                cariStok();
                updateStokObat();
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
    
    public void updateStokObat(){
        try {
            Class.forName("com.mysql.jdbc.Driver");
            conn = DriverManager.getConnection("jdbc:mysql://localhost/farmasi","root","");
            stmt = conn.createStatement();
            String sql = "UPDATE obat SET stok="+hasilStok+" WHERE id_obat='"+idObat+"'";
            stmt.executeUpdate(sql);
            stmt.close();
            conn.close();
        } catch (Exception e){
            e.printStackTrace();
        }
    }
    
    public void cariStok(){
         try {
            Class.forName("com.mysql.jdbc.Driver");
            conn = DriverManager.getConnection("jdbc:mysql://localhost/farmasi","root","");
            stmt = conn.createStatement();
            String sql = "select stok from obat where id_obat='"+idObat+"'";
            rs = stmt.executeQuery(sql);
            while (rs.next()) {
                stok = Integer.parseInt(rs.getString("stok"));
            }
            hasilStok = stok - jumlah;
            stmt.close();
            conn.close();
        } catch (Exception e){
            e.printStackTrace();
        }
    }  
    
    public void cekIdObat(){
        try {
            Class.forName("com.mysql.jdbc.Driver");
            conn = DriverManager.getConnection("jdbc:mysql://localhost/farmasi","root","");
            stmt = conn.createStatement();
            String sql = "select id_obat from obat where id_obat='"+idObat+"'";
            rs = stmt.executeQuery(sql);
            if (rs.next()) {
                if (rs.getString(1) != null) {
                    setNamaObat();
                    setHarga();
                    setTotal();
                }
            }
            stmt.close();
            conn.close();
        } catch (Exception e){
            e.printStackTrace();
        }
    }
    
    public void setTotal(){
        total = harga * jumlah;
    }
    
    public void setHarga(){
         try {
            Class.forName("com.mysql.jdbc.Driver");
            conn = DriverManager.getConnection("jdbc:mysql://localhost/farmasi","root","");
            stmt = conn.createStatement();
            String sql = "select harga from obat where id_obat='"+idObat+"'";
            rs = stmt.executeQuery(sql);
            while (rs.next()) {
                harga = Double.parseDouble(rs.getString("harga"));
            }
            stmt.close();
            conn.close();
        } catch (Exception e){
            e.printStackTrace();
        }
    }
    
    public void setNamaObat(){
        try {
            Class.forName("com.mysql.jdbc.Driver");
            conn = DriverManager.getConnection("jdbc:mysql://localhost/farmasi","root","");
            stmt = conn.createStatement();
            String sql = "select nama_obat from obat where id_obat='"+idObat+"'";
            rs = stmt.executeQuery(sql);
            while (rs.next()) {
                namaObat = rs.getString("nama_obat");
            }
            stmt.close();
            conn.close();
        } catch (Exception e){
            e.printStackTrace();
        }
    }
    
    public void setNamaPegawai(){
        try {
            Class.forName("com.mysql.jdbc.Driver");
            conn = DriverManager.getConnection("jdbc:mysql://localhost/farmasi","root","");
            stmt = conn.createStatement();
            String sql = "select nama_pegawai from pegawai where id_pegawai='"+idPegawai+"'";
            rs = stmt.executeQuery(sql);
            while (rs.next()) {
                namaPegawai = rs.getString("nama_pegawai");
            }
            stmt.close();
            conn.close();
        } catch (Exception e){
            e.printStackTrace();
        }
    } 

    public void cekIdPegawai(){
        try {
            Class.forName("com.mysql.jdbc.Driver");
            conn = DriverManager.getConnection("jdbc:mysql://localhost/farmasi","root","");
            stmt = conn.createStatement();
            String sql = "select id_pegawai from pegawai where id_pegawai='"+idPegawai+"'";
            rs = stmt.executeQuery(sql);
            if (rs.next()) {
                if (rs.getString(1) != null) {
                    setNamaPegawai();
                }
            }
            stmt.close();
            conn.close();
        } catch (Exception e){
            e.printStackTrace();
        }
    }   
    
    public void setNamaPelanggan(){
        try {
            Class.forName("com.mysql.jdbc.Driver");
            conn = DriverManager.getConnection("jdbc:mysql://localhost/farmasi","root","");
            stmt = conn.createStatement();
            String sql = "select nama_pelanggan from pelanggan where id_pelanggan='"+idPelanggan+"'";
            rs = stmt.executeQuery(sql);
            while (rs.next()) {
                namaPelanggan = rs.getString("nama_pelanggan");
            }
            stmt.close();
            conn.close();
        } catch (Exception e){
            e.printStackTrace();
        }
    }
    
    public void cekIdPelanggan(){
        try {
            Class.forName("com.mysql.jdbc.Driver");
            conn = DriverManager.getConnection("jdbc:mysql://localhost/farmasi","root","");
            stmt = conn.createStatement();
            String sql = "select id_pelanggan from pelanggan where id_pelanggan='"+idPelanggan+"'";
            rs = stmt.executeQuery(sql);
            if (rs.next()) {
                if (rs.getString(1) != null) {
                    setNamaPelanggan();
                }
            }
            stmt.close();
            conn.close();
        } catch (Exception e){
            e.printStackTrace();
        }
    }
    
    //method set stok obat baru 

    public void runPertama(){
        getStokObatLama();
        getIdObatLama();
        getJumlahPenjualanLama();
        setStokBaruObatLama();
    }
    
    public void setUlangNilaiStokObatLama(){
        try {
            Class.forName("com.mysql.jdbc.Driver");
            conn = DriverManager.getConnection("jdbc:mysql://localhost/farmasi","root","");
            stmt = conn.createStatement();
            String sql = "UPDATE obat set stok="+stokBaruObatLama+" where id_obat='"+idObatLama+"'";
            cek = sql;
            stmt.execute(sql);
            stmt.close();
            conn.close();
        } catch (Exception e){
            e.printStackTrace();
        }
    }
    
    public void setStokBaruObatLama(){
        stokBaruObatLama = stokObatLama + jumlahPenjualanLama;
    }
    
    public void getJumlahPenjualanLama(){
        try {
            Class.forName("com.mysql.jdbc.Driver");
            conn = DriverManager.getConnection("jdbc:mysql://localhost/farmasi","root","");
            stmt = conn.createStatement();
            String sql = "select jumlah from detail_penjualan where kode_transaksi='"+kodeTransaksi+"'";
            rs = stmt.executeQuery(sql);
            if (rs.next()) {
                if (rs.getString(1) != null) {
                    jumlahPenjualanLama = Integer.parseInt(rs.getString(1));
                }
            }
            stmt.close();
            conn.close();
        } catch (Exception e){
            e.printStackTrace();
        }        
    }

    public void getIdObatLama(){
        try {
            Class.forName("com.mysql.jdbc.Driver");
            conn = DriverManager.getConnection("jdbc:mysql://localhost/farmasi","root","");
            stmt = conn.createStatement();
            String sql = "select id_obat from penjualan where kode_transaksi='"+kodeTransaksi+"'";
            rs = stmt.executeQuery(sql);
            if (rs.next()) {
                if (rs.getString(1) != null) {
                    idObatLama = rs.getString(1);
                }
            }
            stmt.close();
            conn.close();
        } catch (Exception e){
            e.printStackTrace();
        }        
    }
    
    public void getStokObatLama(){
        try {
            Class.forName("com.mysql.jdbc.Driver");
            conn = DriverManager.getConnection("jdbc:mysql://localhost/farmasi","root","");
            stmt = conn.createStatement();
            String sql = "select stok from penjualan INNER JOIN obat USING (id_obat) where kode_transaksi='"+kodeTransaksi+"'";
            rs = stmt.executeQuery(sql);
            if (rs.next()) {
                if (rs.getString(1) != null) {
                    stokObatLama = Integer.parseInt(rs.getString(1));
                }
            }
            stmt.close();
            conn.close();
        } catch (Exception e){
            e.printStackTrace();
        }        
    }       
}
