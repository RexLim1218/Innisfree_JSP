<%-- 
    Document   : cust.Footer
    Created on : Mar 16, 2023, 11:08:29 PM
    Author     : Huawei
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width,initial-scale=1">
    <meta name="description" content="multikart">
    <meta name="keywords" content="multikart">
    <meta name="author" content="multikart">


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



</head>
    <body>
    <!-- footer -->
    <footer class="footer-light">
        <div class="light-layout">
            <div class="container">
                <section class="small-section border-section border-top-0">
                    <div class="row">
                        <div class="col-lg-6">
                            <div class="subscribe">
                                <div>
                                    <h4>KNOW IT ALL FIRST!</h4>
                                    <p>Never Miss Anything From Multikart By Signing Up To Our Newsletter.</p>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-6">
                            <form
                                action="https://pixelstrap.us19.list-manage.com/subscribe/post?u=5a128856334b598b395f1fc9b&amp;id=082f74cbda"
                                class="form-inline subscribe-form auth-form needs-validation" method="post"
                                id="mc-embedded-subscribe-form" name="mc-embedded-subscribe-form" target="_blank">
                                <div class="form-group mx-sm-3">
                                    <input type="text" class="form-control" name="EMAIL" id="mce-EMAIL"
                                        placeholder="Enter your email" required="required">
                                </div>
                                <button type="submit" class="btn btn-solid" id="mc-submit">subscribe</button>
                            </form>
                        </div>
                    </div>
                </section>
            </div>
        </div>
        <section class="section-b-space light-layout">
            <div class="container">
                <div class="row footer-theme partition-f">
                    <div class="col-lg-4 col-md-6">
                        <div class="footer-title footer-mobile-title">
                            <h4>about</h4>
                        </div>
                        <div class="footer-contant">
                            <div class="footer-logo"><img src="../../../assets/images/icon/layout3/logo.png" alt=""></div>
                            <p>We care deeply about your skin and are committed to delivering skin-conscious Beauty. We care deeply about the place we all call Home and stand for Beauty that is also beautiful for our environment. innisfree is taking Action.</p>
                            <div class="footer-social">
                                <ul>
                                    <li><a href="https://www.facebook.com/innisfreeMYS/"><i class="fa fa-facebook-f"></i></a></li>
                                    <li><a href="mailto:cs_my@innisfree.com"><i class="fa fa-google-plus"></i></a></li>
                                    <li><a href="https://www.instagram.com/innisfree_malaysia/"><i class="fa fa-instagram"></i></a></li>
                                   
                                </ul>
                            </div>
                        </div>
                    </div>
                    <div class="col offset-xl-1">
                        <div class="sub-title">
                            <div class="footer-title">
                                <h4>Business Hour</h4>
                            </div>
                            <div class="footer-contant">
                                <ul>
                                    <li>Monday - Saturday</li>
                                    <li>exclude public holidays</li>
                                    <li>10am - 10pm</li>
                                    <li>close on sunday</li>
                                </ul>
                            </div>
                        </div>
                    </div>
                    <div class="col">
                        <div class="sub-title">
                            <div class="footer-title">
                                <h4>products</h4>
                            </div>
                            <div class="footer-contant">
                                <ul>
                                    <li><a href="<%=request.getContextPath()%>/View/Front-End/ProductPage/allproduct.jsp?prodcatid=1">cleansers & makeup removers</a></li>
                                    <li><a href="<%=request.getContextPath()%>/View/Front-End/ProductPage/allproduct.jsp?prodcatid=2">toner</a></li>
                                    <li><a href="<%=request.getContextPath()%>/View/Front-End/ProductPage/allproduct.jsp?prodcatid=3">moisturizer</a></li>
                                    <li><a href="<%=request.getContextPath()%>/View/Front-End/ProductPage/allproduct.jsp?prodcatid=4">serum & essence</a></li>
                                    <li><a href="<%=request.getContextPath()%>/View/Front-End/ProductPage/allproduct.jsp?prodcatid=5">eye care</a></li>
                                    <li><a href="<%=request.getContextPath()%>/View/Front-End/ProductPage/allproduct.jsp?prodcatid=6">sun care</a></li>
                                    <li><a href="<%=request.getContextPath()%>/View/Front-End/ProductPage/allproduct.jsp?prodcatid=7">men</a></li>
                                    <li><a href="<%=request.getContextPath()%>/View/Front-End/ProductPage/allproduct.jsp?prodcatid=8">mask</a></li>
                                    <li><a href="<%=request.getContextPath()%>/View/Front-End/ProductPage/allproduct.jsp?prodcatid=9">set</a></li>
                                </ul>
                            </div>
                        </div>
                    </div>
                    <div class="col">
                        <div class="sub-title">
                            <div class="footer-title">
                                <h4>store information</h4>
                            </div>
                            <div class="footer-contant">
                                <ul class="contact-list">
                                    <li><i class="fa fa-map-marker"></i>Lot No. 170-01-11, 170, Persiaran Gurney, Pulau Tikus, 10250 George Town, Pulau Pinang</li>
                                    <li><i class="fa fa-phone"></i>Call Us: Call Us: 03-7899342</li>
                                    <li><i class="fa fa-envelope"></i>Email Us: <a href="#">Support@innisfreemy.com</a>
                                    </li>
                                    <li><i class="fa fa-fax"></i>Fax: 03-5205200</li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <div class="sub-footer">
            <div class="container">
                <div class="row">
                    <div class="col-xl-6 col-md-6 col-sm-12">
                        <div class="footer-end">
                            <p><i class="fa fa-copyright" aria-hidden="true"></i> 2023-24 themeforest powered by
                                pixelstrap</p>
                        </div>
                    </div>
                    <div class="col-xl-6 col-md-6 col-sm-12">
                        <div class="payment-card-bottom">
                            <ul>
                                <li>
                                    <a href="#"><img src="../../../assets/images/icon/visa.png" alt=""></a>
                                </li>
                                <li>
                                    <a href="#"><img src="../../../assets/images/icon/mastercard.png" alt=""></a>
                                </li>
                                <li>
                                    <a href="#"><img src="../../../assets/images/icon/paypal.png" alt=""></a>
                                </li>
                                <li>
                                    <a href="#"><img src="../../../assets/images/icon/american-express.png" alt=""></a>
                                </li>
                                <li>
                                    <a href="#"><img src="../../../assets/images/icon/discover.png" alt=""></a>
                                </li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </footer>
    <!-- footer end -->


    <!-- cookie bar start -->
    <div class="cookie-bar">
        <p>We use cookies to improve our site and your shopping experience. By continuing to browse our site you accept
            our cookie policy.</p>
        <a href="javascript:void(0)" class="btn btn-solid btn-xs">accept</a>
        <a href="javascript:void(0)" class="btn btn-solid btn-xs">decline</a>
    </div>
    <!-- cookie bar end -->
        
        
        
        
        
        
    
        
        
    <!-- tap to top -->
    <div class="tap-top top-cls">
        <div>
            <i class="fa fa-angle-double-up"></i>
        </div>
    </div>
    <!-- tap to top end -->


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
        $(window).on('load', function () {
            setTimeout(function () {
                $('#exampleModal').modal('show');
            }, 2500);
        });

        function openSearch() {
            document.getElementById("search-overlay").style.display = "block";
        }

        function closeSearch() {
            document.getElementById("search-overlay").style.display = "none";
        }
    </script>
    </body>
</html>
