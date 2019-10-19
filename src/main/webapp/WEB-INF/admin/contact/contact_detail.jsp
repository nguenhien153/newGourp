<%--  Document   : role_list
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
<jsp:include page="shared/msg_show.jsp"/>
<c:if test="${not empty msgError}">
    <span style="color: red">${msgError}</span>
</c:if>
<div class="container" style="margin-bottom: 100px;">
       <h1 class="my-4">Shop Name</h1>
            <div >
    
<form method="post" action="${ctxRoot}/contactForm">
    <c:if test="${not empty param.id}">
        <div class="form-group">
            <lable>Contact ID</label> 
        
                  <input type="text" name="id" readonly="true" value="${form.id}"/>
          
        </div>
        
    </c:if>
    <div class="form-group">
        <lable>Customer Name</label>  
            <input class="form-control" type="text" name="name"  value="${form.name}"/>
            
    </div>
    <div class="form-group">
        <lable>Email</label>
 
            <input class="form-control" type="email" name="email"  value="${form.email}"/>
 
    </div>
    
    <div class="form-group">
        <lable>Title</label> 
            <input class="form-control" type="text" name="title" value="${form.title}"/>
         
    </div>
    <div class="form-group">
        <lable>Question</label>  
        <textarea class="form-control" type="text" name="question" value="${form.question}" rows="5"></textarea>
     
    </div>
    
          <div class="form-group">
        <lable>Answer</label>  
        <textarea class="form-control" type="text" name="answer" value="${form.answer}" rows="5"></textarea>
     
    </div>
    

    <button type="submit" class="btn btn-primary" value="Save">Submit</button>
     <button type="submit" class="btn btn-secondary" value="Save">Send email</button>
</form>
            </div>
</div>
 <%@include file="../fragments/_footer.jsp" %>