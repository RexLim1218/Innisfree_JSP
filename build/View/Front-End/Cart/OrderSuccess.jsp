<%-- 
    Document   : OrderSuccess
    Created on : 03-May-2023, 23:06:42
    Author     : User
--%>
<%@page import="java.util.*"%>
<%@page import="java.util.Base64"%>
<%@page import="Domain.*"%>
<%@page import="DataAccess.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>

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


    </head>
    <body>
        <%
     Customer c = (Customer) session.getAttribute("customerLogin");
            int custid = c.getCustID();
            
//            DACartDetail dacd = new DACartDetail();
//            ArrayList<CartDetail> cartProductList = dacd.getAllCartProductByCustID(auth.getCUSTID());

            DAOrders dao = new DAOrders();
            Orders o = dao.getOrdersBycustID(custid);
            
            
            DAOrderDetails daod = new DAOrderDetails();
            ArrayList<OrderDetails> orderDetails = daod.getAllOrderDetailsByOrderRow(o.getOrderRow());
            
            DAPayment dapay = new DAPayment();
             Payment pay = dapay.getPaymentByOrderRow(o.getOrderRow());
             
            DADeliveryStatus dads = new DADeliveryStatus();
            DeliveryStatus ds = dads.getAddressIDtByOrderRow(o.getOrderRow());
            
            AddressDA daad = new AddressDA();
            Address ad = daad.getAddressByAddressID(ds.getAddressID());
            
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
                            <h2>Order Successful</h2>
                        </div>
                    </div>
                    <div class="col-sm-6">
                        <nav aria-label="breadcrumb" class="theme-breadcrumb">
                            <ol class="breadcrumb">
                                <li class="breadcrumb-item"><a href="../homepage/homepage.jsp">Home</a></li>
                                <li class="breadcrumb-item active" aria-current="page">Order Successful</li>
                            </ol>
                        </nav>
                    </div>
                </div>
            </div>
        </div>
        <!-- breadcrumb End -->
        
        <!-- thank-you section start -->
        <section class="section-b-space light-layout">
            <div class="container">
                <div class="row">
                    <div class="col-md-12">
                        <div class="success-text">
                            <div class="checkmark">
                                <svg class="star" height="19" viewBox="0 0 19 19" width="19"
                                     xmlns="http://www.w3.org/2000/svg">
                                <path
                                    d="M8.296.747c.532-.972 1.393-.973 1.925 0l2.665 4.872 4.876 2.66c.974.532.975 1.393 0 1.926l-4.875 2.666-2.664 4.876c-.53.972-1.39.973-1.924 0l-2.664-4.876L.76 10.206c-.972-.532-.973-1.393 0-1.925l4.872-2.66L8.296.746z">
                                </path>
                                </svg>
                                <svg class="star" height="19" viewBox="0 0 19 19" width="19"
                                     xmlns="http://www.w3.org/2000/svg">
                                <path
                                    d="M8.296.747c.532-.972 1.393-.973 1.925 0l2.665 4.872 4.876 2.66c.974.532.975 1.393 0 1.926l-4.875 2.666-2.664 4.876c-.53.972-1.39.973-1.924 0l-2.664-4.876L.76 10.206c-.972-.532-.973-1.393 0-1.925l4.872-2.66L8.296.746z">
                                </path>
                                </svg>
                                <svg class="star" height="19" viewBox="0 0 19 19" width="19"
                                     xmlns="http://www.w3.org/2000/svg">
                                <path
                                    d="M8.296.747c.532-.972 1.393-.973 1.925 0l2.665 4.872 4.876 2.66c.974.532.975 1.393 0 1.926l-4.875 2.666-2.664 4.876c-.53.972-1.39.973-1.924 0l-2.664-4.876L.76 10.206c-.972-.532-.973-1.393 0-1.925l4.872-2.66L8.296.746z">
                                </path>
                                </svg>
                                <svg class="star" height="19" viewBox="0 0 19 19" width="19"
                                     xmlns="http://www.w3.org/2000/svg">
                                <path
                                    d="M8.296.747c.532-.972 1.393-.973 1.925 0l2.665 4.872 4.876 2.66c.974.532.975 1.393 0 1.926l-4.875 2.666-2.664 4.876c-.53.972-1.39.973-1.924 0l-2.664-4.876L.76 10.206c-.972-.532-.973-1.393 0-1.925l4.872-2.66L8.296.746z">
                                </path>
                                </svg>
                                <svg class="star" height="19" viewBox="0 0 19 19" width="19"
                                     xmlns="http://www.w3.org/2000/svg">
                                <path
                                    d="M8.296.747c.532-.972 1.393-.973 1.925 0l2.665 4.872 4.876 2.66c.974.532.975 1.393 0 1.926l-4.875 2.666-2.664 4.876c-.53.972-1.39.973-1.924 0l-2.664-4.876L.76 10.206c-.972-.532-.973-1.393 0-1.925l4.872-2.66L8.296.746z">
                                </path>
                                </svg>
                                <svg class="star" height="19" viewBox="0 0 19 19" width="19"
                                     xmlns="http://www.w3.org/2000/svg">
                                <path
                                    d="M8.296.747c.532-.972 1.393-.973 1.925 0l2.665 4.872 4.876 2.66c.974.532.975 1.393 0 1.926l-4.875 2.666-2.664 4.876c-.53.972-1.39.973-1.924 0l-2.664-4.876L.76 10.206c-.972-.532-.973-1.393 0-1.925l4.872-2.66L8.296.746z">
                                </path>
                                </svg>
                                <svg class="checkmark__check" height="36" viewBox="0 0 48 36" width="48"
                                     xmlns="http://www.w3.org/2000/svg">
                                <path
                                    d="M47.248 3.9L43.906.667a2.428 2.428 0 0 0-3.344 0l-23.63 23.09-9.554-9.338a2.432 2.432 0 0 0-3.345 0L.692 17.654a2.236 2.236 0 0 0 .002 3.233l14.567 14.175c.926.894 2.42.894 3.342.01L47.248 7.128c.922-.89.922-2.34 0-3.23">
                                </path>
                                </svg>
                                <svg class="checkmark__background" height="115" viewBox="0 0 120 115" width="120"
                                     xmlns="http://www.w3.org/2000/svg">
                                <path
                                    d="M107.332 72.938c-1.798 5.557 4.564 15.334 1.21 19.96-3.387 4.674-14.646 1.605-19.298 5.003-4.61 3.368-5.163 15.074-10.695 16.878-5.344 1.743-12.628-7.35-18.545-7.35-5.922 0-13.206 9.088-18.543 7.345-5.538-1.804-6.09-13.515-10.696-16.877-4.657-3.398-15.91-.334-19.297-5.002-3.356-4.627 3.006-14.404 1.208-19.962C10.93 67.576 0 63.442 0 57.5c0-5.943 10.93-10.076 12.668-15.438 1.798-5.557-4.564-15.334-1.21-19.96 3.387-4.674 14.646-1.605 19.298-5.003C35.366 13.73 35.92 2.025 41.45.22c5.344-1.743 12.628 7.35 18.545 7.35 5.922 0 13.206-9.088 18.543-7.345 5.538 1.804 6.09 13.515 10.696 16.877 4.657 3.398 15.91.334 19.297 5.002 3.356 4.627-3.006 14.404-1.208 19.962C109.07 47.424 120 51.562 120 57.5c0 5.943-10.93 10.076-12.668 15.438z">
                                </path>
                                </svg>
                            </div>
                            <h2>thank you</h2>
                            <p>Payment is successfully processsed and your order is processing</p>
                            <p class="font-weight-bold">Transaction ID: <%=pay.getTransaction_ID() %></p>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!-- Section ends -->


        <!-- order-detail section start -->
        <section class="section-b-space">
            <div class="container">
                <div class="row">
                    <div class="col-lg-6">
                        <div class="product-order">
                             <%for (OrderDetails od : orderDetails) {
                                %>
                            <div class="row product-order-detail">
                                <div class="col-3"><img src="data:image/jpeg;base64,<%= Base64.getEncoder().encodeToString(od.getProductImage().getGetImg())%>" alt=""
                                                        ></div>
                                <div class="col-3 order_detail">
                                    <div>
                                        <h4>product name</h4>
                                        
                                           <%
                                                            String prodname = od.getProduct().getProdName();
                                                            String prodname2 = "";
                                                            if (prodname.length() >= 20) {
                                                                prodname2 = prodname.substring(0, 25) + ".......";

                                                            } else {
                                                                prodname2 = prodname;
                                                            }


                                                        %>
                                        
                                        <h5><%=prodname2%></h5>
                                    </div>
                                </div>
                                <div class="col-3 order_detail">
                                    <div>
                                        <h4>quantity</h4>
                                        <h5><%=od.getOrdQty() %></h5>
                                    </div>
                                </div>
                                <div class="col-3 order_detail">
                                    <div>
                                        <h4>price</h4>
                                        <h5>RM<%=od.getOrdPrice() %></h5>
                                    </div>
                                </div>
                            </div>
                                                 <% }
                                %>
                            <div class="total-sec">
                                <ul>
                                    <li>subtotal <span>RM<%=o.getOrderTtlAmt() %></span></li>
                                    <li>shipping <span>RM<%=pay.getDeliveryFee() %></span></li>
                                    
                                </ul>
                            </div>
                            <div class="final-total">
                                <h3>total <span>RM<%=pay.getPaymentAmount() %></span></h3>
                            </div>
                           
                        </div>
                    </div>
                    <div class="col-lg-6">
                        <div class="order-success-sec">
                            <div class="row">
                                <div class="col-sm-6">
                                    <h4>summary</h4>
                                    <ul class="order-detail">
                                        <li>order ID: <%=o.getOrderNo() %></li>
                                        <li>Order Date: <%=o.getOrderCrDate() %></li>
                                        <li>Order Total: RM<%=pay.getPaymentAmount() %></li>
                                    </ul>
                                </div>
                                <div class="col-sm-6">
                                    <h4>shipping address</h4>
                                    <ul class="order-detail">
                                        <li><%=ad.getReceiverName() %></li>
                                        <li><%=ad.getAddr_Details() %></li>
                                        <li><%=ad.getZipcode() %>, <%=ad.getTown() %>, <%=ad.getAddr_State() %></li>
                                        <li>Contact No: <%=ad.getReceiverHP() %></li>
                                    </ul>
                                </div>
                                <div class="col-sm-12 payment-mode">
                                    <h4>payment method</h4>
                                    <p><%=pay.getPaymentMethod() %></p>
                                </div>
                                <div class="col-md-12">
                                <div class="delivery-sec">
                                    <h3>expected date of delivery: <span><%=o.getExpectedTime() %></span></h3>
                                    <a href="../Order/ViewOrders.jsp?orderRow=<%=o.getOrderRow()%>">track order</a>
                                </div>
                            </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!-- Section ends -->
        <!-- footer start -->
        <jsp:include page="../cust.Footer.jsp"/>
        <!-- footer end -->
    </body>
</html>
