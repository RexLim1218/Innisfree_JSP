<%@page import="Domain.Employee"%>
<!--<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" integrity="sha512-sMnP4LDEixdI4LM/9OtDewqRU4VbdW4th1V5rWctWx1WvcZL5PO4EGX4lE6ieeUcL+w4M/6NqlFgbzqD7iGn7w==" crossorigin="anonymous" referrerpolicy="no-referrer" />-->
<!-- Include the Feather JavaScript file using a CDN -->
<script src="https://cdn.jsdelivr.net/npm/feather-icons/dist/feather.min.js"></script>
<!-- Add Font Awesome CSS file to your HTML code -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" integrity="sha512-D7wVdNZeA7S9z32/BiRQV5LJ6ZjFCN8syvQpI7DvStk8oZ5Pqipx7GASw6lOKAL+tejQn+gCpS02tX2r+Iq+Jw==" crossorigin="anonymous" referrerpolicy="no-referrer" />
<script src="<%=request.getContextPath()%>/assets/commonResources/sweetalert.min.js"></script>

<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/assets/commonResources/sweetalert.min.css"/>


<%
    int found = 0;
    Employee e = (Employee) session.getAttribute("EmpLogin");
    if (e.getEmpID() != 0) {

        if (e.getPosition().equals("Manager")) {
            found = 1;

        }
    } else {%>

<script>
    function loginOrNot() {
        Swal.fire({
            icon: 'error',
            title: 'Access Limited',
            text: 'Please login',
            confirmButtonColor: '#548c5e',
            confirmButtonText: 'Continue',

        }).then((result) => {
            /* Read more about isConfirmed, isDenied below */
            if (result.isConfirmed) {
                window.location.replace("UserLogin.jsp");
            }
        })

    }
    loginOrNot();

</script>

<%}%>


<div class="page-sidebar">
    <div class="main-header-left d-none d-lg-block">
        <div class="logo-wrapper">
            <a href="<%=request.getContextPath()%>/View/Back-End/Dashboard/Dashboard.jsp">
                <img class="d-none d-lg-block blur-up lazyloaded"
                     src="<%=request.getContextPath()%>/assets/images/icon/layout3/logo3.png" alt="">
            </a>
        </div>
    </div>
    <div class="sidebar custom-scrollbar">
        <a href="javascript:void(0)" class="sidebar-back d-lg-none d-block"><i class="fa fa-times"
                                                                               aria-hidden="true"></i></a>

        <ul class="sidebar-menu">
            <li>
                <a class="sidebar-header" href="${pageContext.servletContext.contextPath}/View/Back-End/Dashboard/Dashboard.jsp">
                    <i data-feather="home"></i>
                    <span>Dashboard</span>
                </a>
            </li>




            <li>
                <a class="sidebar-header" href="${pageContext.servletContext.contextPath}/View/Back-End/ProdcutCategory/ProductCategory.jsp">
                    <i data-feather="archive"></i>
                    <span>Product Category</span>
                    <!--                                        <i class="fa fa-angle-right pull-right"></i>-->
                </a>

                <!--                                    <ul class="sidebar-submenu">
                                                        <li>
                                                            <a href="${pageContext.servletContext.contextPath}/View/Back-End/ProdcutCategory/ProductCategory.jsp">
                                                                <i class="fa fa-circle"></i>
                                                                <span>Add New Category</span>
                                                            </a>
                                                        </li>
                
                                                        <li>
                                                            <a href="#">
                                                                <i class="fa fa-circle"></i>
                                                                <span>Current Category</span>
                                                            </a>
                                                        </li>
                                                    </ul>-->
            </li>

            <li>
                <a class="sidebar-header" href="javascript:void(0)">
                    <i data-feather="box"></i>
                    <span>Products</span>
                    <i class="fa fa-angle-right pull-right"></i>
                </a>

                <ul class="sidebar-submenu">
                    <li>
                        <%if (found == 1) {%>
                        <a href="${pageContext.servletContext.contextPath}/View/Back-End/Product/NewProduct.jsp">
                            <i class="fa fa-circle"></i>
                            <span>Add New Product</span>
                        </a>
                        <%}%>


                    </li>
                    <li>
                        <a href="${pageContext.servletContext.contextPath}/View/Back-End/Product/CurrentProduct.jsp">
                            <i class="fa fa-circle"></i>
                            <span>Current Product</span>
                        </a> 
                    </li>
                </ul>
            </li>


            <li>
                <a class="sidebar-header" href="${pageContext.servletContext.contextPath}/View/Back-End/Order_Delivery/CurrentOrder.jsp">
                    <i data-feather="archive"></i>
                    <span>Order</span>
                    <!--                                    <i class="fa fa-angle-right pull-right"></i>-->
                </a>

                <!--                                <ul class="sidebar-submenu">
                                                    <li>
                                                        <a href="${pageContext.servletContext.contextPath}/View/Back-End/ProdcutCategory/ProductCategory.jsp">
                                                            <i class="fa fa-circle"></i>
                                                            <span>Add New Category</span>
                                                        </a>
                                                    </li>
                
                                                    <li>
                                                        <a href="#">
                                                            <i class="fa fa-circle"></i>
                                                            <span>Current Category</span>
                                                        </a>
                                                    </li>
                                                </ul>-->
            </li>

            <%if (found == 1) {%>
            <li>
                <a class="sidebar-header" href="${pageContext.servletContext.contextPath}/View/Back-End/Sales/Sales.jsp">
                    <i data-feather="dollar-sign"></i>
                    <span>Sales</span>

                </a>

            </li>
            <%}%>

            <li>
                <a class="sidebar-header" href="${pageContext.servletContext.contextPath}/View/Back-End/Customer/CurrentCustomer.jsp">
                    <i data-feather="user-plus"></i>
                    <span>Customer</span>

                </a>

            </li>

            <%if (found == 1) {%>
            <li>
                <a class="sidebar-header" href="javascript:void(0)">
                    <i data-feather="user-plus"></i>
                    <span>Users</span>
                    <i class="fa fa-angle-right pull-right"></i>
                </a>
                <ul class="sidebar-submenu">
                    <li>
                        <a href="${pageContext.servletContext.contextPath}/View/Back-End/User/CurrentUser.jsp">
                            <i class="fa fa-circle"></i>User List
                        </a>
                    </li>
                    <%if (found == 1) {%>
                    <li>
                        <a href="${pageContext.servletContext.contextPath}/View/Back-End/User/NewUser.jsp">
                            <i class="fa fa-circle"></i>Create User
                        </a>
                    </li>
                    <%}%>
                </ul>
            </li>

            <%}%>



            <%if (found == 1) {%>

            <li>
                <a class="sidebar-header" href="javascript:void(0)">
                    <i data-feather="bar-chart"></i>
                    <span>Reports</span>
                    <i class="fa fa-angle-right pull-right"></i>
                </a>
                <ul class="sidebar-submenu">
                    <li>
                        <a href="<%=request.getContextPath()%>/View/Back-End/Report/Top5SalesReport.jsp">
                            <i class="fa fa-circle"></i>Top 5 Most Sold Report
                        </a>
                    </li>
                    <li>
                        <a href="<%=request.getContextPath()%>/View/Back-End/Report/Top5LeastSoldReport.jsp">
                            <i class="fa fa-circle"></i>Top 5 Least Sold Report
                        </a>
                    </li>
                </ul>
            </li>
            <%}%>

            <li>
                <a class="sidebar-header" href="javascript:void(0)"><i
                        data-feather="settings"></i><span>Settings</span><i
                        class="fa fa-angle-right pull-right"></i></a>
                <ul class="sidebar-submenu">
                    <li>
                        <a href="<%=request.getContextPath()%>/View/Back-End/User/EditUser.jsp?empid=<%=e.getEmpID()%>"><i class="fa fa-circle"></i>Profile
                        </a>
                    </li>
                    <li>
                        <a href="<%=request.getContextPath()%>/View/Back-End/User/passwordReset.jsp?empid=<%=e.getEmpID()%>"><i class="fa fa-circle"></i>Reset Password
                        </a>
                    </li>
                </ul>
            </li>

            <li>
                <a class="sidebar-header" href="${pageContext.servletContext.contextPath}/UserLogout">
                    <i data-feather="log-in"></i>
                    <span>Logout</span>
                </a>
            </li>
        </ul>
    </div>
</div>
<!-- Page Sidebar Ends-->

<!-- Right sidebar Start-->
