<%-- 
    Document   : checkout
    Created on : Apr 30, 2023, 10:46:15 PM
    Author     : Asus
--%>
<%@page import="java.util.*"%>
<%@page import="java.util.Base64"%>
<%@page import="Domain.*"%>
<%@page import="DataAccess.*"%>
<%@page import="java.util.*"%>
<%@page import="java.util.Base64"%>
<%@page import="Domain.*"%>
<%@page import="DataAccess.*"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Innisfree | Make You Better</title>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width,initial-scale=1">
        <meta name="description" content="multikart">
        <meta name="keywords" content="multikart">
        <meta name="author" content="multikart">
        <link rel="icon" href="../../../assets/images/favicon/3.png" type="image/x-icon">

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

            AddressDA daad = new AddressDA();
            ArrayList<Address> deliveryAddress = daad.getAllAddress(c.getCustID());

            DACartDetail dacd = new DACartDetail();
            ArrayList<CartDetail> cartProductList = dacd.getAllCartProductByCustID(c.getCustID());

            double total = dacd.getTotalCartPrice(cartProductList);
            double shippingPrice = (total >= 200.0) ? 0.0 : 25.0;
            double totalPrice = Math.round((total + shippingPrice) * 100.0) / 100.0;
            request.setAttribute("total", total);
            request.setAttribute("shippingPrice", shippingPrice);
            request.setAttribute("totalPrice", totalPrice);

        %>
        <jsp:include page="../cust.Header_Log.jsp"/>

        <!-- breadcrumb start -->
        <div class="breadcrumb-section">
            <div class="container">
                <div class="row">
                    <div class="col-sm-6">
                        <div class="page-title">
                            <h2>Check-out</h2>
                        </div>
                    </div>
                    <div class="col-sm-6">
                        <nav aria-label="breadcrumb" class="theme-breadcrumb">
                            <ol class="breadcrumb">
                                <li class="breadcrumb-item"><a href="../homepage/homepage.jsp">Home</a></li>
                                <li class="breadcrumb-item"><a href="Cart.jsp">Cart</a></li>
                                <li class="breadcrumb-item active" aria-current="page">Check-out</li>
                            </ol>
                        </nav>
                    </div>
                </div>
            </div>
        </div>
        <!-- breadcrumb End -->


        <!-- section start -->
        <section class="section-b-space">
            <div class="container">
                <div class="checkout-page">
                    <div class="checkout-form">
                        <form action="checkoutReview.jsp" method="post">
                            <div class="row">
                                <div class="col-lg-6 col-sm-12 col-xs-12">
                                    <div class="checkout-title">
                                        <h3>Billing Details</h3>
                                    </div>

                                    <label for="address">Select an address:</label>
                                    <select name="address" id="address" onchange="fillInAddress()">
                                        <!--                                            <option value=""></option>-->
                                        <%for (Address ad : deliveryAddress) {
                                        %>

                                        <option value="<%= ad.getAddressID()%>" data-receivername="<%=ad.getReceiverName()%>" data-receiverhp="<%=ad.getReceiverHP()%>" data-address-detail="<%=ad.getAddr_Details()%>" data-town="<%=ad.getTown()%>" data-zipcode="<%=ad.getZipcode()%>" data-state="<%=ad.getAddr_State()%>"><%= ad.getAddressID()%>, <%= ad.getReceiverName()%>, <%= ad.getReceiverHP()%>, <%= ad.getAddr_Details()%>, <%= ad.getZipcode()%>, <%= ad.getTown()%>, <%= ad.getAddr_State()%></option>

                                        <% }

                                        %>
                                    </select>

                                    <!--                     addresss             <>-->
                                    <div class="row check-out">
                                        <!--                                        <div class="form-group col-md-6 col-sm-6 col-xs-12">
                                                                                    <div class="field-label">First Name</div>
                                                                                    <input type="text" name="field-name" value="" placeholder="">
                                                                                </div>-->
                                        <div class="form-group col-md-12 col-sm-12 col-xs-12">
                                            <div class="field-label">Receiver Name</div>
                                            <input type="text" id="name"  name="name" value=""  required placeholder="">
                                        </div>
                                        <div class="form-group col-md-12 col-sm-12 col-xs-12">
                                            <div class="field-label">Receiver Phone</div>
                                            <input type="text" id="phone" name="phone" value="" required placeholder="">
                                        </div>
                                        <!--                                        <div class="form-group col-md-6 col-sm-6 col-xs-12">
                                                                                    <div class="field-label">Email Address</div>
                                                                                    <input type="text" name="field-name" value="" placeholder="">
                                                                                </div>-->
                                        <!--                                        <div class="form-group col-md-12 col-sm-12 col-xs-12">
                                                                                    <div class="field-label">Country</div>
                                                                                    <select>
                                                                                        <option>India</option>
                                                                                        <option>South Africa</option>
                                                                                        <option>United State</option>
                                                                                        <option>Australia</option>
                                                                                    </select>
                                                                                </div>-->
                                        <div class="form-group col-md-12 col-sm-12 col-xs-12">
                                            <div class="field-label">Address</div>
                                            <input type="text" id="addressdetail" name="addressdetail" value="" required placeholder="Street address">
                                        </div>
                                        <div class="form-group col-md-12 col-sm-12 col-xs-12">
                                            <div class="field-label">Town</div>
                                            <input type="text" id="town" name="town" value="" required placeholder="">
                                        </div>
                                        <div class="form-group col-md-12 col-sm-6 col-xs-12">
                                            <div class="field-label">State</div>
                                            <input type="text" id="state" name="state" value="" required placeholder="">
                                        </div>
                                        <div class="form-group col-md-12 col-sm-6 col-xs-12">
                                            <div class="field-label">Postal Code</div>
                                            <input type="text" id="zipcode"  name="zipcode" required value="" placeholder="">
                                        </div>

                                    </div>


                                    <!--                     addresss             <>-->
                                </div>
                                <div class="col-lg-6 col-sm-12 col-xs-12">
                                    <div class="checkout-details">
                                        <div class="order-box">
                                            <div class="title-box">
                                                <div>Product <span>Total</span></div>
                                            </div>
                                            <%for (CartDetail cd : cartProductList) {
                                            %>
                                            <ul class="qty">

                                                <input type="hidden" name="id" class="form-control input-number"
                                                       value="<%= cd.getprodID()%>" >

                                                <%
                                                    String prodname = cd.getProduct().getProdName();
                                                    String prodname2 = "";
                                                    if (prodname.length() >= 20) {
                                                        prodname2 = prodname.substring(0, 20) + ".......";

                                                    } else {
                                                        prodname2 = prodname;
                                                    }


                                                %>

                                                <!--                                                <li>Pink Slim Shirt × 1 <span>$25.10</span></li>-->
                                                <li><%=prodname2%> × <%=cd.getcartDetailQty()%> <span>RM<%=cd.getProduct().getsingleProductTotalPrice()%></span></li>
                                            </ul>

                                            <% }
                                            %>
                                            <ul class="sub-total">
                                                <li>Subtotal <span class="count">RM${ (total>0)?total:0}</span></li>
                                                <input type="hidden" name="totalprice" class="form-control input-number"
                                                       value="${ (total>0)?total:0}" >
                                                <li>Shipping (Free Shipping Above RM200) <span class="count">RM${ (total >= 200.0)? 0.0 : 25.0}</span></li>
                                                <input type="hidden" name="shippingfee" class="form-control input-number"
                                                       value="${ (total >= 200.0)? 0.0 : 25.0}" >
                                                <!--                                                <li>Shipping
                                                                                                    <div class="shipping">
                                                                                                        <div class="shopping-option">
                                                                                                            <input type="checkbox" name="free-shipping" id="free-shipping">
                                                                                                            <label for="free-shipping">Free Shipping</label>
                                                                                                        </div>
                                                                                                        <div class="shopping-option">
                                                                                                            <input type="checkbox" name="local-pickup" id="local-pickup">
                                                                                                            <label for="local-pickup">Local Pickup</label>
                                                                                                        </div>
                                                                                                    </div>
                                                                                                </li>-->
                                            </ul>
                                            <ul class="total">
                                                <li>Total <span class="count">RM${totalPrice}</span></li>
                                                <input type="hidden" name="totalpay" class="form-control input-number"
                                                       value="${totalPrice}" >
                                            </ul>
                                        </div>
                                        <div class="payment-box">
                                            <div class="upper-box">
                                                <div class="payment-options">
                                                    <ul>
                                                        <li>
                                                            <div class="radio-option">
                                                                <input type="radio" name="payment-group" value="OnlineBanking" id="payment-1"
                                                                       checked="checked">
                                                                <label for="payment-1">Online Banking<span
                                                                        class="small-text">Please send a check to Store
                                                                        Name, Store Street, Store Town, Store State /
                                                                        County, Store Postcode.</span></label>
                                                            </div>
                                                        </li>
                                                        <li>
                                                            <div class="radio-option">
                                                                <input type="radio" name="payment-group" value="Tngo" id="payment-2">
                                                                <label for="payment-2">Tngo E-Wallet<span
                                                                        class="small-text">Please send a check to Store
                                                                        Name, Store Street, Store Town, Store State /
                                                                        County, Store Postcode.</span></label>
                                                            </div>
                                                        </li>
                                                        <li>
                                                            <div class="radio-option paypal">
                                                                <input type="radio" name="payment-group" value="card" id="payment-3">
                                                                <label for="payment-3">Debit Card / Credit Card<span class="image"><img
                                                                            src="../../../assets/images/paypal.png"
                                                                            alt=""></span></label>
                                                            </div>
                                                        </li>
                                                    </ul>
                                                </div>
                                            </div>
                                            <div class="text-end"><button class="btn-solid btn">Place Order</button></div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </section>
        <!-- section end -->


        <!-- tap to top end -->
        <!-- footer start -->
        <jsp:include page="../cust.Footer.jsp"/>
        <!-- footer end -->

        <!-- latest jquery-->

        <script>
            document.addEventListener("DOMContentLoaded", function (event) {
                var select = document.getElementById("address");
                if (select.options.length > 0) {
                    select.options[0].selected = true;
                    fillInAddress();
                }
            });

            function fillInAddress() {
                var select = document.getElementById("address");
                var option = select.options[select.selectedIndex];

                document.getElementById("name").value = option.getAttribute("data-receivername");
                document.getElementById("phone").value = option.getAttribute("data-receiverhp");
                document.getElementById("addressdetail").value = option.getAttribute("data-address-detail");
                document.getElementById("town").value = option.getAttribute("data-town");
                document.getElementById("state").value = option.getAttribute("data-state");
                document.getElementById("zipcode").value = option.getAttribute("data-zipcode");

            }

        </script>

        <script src="../../../assets/js/jquery-3.3.1.min.js"></script>

        <!-- menu js-->
        <script src="../../../assets/js/menu.js"></script>

        <!-- lazyload js-->
        <script src="../../../assets/js/lazysizes.min.js"></script>

        <!-- slick js-->
        <script src="../../../assets/js/slick.js"></script>

        <!-- Bootstrap js-->
        <script src="../../../assets/js/bootstrap.bundle.min.js"></script>

        <!-- Bootstrap Notification js-->
        <script src="../../../assets/js/bootstrap-notify.min.js"></script>

        <!-- Theme js-->
        <script src="../../../assets/js/theme-setting.js"></script>
        <script src="../../../assets/js/script.js"></script>
    </body>
</html>
