<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<ul class="sidebar navbar-nav">
    <li class="nav-item active">
        <a class="nav-link" href="<c:url value="/manager/home"/>">
            <i class="fas fa-fw fa-tachometer-alt"></i>
            <span>Dashboard</span>
        </a>
    </li>
    <li class="nav-item dropdown">
        <a class="nav-link dropdown-toggle" href="#" id="pagesDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
            <i class="fas fa-fw fa-folder"></i>
            <span>Pages</span>
        </a>
        <div class="dropdown-menu" aria-labelledby="pagesDropdown">
            <h6 class="dropdown-header" style="color: #0099ff; font-weight: bold;font-size: 18px">Login Screens:</h6>
            <a class="dropdown-item" href="login.html">Login</a>
            <a class="dropdown-item" href="register.html">Register</a>
            <a class="dropdown-item" href="forgot-password.html">Forgot Password</a>
            <h6 class="dropdown-header" style="color: #0099ff; font-weight: bold;font-size: 18px">Manage Product:</h6>
            <a class="dropdown-item" href="<c:url value="/manager/category"/>">Category</a>
            <a class="dropdown-item" href="<c:url value="/manager/product-type"/>">Product Type</a>
            <a class="dropdown-item" href="<c:url value="/manager/product"/>">Product</a>
            <a class="dropdown-item" href="<c:url value="/manager/metal-type"/>">Metal Type</a>
            <div class="dropdown-divider"></div>
            <h6 class="dropdown-header">Other Pages:</h6>
            <a class="dropdown-item" href="404.html">404 Page</a>
            <a class="dropdown-item" href="blank.html">Blank Page</a>
        </div>
    </li>
    <li class="nav-item">
        <a class="nav-link" href="charts.html">
            <i class="fas fa-fw fa-chart-area"></i>
            <span>Charts</span></a>
    </li>
    <li class="nav-item">
        <a class="nav-link" href="tables.html">
            <i class="fas fa-fw fa-table"></i>
            <span>Tables</span></a>
    </li>
</ul>