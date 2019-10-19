<%-- 
    Document   : role_list
    Created on : Oct 11, 2019, 3:20:28 PM
    Author     : thao
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>  
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:include page="../fragments/header.jsp"/>
<c:set var="ctxRoot" value="${pageContext.request.contextPath}"/> 

        <div class="container">
            <div class="card-deck mb-3 text-center">
        <table class="table">
            <tr>
                <td>ID</td>
                <td>Product</td>
                <td>Discount Value</td>
                <td>Discount Start Date</td>
                <td>Discount End Date</td>
               
                <td>&nbsp;</td>
            </tr>
        <c:forEach items="${listDiscount}" var="item">
            <tr>
                <td>${item.id}</td>
                <td> ${item.productID.productName}</td>
                <td>${item.discountValue}</td>
                <td> <fmt:formatDate type="date" value="${item.discountStartDate }"/></td>
                <td> <fmt:formatDate type="date" value="${item.discountEndDate}"/></td>
                  
                <td>
                    <a href="${ctxRoot}/discountForm?id=${item.id}">Edit</a>
                    |
                    <a href="${ctxRoot}/discountForm?delete=${item.id}">Delete</a>
                </td>
            </tr>
        </c:forEach>
        </table>
            </div>
        <a href="${ctxRoot}/discountForm">Create new</a>
          </div>
    
 <jsp:include page="../fragments/footer.jsp"/>