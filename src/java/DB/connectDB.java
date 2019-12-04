/*
/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DB;

import java.sql.*;
import java.sql.DriverManager;



/**
 *
 * @author Admin
 */
public class connectDB {

    public static Connection connectDB() {
        Connection con= null;
        try{  
        Class.forName("com.mysql.jdbc.Driver");  
         con=DriverManager.getConnection( "jdbc:mysql://localhost:3306/shop","root","");
              
 
        }catch(Exception e){ System.out.println(e);}  
         
        return con;
      }
    public static void main(String[] args) {
        connectDB();
    }
}

