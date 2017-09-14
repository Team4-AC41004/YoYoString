  <%@page import="Util.DBConnection"%>
<%@page import="java.sql.*" %>
  <%@page import="java.util.*" %>
  <%@page import="org.json.JSONObject" %>

<%
    Connection conn= null;
 try{
     //establish connection to SQL database
    conn = DBConnection.createConnection();

    //create empty varaiables
    ResultSet rs = null;
    List yoyodetails = new LinkedList();
    JSONObject responseObj = new JSONObject();

    //create and execute SQL query
    String query = "SELECT UserID from test";
    PreparedStatement pstm= conn.prepareStatement(query);
    rs = pstm.executeQuery();
    
    //create object to hold record
    JSONObject yoyoObj = null;

    //iterate through database till it reaches the end
    while (rs.next()) {
        String userid = rs.getString("UserID");
        yoyoObj = new JSONObject();
        yoyoObj.put("UserID", userid);
        yoyodetails.add(yoyoObj);
        }
        responseObj.put("yoyodetails", yoyodetails);
    out.print(responseObj.toString());
    }
    catch(Exception e){
        e.printStackTrace();
    //close connection
    }finally{
        if(conn!= null){
            try{
            conn.close();
            }catch(Exception e){
                e.printStackTrace();
            }
        }
    }
 %>
  
