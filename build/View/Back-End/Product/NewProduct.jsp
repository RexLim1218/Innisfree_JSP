<%-- 
    Document   : NewProduct
    Created on : Apr 4, 2023, 10:28:11 PM
    Author     : Rex Lim
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="Domain.ProductCategory"%>
<%@page import="DataAccess.DAProductCategory"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
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

            DAProductCategory pcDA = new DAProductCategory();
            ArrayList<ProductCategory> productCategoryList = pcDA.getAllActiveProductsCategory();

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
                                        <h3>Add Products
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

                                        <li class="breadcrumb-item active">Add Product</li>
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
                                    <form class="needs-validation add-product-form" action="${pageContext.servletContext.contextPath}/newProduct" id="newProductForm" name="newProductForm" method="post" enctype="multipart/form-data">

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
                                                                    <div style="position: relative;">
                                                                        <img src="" alt="" name="prodImg1-preview" id="prodImg1-preview" style="width: 80px; height: auto;" onclick="showPreview(this)"/>
                                                                        <span style="position: absolute; top: 0; right: 0; display: none; cursor: pointer;" name="prodImg1-clear" id="prodImg1-clear" onclick="clearImage('prodImg1');">&times;</span>
                                                                    </div>
                                                                    <span style="width:20px;"></span>
                                                                    <div style="position: relative;">
                                                                        <img src="" alt="" name="prodImg2-preview" id="prodImg2-preview" style="width: 80px; height: auto;" onclick="showPreview(this)"/>
                                                                        <span style="position: absolute; top: 0; right: 0; display: none; cursor: pointer;" name="prodImg2-clear" id="prodImg2-clear" onclick="clearImage('prodImg2');">&times;</span>
                                                                    </div>

                                                                </div>
                                                            </div>
                                                            <div class="col-xl-3 xl-50 col-sm-6 col-3">
                                                                <ul class="file-upload-product">
                                                                    <li>
                                                                        <div class="box-input-file">
                                                                            <input class="upload" type="file" accept="image/png, image/jpeg" name="prodImg1" id="prodImg1" onchange="previewImage(this)" required>                                                                    
                                                                            <i class="fa fa-plus" id="prodImg1-addButton"></i>
                                                                            <i class="fa fa-times" id="prodImg1-crossButton" style="display: none;"></i>
                                                                        </div>
                                                                    </li>
                                                                    <li><h6>Image 1</h6></li>
                                                                    <li>
                                                                        <div class="box-input-file">
                                                                            <input class="upload" type="file" accept="image/png, image/jpeg" name="prodImg2" id="prodImg2" onchange="previewImage(this)" required>
                                                                            <i class="fa fa-plus" id="prodImg2-addButton"></i>
                                                                            <i class="fa fa-times" id="prodImg2-crossButton" style="display: none;"></i>
                                                                        </div>
                                                                    </li>
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
                                                                        id="prodCatInNP" name="prodCatInNP">

                                                                    <%for (ProductCategory pc : productCategoryList) {%>
                                                                    <option value="<%=pc.getProdCatID()%>"><%=pc.getProdCatName()%></option>
                                                                    <%}%>
                                                                </select>
                                                            </div>
                                                        </div>


                                                        <div class="form-group mb-3 row">
                                                            <label for="validationCustom01"
                                                                   class="col-xl-3 col-sm-4 mb-0">Product Name :</label>
                                                            <div class="col-xl-8 col-sm-7">
                                                                <input class="form-control" id="prodName" name="prodName"
                                                                       type="text" required="" placeholder="Enter the product name...">
                                                            </div>
                                                            <!-- <div class="valid-feedback">Looks good!</div> -->
                                                        </div>
                                                        <div class="form-group mb-3 row">
                                                            <label class="col-xl-3 col-sm-4">Description :</label>
                                                            <div class="col-xl-8 col-sm-5">
                                                                <textarea required="" style="margin-left: -2px; resize: none; padding: 10px" placeholder="Enter the product description..." id="prodDesc" name="prodDesc"cols="53" rows="3"></textarea>
                                                            </div>
                                                        </div>
                                                        <div class="form-group mb-3 row">
                                                            <label class="col-xl-3 col-sm-4">Instructions :</label>
                                                            <div class="col-xl-8 col-sm-5">
                                                                <textarea required="" style="margin-left: -2px; resize: none; padding: 10px" placeholder="Enter the product ingredients..." id="prodManual" name="prodManual"cols="53" rows="3"></textarea>
                                                            </div>
                                                        </div>
                                                        <div class="form-group mb-3 row">
                                                            <label class="col-xl-3 col-sm-4">Ingredients :</label>
                                                            <div class="col-xl-8 col-sm-5">
                                                                <textarea required="" style="margin-left: -2px; resize: none; padding: 10px" placeholder="Enter the product ingredients..." id="prodIngredients" name="prodIngredients"cols="53" rows="3"></textarea>
                                                            </div>
                                                        </div>

                                                        <div class="form-group row">
                                                            <label class="col-xl-3 col-sm-4 mb-0">Total Products :</label>
                                                            <fieldset class="qty-box col-xl-9 col-xl-8 col-sm-7">
                                                                <div class="input-group">
                                                                    <input class="touchspin" type="text" value="1" onkeypress="return onlyNumberKey(event)" id="prodAvailable_Qty" name="prodAvailable_Qty" readonly="">
                                                                </div>
                                                            </fieldset>
                                                        </div>

                                                        <div class="form-group mb-3 row">
                                                            <label for="validationCustom02"
                                                                   class="col-xl-3 col-sm-4 mb-0">Original Price(RM) :</label>
                                                            <div class="col-xl-8 col-sm-7">
                                                                <input class="form-control" value="0"
                                                                       required="" type=number step=0.01 min="0" id="prod_OriPrice" name="prod_OriPrice" onchange="countPrice()">
                                                            </div>
                                                            <!-- <div class="valid-feedback">Looks good!</div> -->
                                                        </div>
                                                        <div class="form-group mb-3 row">
                                                            <label for="validationCustom02"
                                                                   class="col-xl-3 col-sm-4 mb-0">Discount Percentage(%) :</label>
                                                            <div class="col-xl-8 col-sm-7">
                                                                <input class="form-control"
                                                                       type="number" required="" step="1" min="0" max="70" value="0" id="discount" name="discount" onchange="countPrice()">
                                                            </div>
                                                            <!-- <div class="valid-feedback">Looks good!</div> -->
                                                        </div>
                                                        <div class="form-group mb-3 row">
                                                            <label for="validationCustom02"
                                                                   class="col-xl-3 col-sm-4 mb-0">Sell Price(RM) :</label>
                                                            <div class="col-xl-8 col-sm-7">
                                                                <input class="form-control" 
                                                                       type="text" readonly="" value="0.00" id="prod_FinalPrice" name="prod_FinalPrice">
                                                            </div>
                                                            <!-- <div class="valid-feedback">Looks good!</div> -->
                                                        </div>


                                                        <div class="form-group mb-3 row">
                                                            <label for="validationCustom02"
                                                                   class="col-xl-3 col-sm-4 mb-0">Status :</label>
                                                            <div class="col-xl-8 col-sm-7">
                                                                <input type="radio" id="prod_Status" name="prod_Status" value="Active" required style="margin-left: 80px;">
                                                                <label for="validationCustom02" class="mb-1">Active</label>
                                                                <input type="radio" id="prod_Status" name="prod_Status" value="Deactive" required style="margin-left: 80px;">
                                                                <label for="validationCustom02" class="mb-1">Deactive</label>
                                                            </div>
                                                            <!-- <div class="valid-feedback">Looks good!</div> -->
                                                        </div>

                                                        <div class="form-group row">

                                                            <div class="offset-xl-3 offset-sm-4 mt-4">
                                                                <!--                                                                <br/>
                                                                                                                                <br/>
                                                                                                                                <br/>
                                                                                                                                <br/>
                                                                                                                                <br/>-->
                                                                <button type="submit" class="btn btn-primary" onclick="submitForm(event)">Add</button>

                                                                <button type="reset" class="btn btn-light" id="discardButtonInPC" onclick="discardPhoto()">Discard</button>
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

                                                                    // This function is called when the user clicks the "Clear Image" button
                                                                    function clearImage(inputId) {
                                                                        if ($('#' + inputId + '-preview').attr('src') == $('#photoZoom').attr('src')) {
                                                                            //Set the photoZoom & the no image text
                                                                            $('#photoZoom').attr('src', '');
                                                                            $('#photoZoom').hide();
                                                                            $('#noImage').show();
                                                                        }

                                                                        // Set the source of the image preview to an empty string
                                                                        $('#' + inputId + '-preview').attr('src', '');

                                                                        // Hide the image preview element
                                                                        $('#' + inputId + '-preview').hide();


                                                                        //Show the add button
                                                                        $('#' + inputId + '-addButton').show();

                                                                        //Hide the cross the button
                                                                        $('#' + inputId + '-crossButton').hide();

                                                                        // Hide the "Clear Image" button
                                                                        $('#' + inputId + '-clear').hide();

                                                                        // Clear the selected file from the input element
                                                                        $('#' + inputId).val('');
                                                                    }
                                                                    function  discardPhoto() {
                                                                        clearImage('prodImg1');

                                                                        clearImage('prodImg2');


                                                                    }



                                                                    function showPreview(preview) {
                                                                        // Set the src attribute of the other image tag to the same value as the preview image
                                                                        $('#photoZoom').attr('src', $(preview).attr('src'));
                                                                        $('#photoZoom').show();
                                                                        $('#noImage').hide();


                                                                    }
                                                                    function onlyNumberKey(evt) {

                                                                        // Only ASCII character in that range allowed
                                                                        var ASCIICode = (evt.which) ? evt.which : evt.keyCode
                                                                        if (ASCIICode > 31 && (ASCIICode < 48 || ASCIICode > 57) && $('#prodAvailable_Qty').val() > 100)
                                                                            return false;
                                                                        return true;
                                                                    }


                                                                    function countPrice() {
                                                                        var ori = document.getElementById("prod_OriPrice").value;

                                                                        console.log(ori);

                                                                        var discount = document.getElementById("discount").value;


                                                                        console.log(discount);

                                                                        var afterDiscount = (100 - discount) / 100;

                                                                        console.log(afterDiscount);

                                                                        var total = (ori * afterDiscount).toFixed(2);

                                                                        if (discount > 70) {
                                                                            alert("Percentage is higher than 70%!");
                                                                            document.getElementById("discount").value = 0;
                                                                            document.getElementById("prod_OriPrice").value = 0;
                                                                            document.getElementById("prod_FinalPrice").value = 0;

                                                                        } else {

                                                                            document.getElementById("prod_FinalPrice").value = total;
                                                                        }


                                                                    }


                                                                    function submitForm(event) {
                                                                        const form = document.getElementById('newProductForm');

                                                                        event.preventDefault(); // prevent default form submission

                                                                        var hasEmptyFieldImg1 = false;
                                                                        var hasEmptyFieldImg2 = false;


                                                                        console.log(hasEmptyFieldImg1);
                                                                        console.log(hasEmptyFieldImg2);


                                                                        var img1 = document.getElementById("prodImg1");
                                                                        var img2 = document.getElementById("prodImg2");



                                                                        if (img1.files.length == 0) {
                                                                            hasEmptyFieldImg1 = true;
                                                                        }
                                                                        if (img2.files.length == 0) {
                                                                            hasEmptyFieldImg2 = true;
                                                                        }


                                                                        console.log(hasEmptyFieldImg1);
                                                                        console.log(hasEmptyFieldImg2);


                                                                        if (hasEmptyFieldImg1 == true && hasEmptyFieldImg2 == true) {
                                                                            event.preventDefault();
                                                                            Swal.fire({
                                                                                icon: 'warning',
                                                                                title: 'Empty Image File',
                                                                                text: 'Image 1 , Image 2 cannot be empty',

                                                                                confirmButtonText: 'Continue',

                                                                            }).then((result) => {
                                                                                /* Read more about isConfirmed, isDenied below */
                                                                                if (result.isConfirmed) {
                                                                                    hasEmptyFieldImg1 = false;
                                                                                    hasEmptyFieldImg2 = false;
                                                                                    hasEmptyFieldImg3 = false;
                                                                                    return;
                                                                                }
                                                                            })


                                                                        } else if (hasEmptyFieldImg1 == true) {
                                                                            event.preventDefault();
                                                                            Swal.fire({
                                                                                icon: 'warning',
                                                                                title: 'Empty Image File',
                                                                                text: 'Image 1 cannot be null',

                                                                                confirmButtonText: 'Continue',

                                                                            }).then((result) => {
                                                                                /* Read more about isConfirmed, isDenied below */
                                                                                if (result.isConfirmed) {
                                                                                    hasEmptyFieldImg2 = false;
                                                                                    return;
                                                                                }
                                                                            })
                                                                        } else if (hasEmptyFieldImg2 == true) {
                                                                            event.preventDefault();
                                                                            Swal.fire({
                                                                                icon: 'warning',
                                                                                title: 'Empty Image File',
                                                                                text: 'Image 2 cannot be null',

                                                                                confirmButtonText: 'Continue',

                                                                            }).then((result) => {
                                                                                /* Read more about isConfirmed, isDenied below */
                                                                                if (result.isConfirmed) {
                                                                                    hasEmptyFieldImg3 = false;
                                                                                    return;
                                                                                }
                                                                            })
                                                                        }

                                                                        var isEmptyInput = false;

                                                                        var inputProdName = document.getElementById('prodName').value;
                                                                        var inputDesc = document.getElementById('prodDesc').value;
                                                                        var inputInstruc = document.getElementById('prodManual').value;
                                                                        var ingredients = document.getElementById('prodIngredients').value;
                                                                        var status = document.getElementById('prod_Status').value;

                                                                        var radioBtn = document.querySelector("input[name='prod_Status']:checked");
                                                                        



                                                                        console.log('prodName' + inputProdName);
                                                                        console.log('prodDesc' + inputDesc);
                                                                        console.log('prodManual' + inputInstruc);
                                                                        console.log('prodIngredients' + ingredients);
                                                                        console.log('status' + radioBtn);

                                                                        if (inputProdName == "" || inputDesc == "" || inputInstruc == "" || ingredients == "" || !radioBtn) {
                                                                            isEmptyInput = true;
                                                                            event.preventDefault();
                                                                            Swal.fire({
                                                                                icon: 'warning',
                                                                                title: 'Input null',
                                                                                text: 'Input cannot be null',

                                                                                confirmButtonText: 'Continue',

                                                                            }).then((result) => {
                                                                                /* Read more about isConfirmed, isDenied below */
                                                                                if (result.isConfirmed) {

                                                                                    return;
                                                                                }
                                                                            })


                                                                        }


                                                                        if (hasEmptyFieldImg2 == false && hasEmptyFieldImg1 == false && isEmptyInput == false) {
                                                                            const formData = new FormData(form);
                                                                            fetch(form.action, {
                                                                                method: form.method,
                                                                                body: formData
                                                                            })
                                                                                    .then(response => response.json())
                                                                                    .then(data => {

                                                                                        console.log(data.message);
                                                                                        Swal.fire({
                                                                                            icon: 'success',
                                                                                            title: 'Sucessful',
                                                                                            text: 'New Product ADDED',

                                                                                            confirmButtonText: 'Continue',

                                                                                        }).then((result) => {
                                                                                            location.reload();
                                                                                        })
                                                                                    })
                                                                                    .catch(error => {
                                                                                        console.error('Error:', error);
                                                                                    });

                                                                        }








                                                                    }
        </script>



    </body>
</html>
