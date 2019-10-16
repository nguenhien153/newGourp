<%-- 
    Document   : home
    Created on : Oct 13, 2019, 9:17:54 AM
    Author     : nguen
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="assets/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>

        <title>Product Page</title>
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
        <%@include file="../../fragments/_navigation.jsp" %>

        <div class="container">

            <div class="row">

                <div class="col-lg-3">

                    <h1 class="my-4">Shop Name</h1>
                    <div class="list-group">
                        <a href="#" class="list-group-item">Category 1</a>
                        <a href="#" class="list-group-item">Category 2</a>
                        <a href="#" class="list-group-item">Category 3</a>
                    </div>

                </div>
                <!-- /.col-lg-3 -->

                <div class="col-lg-9">

                    <div id="carouselExampleIndicators" class="carousel slide my-4" data-ride="carousel">
                        <ol class="carousel-indicators">
                            <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
                            <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
                            <li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
                        </ol>
                        <div class="carousel-inner" role="listbox">
                            <div class="carousel-item active">
                                <img class="d-block img-fluid" src="http://placehold.it/900x350" alt="First slide">
                            </div>
                            <div class="carousel-item">
                                <img class="d-block img-fluid" src="http://placehold.it/900x350" alt="Second slide">
                            </div>
                            <div class="carousel-item">
                                <img class="d-block img-fluid" src="http://placehold.it/900x350" alt="Third slide">
                            </div>
                        </div>
                        <a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">
                            <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                            <span class="sr-only">Previous</span>
                        </a>
                        <a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
                            <span class="carousel-control-next-icon" aria-hidden="true"></span>
                            <span class="sr-only">Next</span>
                        </a>
                    </div>

                    <div class="row" id="listProduct">
                        <div class="col-lg-4 col-md-6 mb-4">
                            <div class="card h-100">
                                <a href="#">
                                    <img class="card-img-top" src="http://placehold.it/700x400" alt="">

                                </a>

                                <div class="card-body">
                                    <h4 class="card-title">
                                        <a href="#">Item Six</a>
                                    </h4>
                                    <h5>$24.99</h5>
                                    <p class="card-text text-danger">Out of Stock</p>
                                    <h6> <span class="badge badge-secondary">New</span></h6>
                                </div>
                                <div class="card-footer">
                                    <small class="text-muted">&#9733; &#9733; &#9733; &#9733; &#9734;</small>
                                    <small class="float-right text-info align-middle">50</small>
                                </div>
                            </div>
                        </div>

                    </div>
                    <!-- /.row -->

                </div>
                <!-- /.col-lg-9 -->

            </div>
            <!-- /.row -->

        </div>
        <%@include file="../../fragments/_footer.jsp" %>

        <script src="assets/jquery/jquery.min.js" type="text/javascript"></script>
        <script src="assets/bootstrap/js/bootstrap.bundle.js" type="text/javascript"></script>
        <script src="assets/numberalJS/numeral.min.js" type="text/javascript"></script>
        <script type="text/javascript">
            $(document).ready(function () {
                var e = $.ajax({
                    url: "/g01jewelap/api-displayproduct",
                    type: "get",
//                    contentType: "application/json; charset=utf-8", //application/html;charset=utf-8
                    dataType: "JSON"
                });
                e.done(function (data) {                                     
                    data.forEach(function (item, index, arr) {
                        var currency = numeral(item.grandTotal).format('$0,0.00');

                        var formProduct = '<div class="col-lg-4 col-md-6 mb-4">' +
                                '<div class="card h-100">' +
                                '<a href="${ctxRoot}/product?name='+item.productName+'">' +
                                '<img class="card-img-top" src="image/product/' + item.mainImage + '" alt="">' +
                                '<div class="overlay">' +
                                '<img src="image/product/' + item.subImage + '" alt="" class="card-img-top"/>' +
                                '</div>' +
                                '</a>' +
                                '<div class="card-body">' +
                                '<h4 class="card-title">' +
                                '<a href="${ctxRoot}/product?name='+item.productName+'">' + item.productName + '</a>' +
                                '</h4>' +
                                '<h5>' + currency + '</h5>' +
                                '</div>' +
                                '<div class="card-footer">' +
                                '<small class="text-muted">&#9733; &#9733; &#9733; &#9733; &#9734;</small>' +
                                '</div>' +
                                '</div>' +
                                '</div>';
                        $("#listProduct").append(formProduct);
                    })
                });
                e.fail(function (xhr, status) {
                    alert("Status: " + status);
                });
            });
        </script>
    </body>
</html>
