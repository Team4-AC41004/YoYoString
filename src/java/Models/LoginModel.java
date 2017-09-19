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
    public Object[] authenticateLogin(int userid, String password) 
    {
        Connection con;
        Statement statement = null;
        ResultSet resultSet = null;

        int useridDB = 0;
        String passwordDB = "";
        boolean matched   = false;
        Object[] userdata = new Object[2];
        
        try 
        {
            con = DBConnection.createConnection();
            statement = con.createStatement();
            //resultSet = statement.executeQuery("SELECT Userid, Password FROM users"); 
            resultSet = statement.executeQuery ("SELECT * FROM users WHERE Userid =" +userid);
            //resultSet = statement.executeQuery("SELECT * FROM users");
            
            while (resultSet.next())
            {
                useridDB = resultSet.getInt("Userid");
                passwordDB = resultSet.getString("Password");

                if ((userid==useridDB) && password.equals(passwordDB)) 
                {
                    matched = true;// User credential match found in DB.
                    
                    userdata[0]= resultSet.getInt("OutletRef");                 
                    userdata[1]= resultSet.getInt("IsAdmin");
                    
                    break;
                }
            }
            
            resultSet.close();
            statement.close();
            con.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        
        if(matched){
            return userdata;
        }    
        else{
            return null; // Userid/Password not found/wrong.
        }       
    }
    
}
