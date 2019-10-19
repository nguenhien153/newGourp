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
            }
            .selectList{
                display: none;
            }

            .listOption{
                padding-left: 0px;
            }
            .listOption img, .btn-select img{
                width: 16px;
            }

            .listOption li{              
                list-style: none;
                padding-top: 5px;
                padding-bottom: 5px;
            }

            .listOption li:hover{
                background-color: #F4F3F3;
            }

            .listOption li img{
                margin: 5px;
            }

            .listOption li  span, .btn-select li span{
                margin-left: 20px;
            }

            .b{
                display :none;
                width: 100%;
                background-color:#ffffff; 
                position:absolute;
                z-index: 1000;
                box-shadow: 0 6px 12px rgba(0,0,0,.175);
                border: 1px solid rgba(0,0,0,.15);
                border-radius: 5px  
            }

            .open{
                display: show !important;
            }

            .btn-select{
                margin-top: 10px;
                width: 100%;
                height: 34px;
                border-radius: 5px;
                background-color: #ffffff;
                border: 1px solid #ccc;
            }

            .btn-select li{
                list-style: none;
                float: left;
                padding-bottom: 0px;
            }

            .btn-select:hover li{
                margin-left: 0px;
            }

            .btn-select:hover{
                background-color: #F4F3F3;
                border: 1px solid transparent;
                box-shadow: inset 0 0px 0px 1px #ccc;
            }

            .btn-select:focus{
                outline:none;
            }

            .lang-select{
                position: relative;
            }

            /*     Toast       */
            #snackbar {
                visibility: hidden;
                min-width: 250px;
                height: 50px;
                line-height: 15px;
                margin-left: -125px;
                background-color: #333;
                color: #fff;
                text-align: center;
                border-radius: 25px;
                padding: 16px;
                position: fixed;
                z-index: 1;
                left: 50%;
                bottom: 120px;
                font-size: 20px;
            }

            #snackbar.show {
                visibility: visible;
                -webkit-animation: fadein 0.5s, fadeout 0.5s 2.5s;
                animation: fadein 0.5s, fadeout 0.5s 2.5s;
            }

            @-webkit-keyframes fadein {
                from {bottom: 0; opacity: 0;} 
                to {bottom: 120px; opacity: 1;}
            }

            @keyframes fadein {
                from {bottom: 0; opacity: 0;}
                to {bottom: 120px; opacity: 1;}
            }

            @-webkit-keyframes fadeout {
                from {bottom: 120px; opacity: 1;} 
                to {bottom: 0; opacity: 0;}
            }

            @keyframes fadeout {
                from {bottom: 120px; opacity: 1;}
                to {bottom: 0; opacity: 0;}
            }
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

                                <div class="col-lg-6">
                                    <select class="selectList" id="metalListOption">
                                    </select>
                                    <label>Metal</label>
                                    <div class="lang-select">
                                        <button class="btn-select" value="" id="metalSelected"></button>
                                        <div class="b" id="listUlMetal">
                                            <ul id="metalOption" class="listOption"></ul>
                                        </div>
                                    </div>
                                </div>

                                <div class="col-lg-6">
                                    <select class="selectList" id="diamondListOption">
                                    </select>
                                    <label>Diamond</label>
                                    <div class="lang-select">
                                        <button class="btn-select" value="" id="diamondSelected"></button>
                                        <div class="b" id="listUldiamond">
                                            <ul id="diamondOption" class="listOption"></ul>
                                        </div>
                                    </div>
                                </div>

                                <div class="col-lg-6 mt-4">
                                    <select class="selectList" id="gemstoneListOption">
                                    </select>
                                    <div class="lang-select">
                                        <label>Gemstone</label>
                                        <button class="btn-select" value="" id="gemstoneSelected"></button>
                                        <div class="b" id="listUlgemstone">
                                            <ul id="gemstoneOption" class="listOption"></ul>
                                        </div>
                                    </div>
                                </div>

                            </div>
                            <h4 id="productPrice" class='ml-lg-4 mt-4'></h4>
                        </div>
                        <!--card body-->

                        <div class="card-footer text-center">
                            <button class="btn btn-primary col-lg-5 m-auto" id="addToCart">Add to Cart</button>
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
                                <tr id="lenghtRow">
                                    <td>Length -</td>
                                    <td id="lenghtProduct">3 mm</td>
                                </tr>
                                <tr>
                                    <td>Weight -</td>
                                    <td id="weightProduct">3 g</td>
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
                    <div class="col-lg-12 mt-3 ml-lg-3" id="metalInfoDiv">
                        <label for="metalInfo" style="color: #8863fb" >Metal Details</label>
                        <table id="metalInfo" width="100%">
                            <thead style="border-bottom: 1px solid rgb(233, 233, 233)">
                                <tr>
                                    <th style="width: 25%">
                                        Metal Type
                                    </th>
                                    <th style="width: 10%">-</th>
                                    <th style="width: 10%">-</th>
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
                                    <td id="metalType">18KT Yellow Gold</td>
                                    <td>-</td>
                                    <td>-</td>
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
                                    <td class="valueMetal" style=" color: #9a4ab9;font-weight: bold">12,304</td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                    <!--/Metal Info-->

                    <!--Diamond Info-->
                    <div class="col-lg-12 mt-3 ml-lg-3" id="diamondInfoDiv">
                        <label for="diamondInfo" style="color: #8863fb" >Diamond Details</label>
                        <table id="diamondInfo" width="100%">
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
                                    <td><strong>Total Gemstone Value</strong></td>
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
                    <div class="col-lg-12 mt-3 ml-lg-3" id="gemstoneInfoDiv">
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
                                    <td id="">18KT Yellow Gold</td>
                                    <td id="">3</td>
                                    <td id="">3.5g</td>
                                    <td id="">3.89</td>
                                    <td id="">12,304</td> 
                                    <td id="">12,304</td> 
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
                    <div class="col-lg-12 mt-3 ml-lg-3">
                        <table class="col-12">
                            <tr>
                                <td style="width: 25%">Making Charges</td>
                                <td style="width: 10%">-</td>
                                <td style="width: 10%">-</td>
                                <td style="width: 15%">-</td>
                                <td style="width: 15%"></td>
                                <td style="width: 15%" id="markingCharges">30000</td>
                            </tr>
                            <tr>
                                <td style="width: 25%">Grand Total</td>
                                <td style="width: 10%">-</td>
                                <td style="width: 10%">-</td>
                                <td style="width: 15%">-</td>
                                <td style="width: 15%"></td>
                                <td style="width: 15%; color: #9a4ab9;font-weight: bold" id="grandTotalProduct">30000</td>
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
        <div id="snackbar"></div>
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
            var metalOption;
            var diamondOption;
            var gemstoneOption;
            var oldPriceMetal;
            var oldPriceDiamond;
            var oldPriceGemstone;
            var materialProduct;

            var cartMetal;
            var cartDiamond;
            var cartGemstone;
            var cartPrice;
            var cartProductName;
            function getInfoImage(arrayImage, id)
            {
                var img = $(id).attr("data-thumbnail");
                var text = id.innerText;
                var value = $(id).val();
                var item = '<li><img src="' + img + '" alt="" value="' + value + '"/><span>' + text + '</span></li>';
                arrayImage.push(item);
            }
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
            function showToast(message) {
                $("#snackbar").attr('class', 'show');
                $("#snackbar").text(message);
                setTimeout(function () {
                    $("#snackbar").attr('class', '');
                }, 3000);
            }
            function calculatePrice(old, neww)
            {
                productPrice = (productPrice - old + neww).toFixed(2);
                $("#grandTotalProduct").text(numeral(productPrice).format('$0,0.00'));
                $("#productPrice").text(numeral(productPrice).format('$0,0.00'));
                cartPrice = productPrice;
                showToast("Price changed to " + numeral(productPrice).format('$0,0.00'));
            }

            function createRowInTable(idTable, listDetails, diamondOption) {
                $(idTable + " tbody").empty();
                var wordd;
                var typee;
                listDetails.forEach(function (element) {
                    if (diamondOption.diamondType)
                    {
                        typee = diamondOption.diamondType;
                        wordd = 'Total Diamond Value';
                    } else {
                        typee = diamondOption.gemstoneType;
                        wordd = 'Total Gemstone Value';
                    }
                    var row = '<tr>' +
                            '<td id="">' + typee + '</td>' +
                            '<td id="">' + element.totalNumber + '</td>' +
                            '<td id="">' + numeral(element.carat).format('0,0.00') + ' ct' + '</td>' +
                            '<td id="">' + numeral(element.totalWeight).format('0,0.00') + ' /g' + '</td>' +
                            '<td id="">' + numeral(diamondOption.rate).format('$0,0.00') + '/ct' + '</td>' +
                            '<td id="">' + numeral((diamondOption.rate / (0.2 / element.totalWeight))).format('$0,0.00') + '</td>' +
                            '</tr>';
                    $(idTable + " tbody").prepend(row);

                });
                var row = '<tr>' +
                        '<td><strong>' + wordd + '</strong></td>' +
                        '<td>-</td>' +
                        '<td>-</td>' +
                        '<td>-</td>' +
                        '<td>-</td>' +
                        '<td style="color:#9a4ab9"><strong>' + numeral(diamondOption.price).format('$0,0.00') + '</strong></td>' +
                        '</tr>';
                $(idTable + " tbody").append(row);
            }
            $(document).ready(function () {
                var e = $.ajax({
                    url: "/g01jewelap/api-displayproduct?name=" + urlParams.get('name'),
                    type: "get",
                    dataType: "json"
                });
                e.done(function (data) {
                    product = data;

                    changeImage(product.detailView);

                    cartPrice = product.detailView.grandTotal;
                    cartProductName = product.detailView.productName;
                    cartMetal = product.metalViews[0].metalType;

                    $('#productName').text(product.detailView.productName);
                    productPrice = product.detailView.grandTotal;


                    $("#productPrice").text(numeral(product.detailView.grandTotal).format('$0,0.00'));

// Metal
                    oldPriceMetal = product.metalViews[0].price;
                    materialProduct = "Set in " + product.metalViews[0].metalType + "(" + numeral(product.metalViews[0].weight).format('0,0.00') + "/g) with ";
                    $(".valueMetal").text(numeral(oldPriceMetal).format('$0,0.00'));
                    $("#weightMetal").text(numeral(product.metalViews[0].weight).format('0,0.00') + ' g');
                    $("#rateMetal").text(numeral(product.metalViews[0].rate).format('$0,0.00') + '/g');
                    $("#metalType").text(product.metalViews[0].metalType);
                    product.metalViews.forEach(function (element) {
                        if (element.metalType.search("White") !== -1)
                        {
                            $("#metalListOption").append('<option value="' +
                                    element.metalType + '" data-thumbnail="image/icon/product/oval_white.png">' +
                                    element.metalType + '</option>');
                        }
                        if (element.metalType.search("Rose") !== -1)
                        {
                            $("#metalListOption").append('<option value="' +
                                    element.metalType + '" data-thumbnail="image/icon/product/oval_pink.png">' +
                                    element.metalType + '</option>');
                        }
                        if (element.metalType.search("Yellow") !== -1)
                        {
                            $("#metalListOption").append('<option value="' +
                                    element.metalType + '" data-thumbnail="image/icon/product/oval_yellow.png">' +
                                    element.metalType + '</option>');
                        }

                    });

                    var listImage = [];
                    $('#metalListOption option').each(function () {
                        getInfoImage(listImage, this);
                    })

                    $('#metalOption').html(listImage);

                    $('#metalSelected').html(listImage[0]);
                    $('#metalSelected').attr('value', 'en');

                    $('#metalOption li').click(function () {
                        var img = $(this).find('img').attr("src");
                        var value = $(this).find('img').attr('value');
                        var text = this.innerText;
                        var item = '<li><img src="' + img + '" alt="" /><span>' + text + '</span></li>';
                        $('#metalSelected').html(item);
                        $('#metalSelected').attr('value', value);
                        $("#listUlMetal").toggle();
                        cartMetal = value;
                        metalOption = product.metalViews.find(obj => {
                            return obj.metalType === value;
                        });

                        changeImage(metalOption);

                        $(".valueMetal").text(numeral(metalOption.price).format('$0,0.00'));
                        $("#rateMetal").text(numeral(metalOption.rate).format('$0,0.00') + '/g');
                        $("#metalType").text(metalOption.metalType);
                        calculatePrice(oldPriceMetal, metalOption.price);
                        oldPriceMetal = metalOption.price;
                        var newString = "Set in " + metalOption.metalType + "(" + numeral(metalOption.weight).format('0,0.00') + "/g) with";
                        var subString = materialProduct.split('with');
                        materialProduct = newString + subString[1];
                        $("#materialProduct").text(materialProduct);
                    });

                    $("#metalSelected").click(function () {
                        $("#listUlgemstone").toggle(false);
                        $("#listUlMetal").toggle();
                        $("#listUldiamond").toggle(false);
                    });
//End Metal             

//Diamond
                    if (product.diamondViews === undefined || product.diamondViews.length === 0)
                    {
                        $("#diamondSelected").css('display', 'none');
                        $("#diamondInfoDiv").css('display', 'none');
                    } else {
                        cartDiamond = product.diamondViews[0].diamondType;
                        materialProduct = materialProduct + "Diamonds (" + numeral(product.diamondViews[0].totalWeight).format('0,0.00') + '/g ,' + product.diamondViews[0].diamondType + ")";

                        createRowInTable('#diamondInfoDiv', product.listDiamond, product.diamondViews[0]);
                        oldPriceDiamond = product.diamondViews[0].price;
                        product.diamondViews.forEach(function (element) {
                            $("#diamondListOption").append('<option value="' +
                                    element.diamondType + '" data-thumbnail="image/icon/product/diamond.png">' +
                                    element.diamondType + '</option>');
                        });

                        listImage = [];
                        $('#diamondListOption option').each(function () {
                            getInfoImage(listImage, this);
                        })

                        $('#diamondOption').html(listImage);

                        $('#diamondSelected').html(listImage[0]);
                        $('#diamondSelected').attr('value', 'en');

                        $('#diamondOption li').click(function () {
                            var img = $(this).find('img').attr("src");
                            var value = $(this).find('img').attr('value');
                            var text = this.innerText;
                            var item = '<li><img src="' + img + '" alt="" /><span>' + text + '</span></li>';
                            $('#diamondSelected').html(item);
                            $('#diamondSelected').attr('value', value);
                            $("#listUldiamond").toggle();
                            cartDiamond = value;
                            diamondOption = product.diamondViews.find(obj => {
                                return obj.diamondType === value;
                            });
                            createRowInTable('#diamondInfoDiv', product.listDiamond, diamondOption);
                            calculatePrice(oldPriceDiamond, diamondOption.price);
                            oldPriceDiamond = diamondOption.price;

                            var newString = " with Diamonds (" + numeral(diamondOption.totalWeight).format('0,0.00') + '/g ,' + diamondOption.diamondType + ")";
                            var subString = materialProduct.split('with');
                            materialProduct = subString[0] + newString;
                            $("#materialProduct").text(materialProduct);
                        });

                        $("#diamondSelected").click(function () {
                            $("#listUlgemstone").toggle(false);
                            $("#listUlMetal").toggle(false);
                            $("#listUldiamond").toggle();
                        });
                    }
//End Diamond

//Gemstone

                    if (product.gemstoneViews === undefined || product.gemstoneViews.length === 0)
                    {
                        $("#gemstoneSelected").css('display', 'none');
                        $("#gemstoneSelected").css('display', 'none');
                    } else {
                        cartGemstone = product.gemstoneViews[0].gemstoneType;
                        createRowInTable('#gemstoneInfoDiv', product.listGemstone, product.gemstoneViews[0]);
                        oldPriceGemstone = product.gemstoneViews[0].price;
                        product.gemstoneViews.forEach(function (element) {
                            $("#gemstoneListOption").append('<option value="' +
                                    element.gemstoneType + '" data-thumbnail="image/icon/product/ruby.png">' +
                                    element.gemstoneType + '</option>');
                        });

                        listImage = [];
                        $('#gemstoneListOption option').each(function () {
                            getInfoImage(listImage, this);
                        })

                        $('#gemstoneOption').html(listImage);

                        $('#gemstoneSelected').html(listImage[0]);
                        $('#gemstoneSelected').attr('value', 'en');

                        $('#gemstoneOption li').click(function () {
                            var img = $(this).find('img').attr("src");
                            var value = $(this).find('img').attr('value');
                            var text = this.innerText;
                            var item = '<li><img src="' + img + '" alt="" /><span>' + text + '</span></li>';
                            $('#gemstoneSelected').html(item);
                            $('#gemstoneSelected').attr('value', value);
                            $("#listUlgemstone").toggle();

                            gemstoneOption = product.gemstoneViews.find(obj => {
                                return obj.gemstoneType === value;
                            });
                            cartDiamond = value;
                            createRowInTable('#gemstoneInfoDiv', product.listGemstone, gemstoneOption);
                            calculatePrice(oldPriceGemstone, gemstoneOption.price);
                            oldPriceGemstone = gemstoneOption.price;
                        });

                        $("#gemstoneSelected").click(function () {
                            $("#listUlgemstone").toggle();
                            $("#listUlMetal").toggle(false);
                            $("#listUldiamond").toggle(false);
                        });
                    }
//End Diamond

//Product Information

                    $("#widthProduct").text(numeral(product.detailView.width).format('0,0.00') + ' mm');
                    $("#heightProduct").text(numeral(product.detailView.height).format('0,0.00') + ' mm');
                    $("#weightProduct").text(numeral(product.detailView.weightProduct).format('0,0.00') + ' g');
                    $("#lenghtProduct").text(numeral(product.detailView.lenght).format('0,0.00') + ' mm');
                    $("#markingCharges").text(numeral(product.detailView.makingCharges).format('$0,0.00'));
                    $("#materialProduct").text(materialProduct);
                    $("#grandTotalProduct").text(numeral(productPrice).format('$0,0.00'));
//End Product Information

                    $("#addToCart").click(function () {
                        var v = $.ajax({
                            url: "/g01jewelap/api-displayproduct",
                            type: "post",
                            contentType: "text/html; charset=UTF-8",
                            data: {productName: cartProductName, diamond: cartDiamond, metal: cartMetal
                                , gemstone: cartGemstone, price: cartPrice}
                        });
                        v.done(function (data) {
                            alert(data);
                        });
                        v.fail(function (xhr, status) {
                            alert("Status: " + status);
                        });
                    });


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
