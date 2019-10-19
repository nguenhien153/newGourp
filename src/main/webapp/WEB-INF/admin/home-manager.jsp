<%-- 
    Document   : home-manager
    Created on : Oct 18, 2019, 12:41:21 PM
    Author     : nguen
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Admin Page</title>
        <link href="assets/css/admin/sb-admin.min.css" rel="stylesheet" type="text/css"/>
        <link href="assets/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css"/>
    </head>
    <body id="page-top">
        <%@include file="../fragments/admin/navigation.jsp" %>
        <div id="wrapper">
            <%@include file="../fragments/admin/slidebar.jsp" %>
            <div id="content-wrapper">
                <div class="container-fluid">

                  

                
                </div>
                <!-- /.container-fluid -->

                <!-- Sticky Footer -->
                <footer class="sticky-footer">
                    <div class="container my-auto">
                        <div class="copyright text-center my-auto">
                            <span>Copyright © JewelAp 2019</span>
                        </div>
                    </div>
                </footer>
            </div>
            <!-- /.content-wrapper -->
        </div>
        <!-- /#wrapper -->

        <!-- Scroll to Top Button-->
        <a class="scroll-to-top rounded" href="#page-top">
            <i class="fas fa-angle-up"></i>
        </a>

        <!-- Logout Modal-->
        <div class="modal fade" id="logoutModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel">Ready to Leave?</h5>
                        <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">×</span>
                        </button>
                    </div>
                    <div class="modal-body">Select "Logout" below if you are ready to end your current session.</div>
                    <div class="modal-footer">
                        <button class="btn btn-secondary" type="button" data-dismiss="modal">Cancel</button>
                        <a class="btn btn-primary" href="login.html">Logout</a>
                    </div>
                </div>
            </div>
        </div>
        
        <script src="assets/jquery/jquery.min.js" type="text/javascript"></script>
        <script src="assets/bootstrap/js/bootstrap.bundle.min.js" type="text/javascript"></script>
        <script src="assets/jquery-easing/jquery.easing.min.js" type="text/javascript"></script>
        <script src="assets/js/admin/sb-admin.min.js" type="text/javascript"></script>
       
        
    </body>
</html>
