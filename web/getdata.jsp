<%@page import="java.sql.*" %>
<%@page import="java.util.*" %>
<%@page import="org.json.JSONObject" %>

<%
    Connection con = null;
    try {
        Class.forName("com.mysql.jdbc.Driver").newInstance();
        con = DriverManager.getConnection("jdbc:mysql://silva.computing.dundee.ac.uk/ip17team4db", "ip17team4", "0455.ip17t.5540");

        ResultSet rs = null;
        List empdetails = new LinkedList();
        JSONObject responseObj = new JSONObject();

        String query = "SELECT * FROM test LIMIT 0, 500;";
        PreparedStatement pstm = con.prepareStatement(query);

        rs = pstm.executeQuery();
        JSONObject empObj = null;
        String delims = "[-: .]";

        while (rs.next()) {
            int transactionid = rs.getInt("TransactionID");
            String date = rs.getString("DateAndTime");
            //Date is stored in raw format
            //date = 2014-12-10 12:30.12.0
            String[] parseddate = date.split(delims);
            //Date is then parsed, storing each number as a string in the array
            //parseddate = [2014, 12, 10, 12, 30, 12, 0 ]    Each member is a string
            int[] finaldate = new int[parseddate.length];
            for (int i=0; i < parseddate.length; i++) {
                finaldate[i] = Integer.parseInt(parseddate[i]);
            }
            //parseddate is then converted from a string into an int array so that it can be used by google charts
            //finaldate = [2014, 12, 10, 12, 30, 12, 0 ]    Each member is an int
            int id = rs.getInt("OutletRef");
            String name = rs.getString("OutletName");
            String userid = rs.getString("UserID");
            String transtype = rs.getString("TransactionType");
            float cashspent = rs.getFloat("CashSpent");
            
            empObj = new JSONObject();
            empObj.put("TransactionID", transactionid);

            empObj.put("DateAndTime", finaldate);
            
            empObj.put("UserID", userid);
            
            empObj.put("CashSpent", cashspent);

            empdetails.add(empObj);
        }
        responseObj.put("empdetails", empdetails);
        out.print(responseObj.toString());
    } catch (Exception e) {
        e.printStackTrace();
    } finally {
        if (con != null) {
            try {
                con.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
    }
%>