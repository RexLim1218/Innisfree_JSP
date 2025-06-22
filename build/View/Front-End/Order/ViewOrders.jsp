<%-- 
    Document   : ViewOrders
    Created on : 06-May-2023, 14:37:12
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
<link rel="icon" href="../../../assets/images/favicon/3.png" type="image/x-icon">
        <title>Innisfree | Make You Better</title>

        <!--Google font-->
        <link href="https://fonts.googleapis.com/css?family=Lato:300,400,700,900" rel="stylesheet">
        <link rel="preconnect" href="https://fonts.gstatic.com">
        <link href="https://fonts.googleapis.com/css2?family=Yellowtail&display=swap" rel="stylesheet">

        <!-- Icons -->
        <link rel="stylesheet" type="text/css" href="../assets/css/vendors/font-awesome.css">

        <!--Slick slider css-->
        <link rel="stylesheet" type="text/css" href="../assets/css/vendors/slick.css">
        <link rel="stylesheet" type="text/css" href="../assets/css/vendors/slick-theme.css">

        <!-- Animate icon -->
        <link rel="stylesheet" type="text/css" href="../assets/css/vendors/animate.css">

        <!-- Themify icon -->
        <link rel="stylesheet" type="text/css" href="../assets/css/vendors/themify-icons.css">

        <!-- Bootstrap css -->
        <link rel="stylesheet" type="text/css" href="../assets/css/vendors/bootstrap.css">

        <!-- Theme css -->
        <link rel="stylesheet" type="text/css" href="../assets/css/style.css">

        
    </head>
    <body>
            <body>
        <%
                 Customer c = (Customer) session.getAttribute("customerLogin");
            
         int orderrow = Integer.parseInt(request.getParameter("orderRow"));
         System.out.println(orderrow);
         
            DAOrders dao = new DAOrders();
            Orders o = dao.getOrdersByOrderrow(orderrow);
            
            
            DAOrderDetails daod = new DAOrderDetails();
            ArrayList<OrderDetails> orderDetails = daod.getAllOrderDetailsByOrderRow(orderrow);
            
            DAPayment dapay = new DAPayment();
             Payment pay = dapay.getPaymentByOrderRow(orderrow);
             
            DADeliveryStatus dads = new DADeliveryStatus();
            DeliveryStatus ds = dads.getAddressIDtByOrderRow(orderrow);
            
            AddressDA daad = new AddressDA();
            Address ad = daad.getAddressByAddressID(ds.getAddressID());
            
        %>
        <jsp:include page="../cust.Header_Log.jsp"/>
                <!-- breadcrumb start -->
        <div class="breadcrumb-section">
            <div class="container">
                <div class="row">
                    <div class="col-sm-6">
                        <div class="page-title">
                            <h2>Order Detail</h2>
                        </div>
                    </div>
                    <div class="col-sm-6">
                        <nav aria-label="breadcrumb" class="theme-breadcrumb">
                            <ol class="breadcrumb">
                                <li class="breadcrumb-item"><a href="../homepage/homepage.jsp">Home</a></li>
                                 <li class="breadcrumb-item"><a href="OrderHistory.jsp">Order History</a></li>
                                <li class="breadcrumb-item active" aria-current="page">Order Detail</li>
                            </ol>
                        </nav>
                    </div>
                </div>
            </div>
        </div>
        <!-- breadcrumb End -->
        
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
                                                                prodname2 = prodname.substring(0, 20) + ".......";

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
                                    <li>shipping (Free Shipping Above RM200)<span>RM<%=pay.getDeliveryFee() %></span></li>
                                    
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
                                        <li>Tracking No: <%=o.getTrackingno()%></li>
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
                                    <br>
                                    <h4>payment method</h4>
                                    <p><%=pay.getPaymentMethod() %></p>
                                </div>
                                <div class="col-md-12">
                                    <div class="delivery-sec">
                                       
                                      
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
