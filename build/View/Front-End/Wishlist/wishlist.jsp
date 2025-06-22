<%-- 
    Document   : wishlist
    Created on : Apr 24, 2023, 4:17:32 PM
    Author     : yokec
--%>

<%@page import="Domain.Customer"%>
<%@page import="java.util.Base64"%>
<%@page import="Domain.ProductCategory"%>
<%@page import="DataAccess.DAProductCategory"%>
<%@page import="java.sql.*"%>
<%@page import="java.util.ArrayList"%>
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
        <link rel="icon" href="../../../assets/images/favicon/1.png" type="image/x-icon">
        <link rel="shortcut icon" href="../../../assets/images/favicon/1.png" type="image/x-icon">
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

    <body class="theme-color-1">


        <!-- header start -->
        <jsp:include page="../cust.Header_Log.jsp"/>
        <!-- header end -->


        <%
            DAProductCategory pcDA = new DAProductCategory();
            ArrayList<ProductCategory> productCategoryList = pcDA.getAllProductsCategory();
            int loginFound = 0;
            Customer c = (Customer) session.getAttribute("customerLogin");
            System.out.println(c.getCustID());

            if (c.getCustUsername() != null) {
                loginFound = 1;
            }
        %>



        <!-- breadcrumb start -->
        <div class="breadcrumb-section">
            <div class="container">
                <div class="row">
                    <div class="col-sm-6">
                        <div class="page-title">
                            <h2>wishlist</h2>
                        </div>
                    </div>
                    <div class="col-sm-6">
                        <nav aria-label="breadcrumb" class="theme-breadcrumb">
                            <ol class="breadcrumb">
                                <li class="breadcrumb-item"><a href="../homepage/homepage.jsp">Home</a></li>
                                <li class="breadcrumb-item active">wishlist</li>
                            </ol>
                        </nav>
                    </div>
                </div>
            </div>
        </div>
        <!-- breadcrumb End -->




        <!--section start-->
        <section class="wishlist-section section-b-space">
            <div class="container">
                <div class="row">
                    <div class="col-sm-12 table-responsive-xs">
                        <table class="table cart-table">
                            <thead>
                                <tr class="table-head">
                                    <th scope="col">image</th>
                                    <th scope="col">product name</th>
                                    <th scope="col">price</th>
                                    <th scope="col">availability</th>
                                    <th scope="col">action</th>
                                </tr>
                            </thead>

                            <%
                                try {
                                    PreparedStatement stmt;
                                    String sqll = "SELECT * FROM WISHITEM WHERE CUSTID = ?";
                                    stmt = conn.prepareStatement(sqll);
                                    stmt.setInt(1, c.getCustID());
                                    ResultSet rs = stmt.executeQuery();
                                    while (rs.next()) {
                                        try {
                                            int productId = rs.getInt("PRODID");
                                            String sql2 = "SELECT * FROM PRODUCTLIST WHERE PRODID = " + productId;
                                            Statement stmt2 = conn.createStatement();
                                            ResultSet rs2 = stmt2.executeQuery(sql2);
                                            while (rs2.next()) {
                                                try {
                                                    String sql3 = "SELECT PRODIMG FROM PRODIMAGE WHERE PRODID = " + productId;
                                                    Statement stmt3 = conn.createStatement();
                                                    ResultSet rs3 = stmt3.executeQuery(sql3);

                                                    Blob imageBlob = null;
                                                    if (rs3.next()) {
                                                        imageBlob = rs3.getBlob("prodimg");
                                                    }

                                                    // Convert the Blob object to a byte array
                                                    byte[] imageData = imageBlob.getBytes(1, (int) imageBlob.length());

                                                    // Encode the byte array as a Base64 string
                                                    String base64Image = Base64.getEncoder().encodeToString(imageData);
                            %>

                            <tbody>
                                <tr>
                                    <td>
                                        <a href="../ProductPage/productPage_01.jsp?prodid=<%= rs.getInt("prodid")%>">
                                            <img src="data:image/jpg;base64,<%= base64Image%>" alt="">
                                        </a>
                                    </td>
                                    <td>
                                        <a href="../ProductPage/productPage_01.jsp?prodid=<%= rs.getInt("prodid")%>"><%= rs2.getString("prodname")%></a>

                                        <div class="mobile-cart-content row">
                                            <div class="col">
                                                <%
                                                    int qty = rs2.getInt("PRODAVAILABLE_QTY");
                                                    if (qty > 0) {
                                                %>
                                                <p>in stock</p>
                                                <%
                                                } else {
                                                %>
                                                <span>OUT OF STOCK</span>
                                                <% } %>
                                            </div>
                                            <div class="col">
                                                <% String finalPrice = String.format("%.2f", rs2.getDouble("PROD_FINALPRICE"));%>
                                                <h2 class="td-color" style="font-size: large;">RM<%= finalPrice%></h2>
                                            </div>
                                            <div class="col">
                                                <h2 class="td-color">
                                                    <a href="#" class="icon me-1"><i class="ti-close"></i></a>
                                                    <a href="#" class="cart"><i class="ti-shopping-cart"></i></a>
                                                </h2>
                                            </div>
                                        </div>
                                    </td>
                                    <td>
                                        <h2 style="font-size: large;">RM<%= finalPrice%></h2>
                                    </td>
                                    <td>
                                        <%
                                            if (qty > 0) {
                                        %>
                                        <p>in stock</p>
                                        <%
                                        } else {
                                        %>
                                        <span>OUT OF STOCK</span>
                                        <% }%>
                                    </td>
                                    <td><a href="#" class="icon me-3" onclick="RemoveFromWishlist(<%= rs.getInt("prodid")%>, <%=c.getCustID()%>)"><i class="ti-close"></i></a>
                                        <a href="#" class="cart" onclick="addToCart(<%= rs.getInt("prodid")%>,<%=c.getCustID()%>, event)"><i class="ti-shopping-cart"></i></a>
                                    </td>
                                </tr>
                            </tbody>

                            <script>
                                function RemoveFromWishlist(productId, custId) {
                                    $.ajax({
                                        url: "remove-wishitem.jsp",
                                        method: "POST",
                                        data: {
                                            productId: productId,
                                            custId: custId
                                        },
                                        success: function (message) {
                                            console.log('Received message:', message);
                                            if (message.trim() === 'success') {

                                                // Handle success response from servlet
                                                Swal.fire({
                                                    icon: 'success',
                                                    title: 'Succssfully Removed',
                                                    text: 'Successfully Removed from wishlist',
                                                    confirmButtonColor: '#548c5e',
                                                    confirmButtonText: 'Continue',
                                                }).then((result) => {
                                                    /* Read more about isConfirmed, isDenied below */
                                                    if (result.isConfirmed) {
                                                        window.location.reload();
                                                    }
                                                })
                                            }
                                        },
                                        error: function () {
                                            alert("Error removing product!");
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

                            <%
                                try {
                                    String sql1 = "SELECT COUNT(*) as total FROM WISHITEM WHERE CUSTID = ?";
                                    PreparedStatement stmt;
                                    stmt = conn.prepareStatement(sql1);
                                    stmt.setInt(1, c.getCustID());
                                    ResultSet rs = stmt.executeQuery();
                                    if (rs.next()) {
                            %>

                            <tbody>
                                <tr>
                                    <td colspan="5" style="text-align: right; font-size: medium; padding-right: 90px;">Showing <%= rs.getInt("total")%> Products</td>
                                </tr>
                            </tbody>

                            <% }
                                } catch (SQLException ex) {
                                    conn.close();
                                }
                            %>

                        </table>
                    </div>
                </div>     
                <div class="row wishlist-buttons">
                    <div class="col-12">
                        <a href="../homepage/homepage.jsp" class="btn btn-solid">continue shopping</a>

                    </div>
                </div>
            </div>
        </section>
        <!--section end-->






        <!-- footer start -->
        <jsp:include page="../cust.Footer.jsp"/>
        <!-- footer end -->






        <!-- latest jquery-->
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

        <script>
                                function openSearch() {
                                    document.getElementById("search-overlay").style.display = "block";
                                }

                                function closeSearch() {
                                    document.getElementById("search-overlay").style.display = "none";
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
                                                                        window.location.replace("homepage.jsp");
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