<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>  
<c:set var="ctxRoot" value="${pageContext.request.contextPath}"/>
<c:url var="APIurl" value="/blogForm"/> <!--https://github.com/lamtraining/jsp-servlet-jdbc/blob/master/src/main/java/com/laptrinhjavaweb/controller/admin/api/NewAPI.java-->
<c:url var ="NewURL" value="/blog"/><!--https://github.com/lamtraining/jsp-servlet-jdbc/blob/master/src/main/java/com/laptrinhjavaweb/controller/admin/NewController.java-->
<!--https://github.com/lamtraining/jsp-servlet-jdbc/blob/master/src/main/webapp/views/admin/new/edit.jsp-->
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

                <form method="post" action="${ctxRoot}/blogForm" id="formSubmit">
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
                            <textarea rows="" cols="" id="content" name="content" style="width: 820px;height: 175px" value="${form.content}"></textarea>

                    </div>
                    <div class="form-group">
                        <lable>Image</label>

                            <input class="form-control" type="file" name="imageUrl"  value="${form.imageUrl}"/>

                    </div> 


                  <div class="form-group">
                                <div class="col-sm-12">
                                    <c:if test="${not empty form.id}">
                                        <input type="button" class="btn btn-white btn-warning btn-bold" value="Update News" id="btnAddOrUpdateNew"/>
                                    </c:if>
                                    <c:if test="${empty form.id}">
                                        <input type="button" class="btn btn-white btn-warning btn-bold" value="Create News" id="btnAddOrUpdateNew"/>
                                    </c:if>
                                </div>
                            </div>
                </form>

            </div>
        </div>
   <%@include file="../fragments/_footer.jsp" %>
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
    <script>window.jQuery || document.write('<script src="../../assets/js/vendor/jquery-slim.min.js"><\/script>')</script>
    <script src="https://getbootstrap.com/docs/4.0/assets/js/vendor/popper.min.js"></script>
    <script src="https://getbootstrap.com/docs/4.0/dist/js/bootstrap.min.js"></script>
    <script src="https://getbootstrap.com/docs/4.0/assets/js/vendor/holder.min.js"></script>
   
    <script src="<c:url value="/ckeditor/ckeditor.js"/>"></script>
   
    
    </body>
</html>
   
 <script type="text/javascript">
	var editor = '';
	$(document).ready(function(){
		editor = CKEDITOR.replace( 'content');
	});
	
    $('#btnAddOrUpdateNew').click(function (e) {
        e.preventDefault();
        var data = {};
        var formData = $('#formSubmit').serializeArray();
        $.each(formData, function (i, v) {
            data[""+v.name+""] = v.value;
        });
        data["content"] = editor.getData();
        var id = $('#id').val();
        if (id == "") {
            addNew(data);
        } else {
            updateNew(data);
        }
    });
    function addNew(data) {
        $.ajax({
            url: '${APIurl}',
            type: 'POST',
            contentType: 'application/json',
            data: JSON.stringify(data),
            dataType: 'json',
            success: function (result) {
            	window.location.href = "${NewURL}?type=edit&id="+result.id+"&message=insert_success";
            },
            error: function (error) {
            	window.location.href = "${NewURL}?type=list&maxPageItem=2&page=1&message=error_system";
            }
        });
    }
    function updateNew(data) {
        $.ajax({
            url: '${APIurl}',
            type: 'PUT',
            contentType: 'application/json',
            data: JSON.stringify(data),
            dataType: 'json',
            success: function (result) {
            	window.location.href = "${NewURL}?type=edit&id="+result.id+"&message=update_success";
            },
            error: function (error) {
            	window.location.href = "${NewURL}?type=list&maxPageItem=2&page=1&message=error_system";
            }
        });
    }
</script>