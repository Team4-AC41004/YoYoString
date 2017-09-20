<%-- 
    Document   : users
    Created on : 19-Sep-2017, 15:17:44
    Author     : petersallai
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <form method="POST" action="UserController" name="addUser">
            User ID: <input type="text" name="userid" readonly="readonly" value="<c:out value="${user.userid}"/>"/></br>
            
            Password: <input type="text" name="password" value="<c:out value="${user.password}"/>"/></br>
            
            IsAdmin: <input type="text" name="isadmin" value="<c:out value="${user.isadmin}"/>"/></br>
            
            <input type="submit" value="ADD"/>
        </form>
    </body>
</html>
