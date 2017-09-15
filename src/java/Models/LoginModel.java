/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Models;

//import 
import Util.DBConnection;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

/**
 *
 * @author Admin
 */
public class LoginModel {
    
    /** Verify entered Login credentials.
     * @param int userid
     * @param string password
     * @return String
     */
    public String authenticateLogin(int userid, String password) 
    {
        Connection con;
        Statement statement = null;
        ResultSet resultSet = null;

        int useridDB = 0;
        String passwordDB = "";
        boolean matched   = false;
        
        try 
        {
            con = DBConnection.createConnection();
            statement = con.createStatement();
            resultSet = statement.executeQuery("SELECT ID,Password FROM user"); 
            
            while (resultSet.next())
            {
                useridDB = resultSet.getInt("ID");
                passwordDB = resultSet.getString("Password");

                if ((userid==useridDB) && password.equals(passwordDB)) 
                {
                    matched = true;// User credential match found in DB.
                    break;
                }
            }
            
            resultSet.close();
            statement.close();
            con.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        
        if(matched == true){
            return "matched";
        }    
        else{
            return null; // Userid/Password not found/wrong.
        }       
    }
    
}
