<%-- 
    Document   : stats
    Created on : 14-Sep-2017, 13:31:16
    Author     : Think
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<%@ page import="java.sql.*" %>

<html>
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <meta name="description" content="Landing Page for YoYoStat">
        <meta name="author" content="cjgsdundee">

        <title>Cover Template for Bootstrap</title>

        <!-- Bootstrap core CSS -->
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/css/bootstrap.min.css" integrity="sha384-/Y6pD6FV/Vv2HJnA6t+vslU6fwYXjCFtcEpHbNJ0lyAFsXTsjBbfaDjzALeQsN6M" crossorigin="anonymous">
    </head>
<body>
<div id="content">


    <p>Displaying table contents: </p>

    <table class="table table-striped">
        <thead class="thead-inverse">
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
                int count = 100;
                int inc = 0;
                while(rs.next() && inc < count){
            %>
            <tr>
                <%
                    Date date = rs.getDate("DateAndTime");
                    int id = rs.getInt("OutletRef");
                    String name = rs.getString("OutletName");
                    String userid = rs.getString("UserID");
                    String transtype = rs.getString("TransactionType");
                    float cashspent = rs.getFloat("CashSpent");
                    inc += 1;
                %>
               
                <th scope="row"><%=date%></th>
                <th><%=id %></th>
                <th><%=name %></th>
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
