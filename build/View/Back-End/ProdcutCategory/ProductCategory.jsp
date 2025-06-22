<%-- 
    Document   : NewProdcutCategory
    Created on : Mar 25, 2023, 3:06:30 PM
    Author     : Huawei
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="java.util.ArrayList"%>
<%@page import="DataAccess.DAProductCategory"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="Domain.ProductCategory"%>
<!DOCTYPE html>
<html lang="en">

    <head>

        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta name="description"
              content="Multikart admin is super flexible, powerful, clean &amp; modern responsive bootstrap 4 admin template with unlimited possibilities.">
        <meta name="keywords"
              content="admin template, Multikart admin template, dashboard template, flat admin template, responsive admin template, web app">
        <meta name="author" content="pixelstrap">
        <link rel="icon" href="../../../assets/images/favicon/3.png" type="image/x-icon">
        <title>Innisfree | Admin Panel</title>

        <!-- Data Table-->
        <link rel="stylesheet" href="../datatable.css"/>
        <link rel="stylesheet" href="../bootstrap.min.css"/>
        <!--        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/5.2.0/css/bootstrap.min.css"/>-->

        <!-- Google font-->
        <link rel="stylesheet"
              href="https://fonts.googleapis.com/css2?family=Work+Sans:ital,wght@0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,500;1,600;1,700;1,800;1,900&display=swap">

        <link rel="stylesheet"
              href="https://fonts.googleapis.com/css2?family=Nunito:ital,wght@0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,300;1,400;1,500;1,600;1,700;1,800;1,900&display=swap">


        <!-- Font Awesome-->
        <link rel="stylesheet" type="text/css" href="../assets/css/vendors/font-awesome.css">

        <!-- Flag icon-->
        <link rel="stylesheet" type="text/css" href="../assets/css/vendors/flag-icon.css">

        <!-- Liner icon -->
        <link rel="stylesheet" href="https://cdn.linearicons.com/free/1.0.0/icon-font.min.css">

        <!-- DataTables -->
        <!--        <link rel="stylesheet" href="https://cdn.datatables.net/1.13.4/css/jquery.dataTables.css" />-->


        <!-- Bootstrap css-->
        <link rel="stylesheet" type="text/css" href="../assets/css/vendors/bootstrap.css">

        <!-- App css-->
        <link rel="stylesheet" type="text/css" href="../assets/css/style.css">


        <!--Sweet Alert css-->
        <link rel="stylesheet" type="text/css" href="../../../assets/commonResources/sweetalert.min.css"/>





    </head>


    <body>
        <%

            DAProductCategory pcDA = new DAProductCategory();
            ArrayList<ProductCategory> productCategoryList = pcDA.getAllProductsCategory();
        %>
        <!-- page-wrapper Start-->
        <div class="page-wrapper">


            <!-- Page Header Ends -->
            <%@include file="../header.jsp"%>
            <!-- Page Body Start-->
            <div class="page-body-wrapper">

                <!-- Page Sidebar Start-->
                <%@include file="../sidebar.jsp"%>
                <!-- Right sidebar Ends-->



                <div class="page-body">
                    <!-- Container-fluid starts-->
                    <div class="container-fluid">
                        <div class="page-header">
                            <div class="row">
                                <div class="col-lg-6">
                                    <div class="page-header-left">
                                        <h3>Category
                                            <small>Multikart Admin panel</small>
                                        </h3>
                                    </div>
                                </div>
                                <div class="col-lg-6">
                                    <ol class="breadcrumb pull-right">
                                        <li class="breadcrumb-item">
                                            <a href="../Dashboard/Dashboard.jsp">
                                                <i data-feather="home"></i>
                                            </a>
                                        </li>

                                        <li class="breadcrumb-item active">Product Category</li>
                                    </ol>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- Container-fluid Ends-->

                    <!-- Container-fluid starts-->
                    <div class="container-fluid">
                        <div class="row">
                            <div class="col-sm-12">
                                <div class="card">
                                    <div class="card-header">

                                        <%if (found == 1) {%>

                                        <button type="button" class="btn btn-primary mt-md-0 mt-2" data-bs-toggle="modal"
                                                data-original-title="test" data-bs-target="#exampleModal" style="background-color: #548c5e">Add
                                            Category</button>
                                            <%}%>
                                    </div>


                                    <div class="card-body">
                                        <div class="table-responsive table-desi">
                                            <table  id="editableTable">
                                                <thead>
                                                    <tr>

                                                        <th>Category Name</th>
                                                        <th>Description</th>
                                                        <th>Status</th>
                                                        <th>Updated Date</th>
                                                        <th>Updated By</th>
                                                        <th>Option</th>
                                                    </tr>
                                                </thead>


                                                <tbody>
                                                    <%for (ProductCategory pc : productCategoryList) {%>
                                                    <tr>


                                                        <td data-field="category_name"><%=pc.getProdCatName()%></td>


                                                        <%
                                                            String desc = pc.getProdCatDesc();
                                                            String desc2 = "";
                                                            if (desc.length() >= 20) {
                                                                desc2 = desc.substring(0, 10) + ".......";

                                                            } else {
                                                                desc2 = desc;
                                                            }


                                                        %>

                                                        <td data-field="category_desc"><%=desc2%></td>


                                                        <%

                                                            String statuss = pc.getProdCat_Status();
                                                            String active = "Active";

                                                            if (statuss.equals(active)) {%>

                                                        <td class="order-success" data-field="status">
                                                            <span><%=pc.getProdCat_Status()%></span>
                                                        </td>

                                                        <%} else {%>

                                                        <td class="order-cancle" data-field="status">
                                                            <span><%=pc.getProdCat_Status()%></span>
                                                        </td>
                                                        <%}%>



                                                        <td data-field="category_updateDate"><%=pc.getProdCatUpDate()%></td>
                                                        <td data-field="category_updateBy"><%=pc.getProdCatUpBy()%></td>

                                                        <td>
                                                            <%if (found == 1) {%>
                                                            <a onclick="loadProdCatDetails(<%=pc.getProdCatID()%>)" id="viewBtn" class="prodCatView" role="button" style="margin-left: 10px;margin-right: 10px;">
                                                                <i class="fa fa-edit fa-lg" title="Edit"></i>
                                                            </a>


                                                            <a onclick="deleteConfirmation(<%=pc.getProdCatID()%>, '<%=pc.getProdCatName()%>')" id="viewBtn" class="prodCatView"  role="button" style="margin-right: 10px;">
                                                                <i class="fa fa-trash  fa-lg" title="Delete"></i>
                                                                <%}%>
                                                            </a>
                                                            <a onclick="showProdCatDetails(<%=pc.getProdCatID()%>)" id="viewBtn" class="prodCatView" role="button" style="margin-right: 10px;">
                                                                <i class="fa fa-eye  fa-lg" title="View"></i>
                                                            </a>         
<!--                                                            <a href="ProductCategory.jsp?productCategroyID=<%= pc.getProdCatID()%>" role="button">
                                                                <i class="fa fa-eye  fa-lg" title="View"></i>
                                                            </a>         -->
                                                        </td>
                                                    </tr>
                                                    <%}%>

                                                </tbody>
                                            </table>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- Container-fluid Ends-->
                </div>

                <!-- footer start-->
                <footer class="footer">
                    <div class="container-fluid">
                        <div class="row">
                            <div class="col-md-6 footer-copyright text-start">
                                <p class="mb-0">Copyright 2019 © Multikart All rights reserved.</p>
                            </div>
                            <div class="col-md-6 pull-right text-end">
                                <p class=" mb-0">Hand crafted & made with<i class="fa fa-heart"></i></p>
                            </div>
                        </div>
                    </div>
                </footer>
                <!-- footer end-->
            </div>
        </div>


        <!-- add physical product modal box -->
        <div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
             aria-hidden="true">

            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title f-w-600" id="exampleModalLabel">Add
                            New Category</h5>
                        <button class="btn-close" type="button" data-bs-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">×</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <form class="needs-validation" id="needs-validation">

                            <div class="form">
                                <div class="form-group">

                                    <label for="validationCustom01" class="mb-1">Category Name :</label>
                                    <input class="form-control" id="prodCatName" name="prodCatName" type="text" placeholder="Enter the category name." required>
                                </div>
                                <div class="form-group mb-0">
                                    <label for="validationCustom02" class="mb-1">Category Description :</label>
                                    <input class="form-control" id="prodCatDesc" name="prodCatDesc" type="text" placeholder="Enter the description." required>
                                </div>
                                <br/>
                                <div class="form-group mb-0">
                                    <label for="validationCustom02" class="mb-1">Status :</label>
                                    <input type="radio" id="prodCat_Status" name="prodCat_Status" value="Active" required style="margin-left: 80px;">
                                    <label for="validationCustom02" class="mb-1">Active</label>
                                    <input type="radio" id="prodCat_Status" name="prodCat_Status" value="Deactive" required style="margin-left: 80px;">
                                    <label for="validationCustom02" class="mb-1">Deactive</label>
                                </div>
                                <br/>
                            </div>
                            <div class="modal-footer">
                                <button class="btn btn-primary" type="submit" onclick="addData(event)">Save</button>
                                <button class="btn btn-secondary" type="button" data-bs-dismiss="modal">Close</button>
                            </div>
                        </form>
                    </div>

                </div>
            </div>
        </div>


        <!-- edit physical product modal box -->                 
        <div class="modal fade" id="exampleModal2" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
             aria-hidden="true">

            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title f-w-600" id="exampleModalLabel2">Edit Category</h5>
                        <button class="btn-close" type="button" data-bs-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">×</span>
                        </button>
                    </div>
                    <div class="modal-body">
<!--                        <form class="needs-validation" id="needs-validation"  action="${pageContext.servletContext.contextPath}/newProdCategory" method="post">-->
                        <form class="needs-validation" id="needs-validation">
                            <div class="form">
                                <div class="form-group">
                                    <input type="hidden" id="tempID" name ="tempID" />
                                    <label for="validationCustom01" class="mb-1">Category Name :</label>
                                    <input class="form-control" id="prodCatName2" name="prodCatName2" type="text" placeholder="Enter the category name." required>
                                </div>
                                <div class="form-group mb-0">
                                    <label for="validationCustom02" class="mb-1">Category Description :</label>
                                    <input class="form-control" id="prodCatDesc2" name="prodCatDesc2" type="text" placeholder="Enter the description." required>
                                </div>
                                <br/>
                                <div class="form-group mb-0">
                                    <label for="validationCustom02" class="mb-1">Status :</label>
                                    <input type="radio" id="prodCat_Status2" name="prodCat_Status2" value="Active" required style="margin-left: 80px;">
                                    <label for="validationCustom02" class="mb-1">Active</label>
                                    <input type="radio" id="prodCat_Status2" name="prodCat_Status2" value="Deactive" required style="margin-left: 80px;">
                                    <label for="validationCustom02" class="mb-1">Deactive</label>
                                </div>
                                <br/>
                            </div>
                            <div class="modal-footer">
                                <button class="btn btn-primary" type="submit" onclick="saveData(event)">Save</button>
                                <button class="btn btn-secondary" type="button" data-bs-dismiss="modal">Close</button>
                            </div>
                        </form>
                    </div>

                </div>
            </div>
        </div>                 

        <!-- view physical product modal box -->                 
        <div class="modal fade" id="exampleModal3" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
             aria-hidden="true">

            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title f-w-600" id="exampleModalLabel3">View Product Category</h5>
                        <button class="btn-close" type="button" data-bs-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">×</span>
                        </button>
                    </div>
                    <div class="modal-body">
<!--                        <form class="needs-validation" id="needs-validation"  action="${pageContext.servletContext.contextPath}/newProdCategory" method="post">-->
                        <form class="needs-validation" id="needs-validation">
                            <div class="form">
                                <div class="form-group">

                                    <label for="validationCustom01" class="mb-1">Category Name :</label>
                                    <input class="form-control" id="prodCatName3" name="prodCatName3" type="text" placeholder="Enter the category name." disabled>
                                </div>
                                <div class="form-group mb-0">
                                    <label for="validationCustom02" class="mb-1">Category Description :</label>
                                    <input class="form-control" id="prodCatDesc3" name="prodCatDesc3" type="text" placeholder="Enter the description." disabled>
                                </div>
                                <br/>
                                <div class="form-group mb-0">
                                    <label for="validationCustom02" class="mb-1">Status :</label>
                                    <input type="radio" id="prodCat_Status3" name="prodCat_Status3" value="Active" required style="margin-left: 80px;" disabled>
                                    <label for="validationCustom02" class="mb-1">Active</label>
                                    <input type="radio" id="prodCat_Status3" name="prodCat_Status3" value="Deactive" required style="margin-left: 80px;" disabled>
                                    <label for="validationCustom02" class="mb-1">Deactive</label>
                                </div>
                                <br/>
                            </div>
                            <div class="modal-footer">

                                <button class="btn btn-secondary" type="button" data-bs-dismiss="modal">Close</button>
                            </div>
                        </form>
                    </div>

                </div>
            </div>
        </div>                 



        <!-- latest jquery-->
        <script src="../assets/js/jquery-3.3.1.min.js"></script>

        <!-- Bootstrap js-->
        <script src="../assets/js/bootstrap.bundle.min.js"></script>

        <!-- feather icon js-->
        <script src="../assets/js/icons/feather-icon/feather.min.js"></script>
        <script src="../assets/js/icons/feather-icon/feather-icon.js"></script>

        <!-- Sidebar jquery-->
        <script src="../assets/js/sidebar-menu.js"></script>

        <!--Customizer admin-->
        <script src="../assets/js/admin-customizer.js"></script>

        <!-- Edit, delete and add new -->
        <script src="../assets/js/edit-delete-new-product.js"></script>

        <!--right sidebar js-->
        <script src="../assets/js/chat-menu.js"></script>

        <!--script admin-->
        <script src="../assets/js/admin-script.js"></script>


        <!--script data table-->
        <script src="https://code.jquery.com/jquery-3.5.1.js" defer></script>
        <script src="https://cdn.datatables.net/1.13.4/js/jquery.dataTables.min.js" defer></script>
        <script src="https://cdn.datatables.net/1.13.4/js/dataTables.bootstrap5.min.js" defer></script>

        <!--Sweet Alert js-->
        <script src="../../../assets/commonResources/sweetalert.min.js"></script>

        <script src="../../../assets/commonResources/loadDataTable.js" defer></script>
        <!--        <script src="../loadDataTable.js" defer></script>-->


        <script>
                                    function addData(event) {
                                        event.preventDefault();


                                        var name = document.getElementById('prodCatName').value;
                                        var status = document.getElementById('prodCatDesc').value;

                                        var radioBtn = document.querySelector("input[name='prodCat_Status']:checked");



                                        if (name != null && status != null && radioBtn) {
                                            var data = {
                                                prodCatName: $('#prodCatName').val(),
                                                prodCatDesc: $('#prodCatDesc').val(),
                                                prodCat_Status: $('input[name=prodCat_Status]:checked').val()
                                            };
                                            var jsonData = JSON.stringify(data);

                                            console.log(JSON.parse(jsonData));

//                    //Send JSON data to servlet using AJAX
                                            $.ajax({
                                                type: "POST",
                                                url: "/innisfree_1/newProdCategory", // Replace with your servlet URL
                                                data: jsonData,
                                                contentType: "application/json; charset=utf-8",
                                                dataType: "json",
                                                success: function (response) {
                                                    $('#exampleModal').modal('hide');
                                                    // Handle success response from servlet
                                                    Swal.fire({
                                                        icon: 'success',
                                                        title: 'Succssfully Added',
                                                        text: response.message,
                                                        confirmButtonColor: '#548c5e',
                                                        confirmButtonText: 'Continue',

                                                    }).then((result) => {
                                                        /* Read more about isConfirmed, isDenied below */
                                                        if (result.isConfirmed) {
                                                            location.reload();
                                                        }
                                                    })
                                                },
                                                error: function (xhr, status, error) {
                                                    // Handle error response from servlet
                                                    console.log("Error sending data: " + error);
                                                    // Perform error handling as needed
                                                }
                                            });


                                        } else {
                                            Swal.fire({
                                                icon: 'error',
                                                title: 'Cannot have NULL',
                                                text: 'CANNOT HAVE NULL INPUT',
                                                confirmButtonColor: '#548c5e',
                                                confirmButtonText: 'Continue',

                                            }).then((result) => {
                                                /* Read more about isConfirmed, isDenied below */
                                                if (result.isConfirmed) {
                                                    return;
                                                }
                                            })


                                        }

                                    }
        </script>

        <!-- Include JavaScript code for handling the click event on the product links -->
        <script>
            function loadProdCatDetails(prodCatID) {
                $.ajax({
                    type: "GET",
                    // URL mapped to the ProductServlet
                    url: "${pageContext.servletContext.contextPath}/getProductCategoryByID",
                    data: {"prodCatID": prodCatID},
                    dataType: "json",
                    success: function (data) {

                        var title = document.getElementById('exampleModalLabel2');
                        title.innerHTML = 'Edit Category'; // You can change the content here

                        $('#tempID').val(data.prodCatID);
                        $('#prodCatName2').val(data.prodCatName);
                        $('#prodCatDesc2').val(data.prodCatDesc);
                        $('input[name=prodCat_Status2][value=' + data.prodCat_Status + ']').prop('checked', true);
                        $('#exampleModal2').modal('show');
                        document.getElementById("needs-validation").addEventListener("submit", saveEditedPC);
                    }
                    ,
                    error: function (xhr, status, error) {
                        console.error("Error loading product form: " + error);
                    }
                }
                );
            }
        </script>

        <!--       try the passing data       -->
        <script>
            function saveData(event) {
                event.preventDefault();
                var name = document.getElementById('prodCatName2').value;
                var status = document.getElementById('prodCatDesc2').value;

                var radioBtn = document.querySelector("input[name='prodCat_Status2']:checked");

                if (name != null && status != null && radioBtn&&name!=''&&status!='') {

                    var data = {
                        tempID: $('#tempID').val(),
                        prodCatName2: $('#prodCatName2').val(),
                        prodCatDesc2: $('#prodCatDesc2').val(),
                        prodCat_Status2: $('input[name=prodCat_Status2]:checked').val()
                    };
                    var jsonData = JSON.stringify(data);

                    console.log(JSON.parse(jsonData));

//                    //Send JSON data to servlet using AJAX
                    $.ajax({
                        type: "POST",
                        url: "/innisfree_1/editProductCategory", // Replace with your servlet URL
                        data: jsonData,
                        contentType: "application/json; charset=utf-8",
                        dataType: "json",
                        success: function (response) {

                            // Handle success response from servlet
                            Swal.fire({
                                icon: 'success',
                                title: 'Succssfully Edited',
                                text: response.message,
                                confirmButtonColor: '#548c5e',
                                confirmButtonText: 'Continue',

                            }).then((result) => {
                                /* Read more about isConfirmed, isDenied below */
                                if (result.isConfirmed) {
                                    location.reload();
                                }
                            })
                        },
                        error: function (xhr, status, error) {
                            // Handle error response from servlet
                            console.log("Error sending data: " + error);
                            // Perform error handling as needed
                        }
                    });

                } else {
                    Swal.fire({
                        icon: 'error',
                        title: 'Cannot have NULL',
                        text: 'CANNOT HAVE NULL INPUT',
                        confirmButtonColor: '#548c5e',
                        confirmButtonText: 'Continue',

                    }).then((result) => {
                        /* Read more about isConfirmed, isDenied below */
                        if (result.isConfirmed) {
                            return;
                        }
                    })


                }

            }
        </script>


        <script>
            function deleteConfirmation(prodCatID, prodCatName) {
                Swal.fire({
                    title: 'Are you sure?',
                    text: "You cannot revert this action!",
                    icon: 'warning',
                    showCancelButton: true,
                    confirmButtonColor: '#548c5e',
                    cancelButtonColor: '#d33',
                    confirmButtonText: 'Yes, delete it!'
                }).then((result) => {
                    if (result.isConfirmed) {
                        deleteData(prodCatID, prodCatName, event)
                    }
                })


            }
        </script>

        <script>
            function deleteData(prodCatID, prodCatName, event) {
                event.preventDefault();
                var data = {
                    tempID: prodCatID,
                    prodCatName: prodCatName
                };
                var jsonData = JSON.stringify(data);

                console.log(JSON.parse(jsonData));

//                    //Send JSON data to servlet using AJAX
                $.ajax({
                    type: "POST",
                    url: "/innisfree_1/deleteProductCategory", // Replace with your servlet URL
                    data: jsonData,
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function (response) {
                        console.log(JSON.parse(jsonData));
                        // Handle success response from servlet
                        Swal.fire({
                            icon: 'success',
                            title: 'Succssfully Edited',
                            text: response.message,
                            confirmButtonColor: '#548c5e',
                            confirmButtonText: 'Continue',

                        }).then((result) => {
                            /* Read more about isConfirmed, isDenied below */
                            if (result.isConfirmed) {
                                location.reload();
                            }
                        })
                    },
                    error: function (xhr, status, error) {
                        // Handle error response from servlet
                        console.log("Error sending data: " + error);
                        // Perform error handling as needed
                    }
                });
            }

        </script>

        <script>
            function showProdCatDetails(prodCatID) {
                $.ajax({
                    type: "GET",
                    // URL mapped to the ProductServlet
                    url: "${pageContext.servletContext.contextPath}/getProductCategoryByID",
                    data: {"prodCatID": prodCatID},
                    dataType: "json",
                    success: function (data) {

                        var title = document.getElementById('exampleModalLabel3');
                        title.innerHTML = 'View Product Category'; // You can change the content here


                        $('#prodCatName3').val(data.prodCatName);
                        $('#prodCatDesc3').val(data.prodCatDesc);
                        $('input[name=prodCat_Status3][value=' + data.prodCat_Status + ']').prop('checked', true);
                        $('#exampleModal3').modal('show');

                    }
                    ,
                    error: function (xhr, status, error) {
                        console.error("Error loading product form: " + error);
                    }
                }
                );
            }

        </script>

        <!--       try the servlet name change       -->
        <script>
            function saveEditedPC(event) {
                // Prevent the default form submission behavior
                event.preventDefault();
                // Get the form element
                var form = document.getElementById("needs-validation");
                // Change the form action
                form.action = "${pageContext.servletContext.contextPath}/tryName"; // set the new action URL here
                form.method = "get";
                // Perform any other form validation or data manipulation here

                // Submit the form programmatically
                form.submit();
            }
        </script>

        <script>
            function clearFormField() {
                document.getElementById("needs-validation").action = "${pageContext.servletContext.contextPath}/newProdCategory";
                document.getElementById("needs-validation").method = "post";
                var title = document.getElementById('exampleModalLabel');
                title.innerHTML = 'Add New Category'; // You can change the content here
                $('#prodCatName').val(null);
                $('#prodCatDesc').val(null);
                document.getElementById('prodCat_Status1').checked = false;
                document.getElementById('prodCat_Status2').checked = false;
                $('#exampleModal').modal('show');
//                document.getElementById("needs-validation").addEventListener("submit", handleFormSubmit);
//                $('#exampleModal').modal('show');
            }
        </script>

        <!--        <script>
                    function editedTitle() {
                        var title = document.getElementById('exampleModalLabel');
                        title.innerHTML = 'Edit Result'; // You can change the content here
                    }
        
                </script>-->


        <script>
            function showAlert(value) {
                alert('JSP value: ' + value);
            }
        </script>



    </body>

</html>
