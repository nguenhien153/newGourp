<%-- 
    Document   : manage-product
    Created on : Oct 20, 2019, 2:40:37 PM
    Author     : nguen
--%>

<%-- 
    Document   : manage-category
    Created on : Oct 19, 2019, 9:26:25 AM
    Author     : nguen
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<c:url var="productSup" value="${product.productName}"/>
<c:url var="idPk" value="${product.id}"/>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Category Page</title>
        <link href="../assets/css/admin/sb-admin.min.css" rel="stylesheet" type="text/css"/>
        <link href="../assets/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css"/>
        <link href="../assets/datatables/dataTables.bootstrap4.css" rel="stylesheet" type="text/css"/>
        <link href="../assets/datatables/buttons.dataTables.min.css" rel="stylesheet" type="text/css"/>
        <link href="../assets/css/product/autocomplete.css" rel="stylesheet" type="text/css"/>
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

            tr.group,
            tr.group:hover {
                background-color: #ddd !important;
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
                        <div class="card-header">
                            <i class="fas fa-table"></i>
                            Product Type Table</div>    
                        <div class="card-body">
                            <div class="table-responsive">
                                <table id="dataTable" class="table table-hover" style="font-size: 14px" width="100%" cellspacing="0">
                                    <thead>
                                        <tr>
                                            <th>
                                                ID
                                            </th>
                                            <th>
                                                Product Name
                                            </th>
                                            <th>
                                                Product Type Name
                                            </th>
                                            <th>
                                                Category Name
                                            </th>
                                            <th>
                                                Lenght
                                            </th>
                                            <th>
                                                Height
                                            </th>
                                            <th>
                                                Width
                                            </th>
                                            <th>
                                                Making Charges
                                            </th>
                                            <th>
                                                View Number
                                            </th>
                                            <th>
                                                Tag
                                            </th>

                                            <th>
                                                Date Create
                                            </th>
                                            <th>
                                                Create By
                                            </th>
                                            <th>
                                                Date Modify
                                            </th>
                                            <th>
                                                Modify By
                                            </th>
                                            <th>
                                                Display
                                            </th>
                                        </tr>
                                    </thead>
                                    <tfoot>
                                        <tr>
                                            <th>
                                                ID
                                            </th>
                                            <th>
                                                Product Name
                                            </th>
                                            <th>
                                                Product Type Name
                                            </th>
                                            <th>
                                                Category Name
                                            </th>
                                            <th>
                                                Lenght
                                            </th>
                                            <th>
                                                Height
                                            </th>
                                            <th>
                                                Width
                                            </th>
                                            <th>
                                                Making Charges
                                            </th>
                                            <th>
                                                View Number
                                            </th>
                                            <th>
                                                Tag
                                            </th>

                                            <th>
                                                Date Create
                                            </th>
                                            <th>
                                                Create By
                                            </th>
                                            <th>
                                                Date Modify
                                            </th>
                                            <th>
                                                Modify By
                                            </th>
                                            <th>
                                                Display
                                            </th>
                                        </tr>
                                    </tfoot>
                                </table>
                            </div>
                        </div>
                        <div class="card-footer small text-muted">Updated yesterday at 11:59 PM</div>
                    </div>

                </div>
                <%@include file="../../../fragments/admin/footer.jsp" %>
            </div>
            <div class="modal fade" id="formModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                <div class="modal-dialog" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="exampleModalLabel">Create Form</h5>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>
                        <form method="post" action="" id="formInModal" autocomplete="off">
                            <div class="modal-body">
                                <div class="form-group">
                                    <c:if test="${not empty mapError}">
                                        <div class="showError alert-danger text-center mb-4 rounded-pill">
                                            <ui class="text-danger align-middle" style="font-weight: bold; list-style-type: none">
                                                <c:forEach items="${mapError}" var="item">
                                                    <li>${item.value}</li>
                                                    </c:forEach>
                                            </ui>
                                        </div>
                                    </c:if>
                                    <input type="hidden" value="${product.id}" name="id" id="id"/>
                                    <div class="form-label-group">
                                        <input type="text" id="inputProductName" class="form-control" placeholder="Product Name"
                                               required="required" maxlength="50" title="Not Contain Special Character. Lenght:4-50" 
                                               name="productName" minlength="4" pattern="^[_A-z0-9]*((-|\s)*[_A-z0-9])*$"
                                               value="${product.productName}">
                                        <label for="inputProductName">Product Name</label>
                                    </div>  
                                    <div class="form-label-group mt-4 autocomplete">
                                        <input type="text" id="inputProductTypeName" class="form-control" placeholder="Product Type Name"
                                               required="required" maxlength="50" title="Not Contain Special Character. Lenght:4-50" name="productTypeName" minlength="4"
                                               pattern="^[_A-z0-9]*((-|\s)*[_A-z0-9])*$" value="${product.productTypeName}">
                                        <label for="inputProductTypeName">Type Name</label>
                                    </div>  
                                    <div class="form-label-group mt-4 ">
                                        <input type="text" id="inputLenght" class="form-control" placeholder="Lenght" 
                                               required="required"  title="Lenght: 5 number (Can contain 2 deciaml places)" name="lenght"
                                               pattern="^[0-9]{1,5}(\.[0-9]{1,2})?$" value="${product.lenght}">
                                        <label for="inputLenght">Lenght</label>
                                    </div>
                                    <div class="form-label-group mt-4 ">
                                        <input type="text" id="inputHeight" class="form-control" placeholder="Height" 
                                               required="required"  title="Lenght: 5 number (Can contain 2 deciaml places)" name="height"
                                               pattern="^[0-9]{1,5}(\.[0-9]{1,2})?$" value="${product.height}">
                                        <label for="inputHeight">Height</label>
                                    </div>
                                    <div class="form-label-group mt-4 ">
                                        <input type="text" id="inputWidth" class="form-control" placeholder="Width" 
                                               required="required"  title="Lenght: 5 number (Can contain 2 deciaml places)" name="width"
                                               pattern="^[0-9]{1,5}(\.[0-9]{1,2})?$" value="${product.width}">
                                        <label for="inputWidth">Width</label>
                                    </div>
                                    <div class="form-label-group mt-4 ">
                                        <input type="text" id="inputMakingCharges" class="form-control" placeholder="Making Charges" 
                                               required="required"  title="Lenght: 10 number (Can contain 2 deciaml places)" name="makingCharges"
                                               pattern="^[0-9]{1,10}(\.[0-9]{1,2})?$" value="${product.makingCharges}">
                                        <label for="inputMakingCharges">Making Charges</label>
                                    </div>
                                    <div class=" mt-3">
                                        <div class="checkbox d-flex flex-row-reverse mr-4">
                                            <label>
                                                Display Product: 
                                                <input type="checkbox" id="inputDisplay" value="true" name="display" ${product.display}>
                                            </label>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="modal-footer">
                                <button type="submit" class="btn btn-primary" id="buttonForm">Create</button>
                                <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>

            <div class="modal fade" id="deleteModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
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
                                <p id="textDeleteForm" style="font-weight: bold; font-size: 16px"></p>
                            </div>
                        </div>
                        <div class="modal-footer">
                            <form method="get" action=""/>
                            <input name="id" id="idDeleteForm" type="hidden"/>
                            <button type="submit" class="btn btn-primary">Yes</button>
                            </form>
                            <button type="button" class="btn btn-secondary" data-dismiss="modal">No</button>
                        </div>
                    </div>
                </div>
            </div>
            <div id="snackbar"></div>
            <script src="../assets/jquery/jquery.min.js" type="text/javascript"></script>       
            <script src="../assets/bootstrap/js/bootstrap.bundle.min.js" type="text/javascript"></script>
            <script src="../assets/jquery-easing/jquery.easing.min.js" type="text/javascript"></script>
            <script src="../assets/numberalJS/numeral.min.js" type="text/javascript"></script>
            <script src="../assets/datatables/jquery.dataTables.js" type="text/javascript"></script>
            <script src="../assets/datatables/dataTables.bootstrap4.js" type="text/javascript"></script>
            <script src="../assets/datatables/dataTables.buttons.min.js" type="text/javascript"></script>
            <script src="../assets/datatables/dataTables.select.min.js" type="text/javascript"></script>
            <script src="../assets/js/product/autocomplete.js" type="text/javascript"></script>
            <script src="../assets/js/admin/sb-admin.min.js" type="text/javascript"></script>

            <script type="text/javascript">
                function showToast(message) {
                    $("#snackbar").attr('class', 'show');
                    $("#snackbar").text(message);
                    setTimeout(function () {
                        $("#snackbar").attr('class', '');
                    }, 3000);
                }
                $(document).ready(function () {
                    var urlParams = new URLSearchParams(window.location.search);

                    if ('${productSup}' === '') {
                        if (urlParams.get("successCreate") !== null) {
                            showToast("Create Product Success");
                        }
                        if (urlParams.get("successEdit") !== null) {
                            showToast("Edit Product Success");
                        }
                        if (urlParams.get("successRemove") !== null) {
                            showToast("Remove Product Success");
                        }
                        if (urlParams.get("failRemove") !== null) {
                            showToast("Not found the id !!!");
                        }
                        if (urlParams.get("systemError") !== null)
                        {
                            showToast("System Errors. Please Trying Againt !!!");
                        }
                        if (urlParams.get("cannotDelete") !== null)
                        {
                            showToast("This Product is a parent row !!!");
                        }
                    } else {
                        if ('${idPk}' === '')
                        {
                            $("#buttonForm").text("Create");
                            $("#id").val('');
                        } else {
                            $("#buttonForm").text("Edit");
                        }
                        $("#formModal").modal("show");
                    }

                    var e = $.ajax({
                        url: "/g01jewelap/api-product",
                        type: "get",
//                    contentType: "application/json; charset=utf-8", //application/html;charset=utf-8
                        dataType: "JSON"
                    });
                    e.done(function (data) {
                        $("#dataTable").DataTable({
                            data: data,
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
                                    "data": "productName",
                                    "className": "align-middle",
                                    "render": function (productName) {
                                        return productName;
                                    }
                                },
                                {
                                    "data": "productTypeName",
                                    "className": "align-middle",
                                    "render": function (productTypeName) {
                                        return productTypeName;
                                    }
                                },
                                {data: 'categoryName'},
                                {
                                    "data": "lenght",
                                    "className": "align-middle",
                                    "render": function (lenght) {
                                        return numeral(lenght).format('0,0.00') + " mm";
                                    }
                                },
                                {
                                    "data": "height",
                                    "className": "align-middle",
                                    "render": function (height) {
                                        return numeral(height).format('0,0.00') + " mm";
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
                                    "data": "makingCharges",
                                    "className": "align-middle",
                                    "render": function (makingCharges) {
                                        return numeral(makingCharges).format('$0,0.00');
                                    }
                                },
                                {
                                    "data": "viewNumber",
                                    "className": "align-middle",
                                    "render": function (viewNumber) {
                                        return viewNumber;
                                    }
                                },
                                {
                                    "data": "tag",
                                    "className": "align-middle",
                                    "render": function (tag) {
                                        return tag;
                                    }
                                },
                                {
                                    "data": "dateCreate",
                                    "className": "align-middle",
                                    "render": function (dateCreate) {
                                        return dateCreate;
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
                                        return dateModify;
                                    }
                                },
                                {
                                    "data": "modifyBy",
                                    "className": "align-middle",
                                    "render": function (modifyBy) {
                                        return modifyBy;
                                    }
                                },
                                {
                                    "data": "display",
                                    "className": "align-middle",
                                    "render": function (display) {
                                        if (display === 'true')
                                        {
                                            return '<img src="../image/icon/account/checked.png" width="30px"/>';
                                        } else {
                                            return '';
                                        }
                                    }
                                }
                            ],
                            "columnDefs": [
                                {"visible": false, "targets": 3}
                            ],
                            "order": [[3, 'asc']],
                            "drawCallback": function (settings) {
                                var api = this.api();
                                var rows = api.rows({page: 'current'}).nodes();
                                var last = null;
                                api.column(3, {page: 'current'}).data().each(function (group, i) {
                                    if (last !== group) {
                                        $(rows).eq(i).before(
                                                '<tr class="group"><td colspan="14" style="font-weight:bold; font-size:20px" class="text-center">' + group + '</td></tr>'
                                                );
                                        last = group;
                                    }
                                });
                            },
                            dom: 'Bfrtip',
                            buttons: [
                                {
                                    text: 'Add',
                                    attr: {
                                        'data-toggle': 'modal',
                                        'data-target': '#formModal'
                                    },
                                    action: function (e, dt, node, config) {
                                        $(".showError").hide();
                                        $("#buttonForm").text("Create");
                                        $("#id").val('');
                                        $("#inputProductName").val('');
                                        $("#inputProductTypeName").val('');
                                        $("#inputLenght").val('');
                                        $("#inputHeight").val('');
                                        $("#inputWidth").val('');
                                        $("#inputMakingCharges").val('');
                                        $("#inputDisplay").attr("checked", false);
                                    }
                                },
                                {
                                    text: 'Edit',
                                    action: function (e, dt, node, config) {
                                        try {
                                            var productname = dt.row({selected: true}).data().productName;
                                            var typeName = dt.row({selected: true}).data().productTypeName;
                                            var lenght = dt.row({selected: true}).data().lenght;
                                            var width = dt.row({selected: true}).data().width;
                                            var height = dt.row({selected: true}).data().height;
                                            var makingCharges = dt.row({selected: true}).data().makingCharges;
                                            var display = dt.row({selected: true}).data().display;
                                            var id = dt.row({selected: true}).data().id;
                                            $(".showError").hide();
                                            $("#formModal").modal("show");
                                            $("#id").val(id);
                                            $("#inputProductName").val(productname);
                                            $("#inputProductTypeName").val(typeName);
                                            $("#inputLenght").val(lenght);
                                            $("#inputHeight").val(height);
                                            $("#inputWidth").val(width);
                                            $("#inputMakingCharges").val(makingCharges);
                                            $("#inputDisplay").attr("checked", display === 'true' ? true : false);
                                            $("#buttonForm").text("Edit");
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
                                            $("#deleteModal").modal("show");
                                            $("#textDeleteForm").text("Are you sure to remove the Product with Id:" + id + " ?");
                                            $("#idDeleteForm").val(id);
                                        } catch (err) {
                                            alert('Please Select One Row');
                                        }
                                    }
                                },
                                {
                                    text: 'Details',
                                    action: function (e, dt, node, config) {
                                        try {
                                            var id = dt.row({selected: true}).data().id;
                                            window.location = "http://localhost:8080/g01jewelap/manager/product-details?id=" + id;
                                        } catch (err) {
                                            alert('Please Select One Row');
                                        }
                                    }
                                }
                            ]
                        });
                        var type = $.ajax({
                            url: "/g01jewelap/api-auto-producttype",
                            type: "get",
//                    contentType: "application/json; charset=utf-8", //application/html;charset=utf-8
                            dataType: "JSON"
                        });
                        type.done(function (data) {
                            autocomplete(document.getElementById("inputProductTypeName"), data);
                        });
                    });
                    e.fail(function (xhr, status) {
                        alert("Status: " + status);
                    });
                }
                );
            </script>
    </body>
</html>
