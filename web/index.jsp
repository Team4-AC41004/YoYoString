<%-- 
    Document   : main
    Created on : Sep 13, 2017, 12:39:15 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Hello World!</h1>
        
        <%
        //Welcome loggedin user
        String loggedin = (String)session.getAttribute("loggedin");
            if (loggedin!=null){%>   
            %>
            <h3>Welcome <%=loggedin%> !</h3>  
            <%}
            //Show User options.
            
            %>
        
    </body>
</html>
