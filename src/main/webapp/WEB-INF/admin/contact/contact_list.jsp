<%-- 
    Document   : role_list
    Created on : Oct 11, 2019, 3:20:28 PM
    Author     : thao
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>  
<c:set var="ctxRoot" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
         <link rel="canonical" href="https://getbootstrap.com/docs/4.0/examples/pricing/">

    <!-- Bootstrap core CSS -->
    <link href="https://getbootstrap.com/docs/4.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="<c:url value="/assets/bootstrap/css/jquery.dataTables.min.css"/> ">
    <link rel="stylesheet" href="<c:url value="/assets/bootstrap/css/dataTables.bootstrap4.min.css"/>">

        <title>Discount Page</title>
        <style>
            body {
                padding-top: 56px;
                
            }
            .overlay {
                position: absolute;
                top: 0;
                bottom: 0;
                left: 0;
                right: 0;
                height: 253px;
                width: 100%;
                opacity: 0;
                transition: .5s ease;        
            }

            .card:hover .overlay {
                opacity: 1;
            }
        </style>
    </head>
    <body>
       <%@include file="../fragments/_navigation.jsp" %>

       <div class="container" style="margin-bottom: 100px;">
            <h1 class="my-4">Shop Name</h1>
            <div >
                <table id="companies" class="display">
            <thead>
                
            <tr>
                <td>ID</td>
                <td>Customer name</td>
                <td>Email</td>
                <td>Title</td>
                <td>Question</td>
                <td>Answer</td>
               
                <td>&nbsp;</td>
            </tr>
            </thead>
            <tbody>
        <c:forEach items="${listContact}" var="item">
            <tr>
                <td>${item.id}</td>
                <td>${item.name}</td>
                <td>${item.title}</td>
                <td>${item.question}</td>
                <td>${item.answer}</td>
                  
                <td>
                    <a href="${ctxRoot}/contactForm?id=${item.id}">Edit</a>
                    |
                    <a href="${ctxRoot}/contact?delete=${item.id}">Delete</a>
                </td>
            </tr>
        </c:forEach>
            </tbody>
        </table>
            </div>
        <a href="${ctxRoot}/contactForm">Create new</a>
          </div>
    
  <%@include file="../fragments/_footer.jsp" %>
   <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
    <script>window.jQuery || document.write('<script src="../../assets/js/vendor/jquery-slim.min.js"><\/script>')</script>
    <script src="https://getbootstrap.com/docs/4.0/assets/js/vendor/popper.min.js"></script>
    <script src="https://getbootstrap.com/docs/4.0/dist/js/bootstrap.min.js"></script>
    <script src="https://getbootstrap.com/docs/4.0/assets/js/vendor/holder.min.js"></script>
    <script src="<c:url value="/assets/bootstrap/js/jquery.dataTables.min.js"/>"></script>
    <script src="<c:url value="/assets/bootstrap/js/dataTables.bootstrap4.min.js"/>"></script>
    
            </body>
</html>
       <script type="text/javascript">
            $(document).ready(function (){
                $("#companies").dataTable({
                    "sPaginationType": "full_numbers",
                    "bJQueryUI": true
                });
            });
        </script>