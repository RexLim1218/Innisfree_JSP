<%-- 
    Document   : index.jsp
    Created on : Mar 24, 2023, 9:12:15 PM
    Author     : Huawei
--%>

<%@page import="DataAccess.CustomerDA"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.List"%>
<%@page import="Domain.Orders"%>
<%@page import="java.util.ArrayList"%>
<%@page import="DataAccess.DAOrders"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="DataAccess.DAOrderDetails"%>
<%@page import="org.json.JSONObject"%>
<%@page import="org.json.JSONArray"%>
<%@page import="com.google.gson.Gson"%>
<%@page import="java.sql.SQLException"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
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

        <!-- Google font-->
        <link rel="stylesheet"
              href="https://fonts.googleapis.com/css2?family=Work+Sans:ital,wght@0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,500;1,600;1,700;1,800;1,900&display=swap">

        <link rel="stylesheet"
              href="https://fonts.googleapis.com/css2?family=Nunito:ital,wght@0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,300;1,400;1,500;1,600;1,700;1,800;1,900&display=swap">


        <!-- Font Awesome-->
        <link rel="stylesheet" type="text/css" href="../assets/css/vendors/font-awesome.css">

        <!-- Flag icon-->
        <link rel="stylesheet" type="text/css" href="../assets/css/vendors/flag-icon.css">

        <!-- ico-font-->
        <link rel="stylesheet" type="text/css" href="../assets/css/vendors/icofont.css">

        <!-- Prism css-->
        <link rel="stylesheet" type="text/css" href="../assets/css/vendors/prism.css">

        <!-- Chartist css -->
        <link rel="stylesheet" type="text/css" href="../assets/css/vendors/chartist.css">

        <!-- Bootstrap css-->
        <link rel="stylesheet" type="text/css" href="../assets/css/vendors/bootstrap.css">

        <!-- App css-->
        <link rel="stylesheet" type="text/css" href="../assets/css/style.css">
    </head>

    <body>
        <%
            // Retrieve the top 5 product sales from the database

            String[] productNames = new String[5];
            int[] productQuantities = new int[5];
            double[] productSales = new double[5];

            DAOrderDetails daod = new DAOrderDetails();

            ResultSet rs = daod.getTop5Prods();

            try {
                int j = 0;
                while (rs.next()) {
                    productNames[j] = rs.getString(1);
                    productQuantities[j] = rs.getInt(3);
                    productSales[j] = rs.getDouble(4);
                    j++;

                }

            } catch (SQLException ex) {
            }

            // Convert the data to JSON format
            JSONArray data = new JSONArray();
            for (int i = 0; i < productNames.length; i++) {
                JSONObject obj = new JSONObject();
                obj.put("name", productNames[i]);
                obj.put("sales", productSales[i]);
                obj.put("quantity", productQuantities[i]);
                data.put(obj);
            }

            DAOrders od = new DAOrders();
            ArrayList<Orders> oLists = od.get5LatestOrder();

            double totalEarningOnDay=od.getTotalEarningOnDay();
            int totalOrder = od.getOrderQuantity();
            double totalEarningOnMonth = od.getTotalEarningOnMonth();
            
CustomerDA ca = new CustomerDA();
int custCount =ca.NoCustomerRegister();
        %>



        <!-- page-wrapper Start-->
        <div class="page-wrapper">

            <!-- Page Header Start-->
            <%@include file="../header.jsp"%>
            <!-- Page Header Ends -->

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
                                        <h3>Dashboard
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
                                        <li class="breadcrumb-item active">Dashboard</li>
                                    </ol>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- Container-fluid Ends-->

                    <!-- Container-fluid starts-->
                    <div class="container-fluid">
                        <div class="row">
                            <div class="col-xxl-3 col-md-6 xl-50">
                                <div class="card o-hidden widget-cards">
                                    <div class="warning-box card-body">
                                        <div class="media static-top-widget align-items-center">
                                            <div class="icons-widgets">
                                                <div class="align-self-center text-center">
                                                    <i data-feather="navigation" class="font-warning"></i>
                                                </div>
                                            </div>
                                            <div class="media-body media-doller">
                                                <span class="m-0">Daily Earnings</span>
                                                <h3 class="mb-0">RM <span class="counter"><%=totalEarningOnDay%></span><small> Today
                                                        </small>
                                                </h3>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-xxl-3 col-md-6 xl-50">
                                <div class="card o-hidden widget-cards">
                                    <div class="secondary-box card-body">
                                        <div class="media static-top-widget align-items-center">
                                            <div class="icons-widgets">
                                                <div class="align-self-center text-center">
                                                    <i data-feather="box" class="font-secondary"></i>
                                                </div>
                                            </div>
                                            <div class="media-body media-doller">
                                                <span class="m-0">Order</span>
                                                <h3 class="mb-0"><span class="counter"><%=totalOrder%></span><small> Today</small>
                                                </h3>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-xxl-3 col-md-6 xl-50">
                                <div class="card o-hidden widget-cards">
                                    <div class="primary-box card-body">
                                        <div class="media static-top-widget align-items-center">
                                            <div class="icons-widgets">
                                                <div class="align-self-center text-center" style="background-color: #ff4c3b;">
                                                    <i data-feather="dollar-sign"  class="font-primary"></i>
                                                </div>
                                            </div>
                                            <div class="media-body media-doller"><span class="m-0">Monthly Earning</span>
                                                <h3 class="mb-0">RM<span class="counter"><%=totalEarningOnMonth%></span><small> Monthly</small></h3>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-xxl-3 col-md-6 xl-50">
                                <div class="card o-hidden widget-cards">
                                    <div class="danger-box card-body">
                                        <div class="media static-top-widget align-items-center">
                                            <div class="icons-widgets">
                                                <div class="align-self-center text-center"><i data-feather="users"
                                                                                              class="font-danger"></i></div>
                                            </div>
                                            <div class="media-body media-doller"><span class="m-0">Customer Registered</span>
                                                <h3 class="mb-0"><span class="counter"><%=custCount%></span><small> Monthly
                                                        </small></h3>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <!--Top 5 sales Product-->
                            <div class="col-xl-6 xl-100">
                                <div class="card">
                                    <div class="card-header">
                                        <h5>Top 5 Sales Product</h5>
                                        <div class="card-header-right">
                                            <ul class="list-unstyled card-option">
                                                <li><i class="icofont icofont-simple-left"></i></li>
                                                <li><i class="view-html fa fa-code"></i></li>
                                                <li><i class="icofont icofont-maximize full-card"></i></li>
                                                <li><i class="icofont icofont-minus minimize-card"></i></li>
                                                <li><i class="icofont icofont-refresh reload-card"></i></li>
                                                <li><i class="icofont icofont-error close-card"></i></li>
                                            </ul>
                                        </div>
                                    </div>
                                    <div class="card-body">
                                        <canvas id="myChart"></canvas>
                                    </div>
                                </div>
                            </div>
                            <div class="col-xl-6 xl-100">
                                <div class="card">
                                    <div class="card-header">
                                        <h5>Latest Orders</h5>
                                        <div class="card-header-right">
                                            <ul class="list-unstyled card-option">
                                                <li><i class="icofont icofont-simple-left"></i></li>
                                                <li><i class="view-html fa fa-code"></i></li>
                                                <li><i class="icofont icofont-maximize full-card"></i></li>
                                                <li><i class="icofont icofont-minus minimize-card"></i></li>
                                                <li><i class="icofont icofont-refresh reload-card"></i></li>
                                                <li><i class="icofont icofont-error close-card"></i></li>
                                            </ul>
                                        </div>
                                    </div>

                                    <!--The Order Table--> 
                                    <div class="card-body">
                                        <div class="user-status table-responsive latest-order-table">
                                            <table class="table table-bordernone">
                                                <thead>
                                                    <tr>
                                                        <th scope="col">Order ID</th>
                                                        <th scope="col">Order Total</th>

                                                        <th scope="col">Status</th>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                    <%for (Orders o : oLists) {%>
                                                    <tr>
                                                        <td><%=o.getOrderNo()%></td>
                                                        <td class="digits">RM <%=o.getOrderTtlAmt()%></td>

                                                        <td class="digits"><%=o.getDelivery_Status().getDeliveryStatus()%></td>
                                                    </tr>

                                                    <%}%>
                                                </tbody>
                                            </table>
                                            <a href="<%=request.getContextPath()%>/View/Back-End/Order_Delivery/CurrentOrder.jsp" class="btn btn-primary mt-4">View All Orders</a>
                                        </div>
                                        <div class="code-box-copy">
                                            <button class="code-box-copy__btn btn-clipboard"
                                                    data-clipboard-target="#example-head1" title=""
                                                    data-original-title="Copy"><i class="icofont icofont-copy-alt"></i></button>
                                            <pre class=" language-html"><code class=" language-html" id="example-head1">

                                    </code></pre>
                                        </div>
                                    </div>
                                </div>
                            </div>       
                    </div>
                    <!-- Container-fluid Ends-->
                </div>
                <!-- footer start-->
                <footer class="footer" style="margin-left: -0%">
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

        <!--chartist js-->
        <script src="../assets/js/chart/chartist/chartist.js"></script>

        <!--chartjs js-->
        <script src="../assets/js/chart/chartjs/chart.min.js"></script>

        <!-- lazyload js-->
        <script src="../assets/js/lazysizes.min.js"></script>

        <!--copycode js-->
        <script src="../assets/js/prism/prism.min.js"></script>
        <script src="../assets/js/clipboard/clipboard.min.js"></script>
        <script src="../assets/js/custom-card/custom-card.js"></script>

        <!--counter js-->
        <script src="../assets/js/counter/jquery.waypoints.min.js"></script>
        <script src="../assets/js/counter/jquery.counterup.min.js"></script>
        <script src="../assets/js/counter/counter-custom.js"></script>

        <!--peity chart js-->
        <script src="../assets/js/chart/peity-chart/peity.jquery.js"></script>

        <!-- Apex Chart Js -->
        <script src="https://cdn.jsdelivr.net/npm/apexcharts"></script>

        <!--sparkline chart js-->
        <script src="../assets/js/chart/sparkline/sparkline.js"></script>

        <!--Customizer admin-->
        <script src="../assets/js/admin-customizer.js"></script>

        <!--dashboard custom js-->
        <script src="../assets/js/dashboard/default.js"></script>

        <!--right sidebar js-->
        <script src="../assets/js/chat-menu.js"></script>

        <!--height equal js-->
        <script src="../assets/js/height-equal.js"></script>

        <!-- lazyload js-->
        <script src="../assets/js/lazysizes.min.js"></script>

        <!--script admin-->
        <script src="../assets/js/admin-script.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
        <script>


        </script>
        <script>
            // Get the canvas element and create a new chart object
            var ctx = document.getElementById('myChart').getContext('2d');
            var chart = new Chart(ctx, {
                type: 'pie',
                data: {
                    labels: [],
                    datasets: [{
                            label: 'Product Sales',
                            data: [],
                            backgroundColor: [
                                'rgba(255, 99, 132, 0.2)',
                                'rgba(54, 162, 235, 0.2)',
                                'rgba(255, 206, 86, 0.2)',
                                'rgba(75, 192, 192, 0.2)',
                                'rgba(153, 102, 255, 0.2)'
                            ],
                            borderColor: [
                                'rgba(255, 99, 132, 1)',
                                'rgba(54, 162, 235, 1)',
                                'rgba(255, 206, 86, 1)',
                                'rgba(75, 192, 192, 1)',
                                'rgba(153, 102, 255, 1)'
                            ],
                            borderWidth: 1
                        }]
                },
                options: {
                    responsive: true,
                    maintainAspectRatio: false,
                    width: 500,
                    height: 500,
                    title: {
                        display: true,
                        text: 'Top 5 Product Sales'
                    },
                    tooltips: {
                        callbacks: {
                            label: function (tooltipItem, data) {
                                var dataset = data.datasets[tooltipItem.datasetIndex];
                                var index = tooltipItem.index;
                                var sales = dataset.data[index];
                                var quantity = <%= data.toString()%>[index].quantity;
                                return dataset.label + ': ' + sales + ' (Quantity: ' + quantity + ')';
                            }
                        }
                    }
                }
            });

            // Set the chart data using the JSON data passed from Java
            chart.data.labels = <%= data.toString()%>.map(function (item) {
                return item.name;
            });
            chart.data.datasets[0].data = <%= data.toString()%>.map(function (item) {
                return item.sales;
            });
            chart.update();


        </script>
        


    </body>

</html>
