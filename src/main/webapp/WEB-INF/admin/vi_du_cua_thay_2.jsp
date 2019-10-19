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
        <jsp:include page="shared/msg_show.jsp"/>
        <form method="post" action="${ctxRoot}/RoleFormServlet">
            <c:if test="${not empty param.id}">
                <lable>Role ID</label>
                <br/>
                <input type="text" name="id" readonly="true" value="${form.id}"/>
                <br/>
            </c:if>
            <lable>Role Name</label>
            <br/>
            <input type="text" name="name" value="${form.roleName}"/>
            <br/>
            <input type="submit" value="Save"/>
        </form>
    </body>
</html>
