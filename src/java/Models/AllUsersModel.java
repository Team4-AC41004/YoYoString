package Models;

import Beans.LoggedIn;

import Util.DBConnection;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

/**
 *
 * @author Sophia
 */
public class AllUsersModel {
    
    public boolean createUser (int userid, String password, int isadmin, int outletref) 
    {
        Connection con;
        Statement statement = null;

        try 
        {
            con = DBConnection.createConnection();
            statement = con.createStatement();

            String query = "INSERT INTO users " + "VALUES ('"+userid+"',"+password+","+isadmin+","+outletref+")";

            statement.executeUpdate(query);

            statement.close();
            con.close();

            return true;
        } catch (SQLException e) {
            System.out.println("Error Executing Query");
            e.printStackTrace();
            return false;
        }
    }

    public LoggedIn[] viewUsers(){

        Connection con;
        Statement statement = null;
        ResultSet resultSet = null;

        LoggedIn[] users = new LoggedIn[30];

        try 
        {
            con = DBConnection.createConnection();
            statement = con.createStatement();
            resultSet = statement.executeQuery ("SELECT * FROM users");

            int counter = 0;

            while (resultSet.next())
            {
                LoggedIn user = new LoggedIn();
                user.setUserid(resultSet.getInt("Userid"));
                user.setIsAdmin(resultSet.getInt("IsAdmin"));
                user.setOutletRef(resultSet.getInt("OutletRef"));
                users[counter]=user;
                counter++;
            }

            LoggedIn[] usersSized = new LoggedIn[counter];

            for (int i=0; i<counter; i++){
                    usersSized[i] = users[i];
            }

            resultSet.close();
            statement.close();
            con.close();

            return usersSized;

        } catch (SQLException e) {
            e.printStackTrace();
            return null;
        }
    }

    public boolean editUser(int userid, String password, int isadmin, int outletref){

        Connection con;
        Statement statement = null;

        try 
        {
            con = DBConnection.createConnection();
            statement = con.createStatement();
            String query;
            if (password!=null){
                query = "UPDATE users " + "SET Userid="+userid+", Password='"+password+"', IsAdmin="+isadmin+", OutletRef ="+outletref+" WHERE Userid ="+userid;
            }else{
                query = "UPDATE users " + "SET Userid="+userid+", IsAdmin="+isadmin+", OutletRef ="+outletref+" WHERE Userid ="+userid;
            }

            statement.executeUpdate(query);

            statement.close();
            con.close();

            return true;
        } catch (SQLException e) {
            System.out.println("Error Executing Query");
            e.printStackTrace();
            return false;
        }
    }

    public boolean deleteUser(int userid){

        Connection con;
        Statement statement = null;

        try 
        {
            con = DBConnection.createConnection();
            statement = con.createStatement();
            String query = "DELETE from users WHERE Userid ="+userid;

            statement.executeUpdate(query);

            statement.close();
            con.close();

            return true;
        } catch (SQLException e) {
            System.out.println("Error Executing Deleting User.");
            e.printStackTrace();
            return false;
        }
    }
}
