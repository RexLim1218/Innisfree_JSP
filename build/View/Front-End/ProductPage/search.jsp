<%-- 
    Document   : homepage
    Created on : Apr 28, 2023, 6:42:43 PM
    Author     : yokec
--%>

<%@page import="Domain.Customer"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Base64"%>
<%@page import="java.sql.*"%>
<%@page import="Domain.ProductCategory"%>
<%@page import="DataAccess.DAProductCategory"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <%
        String host = "jdbc:derby://localhost:1527/Innisfree";
        String user = "nbuser";
        String password = "nbuser";
        Connection conn = DriverManager.getConnection(host, user, password);
    %>

    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width,initial-scale=1">
        <meta name="description" content="multikart">
        <meta name="keywords" content="multikart">
        <meta name="author" content="multikart">
        <link rel="icon" href="../../../assets/images/favicon/3.png" type="image/x-icon">
        <title>Innisfree | Make You Better</title>

        <!--Google font-->
        <link href="https://fonts.googleapis.com/css?family=Lato:300,400,700,900" rel="stylesheet">
        <link rel="preconnect" href="https://fonts.gstatic.com">
        <link href="https://fonts.googleapis.com/css2?family=Yellowtail&display=swap" rel="stylesheet">

        <!-- Icons -->
        <link href="../../../assets/css/vendors/font-awesome.css" rel="stylesheet" type="text/css"/>

        <!--Slick slider css-->
        <link href="../../../assets/css/vendors/slick.css" rel="stylesheet" type="text/css"/>
        <link href="../../../assets/css/vendors/slick-theme.css" rel="stylesheet" type="text/css"/>

        <!-- Animate icon -->
        <link href="../../../assets/css/vendors/animate.css" rel="stylesheet" type="text/css"/>

        <!-- Price range icon -->
        <link href="../../../assets/css/vendors/price-range.css" rel="stylesheet" type="text/css"/>

        <!-- Themify icon -->
        <link href="../../../assets/css/vendors/themify-icons.css" rel="stylesheet" type="text/css"/>

        <!-- Bootstrap css -->
        <link href="../../../assets/css/vendors/bootstrap.css" rel="stylesheet" type="text/css"/>

        <!-- Theme css -->
        <link href="../../../assets/css/style.css" rel="stylesheet" type="text/css"/>
        <script src="../../../assets/commonResources/sweetalert.min.js"></script>
        <!-- jQuery library -->
        <script src="https://code.jquery.com/jquery-3.6.0.min.js" type="text/javascript"></script>


        <link rel="stylesheet" type="text/css" href="../../../assets/commonResources/sweetalert.min.css"/>

    </head>

    <body class="theme-color-1">

        <!-- header start -->
        <jsp:include page="../cust.Header_Log.jsp"/>
        <!-- header end -->


        <%
            DAProductCategory pcDA = new DAProductCategory();
            ArrayList<ProductCategory> productCategoryList = pcDA.getAllProductsCategory();
            int loginFound = 0;

            Customer c = new Customer();

            if (session.getAttribute("custID") != null) {
                loginFound = 1;

                c = (Customer) session.getAttribute("customerLogin");
            }
        %>






        <%
            String searchResult = null;
            if (request.getParameter("searchResult") != null) {
                searchResult = request.getParameter("searchResult");
                searchResult = searchResult.toLowerCase();
            }
        %>

        <!-- breadcrumb start -->
        <div class="breadcrumb-section">
            <div class="container">
                <div class="row">
                    <div class="col-sm-6">
                        <div class="page-title">
                            <h2>Search Results for: '<%= searchResult%>'</h2>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- breadcrumb end -->




        <!-- section start -->
        <section class="section-b-space ratio_asos">
            <div class="collection-wrapper">
                <div class="container">
                    <div class="row">
                        <div class="col-sm-3 collection-filter">

                            <!-- side-bar banner start here -->
                            <div class="collection-sidebar-banner">
                                <a href="#">
                                    <img src="side-banner-skincare.jpg" class="img-fluid blur-up lazyload" alt="">
                                </a>
                            </div>
                            <!-- side-bar banner end here -->

                        </div>
                        <div class="collection-content col">
                            <div class="page-main-content">
                                <div class="row">
                                    <div class="col-sm-12">
                                        <div class="top-banner-wrapper">
                                            <a href="#"><img src="2innisfree.jpg" class="img-fluid blur-up lazyload" alt="INNISFREE"></a>
                                            <div class="top-banner-content small-section">
                                                <h4>SKIN-LOVING, EARTH-CARING</h4>
                                                <p style="text-align: justify;">INNISFREE cares deeply about your skin and are committed to delivering skin-conscious 
                                                    Beauty. We offer a wide range of skin care products for all skin styles that cover 
                                                    different skin concerns. Explore our top favourite range of product from cleanser, 
                                                    toner, moisturiser, serum and suncare. Treat all your skin needs from dry and dull 
                                                    skin, tired and ageing skin, to oily and acne-prone skin.
                                                </p>
                                            </div>
                                        </div>
                                        <div class="collection-product-wrapper">
                                            <div class="product-top-filter">
                                                <div class="row">
                                                    <div class="col-xl-12">
                                                        <div class="filter-main-btn">
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="product-wrapper-grid">
                                                <div class="row margin-res">
                                                    <%
                                                        try {
                                                            String sql1 = "SELECT * FROM PRODUCTLIST WHERE (LOWER(PRODNAME) LIKE '%" + searchResult + "%' OR CHAR(PRODID) LIKE '%" + searchResult + "%') AND PROD_STATUS='Active' AND ISDELETED=FALSE";
                                                            Statement stmt1 = conn.createStatement();
                                                            ResultSet rs = stmt1.executeQuery(sql1);
                                                            while (rs.next()) {
                                                                try {
                                                                    int productId = rs.getInt("prodid");
                                                                    String sql2 = "SELECT PRODIMG FROM PRODIMAGE WHERE PRODID = " + productId;
                                                                    Statement stmt2 = conn.createStatement();
                                                                    ResultSet rs2 = stmt2.executeQuery(sql2);

                                                                    // Create a list of image sources
                                                                    List<String> imageSrcList = new ArrayList<String>();
                                                                    while (rs2.next()) {
                                                                        Blob imageBlob = rs2.getBlob("prodimg");
                                                                        byte[] imageBytes = imageBlob.getBytes(1, (int) imageBlob.length());
                                                                        String imageSrc = "data:image/jpg;base64," + Base64.getEncoder().encodeToString(imageBytes);
                                                                        imageSrcList.add(imageSrc);
                                                                    }

                                                                    String frontImageSrc = "";
                                                                    String backImageSrc = "";

                                                                    if (imageSrcList.size() >= 1) {
                                                                        frontImageSrc = imageSrcList.get(0);
                                                                    }

                                                                    if (imageSrcList.size() >= 2) {
                                                                        backImageSrc = imageSrcList.get(1);
                                                                    }
                                                    %>
                                                    <div class="col-xl-3 col-6 col-grid-box">
                                                        <div class="product-box">
                                                            <div class="img-wrapper">
                                                                <div class="front">
                                                                    <a href="../ProductPage/productPage_01.jsp?prodid=<%= rs.getInt("prodid")%>">
                                                                        <img src="<%= frontImageSrc%>" class="img-fluid blur-up lazyload bg-img" alt="">
                                                                    </a>
                                                                </div>
                                                                <div class="back">
                                                                    <a href="../ProductPage/productPage_01.jsp?prodid=<%= rs.getInt("prodid")%>">
                                                                        <img src="<%= backImageSrc%>" class="img-fluid blur-up lazyload bg-img" alt="">
                                                                    </a>
                                                                </div>
                                                                <div class="cart-info cart-wrap">

                                                                    <%if (loginFound == 1) {%>
                                                                    <button data-bs-toggle="modal" data-bs-target="#addtocart" onclick="addToCart(<%= rs.getInt("prodid")%>, <%=c.getCustID()%>, event)" title="Add to cart">
                                                                        <i class="ti-shopping-cart"></i>
                                                                    </button>
                                                                    <a href="javascript:void(0)" onclick="addToWishlist(<%= rs.getInt("prodid")%>, <%=c.getCustID()%>)" title="Add to Wishlist">
                                                                        <i class="ti-heart" aria-hidden="true"></i>
                                                                    </a>
                                                                    <a href="../ProductPage/productPage_01.jsp?prodid=<%= rs.getInt("prodid")%>" title="Quick View">
                                                                        <i class="ti-search" aria-hidden="true"></i>
                                                                    </a>

                                                                    <% } else {%>

                                                                    <button data-bs-toggle="modal" data-bs-target="#addtocart" onclick="loginNotification(event)" title="Add to cart">
                                                                        <i class="ti-shopping-cart"></i>
                                                                    </button>
                                                                    <a href="javascript:void(0)" onclick="loginNotification(event)" title="Add to Wishlist">
                                                                        <i class="ti-heart" aria-hidden="true"></i>
                                                                    </a>
                                                                    <a href="../ProductPage/productPage_01.jsp?prodid=<%= rs.getInt("prodid")%>" title="Quick View">
                                                                        <i class="ti-search" aria-hidden="true"></i>
                                                                    </a>

                                                                    <%}%>
                                                                </div>
                                                            </div>
                                                            <script>
                                                                function addToWishlist(productId, custId) {
                                                                    $.ajax({
                                                                        url: "../ProductPage/insert-wishitem.jsp",
                                                                        method: "POST",
                                                                        data: {
                                                                            productId: productId,
                                                                            custId: custId
                                                                        },
                                                                        success: function (message) {
                                                                            console.log('Received message:', message);
                                                                            if (message.trim() === 'success') {

                                                                                Swal.fire({
                                                                                    icon: 'error',
                                                                                    title: 'Already Exist',
                                                                                    text: 'Please procced to wishlist',
                                                                                    confirmButtonColor: '#548c5e',
                                                                                    confirmButtonText: 'Continue',
                                                                                }).then((result) => {
                                                                                    /* Read more about isConfirmed, isDenied below */
                                                                                    if (result.isConfirmed) {
                                                                                        window.location.replace('../Wishlist/wishlist.jsp')
                                                                                    }
                                                                                })

                                                                            } else if (message.trim() === 'error') {

                                                                                // Handle success response from servlet
                                                                                Swal.fire({
                                                                                    icon: 'success',
                                                                                    title: 'Succssfully Added',
                                                                                    text: 'Successfully added to wishlist',
                                                                                    confirmButtonColor: '#548c5e',
                                                                                    confirmButtonText: 'Continue',
                                                                                }).then((result) => {
                                                                                    /* Read more about isConfirmed, isDenied below */
                                                                                    if (result.isConfirmed) {
                                                                                        window.onload();
                                                                                    }
                                                                                })
                                                                            }
                                                                        },
                                                                        error: function () {
                                                                            alert("Error adding product to wishlist!");
                                                                        }
                                                                    });
                                                                }
                                                            </script>
                                                            <div class="product-detail">
                                                                <div>
                                                                    
                                                                    <a href="../ProductPage/productPage_01.jsp?prodid=<%= rs.getInt("prodid")%>">
                                                                        <h6><%= rs.getString("prodname")%></h6>
                                                                    </a>
                                                                    <%
                                                                    String finalPrice = String.format("%.2f", rs.getDouble("PROD_FINALPRICE"));
                                                                    String originalPrice = String.format("%.2f", rs.getDouble("PROD_ORIPRICE"));
                                                                    int qty = rs.getInt("PRODAVAILABLE_QTY");
                                                                    if (rs.getInt("discount") > 0) {
                                                                        if (qty > 0) {
                                                                    %>
                                                                    <span style="color:red;font-weight:bold;font-size: large">RM<%= finalPrice%></span>&nbsp;
                                                                    <span style="text-decoration: line-through;">RM<%= originalPrice%></span>&nbsp;
                                                                    <span style="color:red;font-size: small">-<%= rs.getInt("discount")%>%</span>
                                                                    <%
                                                                        } else {
                                                                    %>
                                                                    <span style="color:red;font-weight:bold;font-size: large">RM<%= finalPrice%></span>&nbsp;
                                                                    <span style="text-decoration: line-through;">RM<%= originalPrice%></span>&nbsp;
                                                                    <span style="color:red;font-size: small">-<%= rs.getInt("discount")%>%</span><br>
                                                                    <span>OUT OF STOCK</span>
                                                                    <%
                                                                        }
                                                                    } else {
                                                                        if(qty > 0) {
                                                                    %>
                                                                    <h4>RM<%= finalPrice%></h4>
                                                                    <%
                                                                        } else {
                                                                    %>
                                                                    <span style="font-weight: bold; font-size: large;">RM<%= finalPrice%></span>&nbsp;&nbsp;&nbsp;
                                                                    <span>OUT OF STOCK</span>
                                                                    <%
                                                                        }
                                                                    }
                                                                    %>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <%
                                                                } catch (SQLException ex) {
                                                                    conn.close();
                                                                }
                                                            }
                                                        } catch (SQLException ex) {
                                                            conn.close();
                                                        }
                                                    %>
                                                </div>
                                            </div>
                                            <div class="product-pagination">
                                                <div class="theme-paggination-block">
                                                    <%
                                                        try {
                                                            String sql1 = "SELECT COUNT(*) as total FROM PRODUCTLIST WHERE PRODNAME LIKE '%" + searchResult + "%' OR PRODID LIKE '%" + searchResult + "%'";
                                                            Statement stmt1 = conn.createStatement();
                                                            ResultSet rs = stmt1.executeQuery(sql1);
                                                            if (rs.next()) {
                                                    %>
                                                    <div class="row" style="height: 50px; padding: 13px;">
                                                        <div class="search-count">
                                                            <h5 style="text-align: right;">Showing <%= rs.getInt("total")%> Products</h5>
                                                        </div>
                                                    </div>
                                                    <% }
                                                        } catch (SQLException ex) {
                                                            conn.close();
                                                        }
                                                    %>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!-- section End -->



        <!-- footer start -->
        <jsp:include page="../cust.Footer.jsp"/>
        <!-- footer end -->




        <!-- latest jquery-->
        <script src="../../../assets/js/jquery-3.3.1.min.js" type="text/javascript"></script>

        <!-- menu js-->
        <script src="../../../assets/js/menu.js" type="text/javascript"></script>

        <!-- lazyload js-->
        <script src="../../../assets/js/lazysizes.min.js" type="text/javascript"></script>

        <!-- price range js -->
        <script src="../../../assets/js/price-range.js" type="text/javascript"></script>

        <!-- slick js-->
        <script src="../../../assets/js/slick.js" type="text/javascript"></script>

        <!-- Bootstrap js-->
        <script src="../../../assets/js/bootstrap.bundle.min.js" type="text/javascript"></script>

        <!-- Bootstrap Notification js-->
        <script src="../../../assets/js/bootstrap-notify.min.js" type="text/javascript"></script>

        <!-- Theme js-->
        <script src="../../../assets/js/theme-setting.js" type="text/javascript"></script>
        <script src="../../../assets/js/script.js" type="text/javascript"></script>

        <script>
                                                                function openSearch() {
                                                                    document.getElementById("search-overlay").style.display = "block";
                                                                }

                                                                function closeSearch() {
                                                                    document.getElementById("search-overlay").style.display = "none";
                                                                }
                                                                function loginNotification(event) {
                                                                    event.preventDefault();

                                                                    Swal.fire({
                                                                        icon: 'error',
                                                                        title: 'Login',
                                                                        text: 'Please login to proceed...',
                                                                        confirmButtonColor: '#548c5e',
                                                                        confirmButtonText: 'Continue',

                                                                    }).then((result) => {
                                                                        /* Read more about isConfirmed, isDenied below */
                                                                        if (result.isConfirmed) {
                                                                            window.location.replace("<%=request.getContextPath()%>/View/Front-End/login.jsp");
                                                                        }
                                                                    })
                                                                }

                                                                function addToCart(prodID, custID, event) {
                                                                    event.preventDefault();

                                                                    var data = {
                                                                        prodID: prodID,
                                                                        custID: custID
                                                                    };
                                                                    var jsonData = JSON.stringify(data);

                                                                    console.log(JSON.parse(jsonData));

//                    //Send JSON data to servlet using AJAX
                                                                    $.ajax({
                                                                        type: "POST",
                                                                        url: "/innisfree_1/add-to-cart", // Replace with your servlet URL
                                                                        data: jsonData,
                                                                        contentType: "application/json; charset=utf-8",
                                                                        dataType: "json",
                                                                        success: function (response) {
                                                                            console.log(response);
                                                                            if (response.exist === "yes") {

                                                                                // Handle success response from servlet
                                                                                Swal.fire({
                                                                                    icon: 'success',
                                                                                    title: 'Exist',
                                                                                    text: response.message,
                                                                                    confirmButtonColor: '#548c5e',
                                                                                    confirmButtonText: 'Continue',

                                                                                }).then((result) => {
                                                                                    /* Read more about isConfirmed, isDenied below */
                                                                                    if (result.isConfirmed) {
                                                                                        return;
                                                                                    }

                                                                                })


                                                                            } else {

                                                                                // Handle success response from servlet
                                                                                Swal.fire({
                                                                                    icon: 'error',
                                                                                    title: 'Cannot Added to the cart',
                                                                                    text: response.message,
                                                                                    confirmButtonColor: '#548c5e',
                                                                                    confirmButtonText: 'Continue',

                                                                                }).then((result) => {
                                                                                    /* Read more about isConfirmed, isDenied below */
                                                                                    if (result.isConfirmed) {
                                                                                        window.location.replace("<%=request.getContextPath()%>/View/Front-End/Cart/Cart.jsp");

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