<%-- 
    Document   : manage-category
    Created on : Oct 19, 2019, 9:26:25 AM
    Author     : nguen
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Category Page</title>
        <link href="../assets/css/admin/sb-admin.min.css" rel="stylesheet" type="text/css"/>
        <link href="../assets/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css"/>
        <link href="../assets/datatables/dataTables.bootstrap4.css" rel="stylesheet" type="text/css"/>
        <link href="../assets/datatables/buttons.dataTables.min.css" rel="stylesheet" type="text/css"/>
    </head>
    <body id="page-top">
        <%@include file="../../fragments/admin/navigation.jsp" %>


        <div id="wrapper">
            <!-- Sidebar -->
            <%@include file="../../fragments/admin/slidebar.jsp" %>

            <div id="content-wrapper">
                <div class="container-fluid">
                    <div class="card mb-3">
                        <div class="card-header">
                            <i class="fas fa-table"></i>
                            Category Table</div>
                        <div class="card-body">
                            <div class="table-responsive">
                                <table id="dataTable" class="table table-bordered" width="100%" cellspacing="0">
                                    <thead>
                                        <tr>
                                            <th>
                                                ID
                                            </th>
                                            <th>
                                                Category Name
                                            </th>
                                            <th>
                                                Date Create
                                            </th>
                                            <th>
                                                Date Modify
                                            </th>
                                            <th>
                                                Create By
                                            </th>
                                            <th>
                                                Modify By
                                            </th>
                                        </tr>
                                    </thead>
                                    <tfoot>
                                        <tr>
                                            <th>
                                                ID
                                            </th>
                                            <th>
                                                Category Name
                                            </th>
                                            <th>
                                                Date Create
                                            </th>
                                            <th>
                                                Date Modify
                                            </th>
                                            <th>
                                                Create By
                                            </th>
                                            <th>
                                                Modify By
                                            </th>
                                        </tr>
                                    </tfoot>
                                </table>
                            </div>
                        </div>
                        <div class="card-footer small text-muted">Updated yesterday at 11:59 PM</div>
                    </div>



                </div>
                <%@include file="../../fragments/admin/footer.jsp" %>
            </div>

            <div class="modal fade" id="addModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                <div class="modal-dialog" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="exampleModalLabel">Modal title</h5>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>
                        <form method="post" action="">
                            <div class="modal-body">
                                <div class="form-group">
                                    <div class="form-label-group">
                                        <input type="text" id="inputCategoryName" class="form-control" placeholder="Category Name"
                                               required="required" maxlength="50" title="Not Contain Special Character. Lenght:4-50" name="categoryName" minlength="4"
                                               pattern="^[_A-z0-9]*((-|\s)*[_A-z0-9])*$" value="${category.categoryName}">
                                        <label for="inputCategoryName">Category Name</label>
                                    </div>
                                </div>
                            </div>
                            <div class="modal-footer">
                                <button type="submit" class="btn btn-primary">Create</button>
                                <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>

            <script src="../assets/jquery/jquery.min.js" type="text/javascript"></script>       
            <script src="../assets/bootstrap/js/bootstrap.bundle.min.js" type="text/javascript"></script>
            <script src="../assets/jquery-easing/jquery.easing.min.js" type="text/javascript"></script>

            <script src="../assets/datatables/jquery.dataTables.js" type="text/javascript"></script>
            <script src="../assets/datatables/dataTables.bootstrap4.js" type="text/javascript"></script>
            <script src="../assets/datatables/dataTables.buttons.min.js" type="text/javascript"></script>
            <script src="../assets/js/admin/sb-admin.min.js" type="text/javascript"></script>

            <script type="text/javascript">
                $(document).ready(function () {
                    $('#addModal').modal('show');

                    var e = $.ajax({
                        url: "/g01jewelap/api-category",
                        type: "get",
//                    contentType: "application/json; charset=utf-8", //application/html;charset=utf-8
                        dataType: "JSON"
                    });
                    e.done(function (data) {
                        $("#dataTable").DataTable({
                            data: data,
                            "columns": [
                                {
                                    "data": "id",
                                    "className": "align-middle",
                                    "render": function (id) {
                                        return id;
                                    }
                                },
                                {
                                    "data": "categoryName",
                                    "className": "align-middle",
                                    "render": function (categoryName) {
                                        return categoryName;
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
                                    "data": "dateModify",
                                    "className": "align-middle",
                                    "render": function (dateModify) {
                                        return dateModify;
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
                                        'data-target': '#addModal'
                                    }
                                },
                                {
                                    text: 'Edit',
                                    action: function (e, dt, node, config) {
                                        alert('Button activated');
                                    }
                                },
                                {
                                    text: 'Delete',

//                                    action: function (e, dt, node, config) {
//                                        alert('Button activated');
//                                    }
                                }
                            ]
                        });
                    });
                    e.fail(function (xhr, status) {
                        alert("Status: " + status);
                    });
                });
            </script>
    </body>
</html>
