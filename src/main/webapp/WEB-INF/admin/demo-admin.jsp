<%-- 
    Document   : demo-admin
    Created on : Oct 19, 2019, 9:00:10 AM
    Author     : nguen
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link href="assets/css/admin/sb-admin.min.css" rel="stylesheet" type="text/css"/>
        <link href="assets/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css"/>
    </head>
    <body id="page-top">
        <%@include file="../fragments/admin/navigation.jsp" %>


        <div id="wrapper">
            <!-- Sidebar -->
            <%@include file="../fragments/admin/slidebar.jsp" %>

            <div id="content-wrapper">
                <div class="container-fluid">
                </div>



                <%@include file="../fragments/admin/footer.jsp" %>
            </div>


            <script src="assets/jquery/jquery.min.js" type="text/javascript"></script>       
            <script src="assets/bootstrap/js/bootstrap.bundle.min.js" type="text/javascript"></script>
            <script src="assets/jquery-easing/jquery.easing.min.js" type="text/javascript"></script>
            <script src="assets/js/admin/sb-admin.min.js" type="text/javascript"></script>
    </body>
</html>
