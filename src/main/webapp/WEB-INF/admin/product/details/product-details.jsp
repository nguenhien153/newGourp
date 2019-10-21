
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<c:url var="productSup" value="${metalType.metalTypeName}"/>
<c:url var="idPk" value="${metalType.id}"/>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Category Page</title>
        <link href="../assets/css/admin/sb-admin.min.css" rel="stylesheet" type="text/css"/>
        <link href="../assets/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css"/>
        <link href="../assets/datatables/dataTables.bootstrap4.css" rel="stylesheet" type="text/css"/>
        <link href="../assets/datatables/buttons.dataTables.min.css" rel="stylesheet" type="text/css"/>
        <link href="../assets/datatables/select.dataTables.min.css" rel="stylesheet" type="text/css"/>
        <style>
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
    <body id="page-top">
        <%@include file="../../../fragments/admin/navigation.jsp" %>



        <div id="wrapper">
            <!-- Sidebar -->
            <%@include file="../../../fragments/admin/slidebar.jsp" %>
            <div id="content-wrapper">
                <div class="container-fluid">
                    <div class="card mb-3">
                        <div class="card-header" id="productName">
                        </div>
                        <div class="card-body">

                            <!--Metal Table-->
                            <div class="card">
                                <div class="card-header">
                                    <button class="btn btn-primary" type="button" data-toggle="collapse" 
                                            data-target="#metalCollapse" aria-expanded="false"
                                            aria-controls="metalCollapse">
                                        <i class="fas fa-table"></i>
                                        Metal Details Table
                                    </button>
                                </div>
                                <div class="card-body collapse" id="metalCollapse">
                                    <div class="table-responsive">
                                        <table id="metalTable" class="table table-bordered" width="100%" cellspacing="0">
                                            <thead>
                                                <tr>
                                                    <th>ID</th>
                                                    <th>Weight</th>
                                                    <th>Date Create</th>
                                                    <th>Create By</th>
                                                    <th>Date Modify</th>
                                                    <th>Modify By</th>
                                                </tr>
                                            </thead>
                                            <tfoot>
                                                <tr>
                                                    <th>ID</th>
                                                    <th>Weight</th>
                                                    <th>Date Create</th>
                                                    <th>Create By</th>
                                                    <th>Date Modify</th>
                                                    <th>Modify By</th>
                                                </tr>
                                            </tfoot>
                                        </table>
                                    </div>
                                </div>
                            </div>
                            <!--/End Metal Table-->

                            <!--Diamond Table-->
                            <div class="card mt-4">
                                <div class="card-header">
                                    <button class="btn btn-primary" type="button" data-toggle="collapse" 
                                            data-target="#diamondCollapse" aria-expanded="false"
                                            aria-controls="diamondCollapse">
                                        <i class="fas fa-table"></i>
                                        Diamond Details Table
                                    </button>
                                </div>
                                <div class="card-body collapse" id="diamondCollapse">
                                    <div class="table-responsive">
                                        <table id="diamondTable" class="table table-bordered" width="100%" cellspacing="0">
                                            <thead>
                                                <tr>
                                                    <th>ID</th>
                                                    <th>Carat</th>
                                                    <th>Total Number</th>
                                                    <th>Total Weight</th>
                                                    <th>Date Create</th>
                                                    <th>Create By</th>
                                                    <th>Date Modify</th>
                                                    <th>Modify By</th>
                                                </tr>
                                            </thead>
                                            <tfoot>
                                                <tr>
                                                    <th>ID</th>
                                                    <th>Carat</th>
                                                    <th>Total Number</th>
                                                    <th>Total Weight</th>
                                                    <th>Date Create</th>
                                                    <th>Create By</th>
                                                    <th>Date Modify</th>
                                                    <th>Modify By</th>
                                                </tr>
                                            </tfoot>
                                        </table>
                                    </div>
                                </div>
                            </div>
                            <!--/End Metal Table-->

                            <!--Gemstone Table-->
                            <div class="card mt-4">
                                <div class="card-header">
                                    <button class="btn btn-primary" type="button" data-toggle="collapse" 
                                            data-target="#gemstoneCollapse" aria-expanded="false"
                                            aria-controls="gemstoneCollapse">
                                        <i class="fas fa-table"></i>
                                        Gemstone Details Table
                                    </button>
                                </div>
                                <div class="card-body collapse" id="gemstoneCollapse">
                                    <div class="table-responsive">
                                        <table id="GemstoneTable" class="table table-bordered" width="100%" cellspacing="0">
                                            <thead>
                                                <tr>
                                                    <th>ID</th>
                                                    <th>Width</th>
                                                    <th>Length</th>
                                                    <th>Carat</th>
                                                    <th>Total Number</th>
                                                    <th>Total Weight</th>
                                                    <th>Date Create</th>
                                                    <th>Create By</th>
                                                    <th>Date Modify</th>
                                                    <th>Modify By</th>
                                                </tr>
                                            </thead>
                                            <tfoot>
                                                <tr>
                                                    <th>ID</th>
                                                    <th>Width</th>
                                                    <th>Length</th>
                                                    <th>Carat</th>
                                                    <th>Total Number</th>
                                                    <th>Total Weight</th>
                                                    <th>Date Create</th>
                                                    <th>Create By</th>
                                                    <th>Date Modify</th>
                                                    <th>Modify By</th>
                                                </tr>
                                            </tfoot>
                                        </table>
                                    </div>
                                </div>
                            </div>
                            <!--/End Gemstone Table-->

                            <!--Image Table-->
                            <div class="card mt-4">
                                <div class="card-header">
                                    <button class="btn btn-primary" type="button" data-toggle="collapse" 
                                            data-target="#imageCollapse" aria-expanded="false"
                                            aria-controls="imageCollapse">
                                        <i class="fas fa-table"></i>
                                        Image Details Table
                                    </button>
                                </div>
                                <div class="card-body collapse" id="imageCollapse">
                                    <div class="table-responsive">
                                        <table id="imageTable" class="table table-bordered" width="100%" cellspacing="0">
                                            <thead>
                                                <tr>
                                                    <th>ID</th>
                                                    <th>Main Image</th>
                                                    <th>Sub Image</th>
                                                    <th>Image 1</th>
                                                    <th>Image 2</th>
                                                    <th>Image 3</th>
                                                    <th>Image 4</th>
                                                    <th>Date Create</th>
                                                    <th>Create By</th>
                                                    <th>Date Modify</th>
                                                    <th>Modify By</th>
                                                </tr>
                                            </thead>
                                            <tfoot>
                                                <tr>
                                                    <th>ID</th>
                                                    <th>Main Image</th>
                                                    <th>Sub Image</th>
                                                    <th>Image 1</th>
                                                    <th>Image 2</th>
                                                    <th>Image 3</th>
                                                    <th>Image 4</th>
                                                    <th>Date Create</th>
                                                    <th>Create By</th>
                                                    <th>Date Modify</th>
                                                    <th>Modify By</th>
                                                </tr>
                                            </tfoot>
                                        </table>
                                    </div>
                                </div>
                            </div>
                            <!--/End Image Table-->

                        </div>
                        <div class="card-footer small text-muted">Updated yesterday at 11:59 PM</div>
                    </div>

                </div>
                <%@include file="../../../fragments/admin/footer.jsp" %>
            </div>

            <!-- Metal modal -->
            <div class="modal fade" id="formModalMetal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                <div class="modal-dialog" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="exampleModalLabel">Create Form</h5>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>
                        <form method="post" action="<c:url value="/manager/metal-details"/>" id="formInModal" autocomplete="off">
                            <div class="modal-body">
                                <div class="form-group">
                                    <input type="hidden" value="${idMetal}" name="id" id="idMetal"/>
                                    <input type="hidden" value="${productNameMetal}" name="productName" class="productName"/>
                                    <div class="form-label-group">
                                        <input type="text" id="inputWeightMetal" class="form-control" placeholder="Metal Weight"
                                               required="required" maxlength="50" title="Lenght: 10 number (Can contain 2 deciaml places)" name="weight"
                                               pattern="^[0-9]{1,10}(\.[0-9]{1,2})?$" value="${weightMetal}">
                                        <label for="inputWeightMetal">Metal Weight</label>
                                    </div>  
                                </div>
                            </div>
                            <div class="modal-footer">
                                <button type="submit" class="btn btn-primary buttonForm">Create</button>
                                <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>

            <div class="modal fade" id="deleteModalMetal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                <div class="modal-dialog" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="exampleModalLabel">Delete Confirm</h5>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>
                        <div class="modal-body">
                            <div class="alert-warning rounded-pill text-center">
                                <p id="textDeleteFormMetal" style="font-weight: bold; font-size: 16px"></p>
                            </div>
                        </div>
                        <div class="modal-footer">
                            <form method="get" action="<c:url value="/manager/metal-details"/>"/>
                            <input name="id" id="idDeleteFormMetal" type="hidden"/>
                            <button type="submit" class="btn btn-primary">Yes</button>
                            </form>
                            <button type="button" class="btn btn-secondary" data-dismiss="modal">No</button>
                        </div>
                    </div>
                </div>
            </div>
            <!--End Metal Modal -->

            <!-- Diamond modal -->
            <div class="modal fade" id="formModalDiamond" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                <div class="modal-dialog" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="exampleModalLabel">Create Form</h5>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>
                        <form method="post" action="<c:url value="/manager/diamond-details"/>"  autocomplete="off">
                            <div class="modal-body">
                                <div class="form-group">
                                    <input type="hidden" value="" name="id" id="idDiamond"/>
                                    <input type="hidden" value="" name="productName" class="productName"/>
                                    <div class="form-label-group">
                                        <input type="text" id="inputCaratDiamond" class="form-control" placeholder="Carat"
                                               required="required" title="Lenght: 5 number (Can contain 3 deciaml places)" name="carat"
                                               pattern="^[0-9]{1,5}(\.[0-9]{1,3})?$" value="">
                                        <label for="inputCaratDiamond">Carat</label>
                                    </div>
                                    <div class="form-label-group mt-4">
                                        <input type="text" id="inputTotalNumber" class="form-control" placeholder="Total Number"
                                               required="required" title="Lenght: 5 number" name="totalNumber"
                                               pattern="^[0-9]{1,5}$" value="">
                                        <label for="inputTotalNumber">Total Number</label>
                                    </div> 
                                </div>
                            </div>
                            <div class="modal-footer">
                                <button type="submit" class="btn btn-primary buttonForm">Create</button>
                                <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>

            <div class="modal fade" id="deleteModalDiamond" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                <div class="modal-dialog" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="exampleModalLabel">Delete Confirm</h5>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>
                        <div class="modal-body">
                            <div class="alert-warning rounded-pill text-center">
                                <p id="textDeleteFormDiamond" style="font-weight: bold; font-size: 16px"></p>
                            </div>
                        </div>
                        <div class="modal-footer">
                            <form method="get" action="<c:url value="/manager/diamond-details"/>"/>
                            <input name="id" id="idDeleteFormDiamond" type="hidden"/>
                            <button type="submit" class="btn btn-primary">Yes</button>
                            </form>
                            <button type="button" class="btn btn-secondary" data-dismiss="modal">No</button>
                        </div>
                    </div>
                </div>
            </div>
            <!--End Metal Modal -->

            <!-- Gemstone modal -->
            <div class="modal fade" id="formModalGemstone" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                <div class="modal-dialog" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="exampleModalLabel">Create Form</h5>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>
                        <form method="post" action="<c:url value="/manager/gemstone-details"/>"  autocomplete="off">
                            <div class="modal-body">
                                <div class="form-group">
                                    <input type="hidden" value="" name="id" id="idGemstone"/>
                                    <input type="hidden" value="" name="productName" class="productName"/>
                                    <div class="form-label-group">
                                        <input type="text" id="inputWidthGemstone" class="form-control" placeholder="Width"
                                               required="required" title="Lenght: 5 number (Can contain 2 deciaml places)" name="width"
                                               pattern="^[0-9]{1,5}(\.[0-9]{1,2})?$" value="">
                                        <label for="inputWidthGemstone">Width</label>
                                    </div>
                                    <div class="form-label-group mt-4">
                                        <input type="text" id="inputLenghtGemstone" class="form-control" placeholder="Lenght"
                                               required="required" title="Lenght: 5 number (Can contain 2 deciaml places)" name="lenght"
                                               pattern="^[0-9]{1,5}(\.[0-9]{1,2})?$" value="">
                                        <label for="inputLenghtGemstone">Lenght</label>
                                    </div>
                                    <div class="form-label-group mt-4">
                                        <input type="text" id="inputCaratGemstone" class="form-control" placeholder="Carat"
                                               required="required" title="Lenght: 5 number (Can contain 3 deciaml places)" name="carat"
                                               pattern="^[0-9]{1,5}(\.[0-9]{1,3})?$" value="">
                                        <label for="inputCaratGemstone">Carat</label>
                                    </div>
                                    <div class="form-label-group mt-4">
                                        <input type="text" id="inputTotalNumberGemstone" class="form-control" placeholder="Total Number"
                                               required="required" title="Lenght: 5 number" name="totalNumber"
                                               pattern="^[0-9]{1,5}$" value="">
                                        <label for="inputTotalNumberGemstone">Total Number</label>
                                    </div> 
                                </div>
                            </div>
                            <div class="modal-footer">
                                <button type="submit" class="btn btn-primary buttonForm">Create</button>
                                <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>

            <div class="modal fade" id="deleteModalGemstone" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                <div class="modal-dialog" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="">Delete Confirm</h5>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>
                        <div class="modal-body">
                            <div class="alert-warning rounded-pill text-center">
                                <p id="textDeleteFormGemstone" style="font-weight: bold; font-size: 16px"></p>
                            </div>
                        </div>
                        <div class="modal-footer">
                            <form method="get" action="<c:url value="/manager/gemstone-details"/>"/>
                            <input name="id" id="idDeleteFormGemstone" type="hidden"/>
                            <button type="submit" class="btn btn-primary">Yes</button>
                            </form>
                            <button type="button" class="btn btn-secondary" data-dismiss="modal">No</button>
                        </div>
                    </div>
                </div>
            </div>
            <!--End Metal Modal -->

            <!-- Gemstone modal -->
            <div class="modal fade" id="formModalImage" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                <div class="modal-dialog" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="exampleModalLabel">Create Form</h5>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>
                        <form method="post" action="<c:url value="/manager/image"/>"  autocomplete="off">
                            <div class="modal-body">
                                <div class="form-group">
                                    <input type="hidden" value="" name="id" id="idImage"/>
                                    <input type="hidden" value="" name="productName" class="productName"/>
                                    <div class="form-group d-flex justify-content-center align-items-center">
                                        <img id="mainImage" src="" style="width: 100px"/>
                                        <label for="inputMainImage"><strong>Main Image</strong></label>
                                        <input type="file" id="inputMainImage" class="form-control-file" 
                                               required="required"  name="mainImage"  value="">
                                    </div>
                                </div>
                            </div>
                            <div class="modal-footer">
                                <button type="submit" class="btn btn-primary buttonForm">Create</button>
                                <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>

            <div class="modal fade" id="deleteModalImage" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                <div class="modal-dialog" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="">Delete Confirm</h5>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>
                        <div class="modal-body">
                            <div class="alert-warning rounded-pill text-center">
                                <p id="textDeleteFormImage" style="font-weight: bold; font-size: 16px"></p>
                            </div>
                        </div>
                        <div class="modal-footer">
                            <form method="get" action="<c:url value="/manager/image"/>"/>
                            <input name="id" id="idDeleteFormImage" type="hidden"/>
                            <button type="submit" class="btn btn-primary">Yes</button>
                            </form>
                            <button type="button" class="btn btn-secondary" data-dismiss="modal">No</button>
                        </div>
                    </div>
                </div>
            </div>
            <!--End Metal Modal -->

            <div id="snackbar"></div>
            <script src="../assets/jquery/jquery.min.js" type="text/javascript"></script>       
            <script src="../assets/bootstrap/js/bootstrap.bundle.min.js" type="text/javascript"></script>
            <script src="../assets/jquery-easing/jquery.easing.min.js" type="text/javascript"></script>

            <script src="../assets/datatables/jquery.dataTables.js" type="text/javascript"></script>
            <script src="../assets/datatables/dataTables.bootstrap4.js" type="text/javascript"></script>
            <script src="../assets/datatables/dataTables.buttons.min.js" type="text/javascript"></script>
            <script src="../assets/datatables/dataTables.select.min.js" type="text/javascript"></script>
            <script src="../assets/numberalJS/numeral.min.js" type="text/javascript"></script>
            <script src="../assets/js/admin/sb-admin.min.js" type="text/javascript"></script>

            <script type="text/javascript">
                function showToast(message) {
                    $("#snackbar").attr('class', 'show');
                    $("#snackbar").text(message);
                    setTimeout(function () {
                        $("#snackbar").attr('class', '');
                    }, 3000);
                }
                function readURL(input, Idimg) {
                    if (input.files && input.files[0]) {
                        var reader = new FileReader();

                        reader.onload = function (e) {
                            $(Idimg).attr('src', e.target.result);
                        }

                        reader.readAsDataURL(input.files[0]);
                    }
                }
                $(document).ready(function () {

                    $("#inputMainImage").change(function () {
                        readURL(this, "#mainImage");
                    });


                    var urlParams = new URLSearchParams(window.location.search);

                    var idProduct = urlParams.get("id");
                    var e = $.ajax({
                        url: "/g01jewelap/api-product-details?id=" + idProduct,
                        type: "get",
//                    contentType: "application/json; charset=utf-8", //application/html;charset=utf-8
                        dataType: "JSON"
                    });

                    e.done(function (data) {
                        $("#productName").text(data.productName);
//Metal Table
                        if (urlParams.get("successCreateMetal") !== null) {
                            $('#metalCollapse').collapse({
                                toggle: true
                            })
                            showToast("Create Metal Details Success");
                        }
                        if (urlParams.get("failCreateMetal") !== null) {
                            $('#metalCollapse').collapse({
                                toggle: true
                            })
                            showToast("Create Metal Details Faile");
                        }
                        if (urlParams.get("successEditMetal") !== null) {
                            $('#metalCollapse').collapse({
                                toggle: true
                            })
                            showToast("Edit Metal Details Success");
                        }
                        if (urlParams.get("successRemoveMetal") !== null) {
                            $('#metalCollapse').collapse({
                                toggle: true
                            })
                            showToast("Remove Metal Details Success");
                        }

                        var metals = data.metals;
                        $("#metalTable").DataTable({
                            data: metals,
                            select: true,
                            "columns": [
                                {
                                    "data": "id",
                                    "className": "align-middle",
                                    "render": function (id) {
                                        return id;
                                    }
                                },
                                {
                                    "data": "weight",
                                    "className": "align-middle",
                                    "render": function (weight) {
                                        return numeral(weight).format('0,0.00') + "/g";
                                    }
                                },
                                {
                                    "data": "dateCreate",
                                    "className": "align-middle",
                                    "render": function (dateCreate) {
                                        var date = new Date(dateCreate);
                                        return date.getDate() + "/" + (date.getMonth() + 1) + "/" + date.getFullYear();
                                    }
                                },
                                {
                                    "data": "createBy",
                                    "className": "align-middle",
                                    "render": function (createBy) {
                                        return createBy;
                                    }
                                },
                                {
                                    "data": "dateModify",
                                    "className": "align-middle",
                                    "render": function (dateModify) {
                                        if (dateModify !== null) {
                                            var date = new Date(dateModify);
                                            return date.getDate() + "/" + (date.getMonth() + 1) + "/" + date.getFullYear();
                                        } else {
                                            return dateModify;
                                        }
                                    }
                                },
                                {
                                    "data": "modifyBy",
                                    "className": "align-middle",
                                    "render": function (modifyBy) {
                                        return modifyBy;
                                    }
                                }
                            ],
                            dom: 'Bfrtip',
                            buttons: [
                                {
                                    text: 'Add',
                                    attr: {
                                        'data-toggle': 'modal',
                                        'data-target': '#formModalMetal'
                                    },
                                    action: function (e, dt, node, config) {

                                        $("#inputWeightMetal").val('');
                                        $("#idMetal").val('');
                                        $(".productName").val(data.productName);
                                        $(".buttonForm").text("Create");

                                    }
                                },
                                {
                                    text: 'Edit',
                                    action: function (e, dt, node, config) {
                                        try {
                                            var weight = dt.row({selected: true}).data().weight;
                                            var id = dt.row({selected: true}).data().id;
                                            $("#formModalMetal").modal("show");
                                            $("#inputWeightMetal").val(weight);
                                            $("#idMetal").val(id);
                                            $(".productName").val(data.productName);
                                            $(".buttonForm").text("Edit");
                                        } catch (err) {
                                            alert('Please Select One Row');
                                        }
                                    }
                                },
                                {
                                    text: 'Delete',
                                    action: function (e, dt, node, config) {
                                        try {
                                            var id = dt.row({selected: true}).data().id;
                                            $("#deleteModalMetal").modal("show");
                                            $("#textDeleteFormMetal").text("Are you sure to remove the Metal details with Id:" + id + " ?");
                                            $("#idDeleteFormMetal").val(id);
                                        } catch (err) {
                                            alert('Please Select One Row');
                                        }
                                    }
                                }
                            ]
                        });
//End Metal Table 

//Diamond Table
                        if (urlParams.get("successCreateDiamond") !== null) {
                            $('#diamondCollapse').collapse({
                                toggle: true
                            })
                            showToast("Create Diamond Details Success");
                        }
                        if (urlParams.get("successEditDiamond") !== null) {
                            $('#diamondCollapse').collapse({
                                toggle: true
                            })
                            showToast("Edit Diamond Details Success");
                        }
                        if (urlParams.get("successRemoveDiamond") !== null) {
                            $('#diamondCollapse').collapse({
                                toggle: true
                            })
                            showToast("Remove Diamond Details Success");
                        }

                        $("#diamondTable").DataTable({
                            data: data.diamonds,
                            select: true,
                            "columns": [
                                {
                                    "data": "id",
                                    "className": "align-middle",
                                    "render": function (id) {
                                        return id;
                                    }
                                },
                                {
                                    "data": "carat",
                                    "className": "align-middle",
                                    "render": function (carat) {
                                        return numeral(carat).format('0,0.00') + " ct";
                                    }
                                },
                                {
                                    "data": "totalNumber",
                                    "className": "align-middle",
                                    "render": function (totalNumber) {
                                        return totalNumber;
                                    }
                                },
                                {
                                    "data": "totalWeight",
                                    "className": "align-middle",
                                    "render": function (totalWeight) {
                                        return numeral(totalWeight).format('0,0.00') + " /g";
                                    }
                                },
                                {
                                    "data": "dateCreate",
                                    "className": "align-middle",
                                    "render": function (dateCreate) {
                                        var date = new Date(dateCreate);
                                        return date.getDate() + "/" + (date.getMonth() + 1) + "/" + date.getFullYear();
                                    }
                                },
                                {
                                    "data": "createBy",
                                    "className": "align-middle",
                                    "render": function (createBy) {
                                        return createBy;
                                    }
                                },
                                {
                                    "data": "dateModify",
                                    "className": "align-middle",
                                    "render": function (dateModify) {
                                        if (dateModify !== null) {
                                            var date = new Date(dateModify);
                                            return date.getDate() + "/" + (date.getMonth() + 1) + "/" + date.getFullYear();
                                        } else {
                                            return dateModify;
                                        }
                                    }
                                },
                                {
                                    "data": "modifyBy",
                                    "className": "align-middle",
                                    "render": function (modifyBy) {
                                        return modifyBy;
                                    }
                                }
                            ],
                            dom: 'Bfrtip',
                            buttons: [
                                {
                                    text: 'Add',
                                    attr: {
                                        'data-toggle': 'modal',
                                        'data-target': '#formModalDiamond'
                                    },
                                    action: function (e, dt, node, config) {
                                        $("#inputCaratDiamond").val('');
                                        $("#inputTotalNumber").val('');
                                        $("#idDiamond").val('');
                                        $(".productName").val(data.productName);
                                        $(".buttonForm").text("Create");
                                    }
                                },
                                {
                                    text: 'Edit',
                                    action: function (e, dt, node, config) {
                                        try {
                                            var carat = dt.row({selected: true}).data().carat;
                                            var totalNumber = dt.row({selected: true}).data().totalNumber;
                                            var id = dt.row({selected: true}).data().id;
                                            $("#formModalDiamond").modal("show");
                                            $("#inputCaratDiamond").val(carat);
                                            $("#inputTotalNumber").val(totalNumber);
                                            $("#idDiamond").val(id);
                                            $(".productName").val(data.productName);
                                            $(".buttonForm").text("Edit");
                                        } catch (err) {
                                            alert('Please Select One Row');
                                        }
                                    }
                                },
                                {
                                    text: 'Delete',
                                    action: function (e, dt, node, config) {
                                        try {
                                            var id = dt.row({selected: true}).data().id;
                                            $("#deleteModalDiamond").modal("show");
                                            $("#textDeleteFormDiamond").text("Are you sure to remove the Diamond details with Id:" + id + " ?");
                                            $("#idDeleteFormDiamond").val(id);
                                        } catch (err) {
                                            alert('Please Select One Row');
                                        }
                                    }
                                }
                            ]
                        });
//End Diamond Table

//Gemstone Table

                        if (urlParams.get("successCreateGemstone") !== null) {
                            $('#gemstoneCollapse').collapse({
                                toggle: true
                            })
                            showToast("Create Gemstone Details Success");
                        }
                        if (urlParams.get("successEditGemstone") !== null) {
                            $('#gemstoneCollapse').collapse({
                                toggle: true
                            })
                            showToast("Edit Gemstone Details Success");
                        }
                        if (urlParams.get("successRemoveGemstone") !== null) {
                            $('#gemstoneCollapse').collapse({
                                toggle: true
                            })
                            showToast("Remove Gemstone Details Success");
                        }
                        $("#GemstoneTable").DataTable({
                            data: data.gemstones,
                            select: true,
                            "columns": [
                                {
                                    "data": "id",
                                    "className": "align-middle",
                                    "render": function (id) {
                                        return id;
                                    }
                                },
                                {
                                    "data": "width",
                                    "className": "align-middle",
                                    "render": function (width) {
                                        return numeral(width).format('0,0.00') + " mm";
                                    }
                                },
                                {
                                    "data": "lenght",
                                    "className": "align-middle",
                                    "render": function (lenght) {
                                        return numeral(lenght).format('0,0.00') + " mm";
                                    }
                                },
                                {
                                    "data": "carat",
                                    "className": "align-middle",
                                    "render": function (carat) {
                                        return numeral(carat).format('0,0.00') + " ct";
                                    }
                                },
                                {
                                    "data": "totalNumber",
                                    "className": "align-middle",
                                    "render": function (totalNumber) {
                                        return totalNumber;
                                    }
                                },
                                {
                                    "data": "totalWeight",
                                    "className": "align-middle",
                                    "render": function (totalWeight) {
                                        return numeral(totalWeight).format('0,0.00') + " /g";
                                    }
                                },
                                {
                                    "data": "dateCreate",
                                    "className": "align-middle",
                                    "render": function (dateCreate) {
                                        var date = new Date(dateCreate);
                                        return date.getDate() + "/" + (date.getMonth() + 1) + "/" + date.getFullYear();
                                    }
                                },
                                {
                                    "data": "createBy",
                                    "className": "align-middle",
                                    "render": function (createBy) {
                                        return createBy;
                                    }
                                },
                                {
                                    "data": "dateModify",
                                    "className": "align-middle",
                                    "render": function (dateModify) {
                                        if (dateModify !== null) {
                                            var date = new Date(dateModify);
                                            return date.getDate() + "/" + (date.getMonth() + 1) + "/" + date.getFullYear();
                                        } else {
                                            return dateModify;
                                        }
                                    }
                                },
                                {
                                    "data": "modifyBy",
                                    "className": "align-middle",
                                    "render": function (modifyBy) {
                                        return modifyBy;
                                    }
                                }
                            ],
                            dom: 'Bfrtip',
                            buttons: [
                                {
                                    text: 'Add',
                                    attr: {
                                        'data-toggle': 'modal',
                                        'data-target': '#formModalGemstone'
                                    },
                                    action: function (e, dt, node, config) {
                                        $("#inputWidthGemstone").val('');
                                        $("#inputLenghtGemstone").val('');
                                        $("#inputCaratGemstone").val('');
                                        $("#inputTotalNumberGemstone").val('');
                                        $("#idGemstone").val('');
                                        $(".productName").val(data.productName);
                                        $(".buttonForm").text("Create");
                                    }
                                },
                                {
                                    text: 'Edit',
                                    action: function (e, dt, node, config) {
                                        try {
                                            var width = dt.row({selected: true}).data().width;
                                            var lenght = dt.row({selected: true}).data().lenght;
                                            var carat = dt.row({selected: true}).data().carat;
                                            var totalNumber = dt.row({selected: true}).data().totalNumber;
                                            var id = dt.row({selected: true}).data().id;
                                            $("#formModalGemstone").modal("show");
                                            $("#inputWidthGemstone").val(width);
                                            $("#inputLenghtGemstone").val(lenght);
                                            $("#inputCaratGemstone").val(carat);
                                            $("#inputTotalNumberGemstone").val(totalNumber);
                                            $("#idGemstone").val(id);
                                            $(".productName").val(data.productName);
                                            $(".buttonForm").text("Edit");
                                        } catch (err) {
                                            alert('Please Select One Row');
                                        }
                                    }
                                },
                                {
                                    text: 'Delete',
                                    action: function (e, dt, node, config) {
                                        try {
                                            var id = dt.row({selected: true}).data().id;
                                            $("#deleteModalGemstone").modal("show");
                                            $("#textDeleteFormGemstone").text("Are you sure to remove the Gemstone details with Id:" + id + " ?");
                                            $("#idDeleteFormGemstone").val(id);
                                        } catch (err) {
                                            alert('Please Select One Row');
                                        }
                                    }
                                }
                            ]
                        });

//End Gemstone Table

//Image Table

                        if (urlParams.get("successCreateImage") !== null) {
                            $('#imageCollapse').collapse({
                                toggle: true
                            })
                            showToast("Create Image Details Success");
                        }
                        if (urlParams.get("successEditImage") !== null) {
                            $('#imageCollapse').collapse({
                                toggle: true
                            })
                            showToast("Edit Image Details Success");
                        }
                        if (urlParams.get("successRemoveImage") !== null) {
                            $('#imageCollapse').collapse({
                                toggle: true
                            })
                            showToast("Remove Image Details Success");
                        }

                        $("#imageTable").DataTable({
                            data: data.images,
                            select: true,
                            "columns": [
                                {
                                    "data": "id",
                                    "className": "align-middle",
                                    "render": function (id) {
                                        return id;
                                    }
                                },
                                {
                                    "data": "mainImage",
                                    "className": "align-middle",
                                    "render": function (mainImage) {
                                        return mainImage;
                                    }
                                },
                                {
                                    "data": "subImage",
                                    "className": "align-middle",
                                    "render": function (subImage) {
                                        return subImage;
                                    }
                                },
                                {
                                    "data": "image1",
                                    "className": "align-middle",
                                    "render": function (image1) {
                                        return image1;
                                    }
                                },
                                {
                                    "data": "image2",
                                    "className": "align-middle",
                                    "render": function (image2) {
                                        return image2;
                                    }
                                },
                                {
                                    "data": "image3",
                                    "className": "align-middle",
                                    "render": function (image3) {
                                        return image3;
                                    }
                                },
                                {
                                    "data": "image4",
                                    "className": "align-middle",
                                    "render": function (image4) {
                                        return image4;
                                    }
                                },
                                {
                                    "data": "dateCreate",
                                    "className": "align-middle",
                                    "render": function (dateCreate) {
                                        var date = new Date(dateCreate);
                                        return date.getDate() + "/" + (date.getMonth() + 1) + "/" + date.getFullYear();
                                    }
                                },
                                {
                                    "data": "createBy",
                                    "className": "align-middle",
                                    "render": function (createBy) {
                                        return createBy;
                                    }
                                },
                                {
                                    "data": "dateModify",
                                    "className": "align-middle",
                                    "render": function (dateModify) {
                                        if (dateModify !== null) {
                                            var date = new Date(dateModify);
                                            return date.getDate() + "/" + (date.getMonth() + 1) + "/" + date.getFullYear();
                                        } else {
                                            return dateModify;
                                        }
                                    }
                                },
                                {
                                    "data": "modifyBy",
                                    "className": "align-middle",
                                    "render": function (modifyBy) {
                                        return modifyBy;
                                    }
                                }
                            ],
                            dom: 'Bfrtip',
                            buttons: [
                                {
                                    text: 'Add',
                                    attr: {
                                        'data-toggle': 'modal',
                                        'data-target': '#formModalImage'
                                    },
                                    action: function (e, dt, node, config) {
                                        $("#inputMainImage").val('');

                                        $("#idImage").val('');
                                        $(".productName").val(data.productName);
                                        $(".buttonForm").text("Create");
                                    }
                                },
                                {
                                    text: 'Edit',
                                    action: function (e, dt, node, config) {
                                        try {
                                            var width = dt.row({selected: true}).data().width;
                                            var lenght = dt.row({selected: true}).data().lenght;
                                            var carat = dt.row({selected: true}).data().carat;
                                            var totalNumber = dt.row({selected: true}).data().totalNumber;
                                            var id = dt.row({selected: true}).data().id;
                                            $("#formModalGemstone").modal("show");
                                            $("#inputWidthGemstone").val(width);
                                            $("#inputLenghtGemstone").val(lenght);
                                            $("#inputCaratGemstone").val(carat);
                                            $("#inputTotalNumberGemstone").val(totalNumber);
                                            $("#idGemstone").val(id);
                                            $(".productName").val(data.productName);
                                            $(".buttonForm").text("Edit");
                                        } catch (err) {
                                            alert('Please Select One Row');
                                        }
                                    }
                                },
                                {
                                    text: 'Delete',
                                    action: function (e, dt, node, config) {
                                        try {
                                            var id = dt.row({selected: true}).data().id;
                                            $("#deleteModalGemstone").modal("show");
                                            $("#textDeleteFormGemstone").text("Are you sure to remove the Gemstone details with Id:" + id + " ?");
                                            $("#idDeleteFormGemstone").val(id);
                                        } catch (err) {
                                            alert('Please Select One Row');
                                        }
                                    }
                                }
                            ]
                        });

//End Image Table
                    });

                    e.fail(function (xhr, status) {
                        alert("Status: " + status);
                    });

                });
            </script>
    </body>
</html>
