<%-- 
    Document   : passwordReset
    Created on : May 4, 2023, 8:11:15 PM
    Author     : Rex Lim
--%>

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
            #password-criteria li.invalid, #current-message.invalid,#name-validation.invalid{
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

        <%
            int empID = Integer.parseInt(request.getParameter("empid"));
        %>

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

                <div class="page-body">
                    <!-- Container-fluid starts-->
                    <div class="container-fluid">
                        <div class="page-header">
                            <div class="row">
                                <div class="col-lg-6">
                                    <div class="page-header-left">
                                        <h3>Password Reset
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
                                        <li class="breadcrumb-item active">Password Reset </li>
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
                                                <form class="needs-validation user-add" action="${pageContext.servletContext.contextPath}/resetPassword">
                                                    <h4>Reset Password</h4>
                                                    <input type="hidden" value="<%=empID%>" id="empID" name="empID">
                                                    <%
                                                        if (found == 0) {
                                                    %>
                                                    <div class="form-group row">
                                                        <label for="validationCustom0"
                                                               class="col-xl-3 col-md-4"><span>*</span>Current Password</label>
                                                        <div class="col-xl-8 col-md-7">
                                                            <input class="form-control" id="empCurentPwd" name="empCurrentPwd"
                                                                   type="password" required="" pattern="^(?=.*[a-z])(?=.*[A-Z])(?=.*[0-9])(?=.*[!@#$%^&*_=+-]).{8,}$" title="*Use 8 or more characters with a mix of letters, numbers & sysmbol">

                                                        </div>
                                                        <span for="validationCustom2"
                                                              class="col-xl-3 col-md-4"></span>
                                                        <div class="col-xl-8 col-md-7" id="current-message">

                                                        </div>
                                                    </div>
                                                    <div class="form-group row">
                                                        <label for="validationCustom3"
                                                               class="col-xl-3 col-md-4"><span>*</span> Password</label>
                                                        <div class="col-xl-8 col-md-7">
                                                            <input class="form-control" id="empPwd" name="empPwd"
                                                                   type="password" required="" pattern="^(?=.*[a-z])(?=.*[A-Z])(?=.*[0-9])(?=.*[!@#$%^&*_=+-]).{8,}$" title="*Use 8 or more characters with a mix of letters, numbers & sysmbol">

                                                        </div>
                                                        <span for="validationCustom3"
                                                              class="col-xl-3 col-md-4"></span>
                                                        <div class="col-xl-8 col-md-7">
                                                            <ul id="password-criteria">
                                                                <li>At least 8 characters long</li><br>
                                                                <li>At least one uppercase letter</li><br>
                                                                <li>At least one lowercase letter</li><br>
                                                                <li>At least one number</li><br>
                                                                <li>At least one special character (e.g. @, #, $, %)</li>
                                                            </ul>

                                                        </div>

                                                    </div>
                                                    <div class="form-group row">
                                                        <label for="validationCustom4"
                                                               class="col-xl-3 col-md-4"><span>*</span> Confirm
                                                            Password</label>
                                                        <div class="col-xl-8 col-md-7">
                                                            <input class="form-control" id="empPwd2" name="empPwd2"
                                                                   type="password" required="" pattern="^(?=.*[a-z])(?=.*[A-Z])(?=.*[0-9])(?=.*[!@#$%^&*_=+-]).{8,}$" title="*Use 8 or more characters with a mix of letters, numbers & sysmbol">
                                                        </div>
                                                        <span for="validationCustom3"
                                                              class="col-xl-3 col-md-4"></span>
                                                        <div class="col-xl-8 col-md-7" id="password-mismatch-message" style="display:none; color:red;">Passwords do not match</div>
                                                    </div>

                                                    <%} else {%>

                                                    <div class="form-group row">
                                                        <label for="validationCustom3"
                                                               class="col-xl-3 col-md-4"><span>*</span> Password</label>
                                                        <div class="col-xl-8 col-md-7">
                                                            <input class="form-control" id="empPwd" name="empPwd"
                                                                   type="password" required="" pattern="^(?=.*[a-z])(?=.*[A-Z])(?=.*[0-9])(?=.*[!@#$%^&*_=+-]).{8,}$" title="*Use 8 or more characters with a mix of letters, numbers & sysmbol">

                                                        </div>
                                                        <span for="validationCustom3"
                                                              class="col-xl-3 col-md-4"></span>
                                                        <div class="col-xl-8 col-md-7">
                                                            <ul id="password-criteria">
                                                                <li>At least 8 characters long</li><br>
                                                                <li>At least one uppercase letter</li><br>
                                                                <li>At least one lowercase letter</li><br>
                                                                <li>At least one number</li><br>
                                                                <li>At least one special character (e.g. @, #, $, %)</li>
                                                            </ul>

                                                        </div>

                                                    </div>
                                                    <div class="form-group row">
                                                        <label for="validationCustom4"
                                                               class="col-xl-3 col-md-4"><span>*</span> Confirm
                                                            Password</label>
                                                        <div class="col-xl-8 col-md-7">
                                                            <input class="form-control" id="empPwd2" name="empPwd2"
                                                                   type="password" required="" pattern="^(?=.*[a-z])(?=.*[A-Z])(?=.*[0-9])(?=.*[!@#$%^&*_=+-]).{8,}$" title="*Use 8 or more characters with a mix of letters, numbers & sysmbol">
                                                        </div>
                                                        <span for="validationCustom3"
                                                              class="col-xl-3 col-md-4"></span>
                                                        <div class="col-xl-8 col-md-7" id="password-mismatch-message" style="display:none; color:red;">Passwords do not match</div>
                                                    </div>

                                                    <%}%>






                                                    <div class="pull-right">
                                                        <button type="submit" class="btn btn-primary" id="submit-button" onclick="resetPassowrd(event)">Save</button>
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
                                                            const passwordField = document.getElementById('empPwd');
                                                            const confirmPasswordField = document.getElementById('empPwd2');
                                                            const passwordCriteria = document.getElementById('password-criteria');
                                                            const passwordCriteriaItems = passwordCriteria.getElementsByTagName('li');
                                                            const passwordRegexes = [
                                                                /^.{8,}$/,
                                                                /[A-Z]/,
                                                                /[a-z]/,
                                                                /[0-9]/,
                                                                /[!@#$%^&*()_+\-=[\]{};':"\\|,.<>/?]/
                                                            ]; // Change these regexes to match your desired password criteria
                                                            const passwordMismatchMessage = document.getElementById('password-mismatch-message');

                                                            function validatePassword() {
                                                                const password = passwordField.value;
                                                                const confirmPassword = confirmPasswordField.value;
                                                                let passwordsMatch = true;

                                                                for (let i = 0; i < passwordCriteriaItems.length; i++) {
                                                                    if (passwordRegexes[i].test(password)) {
                                                                        passwordCriteriaItems[i].classList.remove('invalid');
                                                                        passwordCriteriaItems[i].classList.add('valid');
                                                                        $('#submit-button').attr('disabled', false); // disable submit button
                                                                    } else {
                                                                        passwordCriteriaItems[i].classList.remove('valid');
                                                                        passwordCriteriaItems[i].classList.add('invalid');
                                                                        passwordsMatch = false;
                                                                        $('#submit-button').attr('disabled', true); // disable submit button
                                                                    }
                                                                }

                                                                if (password === confirmPassword) {
                                                                    confirmPasswordField.classList.remove('invalid');
                                                                    confirmPasswordField.classList.add('valid');
                                                                    passwordMismatchMessage.style.display = 'none';
                                                                    $('#submit-button').attr('disabled', false); // disable submit button
                                                                } else {
                                                                    confirmPasswordField.classList.remove('valid');
                                                                    confirmPasswordField.classList.add('invalid');
                                                                    passwordsMatch = false;
                                                                    passwordMismatchMessage.style.display = 'block';
                                                                    $('#submit-button').attr('disabled', true); // disable submit button
                                                                }

                                                                return passwordsMatch;
                                                            }

                                                            passwordField.addEventListener('input', validatePassword);
                                                            confirmPasswordField.addEventListener('input', validatePassword);
        </script>

        <script>

            $(document).ready(function () {
                $('#empCurentPwd').on('input', function () {
                    var data = {
                        action: "passwordCheck",
                        empCurentPwd: $('#empCurentPwd').val(),
                        empID: $('#empID').val()
                    };
                    var jsonData = JSON.stringify(data);

                    console.log(JSON.parse(jsonData));
                    $.ajax({
                        type: "POST",
                        url: '/innisfree_1/userNamePassword',
                        data: jsonData,
                        contentType: "application/json; charset=utf-8",
                        dataType: "json",
                        success: function (response) {
                            if (response.existsUsername) {
                                $('#submit-button').attr('disabled', false);
                                $('#empCurentPwd').addClass('valid');
                                $('#current-message').text('');
                                $('#current-message').addClass('valid');
                            } else {
                                $('#empCurentPwd').removeClass('invalid');
                                $('#current-message').addClass('invalid');
                                $('#current-message').text('Password not match');
                                $('#submit-button').attr('disabled', true);
                            }

                        }
                    });
                });

                
            });

        </script>




        <script>
            function resetPassowrd(event) {
                event.preventDefault();
                var data = {
                    empID: $('#empID').val(),
                    password: $('#empPwd').val()
                   
                };
                var jsonData = JSON.stringify(data);

                console.log(JSON.parse(jsonData));

                //                    //Send JSON data to servlet using AJAX
                $.ajax({
                    type: "POST",
                    url: "/innisfree_1/resetPassword", // Replace with your servlet URL
                    data: jsonData,
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function (response) {

                        if (response.status === "success") {
                            Swal.fire({
                                icon: 'success',
                                title: 'Succssfully Updated',
                                text: response.message,
                                confirmButtonColor: '#548c5e',
                                confirmButtonText: 'Continue',

                            }).then((result) => {
                                /* Read more about isConfirmed, isDenied below */
                                if (result.isConfirmed) {
                                    location.reload();
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
