package DAO;

import java.sql.*;

public class ConnectDatabase 
{
    //connect Somee
     private static Connection con = null;
     private static String url = "jdbc:sqlserver://";
     private static String serverName= "assignment.mssql.somee.com";
     private static String portNumber = "1433";
     private static String databaseName= "assignment";
    //
     
     public ConnectDatabase()
     {}
     
     public static String getConnectionUrl()
     {
         return url + serverName + ":" + portNumber + "; databaseName=" + databaseName ;
     }

     public static Connection getConnection()
     {
          try
          {
               Class.forName("com.mysql.jdbc.Driver"); 
               //con = DriverManager.getConnection(getConnectionUrl(),"thanhbinh","Teebeizngo14121997");
               con = DriverManager.getConnection("jdbc:mysql://node180774-thanhbinh.jelastic.servint.net/shop_shoes","root","GQAqrf19680");
               System.out.print("Connect Complete");
          }
          catch(Exception e)
          {
              con = null;
          }
          return con;
      }

     public static void closeConnection()
     {
          try
          {
               if(con!=null)
                    con.close();
               con=null;
          }
          catch(Exception e)
          {
               e.printStackTrace();
          }
     }
    
}
