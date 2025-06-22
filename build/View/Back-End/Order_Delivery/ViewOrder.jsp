<%-- 
    Document   : ViewOrder
    Created on : Apr 29, 2023, 6:40:26 PM
    Author     : Rex Lim
--%>

<%@page import="Domain.OrderDetails"%>
<%@page import="java.util.ArrayList"%>
<%@page import="DataAccess.DAOrderDetails"%>
<%@page import="Domain.Orders"%>
<%@page import="DataAccess.DAOrders"%>
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
            int orderRow = Integer.parseInt(request.getParameter("orderRow"));
            DAOrders dao = new DAOrders();
            Orders o = dao.getOrderByRow(orderRow);

            DAOrderDetails od = new DAOrderDetails();
            ArrayList<OrderDetails> getList = od.getAllOrderDetailsByRow(orderRow);
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
                                        <h3>Order Details
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
                                        <li class="breadcrumb-item">Order</li>
                                        <li class="breadcrumb-item active">Order Details</li>
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
                                        <div class="bg-inner cart-section order-details-table">
                                            <div class="row g-4">
                                                <div class="col-xl-8">
                                                    <div class="card-details-title">
                                                        <h3>Order Number <span>#<%=o.getOrderNo()%></span></h3>
                                                    </div>
                                                    <div class="table-responsive table-details">
                                                        <table class="table cart-table table-borderless">
                                                            <thead>
                                                                <tr>
                                                                    <th style="text-align: center">ProductName</th>
                                                                    <th style="text-align: center">
                                                                        Quantity
                                                                    </th>
                                                                    <th style="text-align: center">
                                                                        Price
                                                                    </th>
                                                                </tr>
                                                            </thead>

                                                            <tbody>
                                                                <tr class="table-order">
                                                                    <%for (OrderDetails details : getList) {%>
                                                                    <td>
                                                                        <h5><%=details.getProduct().getProdName()%></h5>
                                                                    </td>
                                                                    <td>

                                                                        <h5 style="text-align: center"><%=details.getOrdQty()%></h5>
                                                                    </td>
                                                                    <td>

                                                                        <h5 style="text-align: center"  ><%=details.getOrdPrice()%></h5>
                                                                    </td>
                                                                </tr>

                                                                <%}%>
                                                            </tbody>

                                                            <tfoot>
                                                                <tr class="table-order">
                                                                    <td colspan="2">
                                                                        <h5>Subtotal(RM) :</h5>
                                                                    </td>
                                                                    <td>
                                                                        <h4 style="text-align: center"><%=o.getOrderTtlAmt()%></h4>
                                                                    </td>
                                                                </tr>

                                                                <tr class="table-order">
                                                                    <td colspan="2">
                                                                        <h5>Shipping(RM) :</h5>
                                                                    </td>
                                                                    <td>
                                                                        <h4 style="text-align: center"><%=o.getPayment().getDeliveryFee()%></h4>
                                                                    </td>
                                                                </tr>




                                                                <tr class="table-order">

                                                                    <td colspan="4">


                                                                    </td>
                                                                </tr>
                                                                <tr class="table-order">

                                                                    <td colspan="2">

                                                                        <h4 class="theme-color fw-bold">Total Price :</h4>
                                                                    </td>
                                                                    <td>
                                                                        <h4 class="theme-color fw-bold" style="text-align: center"><%=o.getPayment().getPaymentAmount()%></h4>
                                                                    </td>
                                                                </tr>
                                                            </tfoot>
                                                        </table>

                                                    </div>

                                                    <br/>
                                                    <br/>
                                                    <br/>
                                                    <br/>
                                                    <br/>
                                                    <div class="form-group row" style="margin-left: -30%">

                                                        <div class="offset-xl-3 offset-sm-4 mt-4" >
                                                            <!--                                                                <br/>                                                               <br/>-->
                                                            <button type="button" class="btn btn-primary" onclick="window.location = 'CurrentOrder.jsp'" style="width: 600px; border-radius: 25px;" >Back to Previous</button>


                                                        </div>
                                                    </div>
                                                </div>

                                                <div class="col-xl-4">
                                                    <div class="row g-4">
                                                        <div class="col-12">
                                                            <div class="order-success">
                                                                <h4>Summary</h4>
                                                                <ul class="order-details">
                                                                    <li>Order ID: <%=o.getOrderNo()%></li>
                                                                    <li>Order Date: <%=o.getOrderCrDate()%></li>
                                                                    <li>Total Payment: <%=o.getPayment().getPaymentAmount()%></li>
                                                                </ul>
                                                            </div>
                                                        </div>

                                                        <div class="col-12">
                                                            <div class="order-success">
                                                                <div class="delivery-sec">

                                                                    <input hidden="" value="<%=orderRow%>" id="orderRow" name="orderRow"/>
                                                                    <input hidden="" value="<%=o.getDelivery_Status().getDeliveryID()%>" id="deliveryID" name="deliveryID"/>
                                                                    <h3><span>Latest Delivery Status:</span></h3>
                                                                    <br>
                                                                    <h3>Latest Updated Date: 
                                                                        <%=o.getDelivery_Status().getDel_UpDate()%></h3>
                                                                    <br>
                                                                    <h3>Status:<br>
                                                                        <select id="deliveryStatus" name="deliveryStatus" disabled style="background-color: #f5f5f5; border: 1px solid #ccc; border-radius: 5px; padding: 5px; width: 60%">
                                                                            
                                                                            <option value="Pending" <% if (o.getDelivery_Status().getDeliveryStatus().equals("Pending")) { %>selected<% }%>>Pending</option>
                                                                            <option value="Packaging" <% if (o.getDelivery_Status().getDeliveryStatus().equals("Packaging")) { %>selected<% }%>>Packaging</option>
                                                                            <option value="Shipping" <% if (o.getDelivery_Status().getDeliveryStatus().equals("Shipping")) { %>selected<% }%>>Shipping</option>
                                                                            <option value="Delivered" <% if (o.getDelivery_Status().getDeliveryStatus().equals("Delivered")) { %>selected<% }%>>Delivered</option>
                                                                            <option value="Completed" <% if (o.getDelivery_Status().getDeliveryStatus().equals("Completed")) { %>selected<% }%>>Completed</option>
                                                                            <option value="Cancelled" <% if (o.getDelivery_Status().getDeliveryStatus().equals("Cancelled")) { %>selected<% }%>>Cancelled</option>
                                                                        </select>

                                                                        </select>
                                                                    </h3>
                                                                    <br>
                                                                    <h3>Tracking No: <input type="text" disabled id="trackingNo" name="trackingNo" placeholder="Enter Tracking No..." value="<%=o.getTrackingno()%>" style="background-color: #f5f5f5; border: 1px solid #ccc; border-radius: 5px; padding: 5px;">
                                                                    </h3>
                                                                </div>
                                                            </div>
                                                        </div>      


                                                        <div class="col-12">
                                                            <div class="order-success">
                                                                <h4>shipping address</h4>
                                                                <ul class="order-details">
                                                                    <li><%=o.getDelivery_Status().getAddr().getReceiverName()%></li>
                                                                    <li>Contact No. <%=o.getDelivery_Status().getAddr().getReceiverHP()%></li>
                                                                    <li><%=o.getDelivery_Status().getAddr().getAddr_Details()%></li>
                                                                    <li><%=o.getDelivery_Status().getAddr().getZipcode()%>, <%=o.getDelivery_Status().getAddr().getTown()%> </li>
                                                                    <li><%=o.getDelivery_Status().getAddr().getAddr_State()%> </li>
                                                                </ul>
                                                            </div>
                                                        </div>



                                                        <div class="col-12">
                                                            <div class="order-success">
                                                                <div class="payment-mode">
                                                                    <h4>payment method</h4>
                                                                    <p><%=o.getPayment().getPaymentMethod()%></p>
                                                                </div>
                                                            </div>
                                                        </div>


                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <!-- section end -->
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

