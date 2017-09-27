<%-- 
    Document   : customerinfo
    Created on : 26-Sep-2017, 10:08:44
    Author     : Think
--%>

<%@page import="Util.DBConnection"%>
<%@page import="com.mysql.jdbc.log.Log"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>


<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/css/bootstrap.min.css" integrity="sha384-/Y6pD6FV/Vv2HJnA6t+vslU6fwYXjCFtcEpHbNJ0lyAFsXTsjBbfaDjzALeQsN6M" crossorigin="anonymous">
        <title>Customer Info</title>
        <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
        <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
        <link rel="stylesheet" href="css/index.css"/>

    </head>
    <body>
        <%@ include file="navbar.jsp"%>
        <% String ID = request.getParameter("id");%>

        <div class="container" style="margin-top: 2.5%;">
            <div class="row">
                <div class="col">
                    <h1 class="display-4">Viewing Details for User <%=ID%>:</h1>

                </div>
            </div>
            <div class="row">
                <div class="col">
                    <h2> Member of Tribes: </h2> 
                    <hr class="my-2"/>
                </div>
            </div>
            <div class="row">
                <%
                    Connection conn = null;
                    conn = DBConnection.createConnection();
                    Statement stmt = null;
                    stmt = conn.createStatement();
                    String query = "select UserID from nightowls WHERE UserID='" + ID + "';";
                    ResultSet rs = null;
                    System.out.println("Query created.");
                    rs = stmt.executeQuery(query);
                    while (rs.next()) {
                        String iddb = rs.getString("UserID");
                        System.out.println(iddb);
                        System.out.println(ID);
                        if (iddb != null) {
                            System.out.println("ADDING BADGE");
                %>
                <div class="col-2 badge">
                    <a href="Nightowls"><img src="img/nightowl.png" class="img-fluid"/></a>
                    <span> <%=ID%> is a Nightowl!</span>
                </div>
                <%} else {
                        }
                    }
                    rs = null;
                    String query2 = "select UserID from daybreakers WHERE UserID='" + ID + "';";
                    System.out.println("Query created.");
                    rs = stmt.executeQuery(query2);
                    while (rs.next()) {
                        String iddb = rs.getString("UserID");
                        System.out.println(iddb);
                        System.out.println(ID);
                        if (iddb != null) {
                            System.out.println("ADDING BADGE");
                %>
                <div class="col-2 badge">
                    <img src="img/daybreakers.png" class="img-fluid"/>
                    <span> <%=ID%> is a Daybreaker! </span>
                </div>
                <%} else {
                        }
                    }
                    rs = null;
                    String query3 = "select UserID from bookworms WHERE UserID='" + ID + "';";
                    System.out.println("Query created.");
                    rs = stmt.executeQuery(query3);
                    while (rs.next()) {
                        String iddb = rs.getString("UserID");
                        System.out.println(iddb);
                        System.out.println(ID);
                        if (iddb != null) {
                            System.out.println("ADDING BADGE");
                %>
                <div class="col-2 badge">
                    <img src="img/bookworm.png" class="img-fluid"/>
                    <span> <%=ID%> is a Bookworm! </span>
                </div>
                <%} else {
                        }
                    }
                    rs = null;
                    String query4 = "select UserID from medicalmarvels WHERE UserID='" + ID + "';";
                    System.out.println("Query created.");
                    rs = stmt.executeQuery(query2);
                    while (rs.next()) {
                        String iddb = rs.getString("UserID");
                        System.out.println(iddb);
                        System.out.println(ID);
                        if (iddb != null) {
                            System.out.println("ADDING BADGE");
                %>
                <div class="col-2 badge">
                    <a href="MedicalMarvels"><img src="img/medicalmarvels.png" class="img-fluid"/></a>
                    <span> <%=ID%> is a Medical Marvel! </span>
                </div>
                <%} else {
                        }
                    }
                    rs = null;
                    String query5 = "select UserID from partyanimals WHERE UserID='" + ID + "';";
                    System.out.println("Query created.");
                    rs = stmt.executeQuery(query2);
                    while (rs.next()) {
                        String iddb = rs.getString("UserID");
                        System.out.println(iddb);
                        System.out.println(ID);
                        if (iddb != null) {
                            System.out.println("ADDING BADGE");
                %>
                <div class="col-2 badge">
                    <a href="MedicalMarvels"><img src="img/partyanimal.png" class="img-fluid"/></a>
                    <span> <%=ID%> is a Party Animal! </span>
                </div>
                <%} else {
                        }
                    }
                    rs = null;
                    conn.close();%>

            </div>
            <hr class="my-2"/>
        </div>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/vivus/0.4.2/vivus.min.js" integrity="sha256-QkfKcx3kugootBtJEPpTKDsWEneddME3kXPoT5o3Yic=" crossorigin="anonymous"></script>
        <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.11.0/umd/popper.min.js" integrity="sha384-b/U6ypiBEHpOf/4+1nzFpr53nxSS+GLCkfwBdFNTxtclqqenISfwAzpKaMNFNmj4" crossorigin="anonymous"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/js/bootstrap.min.js" integrity="sha384-h0AbiXch4ZDo7tp9hKZ4TsHbi047NrKGLO3SEJAg45jXxnGIfYzk4Si90RDIqNm1" crossorigin="anonymous"></script>
    </body>
</html>
