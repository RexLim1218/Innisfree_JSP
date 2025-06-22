<%-- 
    Document   : viewOrder
    Created on : Apr 29, 2023, 10:32:19 AM
    Author     : Rex Lim
--%>

<%@page import="Domain.Orders"%>
<%@page import="DataAccess.DAOrders"%>
<%@page import="java.util.Base64"%>
<%@page import="Domain.ProductImage"%>
<%@page import="DataAccess.DAProductImage"%>
<%@page import="Domain.Product"%>
<%@page import="java.util.ArrayList"%>
<%@page import="DataAccess.DAProduct"%>
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

        <style>
            tbody tr td.order-pending span {
                background-color: rgba(100, 116, 139, .1);
                color: #64748b;
                border: 1px solid #64748b;
                padding: 5px 10px;
                border-radius: 5px;
                font-size: 12px;
                font-weight: 700;
                position: relative;
                text-transform: capitalize;
            }
            tbody tr td.order-continue span {
                background-color: rgba(242,244,248,0.1);
                color: #0b3a77;
                border: 1px solid #0b3a77;
                padding: 5px 10px;
                border-radius: 5px;
                font-size: 12px;
                font-weight: 700;
                position: relative;
                text-transform: capitalize;
            }
            tbody tr td.order-delivered span {

                background-color: rgba(242,244,248,0.1);
                border: 1px solid #42ba96;
                color: #42ba96;
                padding: 5px 10px;
                border-radius: 5px;
                font-size: 12px;
                font-weight: 700;
                position: relative;
                text-transform: capitalize;
            }

        </style>



    </head>
    <body>
        <%
            DAOrders dao = new DAOrders();
            ArrayList<Orders> orderLists = dao.getAllOrder();
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
                                        <h3>Current Order
                                            <small>Innisfree Admin panel</small>
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

                                        <li class="breadcrumb-item active">Current Order</li>
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
                                            <table  id="editableTable" class="orderTable">
                                                <thead>
                                                    <tr>
                                                        <th>Order No</th>
                                                        <th>Total Amount (RM)</th>
                                                        <th>Order Status</th>
                                                        <th>Delivery Status</th>                                                     
                                                        <th>Updated Date</th>
                                                        <th>Updated By</th>
                                                        <th>Option</th>
                                                    </tr>
                                                </thead>


                                                <tbody>
                                                    <%for (Orders o : orderLists) {%>

                                                    <tr>
                                                        <td data-field="order_No"><%=o.getOrderNo()%></td>




                                                        <td data-field="order_ttlAmt"><%=o.getOrderTtlAmt()%></td>

                                                        <%

                                                            String orderStatuss = o.getOrder_Status();
                                                            String success = "Successful";
                                                            if (o.getOrder_Status().equals("Successful")) {%>

                                                        <td class="order-success" data-field="order_Status">
                                                            <span><%=o.getOrder_Status()%></span>
                                                        </td>

                                                        <%} else {%>
                                                        <td class="order-cancle" data-field="order_Status">
                                                            <span><%=o.getOrder_Status()%></span>
                                                        </td>

                                                        <%}%>


                                                        <%

                                                            if (o.getDelivery_Status().getDeliveryStatus().equals("Pending")) {%>

                                                        <td class="order-pending" data-field="orderDelivery_Status">
                                                            <span><%=o.getDelivery_Status().getDeliveryStatus()%></span>
                                                        </td>

                                                        <%} else if (o.getDelivery_Status().getDeliveryStatus().equals("Packaging")) {%>
                                                        
                                                        <td class="order-continue" data-field="orderDelivery_Status">
                                                            <span><%=o.getDelivery_Status().getDeliveryStatus()%></span>
                                                        </td>
                                                        
                                                        <%} else if (o.getDelivery_Status().getDeliveryStatus().equals("Shipping")) {%>
                                                        
                                                        <td class="order-warning" data-field="orderDelivery_Status">
                                                            <span><%=o.getDelivery_Status().getDeliveryStatus()%></span>
                                                        </td>
                                                        
                                                        <%    } else if (o.getDelivery_Status().getDeliveryStatus().equals("Delivered")) {%>
                                                        
                                                        <td class="order-delivered" data-field="orderDelivery_Status">
                                                            <span><%=o.getDelivery_Status().getDeliveryStatus()%></span>
                                                        </td>
                                                        
                                                        <%    } else if (o.getDelivery_Status().getDeliveryStatus().equals("Completed")) {%>
                                                        
                                                        <td class="order-success" data-field="orderDelivery_Status">
                                                            <span><%=o.getDelivery_Status().getDeliveryStatus()%></span>
                                                        </td>
                                                        
                                                        <%    } else {%>
                                                        
                                                        <td class="order-cancle" data-field="orderDelivery_Status">
                                                            <span><%=o.getDelivery_Status().getDeliveryStatus()%></span>
                                                        </td>

                                                        <%}%>


                                                        <td data-field="order_updateDate"><%=o.getOrderUpDate()%></td>
                                                        <td data-field="order_updateBy"><%=o.getOrderUpBy()%></td>

                                                        <td>
                                                            <%if(o.getOrder_Status().equals("Successful")){%>
                                                            <a href="EditOrder.jsp?orderRow=<%=o.getOrderRow()%>" id="viewBtn" class="prodCatView" role="button" style="margin-left: 10px;margin-right: 10px;">
                                                                <i class="fa fa-edit fa-lg" title="Edits"></i>
                                                            </a>
                                                                <%}%>

                                                            <a href="ViewOrder.jsp?orderRow=<%=o.getOrderRow()%>" id="viewBtn" class="prodCatView" role="button" style="margin-right: 10px;">
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
        <script src="https://cdn.datatables.net/1.13.4/js/dataTables.bootstrap5.min.js" defer></script>
        <script src="../../../assets/commonResources/loadDataTable.js" defer></script>

        <!--Sweet Alert js-->
        <script src="../../../assets/commonResources/sweetalert.min.js"></script>


        
    </body>
</html>