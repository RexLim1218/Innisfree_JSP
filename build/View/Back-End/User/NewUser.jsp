<%-- 
    Document   : newUser
    Created on : May 3, 2023, 9:46:29 PM
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

                <div class="page-body">
                    <!-- Container-fluid starts-->
                    <div class="container-fluid">
                        <div class="page-header">
                            <div class="row">
                                <div class="col-lg-6">
                                    <div class="page-header-left">
                                        <h3>Create User
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
                                        <li class="breadcrumb-item active">Create User </li>
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
                                                <form class="needs-validation user-add" action="${pageContext.servletContext.contextPath}/newUser">
                                                    <h4>Account Details</h4>
                                                    <div class="form-group row">
                                                        <label for="validationCustom1"
                                                               class="col-xl-3 col-md-4"><span>*</span> Position</label>
                                                        <div class="col-xl-8 col-md-7">
                                                            <select class="form-control" name="position" id="position">
                                                                <option value="Manager">Manager</option>
                                                                <option value="Staff">Staff</option>

                                                            </select>
                                                        </div>
                                                    </div>
                                                    <div class="form-group row">
                                                        <label for="validationCustom0"
                                                               class="col-xl-3 col-md-4"><span>*</span> Username</label>
                                                        <div class="col-xl-8 col-md-7">
                                                            <input class="form-control" id="username" name="username" type="text"
                                                                   required="" placeholder="Enter username">
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
                                                                   required="" placeholder="Enter employee name">
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
                                                                   required="" title="E.g zhexian1218@gmail.com" placeholder="Enter email">
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
                                                                   pattern="(01)[0-46-9]-*[0-9]{7,8}" required title="E.g: 016-9999999" placeholder="Enter the phone number">
                                                        </div>
                                                        <span for="validationCustom2"
                                                              class="col-xl-3 col-md-4"></span>
                                                        <div class="col-xl-8 col-md-7" id="phoneNum-validation">

                                                        </div>
                                                    </div>
                                                    <div class="form-group row">
                                                        <label for="validationCustom3"
                                                               class="col-xl-3 col-md-4"><span>*</span> Password</label>
                                                        <div class="col-xl-8 col-md-7">
                                                            <div class="input-group">
                                                                <input class="form-control" id="empPwd" name="empPwd" type="password" required="" pattern="^(?=.*[a-z])(?=.*[A-Z])(?=.*[0-9])(?=.*[!@#$%^&*_=+-]).{8,}$" title="*Use 8 or more characters with a mix of letters, numbers & symbols">
                                                                <div class="input-group-append">
                                                                    <button class="btn btn-outline-secondary" type="button" id="togglePassword1"><i class="fa fa-eye"></i></button>
                                                                </div>
                                                            </div>
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
                                                            <div class="input-group">
                                                                <input class="form-control" id="empPwd2" name="empPwd2" type="password" required="" pattern="^(?=.*[a-z])(?=.*[A-Z])(?=.*[0-9])(?=.*[!@#$%^&*_=+-]).{8,}$" title="*Use 8 or more characters with a mix of letters, numbers & symbols">
                                                                <div class="input-group-append">
                                                                    <button class="btn btn-outline-secondary" type="button" id="togglePassword"><i class="fa fa-eye"></i></button>
                                                                </div>
                                                            </div>
                                                        </div>

                                                        <span for="validationCustom3"
                                                              class="col-xl-3 col-md-4"></span>
                                                        <div class="col-xl-8 col-md-7" id="password-mismatch-message" style="display:none; color:red;">Passwords do not match</div>
                                                    </div>
                                                    <div class="form-group row">
                                                        <label for="validationCustom4"
                                                               class="col-xl-3 col-md-4"><span>*</span> Status
                                                        </label>
                                                        <div class="col-xl-8 col-md-7">
                                                            <input type="radio" id="emp_Status" name="emp_Status" value="Active" required style="margin-left: 80px;">
                                                            <label for="validationCustom02" class="mb-1">Active</label>
                                                            <input type="radio" id="emp_Status" name="emp_Status" value="Deactive" required style="margin-left: 80px;">
                                                            <label for="validationCustom02" class="mb-1">Deactive</label>
                                                        </div>
                                                    </div>
                                                    <div class="pull-right">
                                                        <button type="submit" class="btn btn-primary" id="submit-button" onclick="addUser(event)">Save</button>
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




        <!--        <script>
                    const passwordField = document.getElementById('empPwd');
        
                    passwordField.addEventListener('input', () => {
                        const password = passwordField.value;
                        const passwordRegex = /^[\w@-]{8,20}$/; // Change this regex to match your desired password format
        
                        if (passwordRegex.test(password)) {
                            passwordField.style.borderColor = 'initial'; // Set the border color back to its default
                        } else {
                            passwordField.style.borderColor = 'red'; // Set the border color to red
                        }
                    });
                </script>-->


<script>
    var togglePassword = document.getElementById("togglePassword");
    var passwordInput = document.getElementById("empPwd2");

    togglePassword.addEventListener("click", function(event) {
        event.preventDefault();

        if (passwordInput.type === "password") {
            passwordInput.type = "text";
            togglePassword.innerHTML = '<i class="fa fa-eye-slash"></i>';
        } else {
            passwordInput.type = "password";
            togglePassword.innerHTML = '<i class="fa fa-eye"></i>';
        }
    });
    var togglePassword1 = document.getElementById("togglePassword1");
    var passwordInput2 = document.getElementById("empPwd");

    togglePassword1.addEventListener("click", function(event) {
        event.preventDefault();

        if (passwordInput2.type === "password") {
            passwordInput2.type = "text";
            togglePassword1.innerHTML = '<i class="fa fa-eye-slash"></i>';
        } else {
            passwordInput2.type = "password";
            togglePassword1.innerHTML = '<i class="fa fa-eye"></i>';
        }
    });
</script>

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

                                                                if(passwordsMatch){
                                                                    $('#submit-button').attr('disabled', false); 
                                                                }else{
                                                                    $('#submit-button').attr('disabled', true); 
                                                                }

                                                                return passwordsMatch;
                                                            }

                                                            passwordField.addEventListener('input', validatePassword);
                                                            confirmPasswordField.addEventListener('input', validatePassword);
        </script>

        <!--        <script>
        
                    $(document).ready(function () {
                        $('#username, #empemail').on('input', function () {            //for the id 
        
                            var data = {//for input id & action 
                                action: "emp",
                                username: $('#username').val(),
                                email: $('#empemail').val()
                            };
                            var jsonData = JSON.stringify(data);
        
                            console.log(JSON.parse(jsonData));
                            $.ajax({
                                type: "POST",
                                url: '/innisfree_1/userNamePassword', //servlet checking
                                data: jsonData,
                                contentType: "application/json; charset=utf-8",
                                dataType: "json",
                                success: function (response) {
                                    debugger;
                                    if (response.existsUsername) {
                                        $('#submit-button').attr('disabled', true); // disable submit button
                                        $('#username').addClass('invalid');
                                        $('#username-message').text('Username already exists');
                                        $('#username-message').addClass('invalid');
        
                                    } else {
                                        $('#username').removeClass('invalid');
                                        $('#username-message').text('');
                                        $('#submit-button').attr('disabled', false); // enable submit button
                                    }
                                    if (response.existsEmail) {
                                        $('#empemail').addClass('invalid');
                                        $('#email-message').text('Email already exists');
                                        $('#email-message').addClass('invalid');
                                        $('#submit-button').attr('disabled', true); // disable submit button
                                    } else {
                                        $('#empemail').removeClass('invalid');
                                        $('#email-message').text('');
                                        $('#submit-button').attr('disabled', false); // enable submit button
                                    }
                                }
                            });
                        });
                    });
        
        
        
                </script>
        
                <script>
                    $(document).ready(function () {
                        $('#empemail').on('input', function () {
                            var email = $('#empemail').val();
                            var emailRegex = /^\S+@\S+\.\S+$/;
                            if (!emailRegex.test(email)) {
                                $('#submit-button').attr('disabled', true); // disable submit button
                                $('#empemail').addClass('invalid');
                                $('#email-validation').text('Invalid email format');
                                $('#email-validation').addClass('invalid');
        
                            } else {
                                $('#submit-button').attr('disabled', false); // disable submit button
                                $('#empemail').removeClass('invalid');
                                $('#email-validation').text('');
        
                            }
                        });
                    });
        
                </script>-->



        <script>

            $(document).ready(function () {
                $('#username, #empemail').on('input', function () {
                    var data = {
                        action: "emp",
                        username: $('#username').val(),
                        email: $('#empemail').val()
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
                                $('#submit-button').attr('disabled', true);
                                $('#username').addClass('invalid');
                                $('#username-message').text('Username already exists');
                                $('#username-message').addClass('invalid');
                            } else {
                                $('#username').removeClass('invalid');
                                $('#username-message').text('');
                                $('#submit-button').attr('disabled', false);
                            }

                            var email = $('#empemail').val();
                            var emailRegex = /^\S+@\S+\.\S+$/;
                            if (!emailRegex.test(email)) {
                                $('#submit-button').attr('disabled', true);
                                $('#empemail').addClass('invalid');
                                $('#email-validation').text('Invalid email format');
                                $('#email-validation').addClass('invalid');
                            } else if (response.existsEmail) {
                                $('#empemail').addClass('invalid');
                                $('#email-message').text('Email already exists');
                                $('#email-message').addClass('invalid');
                                $('#submit-button').attr('disabled', true);
                            } else {
                                $('#empemail').removeClass('invalid');
                                $('#email-validation').text('');
                                $('#email-message').text('');
                                $('#submit-button').attr('disabled', false);
                            }
                        }
                    });
                });

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
                debugger;
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
            function addUser(event) {
                event.preventDefault();
                var data = {
                    position: $('#position').val(),
                    username: $('#username').val(),
                    empName: $('#empname').val(),
                    empemail: $('#empemail').val(),
                    empHp: $('#empHp').val(),
                    password: $('#empPwd').val(),
                    emp_Status: $('input[name=emp_Status]:checked').val()
                };
                var jsonData = JSON.stringify(data);

                console.log(JSON.parse(jsonData));

                //                    //Send JSON data to servlet using AJAX
                $.ajax({
                    type: "POST",
                    url: "/innisfree_1/newUser", // Replace with your servlet URL
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