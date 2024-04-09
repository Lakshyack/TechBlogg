package com.tech.blog.helper;

import java.sql.Connection;
import java.sql.DriverManager;

public class ConnectionProvider {
    private static Connection con;
    public static Connection getConnection(){
        try{
            String url = "jdbc:mysql://localhost:3306/techblog";
            String user = "root";
            String password = "@Lakshya82#";
           if(con == null){
               // Driver class load

               Class.forName("com.mysql.cj.jdbc.Driver");
               //Create connection..........
               con = DriverManager.getConnection(url,user,password);

           }


        }catch (Exception e){
            e.printStackTrace();
        }
        return con;
    }
}
