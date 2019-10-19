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
<form method="post" action="${ctxRoot}/discountForm">
    <c:if test="${not empty param.id}">
        <div class="form-group">
            <lable>Discount ID</label> 
        
                <input class="form-control" type="text" name="id" readonly="true" value="${form.id}"/>
          
        </div>
        
    </c:if>
    <div class="form-group">
        <lable>Product Name</label>  
            <select name="productName" class="form-control">
                <option value="">--Select one--</option>
                <c:forEach items="${listProduct}" var="c">
                    <option value="${c.id}"
                            ${c.id == form.productID.id?'selected':''}>${c.productName}</option>
                </c:forEach>
            </select> 
            
    </div>
    <div class="form-group">
        <lable>Discount Value</label>
 
            <input class="form-control" type="number" name="discountValue"  value="${form.discountValue}"/>
 
    </div>
    
    <div class="form-group">
        <lable>Discount Start Date</label> 
            <input class="form-control" type="date" name="discountStartDate" value="${form.discountStartDate}"/>
         
    </div>
    <div class="form-group">
        <lable>Discount End Date</label>  
            <input class="form-control" type="date" name="discountEndDate" value="${form.discountEndDate}"/>
     
    </div>
            
    

    <button type="submit" class="btn btn-primary" value="Save">Submit</button>
</form>
            </div>
</div>
   <%@include file="../fragments/_footer.jsp" %>
