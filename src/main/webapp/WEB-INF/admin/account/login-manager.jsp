<%-- 
    Document   : login-manager
    Created on : Oct 18, 2019, 4:28:42 PM
    Author     : nguen
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login Page</title>
        <link href="assets/css/admin/sb-admin.min.css" rel="stylesheet" type="text/css"/>
        <link href="assets/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css"/>
    </head>
    <body class="bg-dark">
        <div class="container mb-lg-5">
            <div class="card card-login mx-auto" style="margin-top: 200px">
                <div class="card-header">Login</div>
                <div class="card-body">
                    <form action="/g01jewelap/login-manager" method="post">
                        <div class="form-group">
                            <p style="display: none" id="alert" class="rounded-pill alert-danger text-center" style="height: 30px; line-height: 30px;">Email or Password not valid !!!</p>
                            <div class="form-label-group">
                                <input type="email" id="inputEmail" name="gmail" class="form-control" placeholder="Email address" required="required" autofocus="autofocus">
                                <label for="inputEmail">Email address</label>
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="form-label-group">
                                <input type="password" id="inputPassword" name="password" class="form-control" placeholder="Password" required="required">
                                <label for="inputPassword">Password</label>
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="checkbox">
                                <label>
                                    <input type="checkbox" value="remember-me">
                                    Remember Password
                                </label>
                            </div>
                        </div>
                        <button class="btn btn-primary btn-block">Sign In</button>
                    </form>
                </div>
            </div>
        </div>

        <script src="assets/jquery/jquery.min.js" type="text/javascript"></script>
        <script src="assets/bootstrap/js/bootstrap.bundle.min.js" type="text/javascript"></script>
        <script src="assets/jquery-easing/jquery.easing.min.js" type="text/javascript"></script>
    </body>
</html>
