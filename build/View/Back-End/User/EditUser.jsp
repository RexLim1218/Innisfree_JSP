<%-- 
    Document   : EditUser
    Created on : May 3, 2023, 9:46:29 PM
    Author     : Rex Lim
--%>

<%@page import="DataAccess.DAEmployee"%>
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

        <!--Sweet Alert css-->
        <link rel="stylesheet" type="text/css" href="../../../assets/commonResources/sweetalert.min.css"/>



        <style>
            #password-criteria li.invalid, #phoneNum-validation.invalid, #email-validation.invalid, #email-message.invalid,#username-message.invalid,#name-validation.invalid{
                color: red;
            }

            #password-criteria li.valid {
                color: green;
            }

            input.invalid {
                border-color: red;
            }

            input.valid {
                border-color: green;
            }
        </style>
    </head>

    <body>

        <!-- page-wrapper Start-->
        <div class="page-wrapper">

            <!-- Page Header Start-->
            <%@include file="../header.jsp"%>
            <!-- Page Header Ends -->

            <!-- Page Body Start-->
            <div class="page-body-wrapper">

                <!-- Left sidebar Start-->
                <%@include file="../sidebar.jsp"%>
                <!-- Left sidebar Ends-->
                <%
                    int empID = Integer.parseInt(request.getParameter("empid"));
                    DAEmployee dae = new DAEmployee();
                    Employee ep = dae.getEmployeeByID(empID);

                %>


                <div class="page-body">
                    <!-- Container-fluid starts-->
                    <div class="container-fluid">
                        <div class="page-header">
                            <div class="row">
                                <div class="col-lg-6">
                                    <div class="page-header-left">
                                        <h3>Edit User
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
                                        <li class="breadcrumb-item">Users </li>
                                        <li class="breadcrumb-item active">Edit User </li>
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
                                <div class="card tab2-card">
                                    <div class="card-body">
                                        <ul class="nav nav-tabs tab-coupon" id="myTab" role="tablist">
                                            <li class="nav-item"><a class="nav-link active show" id="account-tab"
                                                                    data-bs-toggle="tab" href="#account" role="tab" aria-controls="account"
                                                                    aria-selected="true" data-original-title="" title="">Account</a></li>

                                        </ul>
                                        <div class="tab-content" id="myTabContent">
                                            <div class="tab-pane fade active show" id="account" role="tabpanel"
                                                 aria-labelledby="account-tab">
                                                <form class="needs-validation user-add" action="${pageContext.servletContext.contextPath}/editUser">
                                                    <h4>Account Details</h4>
                                                    <div class="form-group row">
                                                        <label for="validationCustom1"
                                                               class="col-xl-3 col-md-4"><span>*</span> Position</label>
                                                        <div class="col-xl-8 col-md-7">
                                                            <select class="form-control" name="position" id="position" disabled="">
                                                                <option value="Manager" <% if (ep.getPosition().equals("Manager")) { %>selected<% }%>>Manager</option>
                                                                <option value="Staff" <% if (ep.getPosition().equals("Staff")) { %>selected<% }%>>Staff</option>

                                                            </select>
                                                        </div>
                                                    </div>
                                                                <input type="hidden" value="<%=ep.getEmpID()%>" id="empID" name="empID">
                                                    <div class="form-group row">
                                                        <label for="validationCustom0"
                                                               class="col-xl-3 col-md-4"><span>*</span> Username</label>
                                                        <div class="col-xl-8 col-md-7">
                                                            <input class="form-control" id="username" name="username" type="text"
                                                                   disabled="" value="<%=ep.getEmpUsername()%>" placeholder="Enter username">
                                                        </div>
                                                        <span for="validationCustom2"
                                                              class="col-xl-3 col-md-4"></span>
                                                        <div class="col-xl-8 col-md-7" id="username-message">

                                                        </div>
                                                    </div>
                                                    <div class="form-group row">
                                                        <label for="validationCustom0"
                                                               class="col-xl-3 col-md-4"><span>*</span> Employee Name</label>
                                                        <div class="col-xl-8 col-md-7">
                                                            <input class="form-control" id="empname" name="empName" type="text" pattern="[a-zA-Z'-'\s]*" title="Only letter"
                                                                   required="" placeholder="Enter employee name" value="<%=ep.getEmpName()%>">
                                                        </div>

                                                        <span for="validationCustom2"
                                                              class="col-xl-3 col-md-4"></span>
                                                        <div class="col-xl-8 col-md-7" id="name-validation">

                                                        </div>
                                                    </div>

                                                    <div class="form-group row">
                                                        <label for="validationCustom2"
                                                               class="col-xl-3 col-md-4"><span>*</span> Email (E.g: zhexian1218@gmail.com)</label>
                                                        <div class="col-xl-8 col-md-7">
                                                            <input class="form-control" type="email" id="empemail" name="empemail" pattern="^\S+@\S+\.\S+$"
                                                                   required="" title="E.g zhexian1218@gmail.com" placeholder="Enter email" value="<%=ep.getEmpEmail()%>">
                                                        </div>
                                                        <span for="validationCustom2"
                                                              class="col-xl-3 col-md-4"></span>
                                                        <div class="col-xl-8 col-md-7" id="email-message">

                                                        </div>
                                                        <span for="validationCustom2"
                                                              class="col-xl-3 col-md-4"></span>
                                                        <div class="col-xl-8 col-md-7" id="email-validation">

                                                        </div>
                                                    </div>
                                                    <div class="form-group row">
                                                        <label for="validationCustom2"
                                                               class="col-xl-3 col-md-4"><span>*</span> Phone Number (E.g: 016-9999999)</label>
                                                        <div class="col-xl-8 col-md-7">
                                                            <input class="form-control" type="tel" id="empHp" name="empHp"
                                                                   pattern="(01)[0-46-9]-*[0-9]{7,8}" required title="E.g: 016-9999999" placeholder="Enter the phone number" value="<%=ep.getEmpHp()%>">
                                                        </div>
                                                        <span for="validationCustom2"
                                                              class="col-xl-3 col-md-4"></span>
                                                        <div class="col-xl-8 col-md-7" id="phoneNum-validation">

                                                        </div>
                                                    </div>
                                                    <div class="form-group row">
                                                        <label for="validationCustom2"
                                                               class="col-xl-3 col-md-4"><span>*</span> Status</label>
                                                        <div class="col-xl-8 col-md-7">
                                                            <input class="form-control" type="text" id="status" name="status" disabled="" value="<%=ep.getEmpStatus()%>">
                                                        </div>
                                                        <span for="validationCustom2"
                                                              class="col-xl-3 col-md-4"></span>
                                                        <div class="col-xl-8 col-md-7" id="phoneNum-validation">

                                                        </div>
                                                    </div>

                                                    <div class="pull-right">
                                                        <button type="submit" class="btn btn-primary" id="submit-button" onclick="editUser(event)">Save</button>
                                                    </div>
                                                </form>
                                            </div>

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

        <!-- lazyload js-->
        <script src="../assets/js/lazysizes.min.js"></script>

        <!--right sidebar js-->
        <script src="../assets/js/chat-menu.js"></script>

        <!--form validation js-->
        <script src="../assets/js/dashboard/form-validation-custom.js"></script>

        <!--script admin-->
        <script src="../assets/js/admin-script.js"></script>

        <!--Sweet Alert js-->
        <script src="../../../assets/commonResources/sweetalert.min.js"></script>









        <script>

                                                            $(document).ready(function () {
                                                                

                                                                $('#empemail').on('input', function () {
                                                                    var email = $('#empemail').val();
                                                                    var emailRegex = /^\S+@\S+\.\S+$/;
                                                                    if (!emailRegex.test(email)) {
                                                                        $('#submit-button').attr('disabled', true);
                                                                        $('#empemail').addClass('invalid');
                                                                        $('#email-validation').text('Invalid email format');
                                                                        $('#email-validation').addClass('invalid');
                                                                    } else {
                                                                        $('#submit-button').attr('disabled', false);
                                                                        $('#empemail').removeClass('invalid');
                                                                        $('#email-validation').text('');
                                                                    }
                                                                });
                                                            });

        </script>

        <script>
            $(document).ready(function () {
                $('#empHp').on('input', function () {
                    var phoneNum = $('#empHp').val();
                    var phoneNumRegex = /^(01)[0-46-9]-*[0-9]{7,8}$/;
                    if (!phoneNumRegex.test(phoneNum)) {
                        $('#empHp').addClass('invalid');
                        $('#phoneNum-validation').text('Invalid phone number format');
                        $('#phoneNum-validation').addClass('invalid');
                        $('#submit-button').attr('disabled', true); // disable submit button
                    } else {
                        $('#empHp').removeClass('invalid');
                        $('#phoneNum-validation').text('');
                        $('#submit-button').attr('disabled', false); // enable submit button
                    }
                });
            });

        </script>

        <script>
            $(document).ready(function () {
               
                $('#empname').on('input', function () {
                    var name = $('#empname').val();
                    var nameRegex = /^[a-zA-Z]+(([',. -][a-zA-Z ])?[a-zA-Z]*)*$/;
                    if (!nameRegex.test(name)) {
                        $('#empname').addClass('invalid');
                        $('#name-validation').text('Invalid name format');
                        $('#name-validation').addClass('invalid');
                        $('#submit-button').attr('disabled', true); // disable submit button
                    } else {
                        $('#empname').removeClass('invalid');
                        $('#name-validation').text('');
                        $('#submit-button').attr('disabled', false); // enable submit button
                    }
                });
            });
        </script>

        <script>
            function editUser(event) {
                event.preventDefault();
                var data = {
                    empID: $('#empID').val(),
                    empName: $('#empname').val(),
                    empemail: $('#empemail').val(),
                    empHp: $('#empHp').val()

                };
                var jsonData = JSON.stringify(data);

                console.log(JSON.parse(jsonData));

                //                    //Send JSON data to servlet using AJAX
                $.ajax({
                    type: "POST",
                    url: "/innisfree_1/editUser", // Replace with your servlet URL
                    data: jsonData,
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function (response) {

                        if (response.status === "success") {
                            Swal.fire({
                                icon: 'success',
                                title: 'Succssfully Added',
                                text: response.message,
                                confirmButtonColor: '#548c5e',
                                confirmButtonText: 'Continue',

                            }).then((result) => {
                                /* Read more about isConfirmed, isDenied below */
                                if (result.isConfirmed) {
                                    window.location.replace("<%=request.getContextPath()%>/View/Back-End/Dashboard/Dashboard.jsp");
                                }
                            })

                        } else if (response.status === "error") {

                            Swal.fire({
                                icon: 'success',
                                title: response.message,
                                text: response.message,
                                confirmButtonColor: '#548c5e',
                                confirmButtonText: 'Continue',

                            }).then((result) => {
                                /* Read more about isConfirmed, isDenied below */
                                if (result.isConfirmed) {
                                    location.reload();
                                }
                            })

                        }


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