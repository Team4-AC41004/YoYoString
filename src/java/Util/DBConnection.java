/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Util;

//The following code is applicable while connecting to SQL server only.
import static java.lang.System.out;

import java.sql.*;

/**
 *
 * @author Admin
 */
public class DBConnection {
    
        public static Connection createConnection() {
        Connection con = null;

        try {
            //Class.forName("com.mysql.jdbc.Driver").newInstance();
            Class.forName("com.mysql.jdbc.Driver");
            try{
                con = DriverManager.getConnection("jdbc:mysql://silva.computing.dundee.ac.uk/ip17team4db", "ip17team4", "0455.ip17t.5540");
            }
            catch(SQLException ex){
                System.out.println("Failed to create the database connection.");
            }
            
            
            //if(!con.isClosed()) out.println("Success connecting to DB.");
        } catch (ClassNotFoundException ex) {
             System.out.println("Driver not found.");
        }
        
        return con;
        
    }
    
}
