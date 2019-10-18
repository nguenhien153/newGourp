
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="ctxRoot" value="${pageContext.request.contextPath}"/>

<nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top">
    <div class="container">
        <a class="navbar-brand" href="#">Jewel AP</a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarResponsive">
            <ul class="navbar-nav ml-auto">
                <li class="nav-item active">
                    <a class="nav-link" href="#">Home
                        <span class="sr-only">(current)</span>
                    </a>
                </li>
                <li class="nav-item">
                    <a href="${ctxRoot}/product" class="nav-link">Product</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#">About</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#">Services</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#">Contact</a>
                </li>
                <c:if test="${not empty accountInfo}">
               
                    <li class="nav-item dropdown show">
                        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownBlog" style="height: 40px" data-toggle="dropdown" aria-haspopup="true" aria-expanded="true">
                            <img src="image/icon/account/account.png" alt="" style="width: 30px;margin-bottom: 5px" class="align-middle"/>
                        </a>
                        <div class="dropdown-menu dropdown-menu-right show" aria-labelledby="navbarDropdownBlog">
                            <div class="card">
                                <div class="card-header">
                                    <h6>Wellcome ${accountInfo.fullName} </h6>
                                    <h8>${accountInfo.gmail} </h8>
                                </div>
                            </div>
                            <a class="dropdown-item" href="blog-home-1.html">My Account</a>
                            <a class="dropdown-item" href="blog-home-2.html">Notification</a>
                            <a class="dropdown-item" href="blog-post.html">Change Password</a>
                            <a class="dropdown-item" href="<c:url value="/logout"/>">Sign Out</a>
                        </div>
                    </li>
                </c:if>
                <c:if test="${empty accountInfo}">
                    <li class="nav-item">
                        <a href="${ctxRoot}/login" class="nav-link">Sign In</a>
                    </li>
                </c:if>
            </ul>
        </div>
    </div>
</nav>