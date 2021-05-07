
package Modelo;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;

public class Conexion {
    public static Statement st=null;
    public static ResultSet rt=null;
    public static Connection conec=null;
    
    public static Connection conectar (){
        
        Connection cn = null;
        try{
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver").newInstance();
            cn = DriverManager.getConnection("jdbc:sqlserver://localhost:1433;databaseName=AlecomDb;user=sa;password=sasa;");
            
        }catch(Exception e){
            System.out.println("Error al conectar:" + e);
            return (cn);
        }
 
         return (cn);
    }
}
