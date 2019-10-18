<%-- 
    Document   : register
    Created on : Oct 18, 2019, 7:58:25 AM
    Author     : nguen
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="assets/css/admin/sb-admin.min.css" rel="stylesheet" type="text/css"/>
        <link href="assets/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css"/>
        <title>Sign Up Page</title>
        <style>
            body{
                margin-top: 56px;
            }
            footer {
                position: fixed;
                left: 0;
                bottom: 0;
                width: 100%;
                background-color: red;
                color: white;
                text-align: center;
            }
        </style>
    </head>
    <body>
        <%@include file="../../fragments/_navigation.jsp" %>

        <div class="container">
            <div class="card card-register mx-auto" style="margin-top: 200px">
                <div class="card-header">Register an Account</div>
                <div class="card-body">
                    <c:if test="${not empty account}">
                        <div class="alert-danger text-center mb-4">
                            <span class="text-danger">${gmailError}</span><br/>
                            <span>${passwordError}</span><br/>
                            <span>${fullnameError}</span><br/>
                            <span>${dobError}</span><br/>
                            <span>${confirmError}</span><br/>
                            <span>${parseDateFalse}</span>
                        </div>
                    </c:if>
                    <form method="post" action="/g01jewelap/register" id="formRegister">
                        <div class="form-group">
                            <div class="form-row">
                                <div class="col-md-6">
                                    <div class="form-label-group">
                                        <input type="text" id="fullName" class="form-control" placeholder="Full name" required="required" autofocus="autofocus" 
                                               name="fullName"  maxlength="50"
                                               title="Only Contain Letters" value="${account.fullName}">
                                        <label for="fullName">Full name</label>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-label-group">
                                        <input type="tel" id="phone" class="form-control" placeholder="Phone" required="required" name="phone" 
                                               pattern="^[0-9]{10,11}$" title="Only Contain Number and Length: 10-11" maxlength="11"
                                               value="${account.phone}">
                                        <label for="phone">Phone</label>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="form-label-group">
                                <input type="email" id="inputEmail" class="form-control" placeholder="Email address" required="required" 
                                       name="gmail"
                                       maxlength="40" title="Exaple: xxxxxxxx@gmail.com"
                                       pattern="^[a-z][a-z0-9_\.]{5,30}@[a-z0-9]{2,}(\.[a-z0-9]{2,4}){1,2}$"
                                       value="${account.gmail}">
                                <label for="inputEmail">Email address</label>
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="form-row">
                                <div class="col-md-6">
                                    <div class="form-label-group">
                                        <input type="date" id="dob" class="form-control" placeholder="Date of Birth" required="required"
                                               name="dob" value="${dobb}">
                                        <label for="dob">Date of Birth</label>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-label-group">
                                        <select class="form-control" style="height: 52px" required="required" name="gender">
                                            <optgroup label="Gender">
                                                <option value="female">Female</option>
                                                <option value="male">Male</option>
                                            </optgroup>
                                        </select>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="form-row">
                                <div class="col-md-6">
                                    <div class="form-label-group">
                                        <input type="password" id="inputPassword" class="form-control" placeholder="Password" required="required"
                                               name="password" pattern="^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,}$" maxlength="50"
                                               title="Minimum Eight Characters, At Least One Letter And One Number">
                                        <label for="inputPassword">Password</label>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-label-group">
                                        <input type="password" id="confirmPassword" class="form-control" placeholder="Confirm password" required="required"
                                               pattern="^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,}$" maxlength="50" name="confirm"
                                               title="Minimum Eight Characters, At Least One Letter And One Number">
                                        <label for="confirmPassword">Confirm password</label>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <button class="btn btn-primary btn-block">Sign Up</button>
                    </form>
                    <div class="text-center" id="footerDiv">
                        <a class="d-block small mt-3" href="<c:url value="/login"/>">Login Page</a>
                        <a class="d-block small" id="forgotPassword" href="forgot-password.html">Forgot Password?</a>
                    </div>
                </div>
            </div>
        </div>

        <%@include file="../../fragments/_footer.jsp" %>
        <script src="assets/jquery/jquery.min.js" type="text/javascript"></script>
        <script src="assets/bootstrap/js/bootstrap.bundle.min.js" type="text/javascript"></script>
        <script src="assets/jquery-easing/jquery.easing.min.js" type="text/javascript"></script>

        <script type="text/javascript">
            var urlParams = new URLSearchParams(window.location.search);
            if (urlParams.get("success") !== null)
            {
                $("#formRegister").hide();
                $("#footerDiv").prepend("<h5>Register Success</h5>")
                $("#forgotPassword").attr("style", "display: none !important");
                $(".card-body").prepend('<div class="d-flex justify-content-center bd-highlight mb-3"><img src="image/icon/account/checked.png"  alt=""/></div>');
            }
        </script>
    </body>
</html>
