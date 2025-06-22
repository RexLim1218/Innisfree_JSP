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


    </head>

    <body class="theme-color-1">


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





        <!-- personal detail section start -->
        <section class="contact-page register-page">
            <div class="container">
                <div class="row">
                    <div class="col-sm-12">

                        <form class="theme-form" action="${pageContext.servletContext.contextPath}/NewAddress"  method="post" id="Profile" enctype='multipart/form-data'>

                            <div class="col-sm-12">
                                <h3>SHIPPING ADDRESS</h3>

                                <div class="form-row row" id = "Address">


                                    <div class="col-md-6">
                                        <input type="radio" id="addr_Type" name="addr_Type" value ="Default" >
                                                                      <label for="Default">Default</label> 
                                    </div>

                                    <div class="col-md-6">
                                                                    <input type="radio" id="addr_Type" name="addr_Type"  value ="Optional" />
                                                                    <label for="Optional">Optional</label><br>
                                    </div>

                                    <div class="col-md-6">
                                        <label for="name">Address Details</label>
                                        <input type="text" class="form-control" id="addr_details" placeholder="E.g 1-12-22, Lorong Permai Jaya" name="addr_details"
                                               value ="" required="">
                                    </div>
                                    <div class="col-md-6">
                                        <label for="name">Town</label>
                                        <input type="text" class="form-control" id="town" placeholder="E.g Tanjung Bungah" name="town"
                                               value =""  required="">
                                    </div>
                                    <div class="col-md-6">
                                        <label for="email">Zipcode *</label>
                                        <input type="text" class="form-control" id="zipcode" placeholder="E.g 11200" name="zipcode"
                                               value =""  required="">
                                    </div>
                                    <div class="col-md-6 select_input">
                                        <label for="State">State*</label>
                                        <select class="form-control"  size="1"   value =""  name="addr_state" 
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
                                    </div>

                                    <div class="col-md-6">
                                        <label for="review">Receiver Name</label>
                                        <input type="text" class="form-control" id="receiverName" placeholder="E.g 012-3456789" name="receiverName"
                                               value ="" required="">
                                    </div>   

                                    <div class="col-md-6">
                                        <label for="review">Receiver Phone Number</label>
                                        <input type="text" class="form-control" id="receiverHP" placeholder="E.g 012-3456789" name="receiverHP"
                                               value ="" required="">
                                    </div>


                                    <div class="col-md-12">
                                        <button class="btn btn-sm btn-solid"  type="submit" onclick="submitForm(event)">Save Settings</button>
                                    </div>

                                </div>

                            </div>
                        </form>
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
                                title: 'Succssfully Added',
                                text: 'New Address Added',
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
