<%-- 
    Document   : Sales
    Created on : May 1, 2023, 2:43:58 AM
    Author     : Rex Lim
--%>

<%@page import="DataAccess.DAOrders"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="DataAccess.DAOrderDetails"%>
<%@page import="Domain.OrderDetails"%>
<%@page import="Domain.Orders"%>
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



        <style>
            #form-inline {
                display: flex;
                margin: 30px 20px 0px 30px;
                flex-wrap: wrap;
            }

            .form-group {
                margin-right: 40px;
            }

            #yearInput, #monthInput, #dateInput {
                display: none;
            }

            #reportOption option {
                background-color: white;
                color: black;
            }

            #reportOption option[value="year"] {
                background-color: #F0F0F0;
            }

            #reportOption option[value="month"] {
                background-color: #E0E0E0;
            }

            #reportOption option[value="date"] {
                background-color: #D0D0D0;
            }

            #reportOption:focus + #yearInput,
            #reportOption:focus + #monthInput,
            #reportOption:focus + #dateInput {
                display: none;
            }

            #reportOption[value="year"] + #yearInput {
                display: flex;
            }

            #reportOption[value="month"] + #yearInput,
            #reportOption[value="month"] + #monthInput {
                display: flex;
            }

            #reportOption[value="date"] + #dateInput {
                display: flex;
            }
            
            #submit {
                width: 80px;
                height: 25px;
                border: 1px solid black;
                border-radius: 5px;
            }
            
            #submit:hover {
                opacity: 0.8;
            }

        </style>

    </head>


    <body>
        <%
            String startDate = "";
            String endDate = "";
            ArrayList<OrderDetails> odL = new ArrayList<OrderDetails>();
            int month = 0;
            int year = 0;
            DAOrders dao = new DAOrders();
            if (request.getParameter("year") != null) {
                year = Integer.parseInt(request.getParameter("year"));
                if (request.getParameter("month") != null) {
                    month = Integer.parseInt(request.getParameter("month"));
                    if (month > 0) {
                        odL = dao.salesReportMonth(year, month);
                    } else if(year>0){
                        odL = dao.salesReportYear(year);
                    }
                    else if (request.getParameter("startDate") != null && request.getParameter("endDate") != null) {
                startDate = request.getParameter("startDate");
                endDate = request.getParameter("endDate");
                odL = dao.salesReportDate(startDate, endDate);
            }

                }

                //run query here
            } 
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
                                        <h3>Sales
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

                                        <li class="breadcrumb-item active">Sales</li>
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

                                    <form id="form-inline" action="Sales.jsp" method="get">
                                        <div class="form-group">
                                            <label>Option:&nbsp;</label>
                                            <select name="reportOption" id="reportOption" style="width: 70px; height: 25px;">
                                                <option value="year">Year</option>
                                                <option value="month">Month</option>
                                                <option value="date">Date</option>
                                            </select>
                                        </div>
                                        <div class="form-group" id="yearInput" style="display: block;">
                                            <label>Year:</label>
                                            <select name="year" style="width: 120px; height: 25px;">
                                                <option value="0">Select a year</option>
                                                <option value="2022">2022</option>
                                                <option value="2023">2023</option>
                                                <option value="2024">2024</option>
                                            </select>
                                        </div>
                                        <div class="form-group" id="monthInput">
                                            <label>Month:</label>
                                            <select name="month"  style="width: 130px; height: 25px;">
                                                <option value="0">Select a option</option>
                                                <option value="1">January</option>
                                                <option value="2">February</option>
                                                <option value="3">March</option>
                                                <option value="4">April</option>
                                                <option value="5">May</option>
                                                <option value="6">June</option>
                                                <option value="7">July</option>
                                                <option value="8">August</option>
                                                <option value="9">September</option>
                                                <option value="10">October</option>
                                                <option value="11">November</option>
                                                <option value="12">December</option>
                                            </select>
                                        </div>
                                        <div class="form-group" id="dateInput">
                                            <label>Start Date:</label>
                                            <input type="date" id="startDate" name="startDate" style="margin-right: 40px;">
                                            <label>End Date:</label>
                                            <input type="date" id="endDate" name="endDate">
                                        </div>
                                        <button type="submit" id="submit">Submit</button>
                                    </form>



                                    <div class="card-body">
                                        <div class="table-responsive table-desi">
                                            <table  id="editableTable" class="orderTable">
                                                <thead>
                                                    <tr>
                                                        <th>Product Name</th>
                                                        <th>Category</th>
                                                        <th>Available Quantity</th>
                                                        <th>Unit Price</th>
                                                        <th>Quantity Sold</th>                                                     
                                                        <th>Sales Amount</th>

                                                    </tr>
                                                </thead>
                                                <%
                                                    if (!odL.isEmpty()) {
                                                        for (OrderDetails od : odL) {%>
                                                <tr>
                                                    <td><%=od.getProduct().getProdName()%></td>
                                                    <td><%=od.getProduct().getProdCat().getProdCatName()%></td>
                                                    <td><%=od.getProduct().getProdAvailable_Qty()%></td>
                                                    <td><%=od.getProduct().getProd_FinalPrice()%></td>
                                                    <td><%=od.getOrdQty()%></td>
                                                    <td><%=od.getOrdPrice()%></td>
                                                </tr>

                                                <% }
                                                    }

                                                %>

                                                <tbody>

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

        <!--Sweet Alert js-->
        <script src="../../../assets/commonResources/sweetalert.min.js"></script>

        <script src="../../../assets/commonResources/loadDataTable.js" defer></script>
        <!--        <script src="../loadDataTable.js" defer></script>-->

        <script>
            // Get references to the select and input fields
            const reportOption = document.querySelector('#reportOption');
            const yearInput = document.querySelector('#yearInput');
            const monthInput = document.querySelector('#monthInput');
            const dateInput = document.querySelector('#dateInput');

            // Set up an event listener for the select field
            reportOption.addEventListener('change', () => {
                // Hide all the input fields by default
                yearInput.style.display = 'none';
                monthInput.style.display = 'none';
                dateInput.style.display = 'none';

                // Show the appropriate input field based on the user's selection
                if (reportOption.value === 'year') {
                    yearInput.style.display = 'block';
                } else if (reportOption.value === 'month') {
                    yearInput.style.display = 'block';
                    monthInput.style.display = 'block';
                } else if (reportOption.value === 'date') {
                    dateInput.style.display = 'block';
                }
            });




        </script>
    </body>

</html>
