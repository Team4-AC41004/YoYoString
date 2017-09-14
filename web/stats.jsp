<%-- 
    Document   : stats
    Created on : 14-Sep-2017, 13:31:16
    Author     : Think
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<%@ page import="java.sql.*" %>

<html>
<body>
<div id="content">


    <p>Displaying table contents: </p>

    <table border="0" cellpadding="10">
        <thead>
            <tr>
                <th>Id</th>
                <th>Name</th>
                <th>Company</th>
                <th>Salary</th>
            </tr>
        </thead>
        <tbody>


            <%
                Class.forName("com.mysql.jdbc.Driver");
                Connection conn = null;
                conn = DriverManager.getConnection("jdbc:mysql://silva.computing.dundee.ac.uk/ip17team4db", "ip17team4", "0455.ip17t.5540");
                Statement stmt = null;
                stmt = conn.createStatement();
                String query = "select * from test";
                ResultSet rs = null;
                rs = stmt.executeQuery(query);
                while(rs.next()){
            %>
            <tr>
                <%
                    String name = rs.getString("OutletName");
                    String userid = rs.getString("UserID");
                    String transtype = rs.getString("TransactionType");
                    Integer cashspent = rs.getInt("CashSpent");
                %>
               
                <td><%=name %></td>
                <td><%=userid %></td>
                <td><%=transtype %></td>
                <td><%=cashspent %></td>
            </tr>               

            <%      
                }
            %>

        </tbody>
    </table>
</div>
</body>
</html>
