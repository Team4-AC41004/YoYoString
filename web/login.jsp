<%-- 
    Document   : login
    Created on : Sep 13, 2017, 11:02:17 AM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login Page</title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/css/bootstrap.min.css" integrity="sha384-/Y6pD6FV/Vv2HJnA6t+vslU6fwYXjCFtcEpHbNJ0lyAFsXTsjBbfaDjzALeQsN6M" crossorigin="anonymous">
        <link rel="stylesheet" href="css/index.css"/>
    </head>
    <body>
        <%@ include file="navbar.jsp" %>
        <h1></h1>    
        <%
            String failedlogin = (String) request.getAttribute("failedlogin");
            if (failedlogin != null) {%>
        <h3><%=failedlogin%>WHOOPS</h3> 
        <%
            }
        %>

        <div class="jumbotron">
            <h1 class="display-3">Login</h1><br/>

            <form action="Login" method="POST">
                <div class="form-group">
                    <input type="number" class="form-control" placeholder="Username" name="userid" aria-label="Username" required>
                </div>
                <div class="form-group">
                    <input type="password" class="form-control" name="password" placeholder="Password" required>
                </div>
                    <hr class='my-4'/>
                    <button type="submit" class="btn btn-primary">Submit </button>
                </div>
            </form>

        </div>

    </body>
</html>
