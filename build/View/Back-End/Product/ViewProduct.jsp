<%-- 
    Document   : EditProduct
    Created on : Apr 26, 2023, 7:53:53 PM
    Author     : Rex Lim
--%>

<%@page import="java.sql.Blob"%>
<%@page import="java.util.Base64"%>
<%@page import="Domain.ProductImage"%>
<%@page import="DataAccess.DAProductImage"%>
<%@page import="Domain.Product"%>
<%@page import="DataAccess.DAProduct"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Domain.ProductCategory"%>
<%@page import="DataAccess.DAProductCategory"%>
<!DOCTYPE html>
<html>
    <head>

        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta name="description"
              content="Multikart admin is super flexible, powerful, clean &amp; modern responsive bootstrap 4 admin template with unlimited possibilities.">
        <meta name="keywords"
              content="admin template, Multikart admin template, dashboard template, flat admin template, responsive admin template, web app">
        <meta name="author" content="pixelstrap">
        <link rel="icon" href="../../../assets/images/favicon/3.png" type="image/x-icon">
        <title>Innisfree | Admin Panel</title>


        <!--        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/5.2.0/css/bootstrap.min.css"/>-->

        <!-- Google font-->
        <link rel="stylesheet"
              href="https://fonts.googleapis.com/css2?family=Work+Sans:ital,wght@0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,500;1,600;1,700;1,800;1,900&display=swap">

        <link rel="stylesheet"
              href="https://fonts.googleapis.com/css2?family=Nunito:ital,wght@0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,300;1,400;1,500;1,600;1,700;1,800;1,900&display=swap">


        <!-- Font Awesome-->
        <link rel="stylesheet" type="text/css" href="../assets/css/vendors/font-awesome.css">

        <!-- Flag icon-->
        <link rel="stylesheet" type="text/css" href="../assets/css/vendors/flag-icon.css">

        <!-- Liner icon -->
        <link rel="stylesheet" href="https://cdn.linearicons.com/free/1.0.0/icon-font.min.css">

        <!-- DataTables -->
        <!--        <link rel="stylesheet" href="https://cdn.datatables.net/1.13.4/css/jquery.dataTables.css" />-->


        <!-- Bootstrap css-->
        <link rel="stylesheet" type="text/css" href="../assets/css/vendors/bootstrap.css">

        <!-- App css-->
        <link rel="stylesheet" type="text/css" href="../assets/css/style.css">



        <!--Sweet Alert css-->
        <link rel="stylesheet" type="text/css" href="../../../assets/commonResources/sweetalert.min.css"/>


        <style>
            #photoZoom{
                transition: transform 0.3s ease;

            }
            #photoZoom:hover{

                transform: scale(1.5);
            }

        </style>

    </head>
    <body>

        <%
            int prodID2 = Integer.parseInt(request.getParameter("prodID"));

            DAProductCategory pcDA = new DAProductCategory();
            ArrayList<ProductCategory> productCategoryList = pcDA.getAllProductsCategory();

            DAProduct prodDA = new DAProduct();
            Product prod = prodDA.getProductById(prodID2);

            DAProductImage piDA = new DAProductImage();
            ArrayList<ProductImage> pi = piDA.getProductImgById(prodID2);

        %>


        <div class="page-wrapper">


            <!-- Page Header Ends -->
            <%@include file="../header.jsp"%>
            <!-- Page Body Start-->
            <div class="page-body-wrapper">

                <!-- Page Sidebar Start-->
                <%@include file="../sidebar.jsp"%>
                <!-- Right sidebar Ends-->



                <div class="page-body">
                    <!-- Container-fluid starts-->
                    <div class="container-fluid">
                        <div class="page-header">
                            <div class="row">
                                <div class="col-lg-6">
                                    <div class="page-header-left">
                                        <h3>View Products
                                            <small>Innisfree Admin panel</small>
                                        </h3>
                                    </div>
                                </div>
                                <div class="col-lg-6">
                                    <ol class="breadcrumb pull-right">
                                        <li class="breadcrumb-item">
                                            <a href="../Dashboard/Dashboard.jsp">
                                                <i data-feather="home"></i>
                                            </a>
                                        </li>

                                        <li class="breadcrumb-item active">View Product</li>
                                    </ol>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- Container-fluid Ends-->

                    <!-- Container-fluid starts-->
                    <div class="container-fluid">
                        <div class="row">
                            <div class="col-sm-12">
                                <div class="card">
                                    <form class="needs-validation add-product-form" action="" id="viewProductForm" name="viewProductForm" >

                                        <div class="card-body">
                                            <div class="row product-adding">
                                                <div class="col-xl-5">
                                                    <div class="add-product">
                                                        <div class="row">
                                                            <div class="col-xl-9 xl-50 col-sm-6 col-9">
                                                                <div style="border:1px solid black; height: 475px; width: 350px; background: rgba(221,221,221,255);">
                                                                    <h3 style="margin-left: 35%; margin-top: 50%" id="noImage">No Image</h3>
                                                                    <img src="" id="photoZoom" alt=""
                                                                         class="img-fluid image_zoom_1 blur-up lazyloaded"style="display: none;max-height: 475px; aspect-ratio:9/16;">
                                                                </div>
                                                                <br/>
                                                                <br/>
                                                                <br/>
                                                                <br/>
                                                                <br/>
                                                                <br/>
                                                                <div style="display: flex;">

                                                                    <%                                                                        int count = 0;
                                                                        byte[] arr1 = null;
                                                                        byte[] arr2 = null;
                                                                        int imgID1 = 0;
                                                                        int imgID2 = 0;
                                                                        for (ProductImage pi2 : pi) {
                                                                            if (count == 0) {
                                                                                arr1 = pi2.getGetImg();
                                                                                imgID1 = pi2.getProdImgID();
                                                                            } else if (count == 1) {
                                                                                arr2 = pi2.getGetImg();
                                                                                imgID2 = pi2.getProdImgID();
                                                                            }
                                                                            count++;
                                                                        }%>


                                                                    <div style="position: relative;">

                                                                        <img src="data:image/jpeg;base64,<%= Base64.getEncoder().encodeToString(arr1)%>" alt="" name="prodImg1-preview" id="prodImg1-preview" style="width: 80px; height: auto;" onclick="showPreview(this)"/>

                                                                    </div>
                                                                    <span style="width:20px;"></span>
                                                                    <div style="position: relative;">
                                                                        <img src="data:image/jpeg;base64,<%= Base64.getEncoder().encodeToString(arr2)%>" alt="" name="prodImg2-preview" id="prodImg2-preview" style="width: 80px; height: auto;" onclick="showPreview(this)"/>

                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <div class="col-xl-3 xl-50 col-sm-6 col-3">
                                                                <ul class="file-upload-product">
                                                                    <li>
                                                                        <div class="box-input-file">
                                                                            <%
                                                                                byte[] imageBytes = arr1;

                                                                                // Convert the byte array into a Base64 encoded string
                                                                                String url1 = Base64.getEncoder().encodeToString(imageBytes);
                                                                            %>
                                                                            <input class="upload" type="file" accept="image/png, image/jpeg" name="prodImg1" value="<%=url1%>" id="prodImg1" onchange="previewImage(this)" disabled>  
                                                                            <% if (url1 != null && !url1.equals("")) {%>
                                                                            <script>
                                                                                document.getElementById('prodImg1').defaultValue = '<%=url1%>';
                                                                            </script>
                                                                            <% }%>
                                                                            <i class="fa fa-plus" id="prodImg1-addButton"></i>
                                                                            <i class="fa fa-times" id="prodImg1-crossButton" style="display: none;"></i>
                                                                        </div>
                                                                    </li>
                                                                    <input type="hidden" id="prodImgID1" name="prodImgID1" value="<%=imgID1%>">

                                                                    <li><h6>Image 1</h6></li>
                                                                    <li>
                                                                        <div class="box-input-file">
                                                                            <%
                                                                                byte[] imageBytes2 = arr1;

                                                                                // Convert the byte array into a Base64 encoded string
                                                                                String url2 = Base64.getEncoder().encodeToString(imageBytes2);
                                                                            %>


                                                                            <input class="upload" type="file" accept="image/png, image/jpeg" name="prodImg2" value="<%=url2%>" id="prodImg2" onchange="previewImage(this)" disabled>
                                                                            <i class="fa fa-plus" id="prodImg2-addButton"></i>
                                                                            <i class="fa fa-times" id="prodImg2-crossButton" style="display: none;"></i>
                                                                        </div>
                                                                    </li>
                                                                    <input type="hidden" id="prodImgID2" name="prodImgID2" value="<%=imgID2%>">

                                                                    <li><h6>Image 2</h6></li>

                                                                </ul>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col-xl-7">
                                                    <div class="form">
                                                        <div class="form-group row">
                                                            <label for="exampleFormControlSelect1"
                                                                   class="col-xl-3 col-sm-4 mb-0">Product Category :</label>
                                                            <div class="col-xl-8 col-sm-7">
                                                                <select class="form-control digits"
                                                                        id="prodCatInNP" name="prodCatInNP" disabled>

                                                                    <% for (ProductCategory pc : productCategoryList) {%>
                                                                    <option value="<%= pc.getProdCatID()%>" <% if (pc.getProdCatID() == prod.getProdCatID()) { %>selected<% }%>>
                                                                        <%= pc.getProdCatName()%>
                                                                    </option>
                                                                    <% }%>
                                                                </select>
                                                            </div>
                                                        </div>

                                                        <input type="hidden" id="prodID" name="prodID" value="<%=prodID2%>"/>
                                                        <input type="hidden" id="useDDAImg1" name="useDDAImg1" value="1"/>
                                                        <input type="hidden" id="useDDAImg2" name="useDDAImg2" value="1"/>

                                                        <div class="form-group mb-3 row">
                                                            <label for="validationCustom01"
                                                                   class="col-xl-3 col-sm-4 mb-0">Product Name :</label>
                                                            <div class="col-xl-8 col-sm-7">
                                                                <input class="form-control" id="prodName" name="prodName"
                                                                       type="text" disabled placeholder="Enter the product name..." value="<%=prod.getProdName()%>">
                                                            </div>
                                                            <!-- <div class="valid-feedback">Looks good!</div> -->
                                                        </div>
                                                        <div class="form-group mb-3 row">
                                                            <label class="col-xl-3 col-sm-4">Description :</label>
                                                            <div class="col-xl-8 col-sm-5">
                                                                <textarea disabled style="margin-left: -2px; resize: none; padding: 10px" placeholder="Enter the product description..." id="prodDesc" name="prodDesc"cols="53" rows="3"><%=prod.getProdDesc()%></textarea>
                                                            </div>
                                                        </div>
                                                        <div class="form-group mb-3 row">
                                                            <label class="col-xl-3 col-sm-4">Instructions :</label>
                                                            <div class="col-xl-8 col-sm-5">
                                                                <textarea disabled="" style="margin-left: -2px; resize: none; padding: 10px" placeholder="Enter the product ingredients..." id="prodManual" name="prodManual"cols="53" rows="3"><%=prod.getProdManual()%></textarea>
                                                            </div>
                                                        </div>
                                                        <div class="form-group mb-3 row">
                                                            <label class="col-xl-3 col-sm-4">Ingredients :</label>
                                                            <div class="col-xl-8 col-sm-5">
                                                                <textarea disabled="" style="margin-left: -2px; resize: none; padding: 10px" placeholder="Enter the product ingredients..." id="prodIngredients" name="prodIngredients"cols="53" rows="3"><%=prod.getProdIngredients()%></textarea>
                                                            </div>
                                                        </div>

                                                        <div class="form-group row">
                                                            <label class="col-xl-3 col-sm-4 mb-0">Total Products :</label>
                                                            <fieldset class="qty-box col-xl-9 col-xl-8 col-sm-7">
                                                                <div class="input-group">
                                                                    <input class="touchspin" type="text" value="<%=prod.getProdAvailable_Qty()%>" onkeypress="return onlyNumberKey(event)" id="prodAvailable_Qty" name="prodAvailable_Qty" disabled>
                                                                </div>
                                                            </fieldset>
                                                        </div>

                                                        <div class="form-group mb-3 row">
                                                            <label for="validationCustom02"
                                                                   class="col-xl-3 col-sm-4 mb-0">Original Price(RM) :</label>
                                                            <div class="col-xl-8 col-sm-7">
                                                                <input class="form-control" value="<%=prod.getProd_OriPrice()%>"
                                                                       disabled type=number step=0.01 min="0" id="prod_OriPrice" name="prod_OriPrice" onchange="countPrice()">
                                                            </div>
                                                            <!-- <div class="valid-feedback">Looks good!</div> -->
                                                        </div>
                                                        <div class="form-group mb-3 row">
                                                            <label for="validationCustom02"
                                                                   class="col-xl-3 col-sm-4 mb-0">Discount Percentage(%) :</label>
                                                            <div class="col-xl-8 col-sm-7">
                                                                <input class="form-control"
                                                                       type="number" disabled step="1" min="0" max="70" value="<%=prod.getDiscount()%>" id="discount" name="discount" onchange="countPrice()">
                                                            </div>
                                                            <!-- <div class="valid-feedback">Looks good!</div> -->
                                                        </div>
                                                        <div class="form-group mb-3 row">
                                                            <label for="validationCustom02"
                                                                   class="col-xl-3 col-sm-4 mb-0">Sell Price(RM) :</label>
                                                            <div class="col-xl-8 col-sm-7">
                                                                <input class="form-control" 
                                                                       type="text" disabled value="<%=prod.getProd_FinalPrice()%>" id="prod_FinalPrice" name="prod_FinalPrice">
                                                            </div>
                                                            <!-- <div class="valid-feedback">Looks good!</div> -->
                                                        </div>


                                                        <div class="form-group mb-3 row">
                                                            <label for="validationCustom02"
                                                                   class="col-xl-3 col-sm-4 mb-0">Status :</label>
                                                            <div class="col-xl-8 col-sm-7">
                                                                <input type="radio" id="prod_Status" name="prod_Status" value="Active"  <% if ("Active".equals(prod.getProd_Status())) { %>checked<% } %> disabled style="margin-left: 80px;  visibility: visible; opacity: 1;">
                                                                <label for="validationCustom02" class="mb-1">Active</label>
                                                                <input type="radio" id="prod_Status" name="prod_Status" value="Deactive" <% if ("Deactive".equals(prod.getProd_Status())) { %>checked<% }%> disabled style="margin-left: 80px;  visibility: visible; opacity: 1;">
                                                                <label for="validationCustom02" class="mb-1">Deactive</label>
                                                            </div>
                                                            <!-- <div class="valid-feedback">Looks good!</div> -->
                                                        </div>

                                                        <div class="form-group row" style="margin-left: -30%">

                                                            <div class="offset-xl-3 offset-sm-4 mt-4" >
                                                                <!--                                                                <br/>                                                               <br/>-->
                                                                <button type="button" class="btn btn-primary" onclick="window.location = 'CurrentProduct.jsp'" style="width: 600px; border-radius: 25px;" >Back to Previous</button>


                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- Container-fluid Ends-->
                </div>
                <h1 id="message"></h1>
                <!-- footer start-->
                <footer class="footer">
                    <div class="container-fluid">
                        <div class="row">
                            <div class="col-md-6 footer-copyright text-start">
                                <p class="mb-0">Copyright 2019 © Multikart All rights reserved.</p>
                            </div>
                            <div class="col-md-6 pull-right text-end">
                                <p class=" mb-0">Hand crafted & made with<i class="fa fa-heart"></i></p>
                            </div>
                        </div>
                    </div>
                </footer>
                <!-- footer end-->
            </div>
        </div>



        <!-- latest jquery-->
        <script src="../assets/js/jquery-3.3.1.min.js"></script>

        <!-- Bootstrap js-->
        <script src="../assets/js/bootstrap.bundle.min.js"></script>

        <!-- feather icon js-->
        <script src="../assets/js/icons/feather-icon/feather.min.js"></script>
        <script src="../assets/js/icons/feather-icon/feather-icon.js"></script>

        <!-- Sidebar jquery-->
        <script src="../assets/js/sidebar-menu.js"></script>

        <!-- touchspin js-->
        <script src="../assets/js/touchspin/vendors.min.js"></script>
        <script src="../assets/js/touchspin/touchspin.js"></script>
        <script src="../assets/js/touchspin/input-groups.min.js"></script>

        <!-- form validation js-->
        <script src="../assets/js/dashboard/form-validation-custom.js"></script>

        <!-- ckeditor js-->
        <script src="../assets/js/editor/ckeditor/ckeditor.js"></script>
        <script src="../assets/js/editor/ckeditor/ckeditor.custom.js"></script>

        <!-- Zoom js-->
        <script src="../assets/js/jquery.elevatezoom.js"></script>
        <script src="../assets/js/zoom-scripts.js"></script>

        <!--Customizer admin-->
        <script src="../assets/js/admin-customizer.js"></script>

        <!-- lazyload js-->
        <script src="../assets/js/lazysizes.min.js"></script>

        <!--right sidebar js-->
        <script src="../assets/js/chat-menu.js"></script>

        <!--script admin-->
        <script src="../assets/js/admin-script.js"></script>

        <!--Sweet Alert Js-->
        <script src="../../../assets/commonResources/sweetalert.min.js"></script>



        <script>
                                                                    // This function is called when the user selects an image file
                                                                    function previewImage(input) {
                                                                        // Get the ID of the input element that was changed
                                                                        var inputId = $(input).attr('id');

                                                                        // Check if the input element has a file selected
                                                                        if (input.files && input.files[0]) {
                                                                            // Create a FileReader object to read the contents of the selected file
                                                                            var reader = new FileReader();

                                                                            // When the FileReader finishes reading the file, update the image preview
                                                                            reader.onload = function (e) {
                                                                                // Set the source of the image preview to the data URL of the selected file
                                                                                $('#' + inputId + '-preview').attr('src', e.target.result);

                                                                                // Show the image preview element
                                                                                $('#' + inputId + '-preview').show();

                                                                                //Hide the add button
                                                                                $('#' + inputId + '-addButton').hide();

                                                                                //Show the cross the button
                                                                                $('#' + inputId + '-crossButton').show();



                                                                                // Show the "Clear Image" button
                                                                                $('#' + inputId + '-clear').show();
                                                                            }

                                                                            // Start reading the selected file as a data URL
                                                                            reader.readAsDataURL(input.files[0]);
                                                                        } else {

                                                                            clearImage(inputId);
                                                                        }
                                                                    }






                                                                    function showPreview(preview) {
                                                                        // Set the src attribute of the other image tag to the same value as the preview image
                                                                        $('#photoZoom').attr('src', $(preview).attr('src'));
                                                                        $('#photoZoom').show();
                                                                        $('#noImage').hide();


                                                                    }


        </script>
        <script>
            function changeIcon() {
                var img1 = document.getElementById("prodImg1");
                var img2 = document.getElementById("prodImg2");
                var defaultImg1Value = img1.defaultValue;
                var defaultImg2Value = img2.defaultValue;

                if (img1.value != defaultImg1Value && img2.value != defaultImg2Value) {
                    $('#prodImg1-addButton').hide();
                    $('#prodImg2-addButton').hide();
                    $('#prodImg1-crossButton').show();
                    $('#prodImg2-crossButton').show();

                } else if (img1.value != defaultImg1Value) {
                    $('#prodImg1-addButton').hide();
                    $('#prodImg1-crossButton').show();
                } else if (img2.value != defaultImg2Value) {
                    $('#prodImg2-addButton').hide();
                    $('#prodImg2-crossButton').show();

                }
            }

            window.onload = function () {
                $('#prodImg1-clear').show();
                $('#prodImg2-clear').show();
                changeIcon();
            }

        </script>


    </body>
</html>

