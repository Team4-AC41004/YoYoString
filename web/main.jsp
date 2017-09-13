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
        <title>YoYoString Main Page</title>
    </head>
    <body>
        <h1>YoYoString Stats</h1>
        
        <%
        //Options for logged-in user
        String loggedin = (String)session.getAttribute("loggedin");
            if (loggedin!=null){%>   
            %>
            <h3>Welcome <%=loggedin%> !</h3>  
            <%
            //Show Primary User options.
            

            //Show Secondary User options.
            %>     
            <form action="Logout" method="GET">
                <input type="submit" value="Logout">
            </form>
            <%
             }
        //Options for not logged-in user
            else{ %>
             <form action="Login" method="GET">
              <input type="submit" value="Login">
             </form>
            <%
            }
            %>
        
    </body>
</html>
