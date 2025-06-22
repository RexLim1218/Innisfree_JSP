<%-- 
    Document   : productPage_01
    Created on : Apr 14, 2023, 3:36:59 PM
    Author     : Asus
--%>

<%@page import="Domain.Customer"%>
<%@page import="Domain.ProductCategory"%>
<%@page import="DataAccess.DAProductCategory"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.Base64" %>
<%@ page import="java.util.ArrayList" %>




<!DOCTYPE html>
<html lang="en">

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

        <!-- jQuery library -->
        <script src="https://code.jquery.com/jquery-3.6.0.min.js" type="text/javascript"></script>


        <link rel="stylesheet" type="text/css" href="../../../assets/commonResources/sweetalert.min.css"/>
        <script src="../../../assets/commonResources/sweetalert.min.js"></script>
    </head>

    <body class="theme-color-1">
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
        <!-- header start -->
        <jsp:include page="../cust.Header_Log.jsp"/>
        <!-- header end -->



        <!-- breadcrumb start -->
        <div class="breadcrumb-section">
            <div class="container">
                <div class="row">
                    <div class="col-sm-6">
                        <div class="page-title">
                            <h2>product</h2>
                        </div>
                    </div>
                    <div class="col-sm-6">
                        <nav aria-label="breadcrumb" class="theme-breadcrumb">
                            <ol class="breadcrumb">
                                <li class="breadcrumb-item"><a href="../homepage/homepage.jsp">Home</a></li>
                                <li class="breadcrumb-item active" aria-current="page">product</li>
                            </ol>
                        </nav>
                    </div>
                </div>
            </div>
        </div>
        <!-- breadcrumb End -->


        <!-- section start -->
        <section>
            <div class="collection-wrapper">
                <div class="container">
                    <div class="row">
                        <div class="col-lg-6">
                            <div class="product-slick">

                                <%        String url = "jdbc:derby://localhost:1527/Innisfree";
                                    String username = "nbuser";
                                    String password = "nbuser";
                                    Connection conn = DriverManager.getConnection(url, username, password);

                                    String prodID = request.getParameter("prodid");
                                    int prodIdInt = Integer.parseInt(prodID);
                                    try {
                                        String sql = "SELECT * FROM prodimage WHERE prodid = " + prodIdInt;
                                        PreparedStatement stmt = conn.prepareStatement(sql);
                                        ResultSet rs = stmt.executeQuery();

                                        // Create a list of image sources
                                        List<String> imageSrcList = new ArrayList<String>();
                                        while (rs.next()) {
                                            Blob imageBlob = rs.getBlob("prodimg");
                                            byte[] imageBytes = imageBlob.getBytes(1, (int) imageBlob.length());
                                            String imageSrc = "data:image/jpeg;base64," + Base64.getEncoder().encodeToString(imageBytes);
                                            imageSrcList.add(imageSrc);
                                        }

                                        // Display the images using Slick
                                        for (String imageSrc : imageSrcList) {
                                            out.println("<div><img src='" + imageSrc + "' alt='Product image' class='img-fluid blur-up lazyload'' style='object-fit: contain; height: 800px; width: 800px;'></div>");
                                        }

                                    } catch (Exception e) {
                                        conn.close();
                                    }
                                %>



                            </div>
                            <!--                        <div class="row">-->
                            <div class="col-12 p-0">
                                <div class="slider-nav">

                                </div>     
                            </div></div>
                        <!--                        </div>-->


                        <div class="col-lg-6 rtl-text">
                            <div class="product-right">

                                <h2>
                                    <%
                                        try {
                                            String query = "SELECT * FROM productlist WHERE prodid =" + prodIdInt;
                                            Statement stmt = conn.createStatement();
                                            ResultSet rs = stmt.executeQuery(query);
                                            while (rs.next()) {
                                                out.println(rs.getString("prodname"));
                                            }
                                        } catch (Exception e) {
                                            conn.close();
                                        }

                                    %>

                                </h2>
                                <!--                            <div class="rating-section">
                                                                <div class="rating"><i class="fa fa-star"></i> <i class="fa fa-star"></i> <i
                                                                        class="fa fa-star"></i> <i class="fa fa-star"></i> <i class="fa fa-star"></i>
                                                                </div>
                                                                <h6>120 ratings</h6>
                                                            </div>-->
                                <!--                            <div class="label-section">
                                                                <span class="badge badge-grey-color">#1 Best seller</span>
                                                                <span class="label-text">in fashion</span>
                                                            </div>-->
                                <br>
                                <h3>
                                    <%
                                        try {
                                            String query = "SELECT * FROM productlist WHERE prodid =" + prodIdInt;
                                            Statement stmt = conn.createStatement();
                                            ResultSet rs = stmt.executeQuery(query);
                                            while (rs.next()) {
                                                String finalPrice = String.format("%.2f", rs.getDouble("PROD_FINALPRICE"));
                                                String originalPrice = String.format("%.2f", rs.getDouble("PROD_ORIPRICE"));
                                                int qty = rs.getInt("PRODAVAILABLE_QTY");
                                                if (rs.getInt("discount") > 0) {
                                                    if (qty > 0) {
                                    %>
                                                        <span style="color:red;font-weight:bold;font-size: x-large;">RM<%= finalPrice%></span>&nbsp;
                                                        <span style="text-decoration: line-through;font-size: large;">RM<%= originalPrice%></span>&nbsp;
                                                        <span style="color:red;font-size: small">-<%= rs.getInt("discount")%>%</span>
                                    <%
                                                    } else {
                                    %>
                                                        <span style="color:red;font-weight:bold;font-size: x-large;">RM<%= finalPrice%></span>&nbsp;
                                                        <span style="text-decoration: line-through;font-size: large;">RM<%= originalPrice%></span>&nbsp;
                                                        <span style="color:red;font-size: small">-<%= rs.getInt("discount")%>%</span><br>
                                                        <span style="font-size: large;">OUT OF STOCK</span>
                                    <%
                                                    }
                                                } else {
                                                    if(qty > 0) {
                                    %>
                                                        <h2>RM<%= finalPrice%></h2>
                                    <%
                                                    } else {
                                    %>
                                                        <span style="font-weight: bold; font-size: x-large;">RM<%= finalPrice%></span><br>
                                                        <span style="font-size: large;">OUT OF STOCK</span>
                                    <%
                                                    }
                                                }
                                            }
                                        } catch (Exception e) {
                                            conn.close();
                                        }
                                    %>
                                </h3>

                                <div id="selectSize" class="addeffect-section product-description border-product">
                                    <!--                                <h6 class="product-title size-text">select size <span><a href="" data-bs-toggle="modal"
                                                                                data-bs-target="#sizemodal">size
                                                                                chart</a></span></h6>-->
                                    <!--                                <div class="modal fade" id="sizemodal" tabindex="-1" role="dialog"
                                                                        aria-labelledby="exampleModalLabel" aria-hidden="true">
                                                                        <div class="modal-dialog modal-dialog-centered" role="document">
                                                                            <div class="modal-content">
                                                                                <div class="modal-header">
                                                                                    <h5 class="modal-title" id="exampleModalLabel">Sheer
                                                                                        Straight Kurta</h5>
                                                                                    <button type="button" class="btn-close" data-bs-dismiss="modal"
                                                                                        aria-label="Close"><span aria-hidden="true">&times;</span></button>
                                                                                </div>
                                                                                <div class="modal-body"><img src="../../../assets/images/size-chart.jpg" alt=""
                                                                                        class="img-fluid blur-up lazyload"></div>
                                                                            </div>
                                                                        </div>
                                                                    </div>-->
                                    <!--                                <h6 class="error-message">please select size</h6>
                                                                    <div class="size-box">
                                                                        <ul>
                                                                            <li><a href="javascript:void(0)">s</a></li>
                                                                            <li><a href="javascript:void(0)">m</a></li>
                                                                            <li><a href="javascript:void(0)">l</a></li>
                                                                            <li><a href="javascript:void(0)">xl</a></li>
                                                                        </ul>
                                                                    </div>-->


                                    <%// Define and initialize maxQuantity
                                        int maxQuantity = 0;

                                        // Connect to the database and execute the query
                                        try {
                                            String query = "SELECT MAX(prodavailable_qty) AS max_quantity FROM productlist WHERE prodid =" + prodIdInt;
                                            Statement stmt = conn.createStatement();
                                            ResultSet rs = stmt.executeQuery(query);

                                            // Retrieve the result and store it in maxQuantity variable
                                            if (rs.next()) {
                                                maxQuantity = rs.getInt("max_quantity");
                                            }

                                    %>




                                    <%                                        } catch (Exception e) {
                                            conn.close();
                                            e.printStackTrace();
                                        }

                                        // Check if maxQuantity is 0
                                        if (maxQuantity == 0) {
                                    %>

                                    
                                    <div class="product-buttons">
                                        <%if (loginFound == 1) {%>

                                        <a href="#" onclick="addToWishlist(<%= prodIdInt%>, <%=c.getCustID()%>)" class="btn btn-solid">
                                            <i class="fa fa-bookmark fz-16 me-2" aria-hidden="true"></i>wishlist
                                        </a>


                                        <% } else {%>

                                        <a href="#" onclick="loginNotification(event)" class="btn btn-solid">
                                            <i class="fa fa-bookmark fz-16 me-2" aria-hidden="true"></i>wishlist
                                        </a>

                                        <%}%>                                    </div>


                                    <%
                                    } else {
                                    %>

                                    <%if (loginFound == 1) {%>

                                    <a href="#" id="cartEffect" class="btn btn-solid hover-solid btn-animation" onclick="addToCart(<%= prodIdInt%>, <%=c.getCustID()%>, event)">
                                        <i class="fa fa-shopping-cart me-1" aria-hidden="true"></i> add to cart
                                    </a>
                                    <a href="#" onclick="addToWishlist(<%= prodIdInt%>, <%=c.getCustID()%>)" class="btn btn-solid">
                                        <i class="fa fa-bookmark fz-16 me-2" aria-hidden="true"></i>wishlist
                                    </a>


                                    <% } else {%>

                                    <a href="#" onclick="loginNotification(event)" id="cartEffect" class="btn btn-solid hover-solid btn-animation">
                                        <i class="fa fa-shopping-cart me-1" aria-hidden="true"></i> add to cart
                                    </a>
                                    <a href="#" onclick="loginNotification(event)" class="btn btn-solid">
                                        <i class="fa fa-bookmark fz-16 me-2" aria-hidden="true"></i>wishlist
                                    </a>

                                    <%}%>

                                    <script>
                                        function addToWishlist(productId, custId) {
                                            $.ajax({
                                                url: "insert-wishitem.jsp",
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

                                    <%
                                        }
                                    %>

                                    <script>
                                        // Get the input field and buttons
                                        var input = document.getElementById("quantity-input");
                                        var leftBtn = document.querySelector(".quantity-left-minus");
                                        var rightBtn = document.querySelector(".quantity-right-plus");
                                        var cartBtn = document.getElementById("cartEffect");

                                        // Add event listeners to the buttons
                                        leftBtn.addEventListener("click", function () {
                                            if (input.value > 0) {
                                                input.value--;
                                            }
                                            updateCartButtonStatus();
                                        });

                                        rightBtn.addEventListener("click", function () {
                                            if (input.value < <%=maxQuantity%>) {
                                                input.value++;
                                            }
                                            updateCartButtonStatus();
                                        });

                                        function updateCartButtonStatus() {
                                            if (input.value == 0) {
                                                cartBtn.disabled = true;
                                            } else {
                                                cartBtn.disabled = false;
                                            }
                                        }
                                    </script>

                                </div> 
                                <!--                         <div class="product-buttons"><a href="javascript:void(0)" id="cartEffect"
                                                                    class="btn btn-solid hover-solid btn-animation"><i class="fa fa-shopping-cart me-1"
                                                                        aria-hidden="true"></i> add to cart</a> <a href="#" class="btn btn-solid"><i
                                                                        class="fa fa-bookmark fz-16 me-2" aria-hidden="true"></i>wishlist</a></div>-->
                                <div class="product-count">
                                    <ul>
                                        <li>
                                            <img src="../../../assets/images/icon/truck.png" class="img-fluid" alt="image">
                                            <span class="lang">Free shipping for orders above RM 200</span>
                                        </li>
                                    </ul>
                                </div>
                                <!--                            <div class="border-product">
                                                                <h6 class="product-title">Sales Ends In</h6>
                                                                <div class="timer">
                                                                    <p id="demo"></p>
                                                                </div>
                                                            </div>-->
                                <div class="border-product">
                                    <h6 class="product-title">shipping info</h6>
                                    <ul class="shipping-info">
                                        <li>100% Original Products</li>
                                        <li>Free Delivery on order above RM 200</li>
                                        <li>Pay on delivery is available</li>
                                        <li>Easy 30 days returns and exchanges</li>
                                    </ul>
                                </div>

                            </div>
                        </div></div>
                </div>
            </div>
        </div>
    </div>
</div>
</section>
<!-- Section ends -->


<!-- product-tab starts -->
<section class="tab-product m-0">
    <div class="container">
        <div class="row">
            <div class="col-sm-12 col-lg-12">
                <ul class="nav nav-tabs nav-material" id="top-tab" role="tablist">
                    <li class="nav-item"><a class="nav-link active" id="top-home-tab" data-bs-toggle="tab"
                                            href="#top-home" role="tab" aria-selected="true"><i
                                class="icofont icofont-ui-home"></i>Details</a>
                        <div class="material-border"></div>
                    </li>




                </ul>
                <div class="tab-content nav-material" id="top-tabContent">
                    <div class="tab-pane fade show active" id="top-home" role="tabpanel"
                         aria-labelledby="top-home-tab">
                        <div class="product-tab-discription">
                            <div class="part">
                                <h5 class="inner-title">DESCRIPTION</h5>
                                <p>
                                    <%
                                        try {
                                            String query = "SELECT * FROM productlist WHERE prodid =" + prodIdInt;
                                            Statement stmt = conn.createStatement();
                                            ResultSet rs = stmt.executeQuery(query);
                                            while (rs.next()) {
                                                out.println(rs.getString("proddesc"));
                                            }
                                        } catch (Exception e) {
                                            conn.close();
                                        }

                                    %>
                                </p>
                            </div>
                            <div class="part">
                                <h5 class="inner-title">HOW TO USE</h5>
                                <p> <%                                        try {
                                        String query = "SELECT * FROM productlist WHERE prodid =" + prodIdInt;
                                        Statement stmt = conn.createStatement();
                                        ResultSet rs = stmt.executeQuery(query);
                                        while (rs.next()) {
                                            out.println(rs.getString("prodmanual"));
                                        }
                                    } catch (Exception e) {
                                        conn.close();
                                    } %>
                                </p>
                            </div>
                            <div class="part">
                                <h5 class="inner-title">INGREDIENTS</h5>
                                <p>
                                    <%
                                        try {
                                            String query = "SELECT * FROM productlist WHERE prodid =" + prodIdInt;
                                            Statement stmt = conn.createStatement();
                                            ResultSet rs = stmt.executeQuery(query);
                                            while (rs.next()) {
                                                out.println(rs.getString("prodingredients"));
                                            }
                                        } catch (Exception e) {
                                            conn.close();
                                        } %>
                                </p>
                            </div>

                        </div>
                    </div>
                    <!--                        <div class="tab-pane fade" id="top-profile" role="tabpanel" aria-labelledby="profile-top-tab">
                                                <p>The Model is wearing a white blouse from our stylist's collection, see the image for a
                                                    mock-up of what the actual blouse would look like.it has text written on it in a black
                                                    cursive language which looks great on a white color.</p>
                                                <div class="single-product-tables">
                                                    <table>
                                                        <tbody>
                                                            <tr>
                                                                <td>Sleeve Length</td>
                                                                <td>Sleevless</td>
                                                            </tr>
                                                            <tr>
                                                                <td>Neck</td>
                                                                <td>Round Neck</td>
                                                            </tr>
                                                            <tr>
                                                                <td>Occasion</td>
                                                                <td>Sports</td>
                                                            </tr>
                                                        </tbody>
                                                    </table>
                                                    <table>
                                                        <tbody>
                                                            <tr>
                                                                <td>Fabric</td>
                                                                <td>Polyester</td>
                                                            </tr>
                                                            <tr>
                                                                <td>Fit</td>
                                                                <td>Regular Fit</td>
                                                            </tr>
                                                        </tbody>
                                                    </table>
                                                </div>
                                            </div>-->
                    <div class="tab-pane fade" id="top-contact" role="tabpanel" aria-labelledby="contact-top-tab">
                        <div class="">
                            <iframe width="560" height="315" src="https://www.youtube.com/embed/BUWzX78Ye_8"
                                    allow="autoplay; encrypted-media" allowfullscreen></iframe>
                        </div>
                    </div>
                    <div class="tab-pane fade" id="top-write-review" role="tabpanel" aria-labelledby="review-top-tab">
                        <form class="theme-form">
                            <div class="form-row row">
                                <div class="col-md-12">
                                    <div class="media">
                                        <label>Rating</label>
                                        <div class="media-body ms-3">
                                            <div class="rating three-star"><i class="fa fa-star"></i> <i
                                                    class="fa fa-star"></i> <i class="fa fa-star"></i> <i
                                                    class="fa fa-star"></i> <i class="fa fa-star"></i></div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <label for="name">Name</label>
                                    <input type="text" class="form-control" id="name" placeholder="Enter Your name"
                                           required>
                                </div>
                                <div class="col-md-6">
                                    <label for="email">Email</label>
                                    <input type="text" class="form-control" id="email" placeholder="Email" required>
                                </div>
                                <div class="col-md-12">
                                    <label for="review">Review Title</label>
                                    <input type="text" class="form-control" id="review"
                                           placeholder="Enter your Review Subjects" required>
                                </div>
                                <div class="col-md-12">
                                    <label for="review">Review Title</label>
                                    <textarea class="form-control" placeholder="Wrire Your Testimonial Here"
                                              id="exampleFormControlTextarea1" rows="6"></textarea>
                                </div>
                                <div class="col-md-12">
                                    <button class="btn btn-solid" type="submit">Submit YOur
                                        Review</button>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
<!-- product-tab ends -->





<!-- product section start -->
<section class="section-b-space ratio_asos">
    <div class="container">
        <div class="row">
            <div class="col-12 product-related">
                <h2>related products</h2>
            </div>
        </div>
        <div class="row search-product">
            <%
                try {
                    String sql1 = "SELECT * FROM PRODUCTLIST WHERE PRODID = " + prodIdInt;
                    Statement stmt1 = conn.createStatement();
                    ResultSet rs = stmt1.executeQuery(sql1);
                    while (rs.next()) {
                        try {
                            int categoryID = rs.getInt("prodcatid");
                            String sql2 = "SELECT * FROM PRODUCTLIST WHERE PRODCATID = " + categoryID + " AND PROD_STATUS = 'Active' AND NOT PRODID = " + prodIdInt + " FETCH FIRST 6 ROWS ONLY";
                            Statement stmt2 = conn.createStatement();
                            ResultSet rs2 = stmt2.executeQuery(sql2);
                            while (rs2.next()) {
                                try {
                                    int productId = rs2.getInt("prodid");
                                    String sql3 = "SELECT prodimg FROM prodimage WHERE prodid = " + productId;
                                    Statement stmt3 = conn.createStatement();
                                    ResultSet rs3 = stmt3.executeQuery(sql3);

                                    // Create a list of image sources
                                    List<String> imageSrcList = new ArrayList<String>();
                                    while (rs3.next()) {
                                        Blob imageBlob = rs3.getBlob("prodimg");
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
            <div class="col-xl-2 col-md-4 col-6">
                <div class="product-box">
                    <div class="img-wrapper">
                        <div class="front">
                            <a href="../ProductPage/productPage_01.jsp?prodid=<%= rs2.getInt("prodid")%>">
                                <img src="<%= frontImageSrc%>"
                                     class="img-fluid blur-up lazyload bg-img" alt=""></a>
                        </div>
                        <div class="back">
                            <a href="../ProductPage/productPage_01.jsp?prodid=<%= rs2.getInt("prodid")%>">
                                <img src="<%= backImageSrc%>"
                                     class="img-fluid blur-up lazyload bg-img" alt=""></a>
                        </div>
                        <div class="cart-info cart-wrap">
                            <%if (loginFound == 1) {%>
                            <button onclick="addToCart(<%= rs2.getInt("prodid")%>, <%=c.getCustID()%>, event)" title="Add to cart">
                                <i class="ti-shopping-cart"></i>
                            </button>
                            <a href="#" onclick="addToWishlist(<%= rs2.getInt("prodid")%>, <%=c.getCustID()%>)" title="Add to Wishlist">
                                <i class="ti-heart" aria-hidden="true"></i>
                            </a>

                            <% } else {%>

                            <button onclick="loginNotification(event)" title="Add to cart">
                                <i class="ti-shopping-cart"></i>
                            </button>
                            <a href="#" onclick="loginNotification(event)" title="Add to Wishlist">
                                <i class="ti-heart" aria-hidden="true"></i>
                            </a>

                            <%}%>
                            <a href="#" title="Quick View">
                                <i class="ti-search" aria-hidden="true"></i>
                            </a>
                        </div>
                    </div>
                    <div class="product-detail">
                        <a href="../ProductPage/productPage_01.jsp?prodid=<%= rs2.getInt("prodid")%>">
                            <h6><%= rs2.getString("prodname")%></h6>
                        </a>
                        <%
                            String finalPrice = String.format("%.2f", rs2.getDouble("PROD_FINALPRICE"));
                            String originalPrice = String.format("%.2f", rs2.getDouble("PROD_ORIPRICE"));
                            int qty = rs2.getInt("PRODAVAILABLE_QTY");
                            if (qty > 0) {
                                if (rs2.getInt("discount") > 0) {
                        %>
                        <span style="color:red;font-weight:bold;font-size: large">RM<%= finalPrice%></span>&nbsp;
                        <span style="text-decoration: line-through;">RM<%= originalPrice%></span>&nbsp;
                        <span style="color:red;font-size: small">-<%= rs2.getInt("discount")%>%</span>
                        <%
                        } else {
                        %>
                        <h4>RM<%= finalPrice%></h4>
                        <%
                            }
                        } else {
                        %>
                        <span style="font-weight: bold; font-size: large;">RM<%= finalPrice%></span>&nbsp;&nbsp;&nbsp;
                        <span>OUT OF STOCK</span>
                        <% } %>
                    </div>
                </div>
            </div>

            <script>
                function addToWishlist(productId, custId) {
                    $.ajax({
                        url: "insert-wishitem.jsp",
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

            <%
                                } catch (SQLException ex) {
                                    conn.close();
                                }
                            }
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
</section>
<!-- product section end -->



<!-- Add to cart modal popup start-->
<div class="modal fade bd-example-modal-lg theme-modal cart-modal" id="addtocart" tabindex="-1" role="dialog"
     aria-hidden="true">
    <div class="modal-dialog modal-lg modal-dialog-centered" role="document">
        <div class="modal-content">
            <div class="modal-body modal1">
                <div class="container-fluid p-0">
                    <div class="row">
                        <div class="col-12">
                            <div class="modal-bg addtocart">
                                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close">
                                    <span aria-hidden="true">&times;</span>
                                </button>
                                <div class="media">
                                    <a href="#">
                                        <img class="img-fluid blur-up lazyload pro-img"
                                             src="../../../assets/images/fashion/product/43.jpg" alt="">
                                    </a>
                                    <div class="media-body align-self-center text-center">
                                        <a href="#">
                                            <h6>
                                                <i class="fa fa-check"></i>Item
                                                <span>men full sleeves</span>
                                                <span> successfully added to your Cart</span>
                                            </h6>
                                        </a>
                                        <div class="buttons">
                                            <a href="#" class="view-cart btn btn-solid">Your cart</a>
                                            <a href="#" class="checkout btn btn-solid">Check out</a>
                                            <a href="#" class="continue btn btn-solid">Continue shopping</a>
                                        </div>

                                        <div class="upsell_payment">
                                            <img src="../../../assets/images/payment_cart.png"
                                                 class="img-fluid blur-up lazyload" alt="">
                                        </div>
                                    </div>
                                </div>
                                <div class="product-section">
                                    <div class="col-12 product-upsell text-center">
                                        <h4>Customers who bought this item also.</h4>
                                    </div>
                                    <div class="row" id="upsell_product">
                                        <div class="product-box col-sm-3 col-6">
                                            <div class="img-wrapper">
                                                <div class="front">
                                                    <a href="#">
                                                        <img src="../../../assets/images/fashion/product/1.jpg"
                                                             class="img-fluid blur-up lazyload mb-1"
                                                             alt="cotton top">
                                                    </a>
                                                </div>
                                                <div class="product-detail">
                                                    <h6><a href="#"><span>cotton top</span></a></h6>
                                                    <h4><span>$25</span></h4>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="product-box col-sm-3 col-6">
                                            <div class="img-wrapper">
                                                <div class="front">
                                                    <a href="#">
                                                        <img src="../../../assets/images/fashion/product/34.jpg"
                                                             class="img-fluid blur-up lazyload mb-1"
                                                             alt="cotton top">
                                                    </a>
                                                </div>
                                                <div class="product-detail">
                                                    <h6><a href="#"><span>cotton top</span></a></h6>
                                                    <h4><span>$25</span></h4>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="product-box col-sm-3 col-6">
                                            <div class="img-wrapper">
                                                <div class="front">
                                                    <a href="#">
                                                        <img src="../../../assets/images/fashion/product/13.jpg"
                                                             class="img-fluid blur-up lazyload mb-1"
                                                             alt="cotton top">
                                                    </a>
                                                </div>
                                                <div class="product-detail">
                                                    <h6><a href="#"><span>cotton top</span></a></h6>
                                                    <h4><span>$25</span></h4>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="product-box col-sm-3 col-6">
                                            <div class="img-wrapper">
                                                <div class="front">
                                                    <a href="#">
                                                        <img src="../../../assets/images/fashion/product/19.jpg"
                                                             class="img-fluid blur-up lazyload mb-1"
                                                             alt="cotton top">
                                                    </a>
                                                </div>
                                                <div class="product-detail">
                                                    <h6><a href="#"><span>cotton top</span></a></h6>
                                                    <h4><span>$25</span></h4>
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
        </div>
    </div>
</div>
<!-- Add to cart modal popup end-->


<!-- footer start -->
<jsp:include page="../cust.Footer.jsp"/>
<!-- footer end -->


<!-- added to cart notification -->
<div class="added-notification">
    <img src="../../../assets/images/fashion/pro/1.jpg" class="img-fluid" alt="">
    <h3>added to cart</h3>
</div>
<!-- added to cart notification -->




<!-- latest jquery-->
<script src="../../../assets/js/jquery-3.3.1.min.js"></script>

<!-- menu js-->
<script src="../../../assets/js/menu.js"></script>

<!-- lazyload js-->
<script src="../../../assets/js/lazysizes.min.js"></script>

<!-- timer js-->
<script src="../../../assets/js/timer.js"></script>

<!-- slick js-->
<script src="../../../assets/js/slick.js"></script>

<!-- sticky cart bottom js-->
<script src="../../../assets/js/sticky-cart-bottom.js"></script>

<!-- Bootstrap js-->
<script src="../../../assets/js/bootstrap.bundle.min.js"></script>

<!-- Bootstrap Notification js-->
<script src="../../../assets/js/bootstrap-notify.min.js"></script>

<!-- Zoom js-->
<!--    <script src="../assets/js/jquery.elevatezoom.js"></script>-->

<!-- Theme js-->
<script src="../../../assets/js/theme-setting.js"></script>
<script src="../../../assets/js/script.js"></script>

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

