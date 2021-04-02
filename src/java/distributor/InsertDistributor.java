/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package distributor;

import java.sql.*;
/**
 *
 * @author genz
 */
public class InsertDistributor {
    //variable untuk dokumen jsp
    public String idDistributor;
    public String namaDistributor;
    public String alamat;
    public String noHp;
    public String email;
    public int a;
    
    //varible koneksi ke database
    Connection conn;
    Statement stmt;
    ResultSet rs;
    
    public void run(){
        setIdDistributor();
        insertProdusen();
    }
    
    public void insertProdusen(){
        try {
            Class.forName("com.mysql.jdbc.Driver");
            conn = DriverManager.getConnection("jdbc:mysql://localhost/farmasi","root","");
            stmt = conn.createStatement();
            String sql = "INSERT INTO distributor(id_distributor,nama_distributor,alamat,no_hp,email) VALUES('"+idDistributor+"','"+namaDistributor+"','"+alamat+"','"+noHp+"','"+email+"')";
            stmt.execute(sql);
            a = 1;
            stmt.close();
            conn.close();
        } catch (Exception e){
            a = 2;
        }
    }
    
    public void setIdDistributor(){
        this.idDistributor = "D"+namaDistributor.substring(3, 6).toUpperCase()+noHp.substring(7,9) + email.toUpperCase().substring(0, 2);
    }
    
}
