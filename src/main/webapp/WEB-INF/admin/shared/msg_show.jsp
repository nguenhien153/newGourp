<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<c:if test="${not empty errMsg}">
    <span style="color: red">${errMsg}</span>
</c:if>
    <c:if test="${not empty infoMsg}">
    <span style="color: blue">${infoMsg}</span>
</c:if>
