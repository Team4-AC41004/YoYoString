/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Models;

import Beans.User;
import Util.DBConnection;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author petersallai
 */
public class UserDAO {
    
    public UserDAO ()
    {
    }
    
    public List<User> selectAllUsers()
    {
        User user = null;
        List<User> list = new ArrayList<User>();
        
        try 
        {
            Connection con = DBConnection.createConnection();
            String query = "SELECT * FROM users ORDER BY UserId asc;";
            PreparedStatement ps = con.prepareStatement(query);
            ResultSet rs = ps.executeQuery();
            
            while (rs.next())
            {
                user = new User();
                user.setUserid(rs.getString("Userid"));
                user.setPassword(rs.getString("Password"));
                user.setIsadmin(rs.getInt("IsAdmin"));
            }
        }
        catch (Exception e) 
        {
            System.err.println("Exception: " + e.getMessage());
        }
        return list;
    }
    
    public void addUser(User person)
    {
        try 
        {
            Connection con = DBConnection.createConnection();
            String query = "INSERT INTO users (Password, IsAdmin) VALUES (?, ?);";
        
            PreparedStatement ps = con.prepareStatement(query);
            ps.setString(1, person.getPassword());
            ps.setInt(2, person.getIsadmin());
            
            ps.execute();

            con.close();
        } 
        catch (Exception e) 
        {
            e.printStackTrace();
        }
    }
    
    public void deleteUser(int userId)
    {
        try 
        {
            Connection con = DBConnection.createConnection();
            String query = "DELETE FROM users WHERE Userid = ?;";
        
            PreparedStatement ps = con.prepareStatement(query);
            ps.setInt(1, userId);
            
            ps.execute();

            con.close();
        } 
        catch (Exception e) 
        {
            System.err.println("Exception: " + e.getMessage());
        }
    }
    
    public void updateUser(User person)
    {
        try 
        {
            Connection con = DBConnection.createConnection();
            String query = "UPDATE users SET Password = ?, IsAdmin = ? WHERE Userid = ?;";
        
            PreparedStatement ps = con.prepareStatement(query);
            ps.setString(1, person.getPassword());
            ps.setInt(2, person.getIsadmin());
            ps.setString(3, person.getUserid());
            
            ps.execute();

            con.close();
        } 
        catch (Exception e) 
        {
            System.err.println("Exception: " + e.getMessage());
        }
    }
    
    public User getUserByID(int userId)
    {
        User user = new User();
        
        try
        {
            Connection con = DBConnection.createConnection();
            
            String query = "SELECT * FROM users WHERE Userid = ?;";
            PreparedStatement ps = con.prepareStatement(query);
            ps.setInt(1, userId);
            
            ResultSet rs = ps.executeQuery();
            
            if (rs.next())
            {
                user.setUserid(rs.getString("Userid"));
                user.setPassword(rs.getString("Password"));
                user.setIsadmin(rs.getInt("IsAdmin"));
            }
        }
        catch (Exception e)
        {
            System.out.println("Exception: " + e.getMessage());
        }
        
        return user;
    }
}
