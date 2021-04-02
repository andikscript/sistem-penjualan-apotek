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
public class DeleteDistributor {
    //variable untuk dokumen html
    public String idDistributor;
    public int a;
    
    //varible koneksi ke database
    Connection conn;
    Statement stmt;
    ResultSet rs;
    
    public void deleteDistributor(){
        try {
            Class.forName("com.mysql.jdbc.Driver");
            conn = DriverManager.getConnection("jdbc:mysql://localhost/farmasi","root","");
            stmt = conn.createStatement();
            String sql = "DELETE FROM distributor WHERE id_distributor='"+idDistributor+"'";
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
