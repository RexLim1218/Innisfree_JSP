<!doctype html>
<html>
    <head>
        <meta charset='utf-8'>
        <meta name='viewport' content='width=device-width, initial-scale=1'>

 <link rel="icon" href="../../assets/images/favicon/3.png" type="image/x-icon">
 <title>Innisfree | Make You Better</title>
        <link
            href='https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css'
            rel='stylesheet'>
        <link
            href='https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.0.3/css/font-awesome.css'
            rel='stylesheet'>
        <script type='text/javascript'
        src='https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js'></script>
        <style>
            .placeicon {
                font-family: fontawesome
            }

            .custom-control-label::before {
                background-color: #dee2e6;
                border: #dee2e6
            }

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
    <body oncontextmenu='return false' class='snippet-body bg-info'>
        <link rel="stylesheet"
              href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-social/5.1.1/bootstrap-social.css">
        <div>
            <!-- Container containing all contents -->
            <div class="container">
                <div class="row justify-content-center">
                    <div class="col-12 col-md-9 col-lg-7 col-xl-6 mt-5">
                        <!-- White Container -->
                        <div class="container bg-white rounded mt-2 mb-2 px-0">
                            <!-- Main Heading -->
                            <div class="row justify-content-center align-items-center pt-3">
                                <h1>
                                    <strong>Reset Password</strong>
                                </h1>
                            </div>
                            <div class="pt-3 pb-3">
                                <form class="form-horizontal" action="${pageContext.servletContext.contextPath}/newPassword" method="POST">
                                    <!-- User Name Input -->
                                    <div class="form-group row justify-content-center px-3">
                                        <div class="col-9 px-0">
                                            <div class="input-group">
                                                <input type="text" name="password" placeholder="&#xf084; &nbsp; New Password" id="empPwd" class="form-control border-info placeicon" style="margin-left: 20%;">
                                                <div class="input-group-append">
                                                    <button class="btn btn-outline-secondary" type="button" id="togglePassword1"><i class="fa fa-eye"></i></button>
                                                </div>
                                            </div>
                                        </div>
                                        <span for="validationCustom3" class="col-xl-3 col-md-4"></span>
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

                                    <!-- Password Input -->
                                    <div class="form-group row justify-content-center px-3">
                                        <div class="col-9 px-0">
                                            <div class="input-group">
                                                <input type="password" name="confPassword" id="empPwd2" placeholder="&#xf084; &nbsp; Confirm New Password" class="form-control border-info placeicon" style="margin-left: 20%;">
                                                <div class="input-group-append">
                                                    <button class="btn btn-outline-secondary" type="button" id="togglePassword"><i class="fa fa-eye"></i></button>
                                                </div>
                                            </div>
                                        </div>
                                        <span for="validationCustom3" class="col-xl-3 col-md-4"></span>
                                        <div class="col-xl-8 col-md-7" id="password-mismatch-message" style="display:none; color:red;">Passwords do not match</div>
                                    </div>


                                    <!-- Log in Button -->
                                    <div class="form-group row justify-content-center">
                                        <div class="col-3 px-3 mt-3">
                                            <input type="submit" value="Reset" id="submit-button"
                                                   class="btn btn-block btn-info">
                                        </div>
                                    </div>
                                </form>
                            </div>
                            <!-- Alternative Login -->
                            <div class="mx-0 px-0 bg-light">

                                <!-- Horizontal Line -->
                                <div class="px-4 pt-5">
                                    <hr>
                                </div>
                                
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <script type='text/javascript'
        src='https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.bundle.min.js'></script>


        <script src="../assets/js/jquery-3.3.1.min.js"></script>
        <script>
            var togglePassword = document.getElementById("togglePassword");
            var passwordInput = document.getElementById("empPwd2");

            togglePassword.addEventListener("click", function (event) {
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

            togglePassword1.addEventListener("click", function (event) {
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
                let passwordformat=true;

                for (let i = 0; i < passwordCriteriaItems.length; i++) {
                    if (passwordRegexes[i].test(password)) {
                        passwordCriteriaItems[i].classList.remove('invalid');
                        passwordCriteriaItems[i].classList.add('valid');
                        passwordformat=false;
                        $('#submit-button').attr('disabled', false); // disable submit button
                    } else {
                        passwordCriteriaItems[i].classList.remove('valid');
                        passwordCriteriaItems[i].classList.add('invalid');
                        passwordsMatch = false;
                        passwordformat=true;
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
    </body>
</html>