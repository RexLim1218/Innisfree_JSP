<%-- 
    Document   : signUp
    Created on : Mar 26, 2023, 5:56:18 PM
    Author     : Yu Xuan
--%>

<%@page import="DataAccess.CustomerDA"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <link rel="icon" href="../../../assets/images/favicon/3.png" type="image/x-icon">
   <title>Innisfree | Make You Better</title>
        <!-- Mobile Specific Metas -->
        <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
        <!-- Font-->
        <link rel="stylesheet" type="text/css" href="../../signUp/css/montserrat-font.css">
        <link rel="stylesheet" type="text/css" href="../../signUp/fonts/material-design-iconic-font/css/material-design-iconic-font.min.css">
        <!-- Main Style Css -->
        <link rel="stylesheet" href="../../../signUp/css/style.css"/>

        <link rel="stylesheet" href="../../../assets/css/vendors/font-awesome/fontawesome.css">

        <link rel="stylesheet" type="text/css" href="../../../assets/commonResources/sweetalert.min.css"/>
        
        <script src='https://kit.fontawesome.com/a076d05399.js' crossorigin='anonymous'></script>

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
    
    

    <body class="form-v10">
        <jsp:include page="../cust.Header_Log.jsp"/>
        <div class="page-content">
            <div class="form-v10-content">

                <form class="form-detail" action="${pageContext.servletContext.contextPath}/SignUp" method="post" id="myform">
                    <div class="form-left">
                        <h2>General Infomation</h2>				

                         <div class="form-row">
                            <input type="text" name="custName" id="custName" placeholder="&#x1F464;Name" required >
                            <span id="name-error"></span>
                        </div>



                        <div class="form-row">
                            <input type="text" name="custUsername" id="custUsername" placeholder="&#x1F464;Username" required >
                            <span id="username-error"></span>

                        </div>




                        <div class="form-row">
                            <input type="text" name="custHP" class="custHP" id="custHP" placeholder="&#x1F4DE;Phone Number" required>
                            <span id="phoneNumber-error"></span>
                        </div>




                        <div class="form-row">
                            <input type="text" name="custEmail" id="custEmail" placeholder="&#x1F4E9;Email Address" required>
                            <span id="email-error"></span>
                            <span id="email-exist"></span>
                        </div>



                        <h2>Password</h2>	

                        <div class="form-row">
                            <!--                            <input type="text" name="password1" class="password1" id="password1" > -->
                            <input type="password" name="password1" autocomplete="current-password" required="" id="password1" placeholder="Create password" required>
                            <i class="far fa-eye" id="togglePassword" style="position: relative; left: 400px; top: -25px;  cursor: pointer;"></i>
                            <ul id="password-criteria">
                                <li>At least 8 characters long</li><br>
                                <li>At least one uppercase letter</li><br>
                                <li>At least one lowercase letter</li><br>
                                <li>At least one number</li><br>
                                <li>At least one special character (e.g. @, #, $, %)</li>
                            </ul>
                        </div>

                        <div class="form-row">
                            <!--                            <input type="text" name="password1" class="password1" id="password1" > -->
                            <input type="password" name="password2" autocomplete="current-password" required="" id="password2" placeholder="Confirm password" required>
                            <i class="far fa-eye" id="togglePassword2" style="position: relative; left: 400px; top: -25px;  cursor: pointer;"></i>
                            <span id="password-mismatch-message" style="display:none; color:red;">Passwords do not match</span>
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

                        

                        <!--
                                                                                     <div class="form-row">
                                                                                                <input type="text" name="password2" class="password2" id="password2" placeholder="&#x1F511;Confirm password" required>
                                                                                    </div>-->

                    </div>
                    <div class="form-right">
                        <h2>Address Details</h2>

                        <div class="form-row">
                            <input type="text" name="addr_details" class="addr_details" id="addr_details" placeholder="Address" required>
                        </div>

                        <div class="form-row">
                            <input type="text" name="town" class="town" id="town" placeholder="Town" required>
                        </div>

                        <div class="form-group">
                            <div class="form-row form-row-1">
                                <input type="text" name="zipcode" class="zipcode" id="zipcode" placeholder="Zipcode" required>
                            </div>

                            <div class="form-row form-row-2">
                                <select name="addr_state">
                                    <option value="addr_state">State</option>
                                    <option value="Johor">Johor</option>
                                    <option value="Kedah">Kedah</option>
                                    <option value="Kelantan">Kelantan</option>
                                    <option value="Kuala Lumpur">Kuala Lumpur</option>
                                    <option value="Labuan">Labuan</option>
                                    <option value="Melaka">Melaka</option>
                                    <option value="Negeri Sembilan">Negeri Sembilan</option>
                                    <option value="Pahang">Pahang</option>
                                    <option value="Penang">Penang</option>
                                    <option value="Perak">Perak</option>
                                    <option value="Perlis">Perlis</option>
                                    <option value="Putrajaya">Putrajaya</option>
                                    <option value="Sabah">Sabah</option>
                                    <option value="Sarawak">Sarawak</option>
                                    <option value="Selangor">Selangor</option>
                                    <option value="Terengganu">Terengganu</option>
                                </select>
                                <span class="select-btn">
                                    <i class="zmdi zmdi-chevron-down"></i>
                                </span>
                            </div>
                        </div>


                        <div class="form-checkbox">
                            <label class="container"><p>I do accept the <a href="#" class="text">Terms and Conditions</a> of your site.</p>
                                <input type="checkbox" name="checkbox">
                                <span class="checkmark"></span>
                            </label>
                        </div>


                        <input type="submit" id="submit-button" class="register" onclick="submitForm(event)" value="Join Innisfree!">


                    </div>
                </form>
            </div>
        </div>
        <!-- latest jquery-->
        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
        <script src="../../../assets/commonResources/sweetalert.min.js"></script>

        
        <jsp:include page="../cust.Footer.jsp"/>

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

        <script>
            function submitForm(event){
                event.preventDefault();
                Swal.fire({
                                icon: 'success',
                                title: 'Succssfully Register',
                                text: 'Account Created!!!',
                                confirmButtonColor: '#548c5e',
                                confirmButtonText: 'Continue',

                            }).then((result) => {
                                /* Read more about isConfirmed, isDenied below */
                                if (result.isConfirmed) {
                                     const form = document.getElementById('myform');
            // Submit the form to the server
            form.submit();
                                }
                            })
                
            }
            </script>
        
        
    </body>
</html>
