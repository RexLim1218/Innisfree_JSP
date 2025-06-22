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


        <script src='https://kit.fontawesome.com/a076d05399.js' crossorigin='anonymous'></script>

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
                                <li class="breadcrumb-item"><a href="../homepage/homepage.jsp">Home</a></li>
                                <li class="breadcrumb-item active" aria-current="page">Address</li>
                                <li class="breadcrumb-item active" aria-current="page">Modify Address</li>
                            </ol>
                        </nav>
                    </div>
                </div>
            </div>
        </div>
        <!-- breadcrumb End -->




        <%
            System.out.println(request.getParameter("addressID"));
            int addressID = Integer.parseInt(request.getParameter("addressID").toString());

//            Customer c = new Customer();
//            CustomerDA custDA = new CustomerDA();
//            c = custDA.getCustRecord(addressID);
            AddressDA addressDA = new AddressDA();
            Address a = addressDA.getAddressByAddressID(addressID);
        %>

        <!-- personal detail section start -->
        <section class="contact-page register-page">
            <div class="container">
                <div class="row">
                    <div class="col-sm-12">
                       


                        <div class="col-sm-12">

                            <form class="theme-form" action="${pageContext.servletContext.contextPath}/ModifyAddress"  method="post" id="Profile" enctype='multipart/form-data'>
                                <div class="form-row row" id = "Address">

                                    <h5><b>SHIPPING ADDRESS </b></h5>
                                                                
                                                           
                                        
                                        <style>
                                            h5{
                                                font-size: 25px;
                                                margin-bottom: 30px;
                                               
                                            }
                                            </style>


                                    <input type="hidden" value="<%=a.getAddressID()%>" name="addr_ID"/>
                                    <div class="col-md-6">
                                        <input type="radio" id="addr_Type_<%=a.getAddressID()%>" name="addr_Type" value ="Default" <% if ("Default".equals(a.getAddr_Type())) { %>checked<% }%> style="visibility: visible; opacity: 1;"/>
                                                                      <label for="Default">Default</label> 
                                    </div>

                                    <div class="col-md-6">
                                                                    <input type="radio" id="addr_Type_<%=a.getAddressID()%>" name="addr_Type"  value ="Optional"  <% if ("Optional".equals(a.getAddr_Type())) { %>checked<% }%> style="visibility: visible; opacity: 1;"/>
                                                                    <label for="Optional">Optional</label><br>
                                    </div>

                                    <div class="col-md-6">
                                        <label for="name">Address Detail</label>
                                        <input type="text" class="form-control" id="addr_details" placeholder="E.g 1-12-22, Lorong Permai Jaya" name="addr_details"
                                               value ="<%=a.getAddr_Details()%>" required="">
                                    </div>
                                    <div class="col-md-6">
                                        <label for="name">Town</label>
                                        <input type="text" class="form-control" id="town" placeholder="E.g Tanjung Bungah" name="town"
                                               value ="<%=a.getTown()%>"  required="">
                                    </div>
                                    <div class="col-md-6">
                                        <label for="email">Zipcode *</label>
                                        <input type="text" class="form-control" id="zipcode" placeholder="E.g 11200" name="zipcode"
                                               value ="<%=a.getZipcode()%>"  required="">
                                    </div>
                                    <div class="col-md-6">
                                        <label for="State">State</label>
                                        <select class="form-control"  size="1"   value ="<%=a.getAddr_State()%>"  name="addr_state" >
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
                                           
                                        </select>
                                    </div>




                                    <div class="col-md-6">
                                        
                                        <label for="review">Receiver Name</label>
                                        <input type="text" class="form-control" id="receiverName" placeholder="E.g 012-3456789" name="receiverName"
                                               value ="<%=a.getReceiverName()%>" required="">
                                    </div>   

                                    <div class="col-md-6">
                                        <label for="review">Receiver Phone Number</label>
                                        <input type="text" class="form-control" id="receiverHP" placeholder="E.g 012-3456789" name="receiverHP"
                                               value ="<%=a.getReceiverHP()%>" required="">
                                    </div>

                                    <div class="col-md-12">
                                        <button class="btn btn-sm btn-solid" type="submit" onclick="submitForm(event)">Save Address</button>
                                    </div>

                            </form>
                        </div>
                    </div>
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
            
            function submitForm(event){
                event.preventDefault();
                Swal.fire({
                                icon: 'success',
                                title: 'Succssfully Modify',
                                text: 'Address had been modified',
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
