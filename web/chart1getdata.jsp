<%-- 
    Document   : chart1getdata
    Created on : 20-Sep-2017, 16:06:38
    Author     : Philipp
--%>

<%@page import="java.sql.*" %>
<%@page import="java.util.*" %>
<%@page import="org.json.JSONObject" %>

<%
    Connection connection = null;
    try 
    {
        // Connect to Database.
        Class.forName("com.mysql.jdbc.Driver").newInstance();
        connection = DriverManager.getConnection("jdbc:mysql://silva.computing.dundee.ac.uk/ip17team4db", "ip17team4", "0455.ip17t.5540");

        // Variables we will use to store data we retrieve from the DB.
        ResultSet resultSet    = null;
        List linkedListThatHoldsJSONObjs    = new LinkedList();
        JSONObject responseObj = new JSONObject();
        JSONObject jsonObj     = null;

        // Get stuff from the Database.
        String sqlQuery = "SELECT * FROM test"; // LIMIT 0, 100;
        PreparedStatement pstm = connection.prepareStatement(sqlQuery);
        resultSet = pstm.executeQuery();
        
        // Iterate over retrieved data.
        while (resultSet.next()) 
        {
            // 1 resultSet is basically one row in the DB table.
            
            // Read the data from the ResultSet and save it in the JSONObject.
            jsonObj = new JSONObject();
            jsonObj.put("DateAndTime", resultSet.getString("DateAndTime"));
            jsonObj.put("OutletRef", resultSet.getInt("OutletRef"));
            jsonObj.put("OutletName", resultSet.getString("OutletName"));
            jsonObj.put("CashSpent", resultSet.getFloat("CashSpent"));
            
            linkedListThatHoldsJSONObjs.add(jsonObj);            
        }
        // Store the List in a JSONObject, turn it into a String and then print it for the other .jsp page to retrieve.
        responseObj.put("linkedListThatHoldsJSONObjs", linkedListThatHoldsJSONObjs);
        out.print(responseObj.toString());
    } 
    catch (Exception e) { e.printStackTrace(); } 
    finally 
    {
        if (connection != null) 
        {
            try { connection.close(); } 
            catch (Exception e) { e.printStackTrace(); }
        }
    }
%>
