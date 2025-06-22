<%-- Document : cust.Footer Created on : Mar 16, 2023, 10:32:17 PM Author :
Huawei --%> <%@page import="DataAccess.DACartDetail"%>
<%@page import="Domain.Customer"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Domain.ProductCategory"%>
<%@page import="DataAccess.DAProductCategory"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width,initial-scale=1" />
        <meta name="description" content="multikart" />
        <meta name="keywords" content="multikart" />
        <meta name="author" content="multikart" />
        <link rel="icon" href="../../assets/images/favicon/3.png" type="image/x-icon">
        <title>Innisfree | Make You Better</title>

        <!--Google font-->
        <link
            href="https://fonts.googleapis.com/css?family=Lato:300,400,700,900"
            rel="stylesheet"
            />
        <link rel="preconnect" href="https://fonts.gstatic.com" />
        <link
            href="https://fonts.googleapis.com/css2?family=Yellowtail&amp;display=swap"
            rel="stylesheet"
            />

        <!-- Icons -->
        <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/assets/css/vendors/font-awesome.css" />

        <!--Slick slider css-->
        <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/assets/css/vendors/slick.css" />
        <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/assets/css/vendors/slick-theme.css" />

        <!-- Animate icon -->
        <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/assets/css/vendors/animate.css" />

        <!-- Themify icon -->
        <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/assets/css/vendors/themify-icons.css" />

        <!-- Bootstrap css -->
        <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/assets/css/vendors/bootstrap.css" />

        <!-- Theme css -->
        <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/assets/css/style.css" />
        <script src="../../../assets/commonResources/sweetalert.min.js"></script>
        <!-- jQuery library -->
        <script src="https://code.jquery.com/jquery-3.6.0.min.js" type="text/javascript"></script>


        <link rel="stylesheet" type="text/css" href="../../../assets/commonResources/sweetalert.min.css"/>
    </head>



    <body class="theme-color-1" style="overflow: auto">


        <%

            int loginFound = 0;
            int count = 0;
            Customer cu = new Customer();

            if (session.getAttribute("custID") != null) {
                loginFound = 1;

                cu = (Customer) session.getAttribute("customerLogin");
                DACartDetail dac = new DACartDetail();
                count = dac.countCartDetailQtyBycustID(cu.getCustID());
            }

        %>


        <!-- header start -->
        <header>
            <div class="top-header">
                <div class="container">
                    <div class="row">
                        <div class="col-lg-6">
                            <div class="header-contact">
                                <ul>
                                    <li>Welcome to Our store Innisfree</li>
                                    <li>
                                        <i class="fa fa-phone" aria-hidden="true"></i>Call Us: 03-7899342
                                    </li>
                                </ul>
                            </div>
                        </div>
                        <div class="col-lg-6 text-end">
                            <ul class="header-dropdown">
                                <li class="mobile-wishlist">
                                    <%if (loginFound != 0) {%>
                                    <a href="<%=request.getContextPath()%>/View/Front-End/Wishlist/wishlist.jsp"><i class="fa fa-heart" aria-hidden="true"></i></a>
                                        <%}%>
                                </li>
                                <li class="onhover-dropdown mobile-account">
                                    <i class="fa fa-user" aria-hidden="true"></i> My Account
                                    <ul class="onhover-show-div">
                                        <%if (loginFound != 0) {%>
                                        <li><a href="<%=request.getContextPath()%>/View/Front-End/Customer/Profile.jsp">Profile</a></li>
                                        <li><a href="<%=request.getContextPath()%>/View/Front-End/Customer/Address.jsp">Address</a></li>
                                        <li><a href="<%=request.getContextPath()%>/View/Front-End/Order/OrderHistory.jsp">Order History</a></li>
                                        <li><a href="${pageContext.servletContext.contextPath}/Logout">Log Out</a></li>
                                            <%} else {%>

                                        <li><a href="<%=request.getContextPath()%>/View/Front-End/login.jsp">Log In</a></li>

                                        <%}%>
                                    </ul>
                                </li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
            <div class="container">
                <div class="row">
                    <div class="col-sm-12">
                        <div class="main-menu">
                            <div class="menu-left">
                                <div class="brand-logo">
                                    <a href="<%=request.getContextPath()%>/View/Front-End/homepage/homepage.jsp"
                                       ><img
                                            src="<%=request.getContextPath()%>/assets/images/icon/layout3/logo.png"
                                            class="img-fluid blur-up lazyloaded"
                                            alt=""
                                            /></a>
                                </div>
                            </div>

                            <div class="menu-right pull-right">
                                <div>
                                    <nav id="main-nav">
                                        <div class="toggle-nav">
                                            <i class="fa fa-bars sidebar-bar"></i>
                                        </div>
                                        <ul id="main-menu" class="sm pixelstrap sm-horizontal hover-unset" data-smartmenus-id="1679117126596558" style="right: -410px" >
                                            <li>
                                                <div class="mobile-back text-end">
                                                    Back
                                                    <i class="fa fa-angle-right ps-2" aria-hidden="true" ></i>
                                                </div>
                                            </li>
                                            <li><a href="<%=request.getContextPath()%>/View/Front-End/homepage/homepage.jsp">Home</a></li>
                                            <li>
                                                <a href="<%=request.getContextPath()%>/View/Front-End/ProductPage/allproductlist.jsp">Product</a>
                                                <ul>
                                                    <%DAProductCategory pcDA = new DAProductCategory();
                                                        ArrayList<ProductCategory> productCategoryList = pcDA.getAllProductsCategory();%>
                                                    <%for (ProductCategory pc : productCategoryList) {%>
                                                    <li><a href="<%=request.getContextPath()%>/View/Front-End/ProductPage/allproduct.jsp?prodcatid=<%=pc.getProdCatID()%>"><%=pc.getProdCatName()%></a></li>
                                                        <%}%>
                                                </ul>
                                            </li>
                                            <li>
                                                <a
                                                    href="<%=request.getContextPath()%>/View/Front-End/ProductPage/promotion.jsp"
                                                    class="has-submenu"
                                                    id="sm-1679117126596558-5"
                                                    aria-haspopup="true"
                                                    aria-controls="sm-1679117126596558-6"
                                                    aria-expanded="false"
                                                    >Promotion <div class="lable-nav">new</div></a>

                                            </li>
                                            <%if (loginFound != 0) {%>
                                            <li>
                                                <a
                                                    href="<%=request.getContextPath()%>/View/Front-End/Order/OrderHistory.jsp"
                                                    class="has-submenu"
                                                    id="sm-1679117126596558-3"
                                                    aria-haspopup="true"
                                                    aria-controls="sm-1679117126596558-4"
                                                    aria-expanded="false"
                                                    >Order</a>

                                            </li>
                                            <%}%>

                                        </ul>
                                    </nav>
                                </div>
                                <div>
                                    <div class="icon-nav">
                                        <ul>
                                            <li>
                                                <div>
                                                    <img src="../../../assets/images/icon/search.png" onclick="openSearch()" class="img-fluid blur-up lazyloaded" alt="" />

                                                </div>
                                                <div id="search-overlay" class="search-overlay">
                                                    <div>
                                                        <span class="closebtn" onclick="closeSearch()" title="Close Overlay" >×</span>
                                                        <div class="overlay-content">
                                                            <div class="container">
                                                                <div class="row">
                                                                    <div class="col-xl-12">
                                                                        <form action="../ProductPage/search.jsp">
                                                                            <div class="form-group">
                                                                                <input type="text" class="form-control" id="exampleInputPassword1" 
                                                                                       name="searchResult" placeholder="Search a Product" />
                                                                            </div>
                                                                            <button type="submit" class="btn btn-primary">
                                                                                <i class="fa fa-search"></i>
                                                                            </button>
                                                                        </form>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </li>

                                            <li class="onhover-div mobile-cart">
                                                <div>
                                                    <%if (loginFound != 0) {%>
                                                    <a href="<%=request.getContextPath()%>/View/Front-End/Cart/Cart.jsp">
                                                        <img
                                                            src="../../../assets/images/icon/cart.png"
                                                            class="img-fluid blur-up lazyloaded"
                                                            alt=""
                                                            />
                                                        <i class="ti-shopping-cart"></i></a>
                                                    <span class="cart_qty_cls"><%=count%></span>
                                                    <%} else {%>
                                                    <a onclick="loginNotification(event)">
                                                        <img
                                                            src="../../../assets/images/icon/cart.png"
                                                            class="img-fluid blur-up lazyloaded"
                                                            alt=""
                                                            />
                                                        <i class="ti-shopping-cart"><%=count%>></i></a>

                                                    <%}%>
                                                </div>

                                            </li>
                                        </ul>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </header>
        <!-- header end -->

        <!-- latest jquery-->
        <script src="../../../assets/js/jquery-3.3.1.min.js"></script>

        <!-- fly cart ui jquery-->
        <script src="../../../assets/js/jquery-ui.min.js"></script>

        <!-- exitintent jquery-->
        <script src="../../../assets/js/jquery.exitintent.js"></script>
        <script src="../../../assets/js/exit.js"></script>

        <!-- slick js-->
        <script src="../../../assets/js/slick.js"></script>

        <!-- menu js-->
        <script src="../../../assets/js/menu.js"></script>

        <!-- lazyload js-->
        <script src="../../../assets/js/lazysizes.min.js"></script>

        <!-- Bootstrap js-->
        <script src="../../../assets/js/bootstrap.bundle.min.js"></script>

        <!-- Bootstrap Notification js-->
        <script src="../../../assets/js/bootstrap-notify.min.js"></script>

        <!-- Fly cart js-->
        <script src="../../../assets/js/fly-cart.js"></script>

        <!-- Theme js-->
        <script src="../../../assets/js/theme-setting.js"></script>
        <script src="../../../assets/js/script.js"></script>

        <script>
                                                        $(window).on("load", function () {
                                                            setTimeout(function () {
                                                                $("#exampleModal").modal("show");
                                                            }, 2500);
                                                        });

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
        </script>
    </body>
</html>
