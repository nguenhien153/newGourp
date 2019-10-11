<%-- 
    Document   : role_list
    Created on : Oct 11, 2019, 3:20:28 PM
    Author     : thao
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<c:set var="ctxRoot" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Hello World! No</h1>
        <table>
            <tr>
                <td>ID</td>
                <td>Name</td>
                <td>&nbsp;</td>
            </tr>
        <c:forEach items="${listRole}" var="item">
            <tr>
                <td>${item.id}</td>
                <td> ${item.roleName}</td>
                <td>
                    <a href="${ctxRoot}/RoleFormServlet?id=${item.id}">Edit</a>
                    |
                    <a href="${ctxRoot}/RoleServlet?delete=${item.id}">Delete</a>
                </td>
            </tr>
        </c:forEach>
        </table>
        <a href="${ctxRoot}/RoleFormServlet">Create new</a>
    </body>
</html>
