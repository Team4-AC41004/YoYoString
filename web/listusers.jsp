<%-- 
    Document   : listusers
    Created on : 19-Sep-2017, 15:18:20
    Author     : petersallai
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <table>
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Password</th>
                    <th>IsAdmin</th>
                </tr>
            </thead>
            <tbody>
            <c:forEach items="${users}" var="user">
                <tr>
                    <td><c:out value="${user.userid}"/></td>
                    <td><c:out value="${user.password}"/></td>
                    <td><c:out value="${user.isadmin}"/></td>
                    <td><a href="UserController?action=edit&Userid=<c:out value="${user.userid}"/>">Update</a></td>
                    <td><a href="UserController?action=delete&Userid=<c:out value="${user.userid}"/>">Delete</a></td>
                </tr>
            </c:forEach>
            </tbody>
            <p><a href="UserController?action=add">ADD USER</a></p>
        </table>
    </body>
</html>
