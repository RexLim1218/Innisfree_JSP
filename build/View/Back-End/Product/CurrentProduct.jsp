<%-- 
    Document   : CurrentProduct
    Created on : Apr 26, 2023, 12:07:58 AM
    Author     : Rex Lim
--%>

<%@page import="java.util.Base64"%>
<%@page import="Domain.ProductImage"%>
<%@page import="DataAccess.DAProductImage"%>
<%@page import="DataAccess.DAProduct"%>
<%@page import="Domain.Product"%>

<%@page import="java.util.ArrayList"%>
<%@page import="Domain.ProductCategory"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
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

            DAProduct dp = new DAProduct();
            ArrayList<Product> getAllProduct = dp.getAllProduct();

            DAProductImage dpi = new DAProductImage();
            ArrayList<ProductImage> getAllImage = dpi.getAllProductImg(getAllProduct);
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
                                        <h3>Current Product
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

                                        <li class="breadcrumb-item active">Current Product</li>
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


                                    <div class="card-body">
                                        <div class="table-responsive table-desi">
                                            <table  id="editableTable">
                                                <thead>
                                                    <tr>
                                                        <th>Image</th>
                                                        <th>Product Name</th>
                                                        <th>Available Quantity</th>
<!--                                                        <th>Category Name</th>-->

                                                        <th>Status</th>
                                                        <th>Updated Date</th>
                                                        <th>Updated By</th>
                                                        <th>Option</th>
                                                    </tr>
                                                </thead>


                                                <tbody>
                                                    <%for (Product p : getAllProduct) {%>

                                                    <tr>

                                                        <% for (ProductImage image : getAllImage) {
                                                                if (image.getProdID() == p.getProdID()) {
                                                        %>

                                                        <td data-field="prod_IMG"><img width="50px" height="50px" src="data:image/jpeg;base64,<%= Base64.getEncoder().encodeToString(image.getGetImg())%>" /></td>
                                                            <% }
                                                                }%>

                                                        <%
                                                            String prodName = p.getProdName();
                                                            String prodName2 = "";
                                                            if (prodName.length() >= 20) {
                                                                prodName2 = prodName.substring(0, 20) + ".......";

                                                            } else {
                                                                prodName2 = prodName;
                                                            }


                                                        %>



                                                        <td data-field="prod_name"><%=prodName2%></td>
                                                        <td data-field="category_name"><%=p.getProdAvailable_Qty()%></td>
<!--                                                        <td data-field="category_name"><%=p.getProdCat().getProdCatName()%></td>-->




                                                        <%

                                                            String statuss = p.getProd_Status();
                                                            String active = "Active";

                                                            if (statuss.equals(active)) {%>

                                                        <td class="order-success" data-field="status">
                                                            <span><%=p.getProd_Status()%></span>
                                                        </td>

                                                        <%} else {%>
                                                        <td class="order-cancle" data-field="status">
                                                            <span><%=p.getProd_Status()%></span>
                                                        </td>

                                                        <%}%>



                                                        <td data-field="product_updateDate"><%=p.getProdUpDate()%></td>
                                                        <td data-field="category_updateBy"><%=p.getProdUpBy()%></td>

                                                        <td>

                                                            <a href="EditProduct.jsp?prodID=<%=p.getProdID()%>" id="viewBtn"  class="prodCatView" role="button"style="margin-left: 10px;margin-right: 10px;">
                                                                <i class="fa fa-edit fa-lg" title="Edits"></i>
                                                            </a>


                                                           <%if(found==1){%>
                                                            <a id="viewBtn" class="prodCatView"  role="button" onclick="deleteConfirmation(<%=p.getProdID()%>, '<%=p.getProdName()%>')" style="margin-right: 10px;">
                                                                <i class="fa fa-trash  fa-lg" title="Delete"></i>
                                                            </a>
                                                           <%}%>
                                                            <a href="ViewProduct.jsp?prodID=<%=p.getProdID()%>" id="viewBtn" class="prodCatView" role="button" style="margin-right: 10px;">
                                                                <i class="fa fa-eye  fa-lg" title="View"></i>
                                                            </a>         

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
        <script src="https://cdn.datatables.net/1.13.4/js/dataTables.bootstrap5.min.js"defer></script>
        <script src="../../../assets/commonResources/loadDataTable.js" defer></script>

        <!--Sweet Alert js-->
        <script src="../../../assets/commonResources/sweetalert.min.js"></script>

        <script>
                                                                        function deleteConfirmation(prodID, prodName) {
                                                                            Swal.fire({
                                                                                title: 'Are you sure?',
                                                                                text: "You cannot revert this action!",
                                                                                icon: 'warning',
                                                                                showCancelButton: true,
                                                                                confirmButtonColor: '#3085d6',
                                                                                cancelButtonColor: '#d33',
                                                                                confirmButtonText: 'Yes, delete it!'
                                                                            }).then((result) => {
                                                                                if (result.isConfirmed) {
                                                                                    deleteData(prodID, prodName, event)
                                                                                }
                                                                            })


                                                                        }
        </script>

        <script>
            function deleteData(prodID, prodName, event) {
                event.preventDefault();
                var data = {
                    prodID: prodID,
                    prodName: prodName
                };
                var jsonData = JSON.stringify(data);

                console.log(JSON.parse(jsonData));

//                    //Send JSON data to servlet using AJAX
                $.ajax({
                    type: "POST",
                    url: "/innisfree_1/deleteProduct", // Replace with your servlet URL
                    data: jsonData,
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function (response) {
                        console.log(JSON.parse(jsonData));
                        // Handle success response from servlet
                        Swal.fire({
                            icon: 'success',
                            title: 'Succssfully Deleted',
                            text: response.message,

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



    </body>
</html>
