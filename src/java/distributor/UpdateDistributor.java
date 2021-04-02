/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package distributor;

import java.sql.*;
import javax.swing.JOptionPane;

/**
 *
 * @author genz
 */
public class UpdateDistributor {
    //variable untuk dokumen html
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
    
    public void updateDistributor(){
        try {
            Class.forName("com.mysql.jdbc.Driver");
            conn = DriverManager.getConnection("jdbc:mysql://localhost/farmasi","root","");
            stmt = conn.createStatement();
            String sql = "UPDATE distributor SET nama_distributor='"+namaDistributor+"', alamat='"+alamat+"', no_hp='"+noHp+"', email='"+email+"' WHERE id_distributor='"+idDistributor+"'";
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
