/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package obat;

import java.sql.*;
/**
 *
 * @author genz
 */
public class DeleteObat {
    //variable untuk dokumen jsp
    public String idObat;
    public int a;
    //variable konek database
    Connection conn;
    Statement stmt;
    ResultSet rs;

    public void deleteObat(){
        try {
            Class.forName("com.mysql.jdbc.Driver");
            conn = DriverManager.getConnection("jdbc:mysql://localhost/farmasi","root","");
            stmt = conn.createStatement();
            String sql = "DELETE FROM obat WHERE id_obat='"+idObat+"'";
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
