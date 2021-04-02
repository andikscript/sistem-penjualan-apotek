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
public class DeletePelanggan {
    //variable untuk dokumen jsp
    public String idPelanggan;
    public int a;
    public String pesan;
    
    //variable konek database
    Connection conn;
    Statement stmt;
    ResultSet rs;
    
    public void deletePelanggan(){
        try {
            Class.forName("com.mysql.jdbc.Driver");
            conn = DriverManager.getConnection("jdbc:mysql://localhost/farmasi","root","");
            stmt = conn.createStatement();
            String sql = "DELETE FROM pelanggan WHERE id_pelanggan='"+idPelanggan+"'";
            stmt.execute(sql);
            a = 1;
            stmt.close();
            conn.close();
        } catch (Exception e){
            a = 2;
            e.printStackTrace();
        }
    }
}
