<%-- 
    Document   : Profile
    Created on : Apr 22, 2023, 10:41:16 PM
    Author     : Yu Xuan
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="Domain.Address"%>
<%@page import="DataAccess.AddressDA"%>
<%@page import="Domain.Customer"%>
<%@page import="DataAccess.CustomerDA"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta name="description" content="multikart">
        <meta name="keywords" content="multikart">
        <meta name="author" content="multikart">

        <meta http-equiv="Cache-Control" content="no-cache, no-store, must-revalidate" />
        <meta http-equiv="Pragma" content="no-cache" />
        <meta http-equiv="Expires" content="0" />
        <link rel="icon" href="../../../assets/images/favicon/3.png" type="image/x-icon">
        <title>Innisfree | Make You Better</title>

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
        <link rel="stylesheet" type="text/css" href="../../../assets/commonResources/sweetalert.min.css">

        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.13.0/css/all.min.css">

        <style>
            #password-criteria li.invalid, #phoneNumber-error.invalid, #email-exist.invalid, #email-error.invalid,#username-error.invalid,#name-error.invalid{
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

    <body class="theme-color-1">

        <%
            response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
            response.setHeader("Pragma", "no-cache");
            response.setHeader("Expires", "0");
        %>
        <!-- header start -->
        <%@include file="../cust.Header_Log.jsp" %>

        <!-- breadcrumb start -->
        <div class="breadcrumb-section">
            <div class="container">
                <div class="row">
                    <div class="col-sm-6">
                        <div class="page-title">
                            <h2>profile</h2>
                        </div>
                    </div>
                    <div class="col-sm-6">
                        <nav aria-label="breadcrumb" class="theme-breadcrumb">
                            <ol class="breadcrumb">
                                <li class="breadcrumb-item"><a href="index.html">Home</a></li>
                                <li class="breadcrumb-item active" aria-current="page">profile</li>
                            </ol>
                        </nav>
                    </div>
                </div>
            </div>
        </div>
        <!-- breadcrumb End -->




        <%
            Customer cd = (Customer) session.getAttribute("customerLogin");
//            AddressDA addressDA = new AddressDA();
//            ArrayList<Address> addressArray = addressDA.getAllAddress(c.getCustID());
%>

        <!-- personal detail section start -->
        <section class="contact-page register-page">
            <div class="container">
                <div class="row">
                    <div class="col-sm-12">
                        <h3>PERSONAL DETAIL</h3>
                        <form class="theme-form" action="${pageContext.servletContext.contextPath}/Profile"  method="post" id="Profile">
                            <div class="form-row row">


                                <div class="col-md-6">
                                    <label for="name">Full Name</label>
                                    <input type="" class="form-control" id="custName" placeholder="Eg. TAN YU XUAN" name ="custName"
                                           value ="<%=cd.getCustName()%> " required="">
                                    <span id="name-error"></span>
                                </div>

                                <div class="col-md-6">
                                    <label for="email">Username</label>
                                    <input type="text" class="form-control" id="custUsername" placeholder="Eg. YuXuan123" readonly="" name ="custUsername"
                                           value ="<%=cd.getCustUsername()%> " >
                                    <span id="username-error"></span>

                                </div>

                                <div class="col-md-6">
                                    <label for="review">Phone number</label>
                                    <input type="text" class="form-control" id="custHP" placeholder="E.g 012-3456789" name="custHP"
                                           value ="<%=cd.getCustHP()%> "required="">
                                    <span id="phoneNumber-error"></span>
                                </div>

                                <div class="col-md-6">
                                    <label for="email">Email Address</label>
                                    <input type="text" class="form-control" id="custEmail" placeholder="Eg. tanyuxuan030409@gmail.com" name="custEmail" 
                                           value ="<%=cd.getCustEmail()%>" required="">
                                    <span id="email-error"></span>
                                    <span id="email-exist"></span>
                                </div>

                                <div class="col-md-6">
                                    <label for="email">Password</label>
                                    <input type="text" class="form-control" id="password1" autocomplete="current-password" placeholder="Eg. Tan@123" name="custPWD"
                                           value ="<%=cd.getCustPWD()%>" required="">

                                    <i class="far fa-eye" id="togglePassword" style="position: relative; left: 600px; top: -70px;  cursor: pointer;"></i>
                                    <ul id="password-criteria">
                                        <li>At least 8 characters long</li><br>
                                        <li>At least one uppercase letter</li><br>
                                        <li>At least one lowercase letter</li><br>
                                        <li>At least one number</li><br>
                                        <li>At least one special character (e.g. @, #, $, %)</li>
                                    </ul>
                                </div>

                                <div class="col-md-6">
                                    <label for="email">Confirm Password</label>
                                    <input type="text" class="form-control" id="password2" autocomplete="current-password" placeholder="Eg. Tan@123" name="custPWD"
                                           value ="<%=cd.getCustPWD()%>" required="">

                                    <i class="far fa-eye" id="togglePassword2" style="position: relative; left: 600px; top: -70px;  cursor: pointer;"></i>

                                </div>
                                <script>
                                    const togglePassword = document.querySelector('#togglePassword');
                                    const password = document.querySelector('#password1');
                                    togglePassword.addEventListener('click', function (e) {
                                        // toggle the type attribute
                                        const type = password.getAttribute('type') === 'password' ? 'text' : 'password';
                                        password.setAttribute('type', type);
                                        // toggle the eye slash icon
                                        togglePassword.classList.toggle('fa-eye-slash');
                                    });

                                    const togglePassword2 = document.querySelector('#togglePassword2');
                                    const password2 = document.querySelector('#password2');
                                    togglePassword2.addEventListener('click', function (e) {
                                        // toggle the type attribute
                                        const type = password2.getAttribute('type') === 'password' ? 'text' : 'password';
                                        password2.setAttribute('type', type);
                                        // toggle the eye slash icon
                                        togglePassword2.classList.toggle('fa-eye-slash');
                                    });

                                </script>


                                <div class="col-md-12">
                                    <button class="btn btn-sm btn-solid" type="submit" id="submit-button" onclick="submitForm(event)">Save setting</button>
                                </div>
                        </form>
                    </div>
                </div>
                <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>


                <script>
                                        $(document).ready(function () {
                                            debugger;
                                            $('#custName').on('input', function () {
                                                var name = $('#custName').val();
                                                var nameRegex = /^[a-zA-Z]+(([',. -][a-zA-Z ])?[a-zA-Z]*)*$/;
                                                if (!nameRegex.test(name)) {
                                                    $('#custName').addClass('invalid');
                                                    $('#name-error').text('Invalid name format');
                                                    $('#name-error').addClass('invalid');
                                                    $('#submit-button').attr('disabled', true); // disable submit button
                                                } else {
                                                    $('#custName').removeClass('invalid');
                                                    $('#name-error').text('');
                                                    $('#submit-button').attr('disabled', false); // enable submit button
                                                }
                                            });
                                        });
                </script>

                <script>

                    $(document).ready(function () {
                        $('#custUsername, #custEmail').on('input', function () {
                            var data = {
                                action: "cust",
                                username: $('#custUsername').val(),
                                email: $('#custEmail').val()
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
                                        $('#custUsername').addClass('invalid');
                                        $('#username-error').text('Username already exists');
                                        $('#username-error').addClass('invalid');
                                    } else {
                                        $('#custUsername').removeClass('invalid');
                                        $('#username-error').text('');
                                        $('#submit-button').attr('disabled', false);
                                    }

                                    var email = $('#custEmail').val();
                                    var emailRegex = /^\S+@\S+\.\S+$/;
                                    if (!emailRegex.test(email)) {
                                        $('#submit-button').attr('disabled', true);
                                        $('#custEmail').addClass('invalid');
                                        $('#email-error').text('Invalid email format');
                                        $('#email-error').addClass('invalid');
                                    } else if (response.existsEmail) {
                                        $('#custEmail').addClass('invalid');
                                        $('#email-exist').text('Email already exists');
                                        $('#email-exist').addClass('invalid');
                                        $('#submit-button').attr('disabled', true);
                                    } else {
                                        $('#custEmail').removeClass('invalid');
                                        $('#email-error').text('');
                                        $('#email-exist').text('');
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
                        $('#custHP').on('input', function () {
                            var phoneNum = $('#custHP').val();
                            var phoneNumRegex = /^(01)[0-46-9]-*[0-9]{7,8}$/;
                            if (!phoneNumRegex.test(phoneNum)) {
                                $('#custHP').addClass('invalid');
                                $('#phoneNumber-error').text('Invalid phone number format');
                                $('#phoneNumber-error').addClass('invalid');
                                $('#submit-button').attr('disabled', true); // disable submit button
                            } else {
                                $('#custHP').removeClass('invalid');
                                $('#phoneNumber-error').text('');
                                $('#submit-button').attr('disabled', false); // enable submit button
                            }
                        });
                    });

                </script>


                <script>
                    const passwordField = document.getElementById('password1');
                    const confirmPasswordField = document.getElementById('password2');
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

            </div>
        </section>
        <!-- Section ends -->



        <%@include file="../cust.Footer.jsp" %>
        <!-- tap to top End -->


        <!-- latest jquery-->
        <script src="../../../../assets/js/jquery-3.3.1.min.js"></script>

        <!-- menu js-->
        <script src="../../../../assets/js/menu.js"></script>

        <!-- lazyload js-->
        <script src="../../../../assets/js/lazysizes.min.js"></script>

        <!-- slick js-->
        <script src="../../../../assets/js/slick.js"></script>

        <!-- Bootstrap js-->
        <script src="../../../../assets/js/bootstrap.bundle.min.js"></script>

        <!-- Bootstrap Notification js-->
        <script src="../../../../assets/js/bootstrap-notify.min.js"></script>

        <!-- Theme js-->
        <script src="../../../../assets/js/theme-setting.js"></script>
        <script src="../../../../assets/js/script.js"></script>
        <script src="../../../assets/commonResources/sweetalert.min.js"></script>

        <script>
                    function openSearch() {
                        document.getElementById("search-overlay").style.display = "block";
                    }

                    function closeSearch() {
                        document.getElementById("search-overlay").style.display = "none";
                    }
                    function submitForm(event) {
                        event.preventDefault();
                        Swal.fire({
                            icon: 'success',
                            title: 'Succssfully Updated',
                            text: 'Profile Updated',
                            confirmButtonColor: '#548c5e',
                            confirmButtonText: 'Continue',

                        }).then((result) => {
                            /* Read more about isConfirmed, isDenied below */
                            if (result.isConfirmed) {
                                const form = document.getElementById('Profile');
// Submit the form to the server
                                form.submit();
                            }
                        })

                    }

        </script>

    </body>

</html>
