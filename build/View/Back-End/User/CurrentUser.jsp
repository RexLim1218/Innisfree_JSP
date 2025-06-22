<%-- 
    Document   : currentUser
    Created on : May 4, 2023, 3:02:03 PM
    Author     : Rex Lim
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@page import="java.util.Base64"%>
<%@page import="Domain.*"%>

<%@page import="java.util.ArrayList"%>
<%@page import="DataAccess.*"%>
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
            DAEmployee dae = new DAEmployee();
            ArrayList<Employee> elist = dae.getAllEmployeeList();
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
                                        <h3>Current User
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
                                        <li class="breadcrumb-item">Users </li>
                                        <li class="breadcrumb-item active">Current User</li>
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
                                                        <th>Username</th>
                                                        <th>Full Name</th>
                                                        <th>Position</th>
                                                        <th>Status</th>
                                                        <th>Created Date</th>                                                     
                                                        <th>Updated Date</th>
                                                        <th>Updated By</th>
                                                        <th>Option</th>
                                                    </tr>
                                                </thead>


                                                <tbody>
                                                    <%for (Employee el : elist) {%>

                                                    <tr>
                                                        <td data-field="username"><%=el.getEmpUsername()%></td>




                                                        <td data-field="fullname"><%=el.getEmpName()%></td>
                                                        <td data-field="position"><%=el.getPosition()%></td>

                                                        <%

                                                            if (el.getEmpStatus().equals("Active")) {%>

                                                        <td class="order-success" data-field="emp_Status">
                                                            <span><%=el.getEmpStatus()%></span>
                                                        </td>

                                                        <%} else {%>
                                                        <td class="order-cancle" data-field="emp_Status">
                                                            <span><%=el.getEmpStatus()%></span>
                                                        </td>

                                                        <%}%>



                                                        <td data-field="createdDate"><%=el.getEmpCrDate()%></td>
                                                        <td data-field="updatedDate"><%=el.getEmpUpDate()%></td>
                                                        <td data-field="updateBy"><%=el.getEmpUpBy()%></td>

                                                        <td>
                                                            <a href="EditUser.jsp?empid=<%=el.getEmpID()%>" id="viewBtn" class="prodCatView" role="button" style="margin-left: 10px;margin-right: 10px;">
                                                                <i class="fa fa-edit fa-lg" title="Edits"></i>
                                                            </a>                                                                

                                                            <a href="ViewUser.jsp?empid=<%=el.getEmpID()%>" id="viewBtn" class="prodCatView" role="button" style="margin-right: 10px;">
                                                                <i class="fa fa-eye  fa-lg" title="View"></i>
                                                            </a>
                                                            <a href="passwordReset.jsp?empid=<%=el.getEmpID()%>" id="viewBtn" class="prodCatView" role="button" style="margin-right: 10px;">
                                                                <i class="fa fa-refresh fa-lg" title="Reset Password"></i>
                                                            </a>

                                                            <%

                                                                if (el.getEmpStatus().equals("Active")) {%>
                                                            <a onclick="deactiveConfimation(<%=el.getEmpID()%>, '<%=el.getEmpName()%>')" id="viewBtn" class="prodCatView" role="button" style="margin-right: 10px;">
                                                                <i class="fa fa-times fa-lg" title="Deactive"></i>
                                                            </a>


                                                            <%} else {%>
                                                            <a onclick="activeConfimation(<%=el.getEmpID()%>, '<%=el.getEmpName()%>')" id="viewBtn" class="prodCatView" role="button" style="margin-right: 10px;">

                                                                <i class="fa fa-check fa-lg" title="Active"></i>
                                                            </a>

                                                            <%}%>  



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


        <script>

                                                                function deactiveConfimation(empID, empName) {
                                                                    Swal.fire({
                                                                        title: 'Are you sure?',
                                                                        text: "Are you sure wanna DEACTIVE this Account!",
                                                                        icon: 'warning',
                                                                        showCancelButton: true,
                                                                        confirmButtonColor: '#548c5e',
                                                                        cancelButtonColor: '#d33',
                                                                        confirmButtonText: 'Yes, DEACTIVATE it!'
                                                                    }).then((result) => {
                                                                        if (result.isConfirmed) {
                                                                            deactiveUser(empID, empName, event)
                                                                        }
                                                                    })
                                                                }


                                                                function deactiveUser(empID, empName, event) {
                                                                    event.preventDefault();
                                                                    var data = {
                                                                        empID: empID,
                                                                        empName: empName
                                                                    };
                                                                    var jsonData = JSON.stringify(data);

                                                                    console.log(JSON.parse(jsonData));

//                    //Send JSON data to servlet using AJAX
                                                                    $.ajax({
                                                                        type: "POST",
                                                                        url: "/innisfree_1/deactiveUser", // Replace with your servlet URL
                                                                        data: jsonData,
                                                                        contentType: "application/json; charset=utf-8",
                                                                        dataType: "json",
                                                                        success: function (response) {
                                                                            console.log(JSON.parse(jsonData));
                                                                            // Handle success response from servlet
                                                                            Swal.fire({
                                                                                icon: 'success',
                                                                                title: 'Succssfully Deactive',
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

                                                                function activeConfimation(empID, empName) {
                                                                    Swal.fire({
                                                                        title: 'Are you sure?',
                                                                        text: "Are you sure wanna ACTIVE this Account!",
                                                                        icon: 'warning',
                                                                        showCancelButton: true,
                                                                        confirmButtonColor: '#548c5e',
                                                                        cancelButtonColor: '#d33',
                                                                        confirmButtonText: 'Yes, ACTIVATE it!'
                                                                    }).then((result) => {
                                                                        if (result.isConfirmed) {
                                                                            activeUser(empID, empName, event)
                                                                        }
                                                                    })
                                                                }


                                                                function activeUser(empID, empName, event) {
                                                                    event.preventDefault();
                                                                    var data = {
                                                                        empID: empID,
                                                                        empName: empName
                                                                    };
                                                                    var jsonData = JSON.stringify(data);

                                                                    console.log(JSON.parse(jsonData));

//                    //Send JSON data to servlet using AJAX
                                                                    $.ajax({
                                                                        type: "POST",
                                                                        url: "/innisfree_1/activeUser", // Replace with your servlet URL
                                                                        data: jsonData,
                                                                        contentType: "application/json; charset=utf-8",
                                                                        dataType: "json",
                                                                        success: function (response) {
                                                                            console.log(JSON.parse(jsonData));
                                                                            // Handle success response from servlet
                                                                            Swal.fire({
                                                                                icon: 'success',
                                                                                title: 'Succssfully Active',
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



    </body>
</html>
