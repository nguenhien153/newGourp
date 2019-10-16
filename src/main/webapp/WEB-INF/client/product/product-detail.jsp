<%-- 
    Document   : product-detail
    Created on : Oct 15, 2019, 5:33:00 PM
    Author     : nguen
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Product Details Page</title>
        <link href="assets/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <link href="assets/slick/slick.css" rel="stylesheet" type="text/css"/>
        <link href="assets/slick/slick-theme.css" rel="stylesheet" type="text/css"/>
        <link href="assets/css/product/SlickProduct.css?3" rel="stylesheet" type="text/css"/>
        <style>
            body {
                padding-top: 54px;
            };




        </style>
    </head>
    <body>
        <%@include file="../../fragments/_navigation.jsp" %>

        <!-- Page Content -->
        <div class="container">

            <!--Row-->
            <div class="row mt-3">

                <!--Image-->
                <div class="col-lg-5">
                    <div class="slider slider-for" style="margin-top:0px;padding:0;" >
                        <image src="http://placehold.it/405x405"  id="mainImgLarge"/>
                        <image src="http://placehold.it/405x405"  id="subImageLarge"/>
                        <image src="http://placehold.it/405x405"  id="image1Large"/>
                        <image src="http://placehold.it/405x405"  id="image2Large"/>
                        <image src="http://placehold.it/405x405"  id="image3Large"/>
                        <image src="http://placehold.it/405x405"  id="image4Large"/>
                    </div>

                    <div class="slider slider-nav" >
                        <image src="http://placehold.it/72x72"  id="mainImg"/>
                        <image src="http://placehold.it/72x72"  id="subImage"/>
                        <image src="http://placehold.it/72x72"  id="image1"/>
                        <image src="http://placehold.it/72x72"  id="image2"/>
                        <image src="http://placehold.it/72x72"  id="image3"/>
                        <image src="http://placehold.it/72x72"  id="image4"/>
                    </div>
                </div>
                <!--Image-->

                <!--Info-->
                <div class="col-lg-7 align-middle">
                    <div class="card mt-4">
                        <div class="card-header">
                            <small class="text-muted ml-lg-3">&#9733; &#9733; &#9733; &#9733; &#9734;</small>
                            <h3 class="card-title ml-lg-3" id="productName"></h3>
                        </div>

                        <div class="card-body">
                            <div class="row">

                                <div class="form-group col-lg-5 ml-lg-4">
                                    <label for="sel1">Select Size</label>
                                    <select class="form-control" id="sel1">
                                        <option>1</option>
                                        <option>2</option>
                                        <option>3</option>
                                        <option>4</option>
                                    </select>
                                </div>

                                <div class="form-group col-lg-5 ml-lg-5">
                                    <label for="sel1">Metal</label>
                                    <select class="form-control" id="sel1">
                                        <option>1</option>
                                        <option>2</option>
                                        <option>3</option>
                                        <option>4</option>
                                    </select>
                                </div>

                                <div class="form-group col-lg-5 ml-lg-4">
                                    <label for="sel1">Diamond</label>
                                    <select class="form-control" id="sel1">
                                        <option>1</option>
                                        <option>2</option>
                                        <option>3</option>
                                        <option>4</option>
                                    </select>
                                </div>

                                <div class="form-group col-lg-5 ml-lg-5">
                                    <label for="sel1">Gemstone</label>
                                    <select class="form-control" id="sel1">
                                        <option>1</option>
                                        <option>2</option>
                                        <option>3</option>
                                        <option>4</option>
                                    </select>
                                </div>
                                <h4 id="productPrice" class='ml-lg-4 mt-4'></h4>
                            </div>
                        </div>
                        <!--card body-->

                        <div class="card-footer text-center">
                            <button class="btn btn-primary col-lg-5 m-auto">Add to Cart</button>
                            <button class="btn btn-info col-lg-3 ml-lg-5">Buy Now</button>
                        </div>
                    </div>
                </div>
                <!--Info-->

            </div>
            <!--Row-->

            <!--Detail-->
            <div class="card mt-3 mb-3">
                <div class="card-header">
                    <h4 class="card-title">Product Details</h4>
                </div>
                <div class="card-body">
                    <!--Product Info-->
                    <div class="d-flex justify-content-around bd-highlight" >
                        <div class="p-2 bd-highlight">
                            <label for="productInfo" style="color: #8863fb" class="d-block">Product Information</label>
                            <table id="productInfo">
                                <tr>
                                    <td>Width -</td>
                                    <td id="widthProduct">3 mm</td>
                                </tr>
                                <tr>
                                    <td>Height -</td>
                                    <td id="heightProduct">3 mm</td>
                                </tr>
                                <tr>
                                    <td>Weight -</td>
                                    <td id="weightProduct">3 g</td>
                                </tr>
                                <tr id="lenghtRow">
                                    <td>Length -</td>
                                    <td id="lenghtProduct">3 mm</td>
                                </tr>
                            </table>
                        </div>

                        <p id="materialProduct" class="text-info mt-lg-5 p-2 bd-highlight">Set in 18 Kt Yellow Gold(3.07 g) with diamonds (0.06 Ct ,IJ-SI)</p>
                        <div class="p-2 bd-highlight">
                            <img src="image/icon/product/packaging.jpg" width="150px" class="" alt=""/>
                        </div>
                    </div>
                    <!--/Product Info-->

                    <!--Metal Info-->
                    <div class="col-lg-12 mt-3 ml-lg-5" id="metalInfoDiv">
                        <label for="metalInfo" style="color: #8863fb" >Metal Details</label>
                        <table id="metalInfo" width="100%">
                            <thead style="border-bottom: 1px solid rgb(233, 233, 233)">
                                <tr>
                                    <th style="width: 25%">
                                        Metal Type
                                    </th>
                                    <th style="width: 10%">&nbsp;</th>
                                    <th style="width: 10%">&nbsp;</th>
                                    <th style="width: 15%">
                                        Weight
                                    </th>
                                    <th style="width: 15%">
                                        Rate
                                    </th>
                                    <th style="width: 15%">
                                        Value
                                    </th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <td id="metalType">18KT Yellow Gold</td>
                                    <td>&nbsp;</td>
                                    <td>&nbsp;</td>
                                    <td id="weightMetal">3.89g</td>
                                    <td id="rateMetal">3.163/g</td>
                                    <td class="valueMetal">12,304</td> 
                                </tr>
                                <tr>
                                    <td><strong>Total Metal Value</strong></td>
                                    <td>-</td>
                                    <td>-</td>
                                    <td>-</td>
                                    <td>-</td>
                                    <td class="valueMetal">12,304</td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                    <!--/Metal Info-->

                    <!--Diamond Info-->
                    <div class="col-lg-12 mt-3 ml-lg-5" id="diamondInfoDiv">
                        <label for="diamondInfo" style="color: #8863fb" >Diamond Details</label>
                        <table id="diamondInfo" width="100%">
                            <thead style="border-bottom: 1px solid rgb(233, 233, 233)">
                                <tr>
                                    <th style="width: 25%">
                                        Diamond Type
                                    </th>
                                    <th style="width: 10%">
                                        Count
                                    </th>
                                    <th style="width: 10%">
                                        Carat
                                    </th>
                                    <th style="width: 15%">
                                        Total Weight
                                    </th>
                                    <th style="width: 15%">
                                        Rate
                                    </th>
                                    <th style="width: 15%">
                                        Value
                                    </th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <td id="diamondType">18KT Yellow Gold</td>
                                    <td id="countDiamond">3</td>
                                    <td id="caratDiamond">3.5g</td>
                                    <td id="totalWeightDiamond">3.89</td>
                                    <td id="rateDiamond">12,304</td> 
                                    <td id="valueDiamond">12,304</td> 
                                </tr>
                                <tr>
                                    <td><strong>Total Diamond Value</strong></td>
                                    <td>-</td>
                                    <td>-</td>
                                    <td>-</td>
                                    <td>-</td>
                                    <td id="totalDiamondValue">12,304</td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                    <!--/Diamond Info-->

                    <!--Gemstone Info-->
                    <div class="col-lg-12 mt-3 ml-lg-5" id="gemstoneInfoDiv">
                        <label for="gemstoneInfo" style="color: #8863fb" >Gemstone Details</label>
                        <table id="gemstoneInfo" width="100%">
                            <thead style="border-bottom: 1px solid rgb(233, 233, 233)">
                                <tr>
                                    <th style="width: 25%">
                                        Gemstone Type
                                    </th>
                                    <th style="width: 10%">
                                        Count
                                    </th>
                                    <th style="width: 10%">
                                        Carat
                                    </th>
                                    <th style="width: 15%">
                                        Total Weight
                                    </th>
                                    <th style="width: 15%">
                                        Rate
                                    </th>
                                    <th style="width: 15%">
                                        Value
                                    </th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <td id="gemstoneType">18KT Yellow Gold</td>
                                    <td id="countGemstone">3</td>
                                    <td id="caratGemstone">3.5g</td>
                                    <td id="totalWeightGemstone">3.89</td>
                                    <td id="rateGemstone">12,304</td> 
                                    <td id="valueGemstone">12,304</td> 
                                </tr>
                                <tr>
                                    <td><strong>Total Gemstone Value</strong></td>
                                    <td>-</td>
                                    <td>-</td>
                                    <td>-</td>
                                    <td>-</td>
                                    <td id="totalGemstoneValue">12,304</td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                    <!--/Gemstone Info-->
                    <hr/>
                    <div class="col-lg-12 mt-3 ml-lg-5">
                        <table class="col-12">
                            <tr>
                                <td style="width: 25%">Grand Total</td>
                                <td style="width: 10%">-</td>
                                <td style="width: 10%">-</td>
                                <td style="width: 15%">-</td>
                                <td style="width: 15%"></td>
                                <td style="width: 15%">30000</td>
                            </tr>
                            <tr>
                                <td>Discount</td>
                                <td>-</td>
                                <td>-</td>
                                <td>-</td>
                                <td>15%</td>
                                <td>2000</td>
                            </tr>
                            <tr>
                                <td style="color: #8863fb"><strong>Final</strong></td>
                                <td>-</td>
                                <td>-</td>
                                <td>-</td>
                                <td></td>
                                <td>30000</td>
                            </tr>
                        </table>
                    </div>
                </div>
                <div class="card-footer">
                    <div class="d-flex justify-content-center bd-highlight mb-3">
                        <div class="p-2">
                            <img src="image/icon/product/check.png" alt="" style="width: 45px"/>
                            <span>Lifetime Exchange &amp; Buyback</span>
                        </div>
                        <div class="p-2">
                            <img src="image/icon/product/check.png" alt="" style="width: 45px"/>
                            <span>Lifetime Exchange &amp; Buyback</span>
                        </div>
                        <div class="p-2">
                            <img src="image/icon/product/certificate.png" alt="" style="width: 45px"/>
                            <span>Certified Jewellery</span>
                        </div>
                    </div>
                </div>
            </div>
            <!--/Detail-->

        </div>
        <!-- /.container -->

        <%@include file="../../fragments/_footer.jsp" %>

        <script src="assets/jquery/jquery.min.js" type="text/javascript"></script>
        <script src="assets/bootstrap/js/bootstrap.bundle.js" type="text/javascript"></script>
        <script src="assets/numberalJS/numeral.min.js" type="text/javascript"></script>
        <script src="assets/slick/slick.min.js" type="text/javascript"></script>
        <script src="assets/numberalJS/numeral.min.js" type="text/javascript"></script>
        <script type="text/javascript">
            var product;
            var urlParams = new URLSearchParams(window.location.search);
            var productPrice;

            function changeImage(jsonData)
            {
                $("#mainImg").attr("src", 'image/product/' + jsonData.mainImage);
                $("#subImage").attr("src", 'image/product/' + jsonData.subImage);
                $("#image1").attr("src", 'image/product/' + jsonData.image1);
                $("#image2").attr("src", 'image/product/' + jsonData.image2);
                $("#image3").attr("src", 'image/product/' + jsonData.image3);
                $("#image4").attr("src", 'image/product/' + jsonData.image4);

                $("#mainImgLarge").attr("src", 'image/product/' + jsonData.mainImage);
                $("#subImageLarge").attr("src", 'image/product/' + jsonData.subImage);
                $("#image1Large").attr("src", 'image/product/' + jsonData.image1);
                $("#image2Large").attr("src", 'image/product/' + jsonData.image2);
                $("#image3Large").attr("src", 'image/product/' + jsonData.image3);
                $("#image4Large").attr("src", 'image/product/' + jsonData.image4);
            }

            $(document).ready(function () {
                var e = $.ajax({
                    url: "/g01jewelap/api-displayproduct?name=" + urlParams.get('name'),
                    type: "get",
                    dataType: "json"
                });
                e.done(function (data) {

                    product = data;

                    changeImage(product);

                    $('#productName').text(product.productName);
                    productPrice = numeral(product.grandTotal).format('$0,0.00');
                    $("#productPrice").text(productPrice);

                    $('.slider-for').slick({
                        slidesToShow: 1,
                        slidesToScroll: 1,
                        arrows: true,
                        fade: true,
                        asNavFor: '.slider-nav'
                    });
                    $('.slider-nav').slick({
                        slidesToShow: 4,
                        slidesToScroll: 1,
                        asNavFor: '.slider-for',
                        focusOnSelect: true
                    });
                });
                e.fail(function (xhr, status) {
                    alert("Status: " + status);
                });
            });
        </script>
    </body>
</html>
