package Models;

import Util.DBConnection;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.*;
import org.json.JSONObject;
import Beans.PremierPatriotsBean;
import sun.rmi.runtime.Log;

/**
 *
 * @author Chris
 */
public class PremierPatriotsModel {
    
    public List getJSONObjectList() throws SQLException
    {
        Connection conn = null;
        
        try
        { 
            // Establish Database Connection via external class.
            conn = DBConnection.createConnection();
            
            ResultSet resultSet = null;
            List listOfJSONObjects = new LinkedList();
            Statement statement = conn.createStatement();
            String delimiters = "[-: .]";
            
            // Select which Data to pull from DB and store in resultset.
            resultSet = statement.executeQuery("SELECT * FROM premierpatriots GROUP BY UserID;");
            //resultSet = statement.executeQuery("SELECT * FROM test LIMIT 0, 100;");

            while (resultSet.next())
            {
                // === Using JSONObject for Graphs/Charts ===
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
    }
}