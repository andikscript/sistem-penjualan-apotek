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
public class UpdatePelanggan {
    //variable untuk dokumen jsp
    public String idPelanggan;
    public String namaPelanggan;
    public String alamat;
    public String noHp;
    public String email;
    public int a;
    
    //variable konek database
    Connection conn;
    Statement stmt;
    ResultSet rs;
    
    public void updatePelanggan(){
        try {
            Class.forName("com.mysql.jdbc.Driver");
            conn = DriverManager.getConnection("jdbc:mysql://localhost/farmasi","root","");
            stmt = conn.createStatement();
            String sql = "UPDATE pelanggan SET nama_pelanggan='"+namaPelanggan+"', alamat='"+alamat+"', no_hp='"+noHp+"', email='"+email+"' WHERE id_pelanggan='"+idPelanggan+"'";
            int i = stmt.executeUpdate(sql);
            if (i > 0) {
                a = 1;
            } else {
                a = 2;
            }
            stmt.close();
            conn.close();
        } catch (Exception e){
            e.printStackTrace();
        }
    }
}
