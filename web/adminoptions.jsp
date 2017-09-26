<%-- 
    Document   : adminoptions
    Created on : Sep 22, 2017, 1:43:08 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="Beans.LoggedIn"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/css/bootstrap.min.css" integrity="sha384-/Y6pD6FV/Vv2HJnA6t+vslU6fwYXjCFtcEpHbNJ0lyAFsXTsjBbfaDjzALeQsN6M" crossorigin="anonymous">
        
        <link rel="stylesheet" href="css/index.css"/>
        <title>YoYoString - Admin</title>
    </head>
 
    <body>
        <%@include file="navbar.jsp" %>
        
        <div class="container-fluid">

            <%  LoggedIn Loggedin = (LoggedIn) session.getAttribute("loggedin");
                if (loggedin != null) {
                    //is the user trying to accesss this page is not an admin
                    
                    if (Loggedin.getIsAdmin()!=1){
                        request.getRequestDispatcher("./").forward(request, response);
                    }
            %> 
            <h3>Welcome <%=Loggedin.getUserid()%> !</h3> 
            <br>
            
            <!--<button type="submit" class="btn btn-primary" href="/CreateUser">Create New User</button>-->
            <button class="btn btn-info float-left" onclick="CreateUserLink()">Create New User</button><br><br>
            <!--<button onclick="ViewUsersLink()" class="btn btn-primary">View All Users</button> -->
            <form action="ViewUsers" method="POST"> 
             <button class="btn btn-info float-left" type="submit" value="Submit">View All Users</button>
            </form>
            
            <%} else { %><br/>
            <div class="alert alert-info float-center" style="width: 100%;"role="alert">
                <button type="button" class="close" data-dismiss="alert" aria-label="Close" style='cursor: pointer'>
                    <span aria-hidden="true">&times;</span>
                </button>
                It seems like you're not logged in. Click <a href='Login' class='alert-link'>Here</a> to log in!
            </div>
            <%}%>
            <br/>


        </div>
            <script type ="text/javascript">            
            function CreateUserLink(){
                window.location = 'CreateUser';  
            }
            
            function ViewUsersLink(){
                window.location = 'ViewUsers';  
            }
            </script>
       
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/js/bootstrap.min.js" integrity="sha384-h0AbiXch4ZDo7tp9hKZ4TsHbi047NrKGLO3SEJAg45jXxnGIfYzk4Si90RDIqNm1" crossorigin="anonymous"></script>
    
</body>
</html>
