<%-- 
    Document   : login
    Created on : Sep 13, 2017, 11:02:17 AM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="Beans.LoggedIn"%>

<!DOCTYPE html>
<html>
    <head>
        <!-- Bootstrap CSS -->
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/css/bootstrap.min.css" integrity="sha384-/Y6pD6FV/Vv2HJnA6t+vslU6fwYXjCFtcEpHbNJ0lyAFsXTsjBbfaDjzALeQsN6M" crossorigin="anonymous">
        <link rel="stylesheet" href="css/index.css"/>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>YoYoString Login Page</title>
    </head>
    <body>
        <%@include file="navbar.jsp"%>
        <div class="container">
            <div class="jumbotron">
                <h1 class="display-4">Login</h1><br/>
                <hr class="my-2"/>
                <form action="Login" method="POST">

                    <div class="form-group row">
                        <label for="useridlog" class="col-sm-2 col-form-label">User ID:</label>
                        <div class="col-sm-10">
                            <input type="username" id="useridlog" name="userid" placeholder="12345" required class="form-control" id="userid">
                        </div>
                    </div>   
                    <div class="form-group row">
                        <label for="password" class="col-sm-2 col-form-label">Password:</label>
                        <div class="col-sm-10">
                            <input type="password" id="password" name="password" required class="form-control" id="password">
                        </div>
                    </div>
                   
                        <button class="btn btn-info float-right" type="submit" value="Submit">Submit</button>
                    <br/><br/>
                </form>
                <hr class="my-2"/>
                <small class="text-muted float-right"> Having trouble logging in? Contact an Administrator to reset your password.</small>
            </div>



        </div>
    </div>
</body>
</html>
