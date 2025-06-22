

<%@page import="java.util.*"%>
<%@page import="java.util.Base64"%>
<%@page import="Domain.*"%>
<%@page import="DataAccess.*"%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
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
        <link href="https://cdn.jsdelivr.net/npm/font-awesome@4.7.0/css/font-awesome.css" rel="stylesheet">

        <!--Slick slider css-->
        <link rel="stylesheet" type="text/css" href="../../../../../assets/css/vendors/slick.css">
        <link rel="stylesheet" type="text/css" href="../../../assets/css/vendors/slick-theme.css">

        <!-- Animate icon -->
        <link rel="stylesheet" type="text/css" href="../../../assets/css/vendors/animate.css">

        <!-- Themify icon -->
        <link rel="stylesheet" type="text/css" href="../../../assets/css/vendors/themify-icons.css">

        <!-- Bootstrap css -->
        <link rel="stylesheet" type="text/css" href="../../../assets/css/vendors/bootstrap.css">

        <!-- Theme css -->
        <link rel="stylesheet" type="text/css" href="../../../assets/css/style.css">
        <!-- Data Table-->
        <link rel="stylesheet" href="../../assets/commonResources/datatable.css"/>
        <link rel="stylesheet" href="../../assets/commonResources/bootstrap.min.css"/>

        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" integrity="sha512-WCHMKgNVg7ugfOZ41SKJ1qn0Wm8hN1kAIwQ7uknW7j8gQJclAAe+zQaV5Xep/MaFq8OWPdQKZCrw0rSb7hG8TQ==" crossorigin="anonymous" referrerpolicy="no-referrer" />


    </head>

    <body class="theme-color-1">

        <%
                Customer c = (Customer) session.getAttribute("customerLogin");
            int custid = c.getCustID();

            DAOrders dao = new DAOrders();
            ArrayList<Orders> OrdersList = dao.getAllOrdersByCustID(custid);

        %>

        <!-- header start -->
        <jsp:include page="../cust.Header_Log.jsp"/>

        <!-- breadcrumb start -->
        <div class="breadcrumb-section">
            <div class="container">
                <div class="row">
                    <div class="col-sm-6">
                        <div class="page-title">
                            <h2>Order History</h2>
                        </div>
                    </div>
                    <div class="col-sm-6">
                        <nav aria-label="breadcrumb" class="theme-breadcrumb">
                            <ol class="breadcrumb">
                                <li class="breadcrumb-item"><a href="../homepage/homepage.jsp">Home</a></li>
                                <li class="breadcrumb-item active" aria-current="page">Order History</li>
                            </ol>
                        </nav>
                    </div>
                </div>
            </div>
        </div>
        <!-- breadcrumb End -->


        <!-- tracking page start -->
        <!-- tracking page start -->
        <section class="tracking-page section-b-space">
            <div class="container">
                <div class="row">
                    <div class="col-sm-12">


                        <div class="order-table table-responsive-sm">
                            <table class="table mb-0 table-striped table-borderless">
                                <thead class="">
                                    <tr>
                                        <th scope="col">Order Create Date</th>
                                        <th scope="col">Order ID</th>
                                        <th scope="col">Payment Amount</th>
                                        <th scope="col">Tracking NO</th>
                                        <th scope="col">Order Status</th>
                                        <th scope="col">Delivery Status</th>

                                        <th scope="col">Action</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <%for (Orders o : OrdersList) {
                                    %>
                                    <tr>
                                        <td><%=o.getOrderCrDate()%></td>
                                        <td><%=o.getOrderNo()%></td>
                                        <td><%=o.getPayment().getPaymentAmount()%></td>
                                        <td><%=o.getTrackingno()%></td>
                                        <td><%=o.getOrder_Status()%></td>
                                        <td><%=o.getDelivery_Status().getDeliveryStatus()%></td>
                                        <td>
                                            <a href="ViewOrders.jsp?orderRow=<%=o.getOrderRow()%>" role="button"
                                               <i style="color: #C9C5DE"class="fa fa-eye fa-lg" title="View Order"></i>
                                            </a>
                                            <%
                                                if (o.getDelivery_Status().getDeliveryStatus().equals("Pending")) {
                                            %>
                                            <a onclick="cancelConfimation(<%=o.getOrderRow()%>, 'Cancelled')" id="viewBtn" class="prodCatView" role="button" style="margin-right: 10px;">

                                                <i style="color: #C9C5DE" class="fa fa-times fa-lg" title="Cancel Order"></i>
                                            </a>
                                            <%}%>
                                        </td>
                                    </tr>
                                    <% }%>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!-- tracking page end -->
        <!-- tracking page end -->
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
        <script src="../../../assets/js/script.js"></script>
        <script src="../../../assets/commonResources/loadDataTable.js" defer></script>
        <!--Sweet Alert js-->
        <script src="https://code.jquery.com/jquery-3.5.1.js" defer></script>
        <script src="../../assets/commonResources/sweetalert.min.js"></script>
        

        <script>
                                                function cancelConfimation(orderRow, cancelled) {
                                                    Swal.fire({
                                                        title: 'Are you sure?',
                                                        text: "Are you sure wanna CANCELLED this Order!",
                                                        icon: 'warning',
                                                        showCancelButton: true,
                                                        confirmButtonColor: '#548c5e',
                                                        cancelButtonColor: '#d33',
                                                        confirmButtonText: 'Yes, Cancel it!'
                                                    }).then((result) => {
                                                        if (result.isConfirmed) {
                                                            cancelOrder(orderRow, cancelled, event)
                                                        }
                                                    })
                                                }

                                                function cancelOrder(orderRow, cancelled, event) {
                                                    event.preventDefault();
                                                    var data = {
                                                        orderRow: orderRow,
                                                        cancelled: cancelled
                                                    };
                                                    var jsonData = JSON.stringify(data);

                                                    console.log(JSON.parse(jsonData));

//                    //Send JSON data to servlet using AJAX
                                                    $.ajax({
                                                        type: "POST",
                                                        url: "/innisfree_1/cancelOrder", // Replace with your servlet URL
                                                        data: jsonData,
                                                        contentType: "application/json; charset=utf-8",
                                                        dataType: "json",
                                                        success: function (response) {
                                                            console.log(JSON.parse(jsonData));
                                                            // Handle success response from servlet
                                                            Swal.fire({
                                                                icon: 'success',
                                                                title: 'Succssfully Cancel',
                                                                text: response.message,
                                                                confirmButtonColor: '#548c5e',
                                                                confirmButtonText: 'Continue',

                                                            }).then((result) => {
                                                                /* Read more about isConfirmed, isDenied below */
                                                                if (result.isConfirmed) {
                                                                    location.reload();
                                                                }
                                                            })
                                                        },
                                                        error: function (xhr, status, error) {
                                                            // Handle error response from servlet
                                                            console.log("Error sending data: " + error);
                                                            // Perform error handling as needed
                                                        }
                                                    });
                                                }
        </script>



        <script>

            function openSearch() {
                document.getElementById("search-overlay").style.display = "block";
            }

            function closeSearch() {
                document.getElementById("search-overlay").style.display = "none";
            }
        </script>

    </body>

</html>