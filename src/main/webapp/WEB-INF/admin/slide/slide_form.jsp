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

                <form method="post" action="${ctxRoot}/blogForm">
                    <c:if test="${not empty param.id}">
                        <div class="form-group">
                            <lable>Blog ID</label> 

                                <input type="text" name="id" readonly="true" value="${form.id}"/>

                        </div>

                    </c:if>
                    <div class="form-group">
                        <lable>Title</label>  
                            <input class="form-control" type="text" name="title"  value="${form.title}"/>

                    </div>
                    <div class="form-group">
                        <lable>CreatesBy</label>

                            <input class="form-control" type="text" name="createdby"  value="${form.createdby}"/>

                    </div>

                    <div class="form-group">
                        <lable>Content</label> 
                            <textarea class="form-control" type="text" name="content" value="${form.content}" rows="10"></textarea>

                    </div>
                    <div class="form-group">
                        <lable>Image</label>

                            <input class="form-control" type="file" name="imageUrl"  value="${form.imageUrl}"/>

                    </div> 


                    <button type="submit" class="btn btn-primary" value="Save">Submit</button>
                </form>

            </div>
        </div>
        <jsp:include page="../fragments/footer.jsp"/>
