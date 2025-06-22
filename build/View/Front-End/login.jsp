<%-- 
    Document   : login
    Created on : Mar 16, 2023, 8:17:20 PM
    Author     : Yu Xuan
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width,initial-scale=1">
        <meta name="description" content="multikart">
        <meta name="keywords" content="multikart">
        <meta name="author" content="multikart">
        <meta http-equiv="Cache-Control" content="no-cache, no-store, must-revalidate" />
        <meta http-equiv="Pragma" content="no-cache" />
        <meta http-equiv="Expires" content="0" />
        <link rel="icon" href="../../assets/images/favicon/1.png" type="image/x-icon">
        <link rel="icon" href="../../assets/images/favicon/3.png" type="image/x-icon">
        <title>Innisfree | Make You Better</title>

        <!--Google font-->
        <link href="https://fonts.googleapis.com/css?family=Lato:300,400,700,900" rel="stylesheet">
        <link rel="preconnect" href="https://fonts.gstatic.com">
        <link href="https://fonts.googleapis.com/css2?family=Yellowtail&display=swap" rel="stylesheet">

        <!-- Icons -->
        <link rel="stylesheet" type="text/css" href="../../assets/css/vendors/font-awesome/fontawesome.css">
        

        <!--Slick slider css-->
        <link rel="stylesheet" type="text/css" href="../../assets/css/vendors/slick.css">
        <link rel="stylesheet" type="text/css" href="../../assets/css/vendors/slick-theme.css">

        <!-- Animate icon -->
        <link rel="stylesheet" type="text/css" href="../../assets/css/vendors/animate.css">

        <!-- Themify icon -->
        <link rel="stylesheet" type="text/css" href="../../assets/css/vendors/themify-icons.css">

        <!-- Bootstrap css -->
        <link rel="stylesheet" type="text/css" href="../../assets/css/vendors/bootstrap.css">

        <!-- Theme css -->
        <link rel="stylesheet" type="text/css" href="../../assets/css/style.css">

        <link rel="stylesheet" type="text/css" href="../../assets/commonResources/sweetalert.min.css"/>
        
        <!--Sweet Alert js-->
        <script src="../../assets/commonResources/sweetalert.min.js"></script>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.13.0/css/all.min.css">

    </head>
<%@include file="cust.Header_Log.jsp" %>
    <body class="theme-color-1">

        
        <%
            String message = (String) session.getAttribute("message");
            session.removeAttribute("message");
            if (message != null) {%>
        <script>
            function notExist(message) {
                Swal.fire(message);

            }
            notExist('<%= message%>');
        </script>
        <% }%>




        <!--section start-->
        <section class="login-page section-b-space">
            <div class="container">
                <div class="row">
                    <div class="col-lg-6">
                        <h3>Login</h3>
                        <div class="theme-card">
                            <form class="theme-form" action="${pageContext.servletContext.contextPath}/Login" method="post" id="Loginform">
                                <div class="form-group">
                                    <label for="email">Username</label>
                                    <input type="text" class="form-control" id="custUsername" name="custUsername" placeholder="Username" required/>



                                </div>



                                <div class="form-group">
                                    <label for="review">Password</label>
                                    <input type="password" class="form-control" id="custPWD" name="custPWD"
                                           placeholder="Enter your password" required/>
                                    <i class="far fa-eye" id="togglePassword" style="position: relative; left: 550px; top: -65px;  cursor: pointer;"></i>
                                </div>
                                <script>
                            const togglePassword = document.querySelector('#togglePassword');
                            const password = document.querySelector('#custPWD');
                            togglePassword.addEventListener('click', function (e) {
                                // toggle the type attribute
                                const type = password.getAttribute('type') === 'password' ? 'text' : 'password';
                                password.setAttribute('type', type);
                                // toggle the eye slash icon
                                togglePassword.classList.toggle('fa-eye-slash');
                            });
                            </script>
                                <div class="forLogin" style="display: flex;flex-direction: row;">
                                    <div style="margin-right: 40px">
                                        <input type="checkbox" id="rememberMe" name="rememberMe" value="rememberMe">
                                        <label for="vehicle1"> Remember Me</label> 
                                    </div>
                                    <div class="form-group1" style="margin-left: 350px">
                                        <a href="forgotPassword.jsp">Forget Password</a>
                                    </div>            
                                </div>


                                <!--                            <a href="index.html" class="btn btn-solid">Login</a>-->
                                <button type="submit" onclick="submitLogin(event)" class="btn btn-solid">login</button>
                            </form>
                        </div>
                    </div>
                    <div class="col-lg-6 right-login">

                        <h3>New Customer</h3> 

                        <div class="theme-card authentication-right">
                            <h6 class="title-font">Annyeonghaseyo!
                                <br><br>
                                <p>Sign up for a free account at our store. 
                                    Registration is quick and easy. <br>
                                    It allows you to be able to order from our shop. To start shopping click register. <br><br>
                                    <a href="Customer/signUp.jsp"class="btn btn-solid">Join the Innisfree family!</a> 
                                    <br><br><br><br>
                                </p>
                            </h6>

                        </div>


                    </div>
                </div>
            </div>
        </section>
        <!--Section ends-->
        <%@include file="cust.Footer.jsp" %>






        <!-- latest jquery-->
        <script src="../../assets/js/jquery-3.3.1.min.js"></script>

        <!-- menu js-->
        <script src="../../assets/js/menu.js"></script>

        <!-- lazyload js-->
        <script src="../../assets/js/lazysizes.min.js"></script>

        <!-- slick js-->
        <script src="../../assets/js/slick.js"></script>

        <!-- Bootstrap js-->
        <script src="../../assets/js/bootstrap.bundle.min.js"></script>

        <!-- Bootstrap Notification js-->
        <script src="../../assets/js/bootstrap-notify.min.js"></script>

        <!-- Theme js-->
        <script src="../../assets/js/theme-setting.js"></script>
        <script src="../../assets/js/script.js"></script>

        <script src="https://code.jquery.com/jquery-3.5.1.js" defer></script>
        <script src="../../assets/commonResources/sweetalert.min.js"></script>

        <script>
            function openSearch() {
                document.getElementById("search-overlay").style.display = "block";
            }

            function closeSearch() {
                document.getElementById("search-overlay").style.display = "none";
            }
        </script>
        <script type="text/javascript">
            function disableBackButton() {
                window.history.forward();
            }
            setTimeout("disableBackButton()", 0);
        </script>


        <script>
            function submitLogin(event) {
                event.preventDefault();

                var data = {
                    custUsername: $('#custUsername').val(),
                    custPWD: $('#custPWD').val()
                };
                var jsonData = JSON.stringify(data);

                console.log(JSON.parse(jsonData));

//                    //Send JSON data to servlet using AJAX
                $.ajax({
                    type: "POST",
                    url: "/innisfree_1/Login", // Replace with your servlet URL
                    data: jsonData,
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function (response) {

                        if (response.status === "success") {

                            // Handle success response from servlet
                            Swal.fire({
                                icon: 'success',
                                title: 'Succssfully Login',
                                text: response.message,
                                confirmButtonColor: '#548c5e',
                                confirmButtonText: 'Continue',

                            }).then((result) => {
                                /* Read more about isConfirmed, isDenied below */
                                if (result.isConfirmed) {
                                    window.location.replace("homepage/homepage.jsp");
                                }
                            })


                        }else{
                            
                             // Handle success response from servlet
                            Swal.fire({
                                icon: 'error',
                                title: 'Cannot Login',
                                text: response.message,
                                confirmButtonColor: '#548c5e',
                                confirmButtonText: 'Continue',

                            }).then((result) => {
                                /* Read more about isConfirmed, isDenied below */
                                if (result.isConfirmed) {
                                    window.location.replace("login.jsp");
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