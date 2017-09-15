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
  
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>YoYoString Login Page</title>
    </head>
    <body>
        <h1>YoYoString Stats</h1>   
        
          <%
          LoggedIn loggedin = (LoggedIn) session.getAttribute("loggedin");
          //String failedlogin = (String)request.getAttribute("failedlogin");
          //if (failedlogin!=null){ <h3><%//=failedlogin</h3>}
          %>  
        
           <nav class="navbar navbar-expand-lg navbar-light bg-light">
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarTogglerDemo01" aria-controls="navbarTogglerDemo01" aria-expanded="false" aria-label="Toggle navigation">
              <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarTogglerDemo01">
              <a class="navbar-brand" href="#">YoYoString</a>
              <ul class="navbar-nav mr-auto mt-2 mt-lg-0">
                <li class="nav-item active">
                  <a class="nav-link" href="Main">Home <span class="sr-only">(current)</span></a>
                </li>
                <%
                if (loggedin!=null){
                %>
                
                <li class="nav-item">
                  <a class="nav-link" href="#">Weekly Stats</a>
                </li>
                <li class="nav-item">
                  <a class="nav-link disabled" href="#">Much Option</a>
                </li>
                <li class="nav-item">
                  <a class="nav-link disabled" href="#">Very Wow</a>
                </li>
              </ul>
              
              <form class="form-inline my-2 my-lg-0" action="Logout" method="GET">
                <button class="btn btn-sm align-middle btn-outline-secondary" type="submit">Logout</button>
              </form>
              
              <%
              }else{
              %>  <!--    
              <form class="form-inline my-2 my-lg-0" action="Login" method="GET">
                <button class="btn btn-outline-success my-2 my-sm-0" type="submit">Login</button>
              </form>
                  -->
              
              <%
              }
              %>
            </div>
          </nav>  
      
          <br>
          <h4>Login Here:</h4><br>
        
        <div class="form-group">
            <form action="Login" method="POST">
                <b> <label for="Userid">Userid:</label> </b>
                <input type="number" name="userid" min="1" max="100000" value="12345" required class="form-control" id="userid">

                <b> <label for="Password">Password:</label> </b>
                <input type="password" name="password"  value="" required class="form-control" id="password"> <br><br>
                
                <button class = "btn btn-outline-secondary" type="submit" value="Submit">Submit</button>
            </form>
        </div>

            
        
        
    </body>
</html>
