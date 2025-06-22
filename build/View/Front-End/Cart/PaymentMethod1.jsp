<%-- 
    Document   : PaymentMethod1
    Created on : May 1, 2023, 9:48:32 PM
    Author     : Asus
--%>
<%@page import="java.util.*"%>
<%@page import="java.util.Base64"%>
<%@page import="Domain.*"%>
<%@page import="DataAccess.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Innisfree | Make You Better</title>
        <link rel="icon" href="../../../assets/images/favicon/3.png" type="image/x-icon">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="preconnect" href="https://fonts.gstatic.com">
        <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;500;600;700&display=swap" rel="stylesheet">
        <link rel="stylesheet" type="text/css" href="../../../assets/commonResources/sweetalert.min.css">
        <style type="text/css">

            *{
                margin: 0;
                padding: 0;
                box-sizing: border-box;

            }

            body{
                width: 100%;
                height: 100vh;
                display: flex;
                justify-content: center;
                align-items: center;
                background-color: azure;
                font-family: 'Poppins', sans-serif;
            }

            .container{
                width: 750px;
                height: 500px;
                border: 1px solid;
                background-color: white;
                display: flex;
                flex-direction: column;
                padding: 40px;
                justify-content:space-around;
            }

            .container h1{
                text-align: center;
            }

            .first-row{
                display: flex;
            }

            .owner{
                width: 100%;
                margin-right: 40px;
            }

            .input-field{
                border: 1px solid #999;
            }

            .input-field input{
                width: 100%;
                border:none;
                outline: none;
                padding: 10px;
            }

            .selection{
                display: flex;
                justify-content: space-between;
                align-items: center;
            }

            .selection select{
                padding: 10px 20px;
            }

            a{
                background-color: blueviolet;
                color: white;
                text-align: center;
                text-transform: uppercase;
                text-decoration: none;
                padding: 10px;
                font-size: 18px;
                transition: 0.5s;
            }

            a:hover{
                background-color: dodgerblue;
            }

            .my-button {
                background-color: blueviolet;
                color: white;
                text-align: center;
                text-transform: uppercase;
                text-decoration: none;
                padding: 10px;
                font-size: 18px;
                transition: 0.5s;
            }

            .my-button:hover{

                background-color: dodgerblue;
            }

            .cards img{
                width: 100px;
            }

        </style>
        <title>JSP Page</title>
    </head>
    <body>

        <%
           Customer c = (Customer) session.getAttribute("customerLogin");

            DACartDetail dacd = new DACartDetail();
            ArrayList<CartDetail> cartProductList = dacd.getAllCartProductByCustID(c.getCustID());

            double total = dacd.getTotalCartPrice(cartProductList);
            double shippingPrice = (total >= 200.0) ? 0.0 : 25.0;
            double totalPrice = total + shippingPrice;
            request.setAttribute("total", total);
            request.setAttribute("shippingPrice", shippingPrice);
            request.setAttribute("totalPrice", totalPrice);

            double subtotal = Double.parseDouble(request.getAttribute("total").toString());
            double shippingfee = Double.parseDouble(request.getAttribute("shippingPrice").toString());
            double totalAmount = Double.parseDouble(request.getAttribute("totalPrice").toString());

            String name = request.getParameter("name");
            request.setAttribute("name", name);
            String phone = request.getParameter("phone");
            request.setAttribute("phone", phone);
            String addressdetail = request.getParameter("addressdetail");
            request.setAttribute("addressdetail", addressdetail);
            String town = request.getParameter("town");
            request.setAttribute("town", town);
            String state = request.getParameter("state");
//            request.setAttribute("state", state);
            String zipcode = request.getParameter("zipcode");
            request.setAttribute("zipcode", zipcode);
            String paymentMethod = request.getParameter("paymentMethod");
//            request.setAttribute("payment-group", paymentMethod);
            String address = request.getParameter("address");
            request.setAttribute("address", address);
        %>

        <form action="${pageContext.servletContext.contextPath}/OrderSuccesfully"  enctype="multipart/form-data"id="paymentMethod1Form" method="post">
            <%for (CartDetail cd : cartProductList) {
            %>
            <input type="hidden" name="prodname" class="form-control input-number"
                   value="<%= cd.getProduct().getProdName()%>" >
            <input type="hidden" name="prodid" class="form-control input-number"
                   value="<%= cd.getprodID()%>" >
            <input type="hidden" name="prodfinalprice" class="form-control input-number"
                   value="<%= cd.getProduct().getProd_FinalPrice()%>" >
            <input type="hidden" name="cartdetailid" class="form-control input-number"
                   value="<%= cd.getcartDetailID()%>" >
            <input type="hidden" name="cartdetailqty" class="form-control input-number"
                   value="<%= cd.getcartDetailQty()%>" >

            <input type="hidden" name="subtotal" class="form-control input-number"
                   value="<%= subtotal%>" ><!--
            -->            <input type="hidden" name="shippingfee" class="form-control input-number"
                                  value="<%= shippingfee%>" >
            <input type="hidden" name="totalamount" class="form-control input-number"
                   value="<%= totalAmount%>" >


            <% }

            %>
            <input type="hidden" id="name" name="name" value="${name}"  placeholder="">
            <input type="hidden" id="phone" name="phone" value="${phone}"  placeholder="">
            <input type="hidden" id="addressdetail" name="addressdetail" value="${addressdetail}"  placeholder="">
            <input type="hidden" id="town" name="town" value="${town}"  placeholder="">
            <input type="hidden" id="state" name="state" value="<%=state%>"  placeholder="">
            <input type="hidden" id="zipcode" name="zipcode" value="${zipcode}"  placeholder="">
            <input type="hidden" id="paymentMethod" name="paymentMethod" value="<%=paymentMethod%>"  placeholder="">
            <input type="hidden" id="address" name="address" value="${address}"  placeholder="">



            <div class="container">
                <h1>Confirm Your Payment</h1>
                <div class="first-row">
                    <div class="owner">
                        <h3>Card Holder's Name</h3>
                        <div class="input-field">
                            <input type="text" id="input1">
                        </div>
                    </div>
                    <div class="cvv">
                        <h3>CVV</h3>
                        <div class="input-field">
                            <input type="password" id="input2" maxlength="3" >
                        </div>
                    </div>
                </div>
                <div class="second-row">
                    <div class="card-number">
                        <h3>Card Number</h3>
                        <div class="input-field">
                            <input type="number" maxlength="16" id="input3" >
                        </div>
                    </div>
                </div>
                <div class="third-row">
                    <h3>Exp</h3>
                    <div class="selection">
                        <div class="date">
                            <select name="months" id="months" required>
                                <option value="Jan">Jan</option>
                                <option value="Feb">Feb</option>
                                <option value="Mar">Mar</option>
                                <option value="Apr">Apr</option>
                                <option value="May">May</option>
                                <option value="Jun">Jun</option>
                                <option value="Jul">Jul</option>
                                <option value="Aug">Aug</option>
                                <option value="Sep">Sep</option>
                                <option value="Oct">Oct</option>
                                <option value="Nov">Nov</option>
                                <option value="Dec">Dec</option>
                            </select>
                            <select name="years" id="years" required>
                                <option value="2020">2020</option>
                                <option value="2019">2019</option>
                                <option value="2018">2018</option>
                                <option value="2017">2017</option>
                                <option value="2016">2016</option>
                                <option value="2015">2015</option>
                            </select>
                        </div>
                        <div class="cards">

                            <img src="../../../assets/images/mc.png" alt="">
                            <img src="../../../assets/images/vi.png" alt="">
                            <img src="../../../assets/images/pp.png" alt="">
                        </div>
                    </div>    
                </div>

                <button type="submit" class="my-button" onclick="submitPayment(event)">pay</button>
                <a href="Cart.jsp">Cancel</a>
            </div>
        </form>

        <script src="https://code.jquery.com/jquery-3.5.1.js" defer></script>
        <script src="../../../assets/commonResources/sweetalert.min.js"></script>
        <script>
                    function submitPayment(event) {
                        var input1 = document.getElementById("input1").value;
                        var input2 = document.getElementById("input2").value;
                        var input3 = document.getElementById("input3").value;
                        var cardnum = $('#input3').val();
                   
  var cardNumRegex = /^\d{16}$/; // regular expression to match 16 digits


                        // Check if the input values are null or empty
                        if (!input1 || !input2 || !input3) {
                            // Prevent the form from submitting
                            event.preventDefault();
//                            alert("All input fields are required.");
                            Swal.fire('Please Fill in all input. Thank You');
                            
                            return;
                          
                        } else if(!cardNumRegex.test(cardnum)){
                            // Prevent the form from submitting
                            event.preventDefault();
//                            alert("All input fields are required.");
                            Swal.fire('Please Fill correct card format with 16 number ONLY. Thank You');
                            
                            return;
                            
                        }else {
                                event.preventDefault();
                    Swal.fire({
                        title: 'Payment Successfully!',
                        text: 'Click "OK" button to see your Order. Thank You!',
                        icon: 'success',
                        confirmButtonText: 'OK'
                    }).then((result) => {
                        if (result.isConfirmed) {
                            // Get the form element and create a new FormData object
                            const form = document.querySelector('#paymentMethod1Form');
                            const formData = new FormData(form);

                            // Set the form action to the servlet URL
                            form.action = '/innisfree_1/OrderSuccesfully';

                            // Submit the form with the form data
                            fetch(form.action, {
                                method: 'POST',
                                body: formData
                            })
                                    .then(response => {
                                        location.replace("OrderSuccess.jsp");
                                    })
                                    .catch(error => {
                                        // Handle any errors that occur during the POST request
                                    });
                        }
                    });
                    }
                            
                            
                            
                        }
                    

                



        </script>

    </body>
</html>
