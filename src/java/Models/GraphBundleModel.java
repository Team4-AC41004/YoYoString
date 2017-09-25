package Models;

import Util.DBConnection;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.LinkedList;
import java.util.List;
import org.json.JSONObject;

/**
 * Will make several graphs and charts in one single page. TestArea.
 * @author Philipp
 */
public class GraphBundleModel 
{
    public List getJSONObjectList() throws SQLException
    {
        Connection conn = null;
        
        try
        { 
            // Establish Database Connection via external class.
            conn = DBConnection.createConnection();
            
            ResultSet resultSet    = null;
            
            List listOfJSONObjects = new LinkedList();
            Statement statement    = conn.createStatement();
            String delimiters      = "[-: .]";
            
            // Select which Data to pull from DB and store in resultset.
            resultSet  = statement.executeQuery("SELECT * FROM test LIMIT 0,100"); // test = tablename in DB
            //resultSet2 = statement2.executeQuery("SELECT COUNT (DISTINCT UserID) FROM test WHERE test.OutletName='Library'");
            
            // SELECT COUNT(DISTINCT UserID) FROM test WHERE OutletName='Dental Café' or OutletRef=239; //=199
            //
            /*  
            SELECT COUNT (DISTINCT column-name)
            FROM table-name
            */
            while (resultSet.next())
            {
                // === Using JSONObject for Graphs/Charts ===
                // Make a new JSONObject used for Graph/Chart data.
                JSONObject jsonData = new JSONObject();
                
                // Get the data from the ResultSet and store in jsonData.
                
                // Date and Time are special and must be processed a bit.
                String dateAndTime  = resultSet.getString("DateAndTime"); //Date is stored in raw format: date = 2014-12-13 12:30.12.0
                String[] parsedDateTime = dateAndTime.split(delimiters); //Date is then parsed, storing each number as a string in the array//parseddate = [2014, 12, 10, 12, 30, 12, 0 ]    Each member is a string
                
                //Dirty Hack to append date to correct month in google charts, forgive me for my sins. (ﾉಥ益ಥ）ﾉ
                int fixmonth = Integer.parseInt(parsedDateTime[1]);
                fixmonth -= 1;
                parsedDateTime[1] = ""+fixmonth;
                
                int[] finalDateTime = new int[parsedDateTime.length];
                for (int i = 0; i < parsedDateTime.length; i++)
                { finalDateTime[i] = Integer.parseInt(parsedDateTime[i]); }//parseddate is then converted from a string into an int array so that it can be used by google charts//finaldate = [2014, 12, 10, 12, 30, 12, 0 ]    Each member is an int
                
                // Here I get every single column. You might not actually need all of them for the chart you are making.
                jsonData.put("DateAndTime"  , finalDateTime);
                jsonData.put("OutletRef"    , resultSet.getInt("OutletRef"));
                jsonData.put("OutletName"   , resultSet.getString("OutletName"));
                jsonData.put("UserID"       , resultSet.getString("UserID"));
                jsonData.put("TransactionType", resultSet.getString("TransactionType"));
                jsonData.put("CashSpent"    , resultSet.getFloat("CashSpent"));
                jsonData.put("Discount"     , resultSet.getFloat("Discount")); 
                jsonData.put("Total"        , resultSet.getFloat("Total"));
                jsonData.put("TransactionID", resultSet.getInt("TransactionID"));
                
                // Add the jsonData object to the list.
                listOfJSONObjects.add(jsonData);
                
                // Chris sticks the list into another JSONObject and then sends this via out.print
                // Check if that's needed or if that's just due to him doing it in .jsp
            }
            
            // Return the list that contains all the retrieved data. (This will be called by the Servlet).
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
    } // end getJSONObjectList()
    
    public List getUniqueCustomers() throws SQLException
    {
        Connection conn = null;
        try { 
            // Establish Database Connection via external class.
            conn = DBConnection.createConnection();
            
            List listOfJSONObjects = new LinkedList();
            Statement statement    = conn.createStatement();
            ResultSet resultSet    = statement.executeQuery("SELECT COUNT(DISTINCT UserID) FROM test"); // Total # of Yoyo customers.
            
            // Make a new JSONObject used for Graph/Chart data.
            JSONObject jsonData = new JSONObject();
            
            while (resultSet.next())
            {
                // Get the data from the ResultSet and store in jsonData.
                jsonData.put("TotalYoyoCustomers", resultSet.getInt("COUNT(DISTINCT UserID)"));
                // Add the jsonData object to the list.
                listOfJSONObjects.add(jsonData);
            }
            
            // Get all Outlet Refs.
            resultSet = statement.executeQuery("SELECT DISTINCT OutletRef FROM test");
            List listOutletRefs = new LinkedList();
            while (resultSet.next())
            {
                listOutletRefs.add(resultSet.getInt("OutletRef"));
            }
            
            // Now use the Refs to find unique #of yoyo customers for location.
            for (int i = 0; i < listOutletRefs.size(); i++)
            { 
                //System.out.println("Refs cunts: " + listOutletRefs.get(i) );
                
                // One Ref at a time.
                PreparedStatement ps = conn.prepareStatement("SELECT COUNT(DISTINCT UserID) FROM test WHERE OutletRef=?");
                ps.setObject(1, listOutletRefs.get(i) );
                resultSet = ps.executeQuery();
                while(resultSet.next())
                {
                    String key = "a" + listOutletRefs.get(i).toString();
                    jsonData.put(key, resultSet.getInt("COUNT(DISTINCT UserID)")); 
                    
                    listOfJSONObjects.add(jsonData);
                }
                // Now JSON has: [total#][a238, #num][a239, #num] etc
            } // end for loop
            
            // Return the list that contains all the retrieved data. (This will be called by the Servlet).
            return listOfJSONObjects;
        }
        catch (SQLException e) { e.printStackTrace(); }
        finally
        {
            if (conn != null && !conn.isClosed()) {
                conn.close();
            }
        }
        return null;
    }
}

// Total amount of unique Yoyo customers
// SELECT COUNT(DISTINCT UserID) FROM test

// #yoyo customers in specific outlet
// SELECT COUNT(DISTINCT UserID) FROM test WHERE OutletName='Dental Café' or OutletRef=239

// outletNames
// SELECT DISTINCT OutletName FROM test;

// outletRefs
// SELECT DISTINCT OutletRef FROM test;

// specific ref of outletname given
// SELECT DISTINCT OutletRef FROM test WHERE OutletName='Library';

// all outlets and their ref number DANGER: 239 = Dental Cafe AND Spare
// SELECT DISTINCT OutletRef, OutletName FROM test;


// 
// SELECT COUNT(DISTINCT UserID) FROM test WHERE OutletName='Dental Café' or OutletRef=239; //=199





/* 
                jsonData.put("OutletRef"    , resultSet.getInt("OutletRef"));
                jsonData.put("OutletName"   , resultSet.getString("OutletName"));
                jsonData.put("UserID"       , resultSet.getString("UserID"));
                jsonData.put("TransactionType", resultSet.getString("TransactionType"));
                jsonData.put("CashSpent"    , resultSet.getFloat("CashSpent"));
                jsonData.put("Discount"     , resultSet.getFloat("Discount")); 
                jsonData.put("Total"        , resultSet.getFloat("Total"));
                jsonData.put("TransactionID", resultSet.getInt("TransactionID"));
*/