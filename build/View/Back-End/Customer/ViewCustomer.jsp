<%-- 
    Document   : CurrentCustomer
    Created on : May 4, 2023, 11:19:03 PM
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





        <!--Google font-->
        <link href="https://fonts.googleapis.com/css?family=Lato:300,400,700,900" rel="stylesheet">
        <link rel="preconnect" href="https://fonts.gstatic.com">
        <link href="https://fonts.googleapis.com/css2?family=Yellowtail&display=swap" rel="stylesheet">

        <!-- Icons -->
        <link rel="stylesheet" type="text/css" href="../../../assets/css/vendors/font-awesome.css">

        <!--Slick slider css-->
        <link rel="stylesheet" type="text/css" href="../../../assets/css/vendors/slick.css">
        <link rel="stylesheet" type="text/css" href="../../../assets/css/vendors/slick-theme.css">

        <!-- Animate icon -->
        <link rel="stylesheet" type="text/css" href="../../../assets/css/vendors/animate.css">

        <!-- Themify icon -->
        <link rel="stylesheet" type="text/css" href="../../../assets/css/vendors/themify-icons.css">

        <!-- Bootstrap css -->
        <link rel="stylesheet" type="text/css" href="../../../assets/css/vendors/bootstrap.css">

        <!-- Theme css -->
        <link rel="stylesheet" type="text/css" href="../../../assets/css/style.css">





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
                                        <h3>View Customer
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

                                        <li class="breadcrumb-item active">View Customer</li>
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
                                        <%
                                            int custID = Integer.parseInt(request.getParameter("custID"));
                                            Customer c = new Customer();
                                            CustomerDA dac = new CustomerDA();
                                            c = dac.getCustRecord(custID);
                                            AddressDA addressDA = new AddressDA();
                                            ArrayList<Address> addressArray = addressDA.getAllAddress(custID);
                                        %>

                                        <!-- personal detail section start -->
                                        <section class="contact-page register-page">
                                            <div class="container">
                                                <div class="row">
                                                    <div class="col-sm-12">
                                                        <h3>PERSONAL DETAIL</h3>
                                                        <div class="form-row row">


                                                            <div class="col-md-6">
                                                                <label for="name">Full Name</label>
                                                                <input type="" class="form-control" id="custName" placeholder="Eg. TAN YU XUAN" name ="custName"
                                                                       value ="<%=c.getCustName()%> " disabled>
                                                            </div>

                                                            <div class="col-md-6">
                                                                <label for="email">Username</label>
                                                                <input type="text" class="form-control" id="custUsername" placeholder="Eg. YuXuan123" readonly="" name ="custUsername"
                                                                       value ="<%=c.getCustUsername()%> " disabled>
                                                            </div>

                                                            <div class="col-md-6">
                                                                <label for="review">Phone number</label>
                                                                <input type="text" class="form-control" id="custHP" placeholder="E.g 012-3456789" name="custHP"
                                                                       value ="<%=c.getCustHP()%> "disabled>
                                                            </div>

                                                            <div class="col-md-6">
                                                                <label for="email">Email Address</label>
                                                                <input type="text" class="form-control" id="custEmail" placeholder="Eg. tanyuxuan030409@gmail.com" name="custEmail" 
                                                                       value ="<%=c.getCustEmail()%>" disabled>
                                                            </div>




                                                            <div class="col-sm-12">
                                                                <br>
                                                                <h3>SHIPPING ADDRESS</h3>
                                                                <form class="theme-form">
                                                                    <div class="form-row row" id = "Address">
                                                                        <%int i = 1;
                                                                            for (Address a : addressArray) {

                                                                        %>
                                                                        <h5><%if (i != 1) {%><br><%}%>SHIPPING ADDRESS<%=i%></h5>
                                                                            <%i++;%>

                                                                        <input type="hidden" value="<%=a.getAddressID()%>" name="addr_ID"/>
                                                                        <div class="col-md-6">
                                                                            <input type="radio" disabled id="addr_Type_<%=a.getAddressID()%>" name="addr_Type_<%=a.getAddressID()%>" value ="<%=a.getAddr_Type()%>" <% if ("Default".equals(a.getAddr_Type())) { %>checked<% }%> style="visibility: visible; opacity: 1;"/>
                                                                                                          <label for="Default">Default</label> 
                                                                        </div>

                                                                        <div class="col-md-6">
                                                                                                        <input type="radio" id="addr_Type_<%=a.getAddressID()%>" disabled name="addr_Type_<%=a.getAddressID()%>"  value ="<%=a.getAddr_Type()%>"  <% if ("Optional".equals(a.getAddr_Type())) { %>checked<% }%> style="visibility: visible; opacity: 1;"/>
                                                                                                        <label for="Optional">Optional</label><br>
                                                                        </div>

                                                                        <div class="col-md-6">
                                                                            <label for="name">Address Details</label>
                                                                            <input type="text" class="form-control" id="addr_details"  placeholder="E.g 1-12-22, Lorong Permai Jaya" name="addr_details"
                                                                                   value ="<%=a.getAddr_Details()%>" disabled>
                                                                        </div>
                                                                        <div class="col-md-6">
                                                                            <label for="name">Town</label>
                                                                            <input type="text" class="form-control" id="town" placeholder="E.g Tanjung Bungah" name="town"
                                                                                   value ="<%=a.getTown()%>" disabled>
                                                                        </div>
                                                                        <div class="col-md-6">
                                                                            <label for="email">Zipcode *</label>
                                                                            <input type="text" class="form-control" id="zipcode" placeholder="E.g 11200" name="zipcode"
                                                                                   value ="<%=a.getZipcode()%>" disabled>
                                                                        </div>
                                                                        <div class="col-md-6 select_input">
                                                                            <label for="State">State*</label>
                                                                            <select class="form-control"  size="1"  name="addr_state" disabled>
                                                                                <option value="addr_state">State</option>
                                                                                <option value="Johor" <% if (a.getAddr_State().equals("Johor")) { %>selected<% }%>>Johor</option>
                                                                                <option value="Kedah" <% if (a.getAddr_State().equals("Kedah")) { %>selected<% }%>>Kedah</option>
                                                                                <option value="Kelantan" <% if (a.getAddr_State().equals("Kelantan")) { %>selected<% }%>>Kelantan</option>
                                                                                <option value="Kuala Lumpur" <% if (a.getAddr_State().equals("Kuala Lumpur")) { %>selected<% }%>>Kuala Lumpur</option>
                                                                                <option value="Labuan" <% if (a.getAddr_State().equals("Labuan")) { %>selected<% }%>>Labuan</option>
                                                                                <option value="Melaka" <% if (a.getAddr_State().equals("Melaka")) { %>selected<% }%>>Melaka</option>
                                                                                <option value="Negeri Sembilan" <% if (a.getAddr_State().equals("Negeri Sembilan")) { %>selected<% }%>>Negeri Sembilan</option>
                                                                                <option value="Pahang" <% if (a.getAddr_State().equals("Pahang")) { %>selected<% }%>>Pahang</option>
                                                                                <option value="Penang" <% if (a.getAddr_State().equals("Penang")) { %>selected<% }%>>Penang</option>
                                                                                <option value="Perak" <% if (a.getAddr_State().equals("Perak")) { %>selected<% }%>>Perak</option>
                                                                                <option value="Perlis" <% if (a.getAddr_State().equals("Perlis")) { %>selected<% }%>>Perlis</option>
                                                                                <option value="Putrajaya" <% if (a.getAddr_State().equals("Putrajaya")) { %>selected<% }%>>Putrajaya</option>
                                                                                <option value="Sabah" <% if (a.getAddr_State().equals("Sabah")) { %>selected<% }%>>Sabah</option>
                                                                                <option value="Sarawak" <% if (a.getAddr_State().equals("Sarawak")) { %>selected<% }%>>Sarawak</option>
                                                                                <option value="Selangor" <% if (a.getAddr_State().equals("Selangor")) { %>selected<% }%>>Selangor</option>
                                                                                <option value="Terengganu" <% if (a.getAddr_State().equals("Terengganu")) { %>selected<% }%>>Terengganu</option>
                                                                            </select>
                                                                        </div>

                                                                        <div class="col-md-6">
                                                                            <label for="review">Receiver Name</label>
                                                                            <input type="text" class="form-control" id="receiverName" placeholder="E.g 012-3456789" name="receiverName"
                                                                                   value ="<%=a.getReceiverName()%>" disabled>
                                                                        </div>   

                                                                        <div class="col-md-6">
                                                                            <label for="review">Receiver Phone Number</label>
                                                                            <input type="text" class="form-control" id="receiverHP" placeholder="E.g 012-3456789" name="receiverHP"
                                                                                   value ="<%=a.getReceiverHP()%>" disabled>
                                                                        </div>
                                                                        <%}%>

                                                                </form>

                                                            </div>


                                                            <div class="col-md-12">
                                                                <br>
                                                                <button class="btn btn-sm btn-solid" type="button" onclick="window.location = 'CurrentCustomer.jsp'">Back</button>
                                                            </div>

                                                        </div>
                                                    </div>
                                                </div>
                                        </section>
                                        <!-- Section ends -->
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

                                                                    function deactiveConfimation(custID, custName) {
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
                                                                                deactiveUser(custID, custName, event)
                                                                            }
                                                                        })
                                                                    }


                                                                    function deactiveUser(custID, custName, event) {
                                                                        event.preventDefault();
                                                                        var data = {
                                                                            custID: custID,
                                                                            custName: custName
                                                                        };
                                                                        var jsonData = JSON.stringify(data);
                                                                        console.log(JSON.parse(jsonData));
                                                                        //                    //Send JSON data to servlet using AJAX
                                                                        $.ajax({
                                                                            type: "POST",
                                                                            url: "/innisfree_1/deactiveCustomer", // Replace with your servlet URL
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

            function activeConfimation(custID, custName) {
                Swal.fire({
                    title: 'Are you sure?',
                    text: "Are you sure wanna ACTIVE this Account!",
                    icon: 'warning',
                    showCancelButton: true,
                    confirmButtonColor: '#548c5e',
                    cancelButtonColor: '#d33',
                    confirmButtonText: 'Yes, ACTIVE it!'
                }).then((result) => {
                    if (result.isConfirmed) {
                        activeUser(custID, custName, event)
                    }
                })
            }


            function activeUser(custID, custName, event) {
                event.preventDefault();
                var data = {
                    custID: custID,
                    custName: custName
                };
                var jsonData = JSON.stringify(data);
                console.log(JSON.parse(jsonData));
                //                    //Send JSON data to servlet using AJAX
                $.ajax({
                    type: "POST",
                    url: "/innisfree_1/activeCustomer", // Replace with your servlet URL
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

