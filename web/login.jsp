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
    </head>
    <body>
        <h1>Welcome!</h1>    
        <%
        String failedlogin = (String)request.getAttribute("failedlogin");
            if (failedlogin!=null){%>
            <h3><%=failedlogin%></h3> 
            <%
            }
            %>
            
        
        <h2>Login Here:</h2>
        <form action="Login" method="POST">
            User ID: <input type="number" name="userid" min="1" max="100000" value="12345" required>
            Password: <input type="password" name="password" value="" required><br>
            <input type="submit" value="Submit">
        </form>
        
        
        
    </body>
</html>
