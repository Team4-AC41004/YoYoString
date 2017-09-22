<%-- 
    Document   : createuser
    Created on : Sep 22, 2017, 1:42:17 PM
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
                    //is the user trying to acces this page is not an admin
                    if (Loggedin.getIsAdmin()!=1){
                    %>
                        <script>
                        redirectUser();
                        </script>
                    <%
                    }
            %> 
            <h3>Welcome <%=Loggedin.getUserid()%> !</h3> 
            
            <form action="CreateUser" method="POST">

                    <div class="form-group row">
                        <label for="useridlog" class="col-sm-2 col-form-label">User ID:</label>
                        <div class="col-sm-10">
                            <input type="number" id="useridlog" name="userid" placeholder="12345" required class="form-control" id="userid" min="1" max="999999999">
                        </div>
                    </div>   
                    <div class="form-group row">
                        <label for="password" class="col-sm-2 col-form-label">Password:</label>
                        <div class="col-sm-10">
                            <input type="password" id="password" name="password" required class="form-control" id="password" maxlength="45">
                        </div>
                    </div>
                <div class="form-group row">
                        <label for="outletref" class="col-sm-2 col-form-label">Outlet Reference</label>
                        <div class="col-sm-10">
                            <input type="number" id="outletref" name="outletref" required class="form-control" id="outletref" maxlength="3">
                        </div>
                    </div>
                <div class="form-group row">
                        <label for="isadmin" class="col-sm-2 col-form-label">Is Admin?</label>
                        <div class="col-sm-10">
                            <input type="number" id="isadmin" name="isadmin" required class="form-control" id="outletref" maxlength="1" value="0">
                        </div>
                    </div>
                   
                        <button class="btn btn-info float-right" type="submit" value="Submit">Submit New User</button>
                    <br/><br/>
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
            function redirectUser() {
             // similar behavior as an HTTP redirect
            window.location.replace("./");
            }    
            </script>
       
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/js/bootstrap.min.js" integrity="sha384-h0AbiXch4ZDo7tp9hKZ4TsHbi047NrKGLO3SEJAg45jXxnGIfYzk4Si90RDIqNm1" crossorigin="anonymous"></script>
    
</body>
</html>
