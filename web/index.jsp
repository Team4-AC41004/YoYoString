<%-- 
    Document   : main
    Created on : Sep 13, 2017, 12:39:15 PM
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
        <title>YoYoString - Home</title>
    </head>
 
    <body>
        <%@include file="navbar.jsp" %>
        
        <div class="container-fluid">

            <%  LoggedIn Loggedin = (LoggedIn) session.getAttribute("loggedin");
                if (loggedin != null) {%> 
                <div class="row">
                    <div class="col">
                        <a class="indexbtn" id="indbtntopleft" href="#">12</a>
                    </div>
                    <div class="col">
                        a
                    </div>
                </div>
                <div class="row">
                    <div class="col">
                        a
                    </div>
                    <div class="col">
                        a
                    </div>
                </div>
                
                
            <%} else { %><br/>
            <div class="alert alert-info float-center" style="width: 100%;"role="alert">
                <button type="button" class="close" data-dismiss="alert" aria-label="Close" style='cursor: pointer'>
                    <span aria-hidden="true">&times;</span>
                </button>
                It seems like you're not logged in. Click <a href='Login' class='alert-link'>Here</a> to log in!
            </div><%}%><br/>


        </div>
            
       

    <script src="https://cdnjs.cloudflare.com/ajax/libs/vivus/0.4.2/vivus.min.js" integrity="sha256-QkfKcx3kugootBtJEPpTKDsWEneddME3kXPoT5o3Yic=" crossorigin="anonymous"></script>
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.11.0/umd/popper.min.js" integrity="sha384-b/U6ypiBEHpOf/4+1nzFpr53nxSS+GLCkfwBdFNTxtclqqenISfwAzpKaMNFNmj4" crossorigin="anonymous"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/js/bootstrap.min.js" integrity="sha384-h0AbiXch4ZDo7tp9hKZ4TsHbi047NrKGLO3SEJAg45jXxnGIfYzk4Si90RDIqNm1" crossorigin="anonymous"></script>
    
</body>
</html>
