<%-- 
    Document   : viewusers
    Created on : Sep 22, 2017, 2:40:49 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="Beans.LoggedIn"%>
<%@ page import="java.util.Arrays" %>

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
            
            <%
            //LoggedIn[] users = new LoggedIn[30];
            //LoggedIn[] users = Arrays.copyOf((LoggedIn[]) session.getAttribute("users"), 30);
            //LoggedIn[] users = (LoggedIn[]) session.getAttribute("users");
            LoggedIn[] users = ((LoggedIn[]) session.getAttribute("users")).clone();
            

            //PRINT USERS
            %>
            <form action="EditUser" method="POST">
            <table class="table">
                <tr>
                    <th>Userid</th>
                    <th>Password</th>
                    <th>IsAdmin</th>
                    <th>OutletRef</th>
                </tr>
                <tr>
                <%
                for (int i=0; i<users.length; i++){
                    int id = users[i].getUserid();
                %>
                    <td><input type="text" value=<%=id%> class="form-control" name=<%="userid"+id%>></td> 
                    <td><input type="password" value="" class="form-control" name=<%="password" + id%>></td> 
                    <td><input type="number" value=<%=users[i].getIsAdmin()%> class="form-control" maxlength="3" required name=<%="isadmin"+id%> ></td> 
                    <td><input type="number" value=<%=users[i].getOutletRef()%> class="form-control" maxlength="1" required name=<%="outletref"+id%> ></td> 
                    

                    <input type="hidden" name=<%=users[i].getUserid()%> value=<%=users[i].getUserid()%>>
                    
                    <td><button class="btn btn-info float-left" type="submit" id="submitbutt" name="submitbutt" value=<%=id%>  >Update User</button></td>
                    
                    <form action="DeleteUser" method="POST">
                        <td><button class="btn btn-info float-left" type="submit" id="submitbutt" name="submitbutt" value=<%=id%> >Delete User</button></td>
                    </form>
            </tr>        
            
            <%}%>
            </table>
            </form>
          <%  } else { %>
            <br/>
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