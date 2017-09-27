<%-- 
    Document   : navbar
    Created on : 18-Sep-2017, 08:58:01
    Author     : Think
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="Beans.LoggedIn"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="http://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css">
    </head>
    <body>
        <nav class="navbar navbar-expand-lg navbar-dark bg-dark sticky-top">
            <a class="navbar-brand" href="./"> YoYoString<a>
                    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                        <span class="navbar-toggler-icon"></span>
                    </button>

                    <div class="collapse navbar-collapse" id="navbarSupportedContent">
                        <ul class="navbar-nav mr-auto">
                            <li class="nav-item active">
                                <a class="nav-link" href="./">Home <span class="sr-only">(current)</span></a>
                            </li>
                            <%  //Welcome loggedin user
                                LoggedIn loggedin = (LoggedIn) session.getAttribute("loggedin");
                                if (loggedin != null) {%> 
                            <li class="nav-item">
                                <a class="nav-link" href="#"> <i class="icon ion-person"></i> <%=loggedin.getUserid()%> </a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="Logout">Logout</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="AllData"> Stats</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="testServlet">EVERYTHING_TABLE</a>
                                <!-- 
                                <form method="Post" action="testServlet" style="margin-bottom: 0em;">
                                    <input type="submit" name="type" value="To Philipp's Test Page" id="submit">
                                </form> --> <!-- This will trigger the doPost Method in the Servlet that has name testServlet. -->
                            </li>
                            <li class="nav-item">
                                    <a class="nav-link" href="AdminOptions"> Admin Options</a>
                            </li>
                            <li class="nav-item">
                                    <a class="nav-link" href="tribes.jsp"> View Tribes</a>
                            </li>
                            
                            <%} else {%>
                            <li class="nav-item">
                                <a class="nav-link" href="Login">Login</a>
                            </li><%}%>
                        </ul>
                       
                    </div>
                    </nav>
                   
                    </body>
                    </html>
