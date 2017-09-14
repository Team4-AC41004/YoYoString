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
            Class.forName("com.mysql.jdbc.Driver").newInstance();

            con = DriverManager.getConnection("jdbc:mysql:\\silva.computing.dundee.ac.uk\\webapps\\2017-indteam4", "ip17team4", "0455.ip17t.5540");
            if(!con.isClosed()) out.println("Success");
        } catch (Exception e) {
            System.out.println(e);
        }
        return con;
    }
    
}
