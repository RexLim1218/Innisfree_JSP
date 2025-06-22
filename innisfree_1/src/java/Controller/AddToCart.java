/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import Domain.*;
import DataAccess.*;
import java.io.BufferedReader;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.sql.Timestamp;
import java.util.Date;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.json.JSONObject;

/**
 *
 * @author Asus
 */
@WebServlet(name = "add-to-cart", urlPatterns = {"/add-to-cart"})
public class AddToCart extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        try {
            PrintWriter out = response.getWriter();
            HttpSession session = request.getSession();
            Customer c = (Customer) session.getAttribute("customerLogin");
            System.out.println("Customer ID: " + c.getCustID() + "<br>");
            System.out.println("FOUND ADD TO CART");

            response.setContentType("application/json");
            BufferedReader reader = request.getReader();
            String jsonData = "";
            String line;
            while ((line = reader.readLine()) != null) {
                jsonData += line;
            }

            // Parse the JSON data
            JSONObject jsonObject = new JSONObject(jsonData);
            int custID2 = jsonObject.getInt("custID");
            int prodID = jsonObject.getInt("prodID");
            System.out.println(prodID);
            System.out.println(custID2);

            DACart cartda = new DACart();

            Cart c1 = cartda.getCartIDBycustID(c.getCustID());

            JSONObject jsonResponse = new JSONObject();

            if (c1.getcartID() != 0) {

                DACartDetail da = new DACartDetail();

                CartDetail cd = da.getCartDetailById2(prodID, c.getCustID());
                if (c1.getcartID() == cd.getcartID()) {
                    jsonResponse.put("exist", "yes");
                    jsonResponse.put("message", "Product Exist in cart.Please proceed to cart");

                } else {

                    CartDetail cartDetail = new CartDetail();
                    cartDetail.setcartID(c1.getcartID());
                    cartDetail.setprodID(prodID);
                    cartDetail.setcartDetailQty(1);

                    DACartDetail dcd = new DACartDetail();
                    int rowww = dcd.addCartDetail(cartDetail);

                    if (rowww > 0) {
                        jsonResponse.put("exist", "yes");
                        jsonResponse.put("message", "Product Added to the cart");
                    }
                }

            } else {

                Date date = new Date();
                Timestamp prodCatCrDate = new Timestamp(date.getTime());
                int custID = c.getCustID();

                Cart cart = new Cart();
                cart.setcustID(custID);
                cart.setcartUpDate(prodCatCrDate);

                DACart da2 = new DACart();
                int row = da2.addCart(cart);

                if (row > 0) {
                    Cart ca = da2.getCartID();
                    int cartID = ca.getcartID();

                    CartDetail cartDetail = new CartDetail();
                    cartDetail.setcartID(cartID);
                    cartDetail.setprodID(prodID);
                    cartDetail.setcartDetailQty(1);

                    DACartDetail dcd = new DACartDetail();
                    int row2 = dcd.addCartDetail(cartDetail);

                    if (row2 > 0) {

                        jsonResponse.put("exist", "yes");
                        jsonResponse.put("message", "Product Added to the new cart");
                    }
                } else {
                    System.out.println("ERROR");
                    jsonResponse.put("exist", "no");
                jsonResponse.put("message", "Error");
                }
                

            }
            // Send the JSON response back to the client
            response.setContentType("application/json");

            out.print(jsonResponse.toString());
            out.flush();

        } catch (SQLException ex) {

            System.out.println(ex.getMessage());
        }

    }
}
