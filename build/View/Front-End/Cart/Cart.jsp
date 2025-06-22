<%-- 
    Document   : Cart
    Created on : Apr 12, 2023, 5:56:05 PM
    Author     : Asus
--%>



<%@page import="java.util.*"%>
<%@page import="java.util.Base64"%>
<%@page import="Domain.*"%>
<%@page import="DataAccess.*"%>
<%--<%@page import="java.text.DecimalFormat"%>--%>

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
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" />
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
        <!-- Theme css -->
        <link rel="stylesheet" type="text/css" href="../../../assets/css/style.css">
        <link rel="stylesheet" type="text/css" href="../../../assets/commonResources/sweetalert.min.css">
        <style type="text/css">

            /*            .table tbody td{
                            vertical-align: middle;
                        }*/
            .btn-incre, .btn-decre{
                box-shadow: none;
                font-size: 25px;
            }
        </style>
    </head>

    <body class="theme-color-1">
        <jsp:include page="../cust.Header_Log.jsp"/>
        <%
//            DecimalFormat dcf = new DecimalFormat("#.##");
            Customer c = (Customer) session.getAttribute("customerLogin");

            DACartDetail dacd = new DACartDetail();
            ArrayList<CartDetail> cartProductList = dacd.getAllCartProductByCustID(c.getCustID());

            double total = dacd.getTotalCartPrice(cartProductList);
            double shippingPrice = (total >= 200.0) ? 0.0 : 25.0;
            double totalPrice = Math.round((total+shippingPrice) * 100.0) / 100.0;
            request.setAttribute("total", total);
            request.setAttribute("shippingPrice", shippingPrice);
            request.setAttribute("totalPrice", totalPrice);

//            ArrayList<Cart> cart_list = (ArrayList<Cart>) session.getAttribute("cart-list");
//            ArrayList<Cart> cartProduct = null;
//
//            if (cart_list != null) {
//                DAProductList pDao = new DAProductList();
//                cartProduct = pDao.getCartProducts(cart_list);
//                double total = pDao.getTotalCartPrice(cart_list);
//
//                request.setAttribute("cart_list", cart_list);
//                request.setAttribute("total", total);
//            }
        %>

        <%        %>



        <!-- breadcrumb start -->
        <div class="breadcrumb-section">
            <div class="container">
                <div class="row">
                    <div class="col-sm-6">
                        <div class="page-title">
                            <h2>cart</h2>
                        </div>
                    </div>
                    <div class="col-sm-6">
                        <nav aria-label="breadcrumb" class="theme-breadcrumb">
                            <ol class="breadcrumb">
                                <li class="breadcrumb-item"><a href="../homepage/homepage.jsp">Home</a></li>
                                <li class="breadcrumb-item active">cart</li>
                            </ol>
                        </nav>
                    </div>
                </div>
            </div>
        </div>
        <!-- breadcrumb End -->


        <!--section start-->
        <section class="cart-section section-b-space">
            <div class="container">
                <div class="row">
                    
                    <div class="col-sm-12 table-responsive-xs">
                        <table class="table cart-table">
                            <thead>
                                <tr class="table-head">
                                    <th scope="col">image</th>
                                    <th scope="col">product name</th>
                                    <th scope="col">price</th>
                                    <th scope="col">quantity</th>
                                    <th scope="col">action</th>
                                    <th scope="col">total</th>
                                </tr>
                            </thead>
                            <tbody>
                                <%for (CartDetail cd : cartProductList) {
                                %>
                                <tr>
                                    <td>
                                        <a href="#"><img src="data:image/jpeg;base64,<%= Base64.getEncoder().encodeToString(cd.getProductImage().getGetImg())%>" alt=""></a>
                                    </td>
                                    <td><%=cd.getProduct().getProdName()%>

                                        <!--                                    <td><a href="#">cotton shirt</a>-->
                                        <!--                                        <div class="mobile-cart-content row">
                                                                                    <div class="col">
                                                                                        <div class="qty-box">
                                                                                            <div class="input-group">
                                                                                                <input type="text" name="quantity" class="form-control input-number"
                                                                                                       value="1">
                                                                                            </div>
                                                                                        </div>
                                                                                    </div>
                                                                                    <div class="col">
                                                                                        <h2 class="td-color">$63.00</h2>
                                                                                    </div>
                                                                                    <div class="col">
                                                                                        <h2 class="td-color"><a href="#" class="icon"><i class="ti-close"></i></a>
                                                                                        </h2>
                                                                                    </div>
                                                                                </div>-->
                                    </td>
                                    <td>
                                        <h2><%= cd.getProduct().getProd_FinalPrice()%></h2>

                                    </td>
                                    <td>
                                        <div class="qty-box">
                                            <div class="input-group">
                                                <form action="" method="post" class="form-inline">
                                                    <input type="hidden" name="id" class="form-control input-number"
                                                           value="<%= cd.getprodID()%>" >
                                                    <input type="hidden" name="cartdetailid" class="form-control input-number"
                                                           value="<%= cd.getcartDetailID()%>" >
                                                    <a class="btn bnt-sm btn-incre" href="${pageContext.servletContext.contextPath}/QuantityIncDes?action=inc&cartdetailid=<%=cd.getcartDetailID()%>"><i class="fas fa-plus-square"></i></a> 
                                                    <input type="number" name="quantity" min="1" class="form-control input-number"
                                                           value="<%=cd.getcartDetailQty()%>" readonly>
                                                    <a class="btn bnt-sm btn-decre" href="${pageContext.servletContext.contextPath}/QuantityIncDes?action=dec&cartdetailid=<%=cd.getcartDetailID()%>"><i class="fas fa-minus-square"></i></a> 
                                                </form>
                                            </div>
                                        </div>
                                    </td>
                                    <td><a href="${pageContext.servletContext.contextPath}/RemoveFromCart?cartdetailid=<%=cd.getcartDetailID()%>" class="icon"><i class="ti-close"></i></a></td>
                                    <td>
                                        <h2 class="td-color">RM<%=cd.getProduct().getsingleProductTotalPrice()%></h2>
                                    </td>
                                </tr>

                                <% }

                                %>
                            </tbody>

                        </table>
                        <div class="table-responsive-md">
                            <table class="table cart-table ">
                                <tfoot>
                                    <tr>
                                        <td>total price :</td>
                                        <td>

                                            <h2>RM${ (total>0)?total:0}</h2>
                                            <input type="hidden" name="totalprice" class="form-control input-number"
                                                   value="${ (total>0)?total:0}" >
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>Shipping Fee :</td>
                                        <td>

                                            <h2>RM${ (total >= 200.0)? 0.0 : 25.0}</h2>
                                            <input type="hidden" name="shippingfee" class="form-control input-number"
                                                   value="${ (total >= 200.0)? 0.0 : 25.0}" >
                                        </td>
                                    </tr>


                                    <tr>
                                        <td>Total Pay :</td>
                                        <td>

                                            <h2>RM${totalPrice}</h2>
                                            <input type="hidden" name="totalpay" class="form-control input-number"
                                                   value="${totalPrice}" >

                                        </td>
                                    </tr>
                                    <tr> 

                                    </tr> 
                                </tfoot>
                            </table>
                        </div>
                    </div>
                </div>
                <div class="row cart-buttons">                        
                    <div class="col-6"><a href="<%=request.getContextPath()%>/View/Front-End/homepage/homepage.jsp" class="btn btn-solid">continue shopping</a></div>

                    <%if (!cartProductList.isEmpty()) {%>

                    <div class="col-6"><a href="#" onclick="checkQty(event)" class="btn btn-solid">check out</a></div>

                    <%}else{%>
                    <div class="col-6"></div>

<%}%>
                </div>
            </div>
        </section>
        <!--section end-->
        <!-- footer start -->
        <jsp:include page="../cust.Footer.jsp"/>
        <!-- footer end -->







        <!-- tap to top start -->


        <!-- latest jquery-->
        <script src="../../../assets/js/jquery-3.3.1.min.js"></script>

        <!-- menu js-->
        <script src="../../../assets/js/menu.js"></script>

        <!-- lazyload js-->
        <script src="../../../assets/js/lazysizes.min.js"></script>

        <!-- timer js-->
        <script src="../../../assets/js/timer1.js"></script>

        <!-- slick js-->
        <script src="../../../assets/js/slick.js"></script>

        <!-- Bootstrap js-->
        <script src="../../../assets/js/bootstrap.bundle.min.js"></script>

        <!-- Bootstrap Notification js-->
        <script src="../../../assets/js/bootstrap-notify.min.js"></script>

        <!-- Theme js-->
        <script src="../../../assets/js/theme-setting.js"></script>
        <script src="../../../assets/js/script.js"></script>

        <script src="https://code.jquery.com/jquery-3.5.1.js" defer></script>
        <script src="../../../assets/commonResources/sweetalert.min.js"></script>


        <script>
                        function openSearch() {
                            document.getElementById("search-overlay").style.display = "block";
                        }

                        function closeSearch() {
                            document.getElementById("search-overlay").style.display = "none";
                        }

                        function checkQty(event) {

                            event.preventDefault();
                            $.ajax({
                                type: "POST",
                                url: "/innisfree_1/checkQuantity", // Replace with your servlet URL
                                contentType: "application/json; charset=utf-8",
                                success: function (response) {
                                    console.log(response);
                                    if (response.exceed) {

                                        // Handle success response from servlet
                                        Swal.fire({
                                            icon: 'error',
                                            title: 'Not available quantity',
                                            text: response.qty,
                                            confirmButtonColor: '#548c5e',
                                            confirmButtonText: 'Continue',

                                        }).then((result) => {
                                            /* Read more about isConfirmed, isDenied below */
                                            if (result.isConfirmed) {
                                                window.location.reload();
                                            }
                                        })


                                    } else {

                                        window.location.href = '<%=request.getContextPath()%>/View/Front-End/Cart/checkout.jsp';


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
