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

import java.util.Date;
import java.text.SimpleDateFormat;
import java.util.LinkedList;
import java.util.List;
import org.json.JSONObject;

/**
 *
 * @author Admin
 */
public class AllDataModel {
    
    public List getJSONObjectList(String startdate, String enddate, String userid, String[] location) throws SQLException{
        
        Connection conn = null;
        
        try
        { 
            conn = DBConnection.createConnection();
            ResultSet resultSet = null;
            Statement statement = conn.createStatement();
            
            String delimiters = "[-: .]";
            
            List listOfJSONObjects = new LinkedList(); 
            JSONObject jsonObj = new JSONObject();
            
            
            boolean useDates = false;
            boolean useUserid = false;
            boolean useLocation = false;
            
            /////////////////////NEW///////////////////
            /*String query = "SELECT ";
            
            if (attributes[0]=="!"){
                query = query + "* ";
            }else{
                for (int i=0; i<attributes.length; i++){
                    query = query + attributes[i];
                }
            }    
            query = query + " FROM disbursals WHERE ";
            */
            /////////////////////NEW///////////////////
            
            
            
            String query="SELECT * FROM disbursals WHERE ";
            
            //"!" indicates null, since this method cannot be accessed with null values
            if (!startdate.equals("!")){
                useDates = true;
            }
            if (!userid.equals("!")){
                useUserid = true;
            }
            if (!location[0].equals("!") ){
                    useLocation = true;
            }   
            
            if (useDates && useUserid && useLocation){
                //query = "SELECT * FROM disbursals WHERE UserID='dusa-" +userid+ "' AND DateAndTime BETWEEN '" +startdate+ "' AND '" +enddate+ "' AND (OutletName ='" + location[0]+ "'";
                //query = "SELECT * FROM disbursals WHERE UserID='dusa-" +userid+ "' AND OutletName ='" + location[0];
                query = query + "UserID='dusa-" +userid+ "' AND DateAndTime BETWEEN '" +startdate+ "' AND '" +enddate+ "' AND (OutletName ='" + location[0]+ "'";

                for (int i=1; i<location.length; i++){
                 query = query + " OR OutletName ='" +location[i]+ "'";
                }
                query = query +")"; 
            }
            else if (useDates && useUserid && useLocation==false){
                //query = "SELECT * FROM disbursals WHERE UserID='dusa-" +userid+ "' AND DateAndTime BETWEEN '" +startdate+ "' AND '" +enddate+ "'";
                query =  query + "UserID='dusa-" +userid+ "' AND DateAndTime BETWEEN '" +startdate+ "' AND '" +enddate+ "'";

            }
            else if (useDates && useUserid==false && useLocation==false){
                //query = "SELECT * FROM disbursals WHERE DateAndTime BETWEEN '" +startdate+ "' AND '" +enddate+ "'";
                query =  query + "DateAndTime BETWEEN '" +startdate+ "' AND '" +enddate+ "'";

            }
            else if (useDates==false && useUserid && useLocation){
                //query = "SELECT * FROM disbursals WHERE UserID='dusa-" +userid+ "' AND (OutletName ='" +location[0]+ "'";
                query =  query + "UserID='dusa-" +userid+ "' AND (OutletName ='" +location[0]+ "'";

                for (int i=1; i<location.length; i++){
                 query = query + " OR OutletName ='" +location[i]+ "'";
                }
                query = query +")"; 
            }
            else if (useDates==false && useUserid==false && useLocation){
                //query = "SELECT * FROM disbursals WHERE (OutletName ='" +location[0]+ "'";
                query =  query + "(OutletName ='" +location[0]+ "'";

                for (int i=1; i<location.length; i++){
                 query = query + " OR OutletName ='" +location[i]+ "'";
                }
                query = query +")"; 
            }  
            else if (useDates==false && useUserid && useLocation==false){
                //query = "SELECT * FROM disbursals WHERE UserID='dusa-" +userid+ "'";
                query =  query + "UserID='dusa-" +userid+ "'";

            }
            else if (useDates==false && useUserid==false && useLocation==false){
                //query = "SELECT * FROM disbursals WHERE UserID='dusa-" +userid+ "'";
                query =  "SELECT * FROM disbursals";

            }
            else if (useDates && useUserid==false && useLocation){
                //query = "SELECT * FROM disbursals WHERE DateAndTime BETWEEN '" +startdate+ "' AND '" +enddate+ "' AND (OutletName ='" + location[0]+ "'";
                query =  query + "DateAndTime BETWEEN '" +startdate+ "' AND '" +enddate+ "' AND (OutletName ='" + location[0]+ "'";

                for (int i=1; i<location.length; i++){
                 query = query + " OR OutletName ='" +location[i]+ "'";
                }
                query = query +")"; 
            }
            
            System.out.println("query: " + query);
            resultSet = statement.executeQuery(query);
            
            while (resultSet.next())
            {
                JSONObject jsonData = new JSONObject();
                
                String dateAndTime  = resultSet.getString("DateAndTime");
                String[] parsedDateTime = dateAndTime.split(delimiters);
                
                //Dirty Hack to append date to correct month in google charts, forgive me for my sins. (ﾉಥ益ಥ）ﾉ
                int fixmonth = Integer.parseInt(parsedDateTime[1]);
                fixmonth -= 1;
                parsedDateTime[1] = ""+fixmonth;
                //////////////////////////////////////////////////////////////////////////////////////////
                
                int[] finalDateTime = new int[parsedDateTime.length];
                for (int i = 0; i < parsedDateTime.length; i++)
                { finalDateTime[i] = Integer.parseInt(parsedDateTime[i]); }
                
                //Columns
                jsonData.put("DateAndTime"  , finalDateTime);
                jsonData.put("OutletRef"    , resultSet.getInt("OutletRef"));
                jsonData.put("OutletName"   , resultSet.getString("OutletName"));
                jsonData.put("UserID"       , resultSet.getString("UserID"));
                jsonData.put("TransactionType", resultSet.getString("TransactionType"));
                jsonData.put("CashSpent"    , resultSet.getFloat("CashSpent"));
                jsonData.put("Discount"     , resultSet.getFloat("Discount")); 
                jsonData.put("Total"        , resultSet.getFloat("Total"));
                jsonData.put("TransactionID", resultSet.getInt("TransactionID"));
                
                listOfJSONObjects.add(jsonData);
            }
            
             conn.close();
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
    
    //I like this method and I don't want to remove it :D
    //
    //@ param A String filled with locations (e.g. 'Premier Shop,Mono,Air Bar')
    //@return A String array with the given locations
    /*
    public String[] processLocation(String locations){
        String[] myarray = new String[20];
        int locationCounter = 1;
        int counter=0; //where the last coma was
        
        for (int i=0; i<locations.length(); i++){
            if (locations.charAt(i)==','){
                
                locationCounter++;
                counter=i;
                
                for (int k=counter; k<=i; k++){
                    myarray[locationCounter-1] = myarray[locationCounter-1] + locations.charAt(counter+k);
                }
                
            }
        }
        
        if (locationCounter==1){
            myarray[0] = locations;
        }
        
        String[] finalArray = new String[locationCounter];
        
        for (int j=0; j<finalArray.length; j++){
            finalArray[j] =  myarray[j];
        }
        System.out.println("THIS ARRAY: " + finalArray[0]);
        
        return finalArray;
    }
*/    
    
}
