/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Models;

import Util.DBConnection;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.*;
import java.util.ArrayList;
import java.util.*;
import org.json.JSONObject;
import Beans.testBean;

/**
 *
 * @author Philipp
 */
public class testModel {
    
    public List getJSONObjectList() throws SQLException
    {
        Connection conn = null;
        
        try
        { 
            // Establish Database Connection via external class.
            conn = DBConnection.createConnection();
            
            ResultSet resultSet = null;
            List listOfJSONObjects = new LinkedList(); // Do you need to specify type of objects in the LinkedList? Like ArrayList<myBeanNameBlabla> ?
            JSONObject jsonObj = new JSONObject();
            Statement statement = conn.createStatement();
            
            // Prepared Statement if it's "hardcoded" and can't be changed or influenced by user.
         /* String query = "SELECT * FROM databaseTableName LIMIT 0, 100;";
            PreparedStatement pstm = conn.prepareStatement(query);
            resultSet = pstm.executeQuery(); */
            
            // Select which Data to pull from DB and store in resultset.
            resultSet = statement.executeQuery("SELECT * FROM test LIMIT 0,100");
            
            while (resultSet.next())
            {
                // === Using JSONObject for Graphs/Charts ===
                // Make a new JSONObject used for Graph/Chart data.
                JSONObject jsonData = new JSONObject();
                
                // Get the data from the ResultSet and store in jsonData.
                //jsonData.put("DateAndTime", resultSet.getDate("DateAndTime"));
                jsonData.put("Date", resultSet.getDate("DateAndTime"));
                jsonData.put("Time", resultSet.getTime("DateAndTime"));
                jsonData.put("OutletRef"  , resultSet.getInt("OutletRef"));
                jsonData.put("OutletName" , resultSet.getString("OutletName"));
                jsonData.put("CashSpent"  , resultSet.getFloat("CashSpent"));
                
                // Add the jsonData object to the list.
                listOfJSONObjects.add(jsonData);
                
                
                
                // Chris sticks the list into another JSONObject and then sends this via out.print
                // Check if that's needed or if that's just due to him doing it in .jsp
            }
            
            // Return the list to be used.
            return listOfJSONObjects;
        }
        catch (SQLException e) { e.printStackTrace(); }
        finally
        {
            if (conn != null && !conn.isClosed()) {
                conn.close();
            }
            
        }
        return null; // DB Conn failed or no data found.
    }
    
    
    public ArrayList<testBean> getBeanList() throws SQLException 
    {
        Connection conn      = null;
        ResultSet resultSet  = null;
        Statement statement  = null;
        ArrayList<testBean> listOfTestBeans = new ArrayList<>();

        try 
        {
            conn      = DBConnection.createConnection();
            statement = conn.createStatement();
            resultSet = statement.executeQuery("SELECT * FROM test LIMIT 0,100");

            while ( resultSet.next() ) 
            {
                // 1 resultSet is basically one row when you select *
                // Make a new Bean Object which will store our data.
                testBean testBeanObj = new testBean();
                
                // Store the Data from the ResultSet in the Bean object.
                testBeanObj.setDateAndTime(resultSet.getDate("DateAndTime"));
                testBeanObj.setOutletName (resultSet.getString("OutletName"));
                testBeanObj.setOutletRef  (resultSet.getInt("OutletRef"));
                testBeanObj.setCashSpent  (resultSet.getFloat("CashSpent"));
                
                // Add the Bean object to the list.
                listOfTestBeans.add(testBeanObj);
            }
            
            conn.close();
            return listOfTestBeans;
        } catch (SQLException e) {
            e.printStackTrace();
        } finally { //finally runs before a return in the try block
            if (conn != null && !conn.isClosed()) {
                conn.close();
            }
        }
        
        return null; // DB Conn failed or no data found.
    }
    
    
}


                // === Using a selfmade Bean ===
                // Make a new Bean Object which will hold this row of data.
                //testBean testBeanObj = new testBean();
                
                // Store the data of the ResultSet in the Bean.
                //testBeanObj.setDateAndTime( resultSet.getDate("DateAndTime") );
                //testBeanObj.setOutletRef(
                //testBeanObj.setOutletName(
                //testBeanObj.setCashSpent(
                
                // Add Bean to the list.
                //listOfBeans.add(testBeanObj);