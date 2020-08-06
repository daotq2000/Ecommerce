/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.Statement;

/**
 *
 * @author Administrator
 */
public class ketnoi1 {
    public static Connection connetion(){
    
        try {
          Connection ketnoi = null;
        String url = "jdbc:sqlserver://Localhost:1433;databaseName=MyWebsite";
        String user ="sa";
        String Password ="sa";
                Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
             ketnoi = DriverManager.getConnection(url, user, Password);
             return ketnoi;
             
             
  
}catch(Exception e){
            System.out.println(e);
}
        return connetion();
}
}
