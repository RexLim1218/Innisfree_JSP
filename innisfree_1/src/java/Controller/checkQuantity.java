/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import DataAccess.DACartDetail;
import DataAccess.DAProduct;
import Domain.CartDetail;
import Domain.Customer;
import Domain.Product;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.json.JSONObject;

/**
 *
 * @author Rex Lim
 */
@WebServlet(name = "checkQuantity", urlPatterns = {"/checkQuantity"})
public class checkQuantity extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession();
        Customer c = (Customer) session.getAttribute("customerLogin");

        JSONObject jsonResponse = new JSONObject();

        int custID = c.getCustID();
        int qty = 0;
        Boolean exceed = false;
        String name = "";
        DACartDetail dcd = new DACartDetail();
        ArrayList<CartDetail> cdList = dcd.getAllCartProductByCustID(custID);
        for (CartDetail cd : cdList) {

            DAProduct dap = new DAProduct();
            Product p = dap.getProductById(cd.getprodID());
            System.out.println(p.getProdName());
            System.out.println(cd.getprodID()+"Name"+cd.getProduct().getProdName());
            System.out.println("Name"+cd.getProduct().getProdName()+" Quantity in cart detail:" +cd.getcartDetailQty());
            System.out.println("Name"+cd.getProduct().getProdName()+" Quantity in productlist:" +p.getProdAvailable_Qty());
            System.out.println(cd.getprodID()+"Name"+cd.getProduct().getProdName());
            if (cd.getcartDetailQty() > p.getProdAvailable_Qty()) {
                name = "";
                exceed = true;
                qty = p.getProdAvailable_Qty();
                name = cd.getProduct().getProdName();
                System.out.println("Here is looping..." + cd.getprodID() + "/n Quantity is " + cd.getcartDetailQty() + " Availablev quantity of " + cd.getProduct().getProdName() + "is " + p.getProdAvailable_Qty());

                break;
            }
        }

        if (exceed == true) {
            jsonResponse.put("exceed", exceed);
            jsonResponse.put("qty", "Product: " + name + " only have " + qty + " quantity");

        } else {

            jsonResponse.put("exceed", exceed);
        }

        System.out.println(exceed);

        PrintWriter out = response.getWriter();
        response.setContentType("application/json");

        out.print(jsonResponse.toString());
        out.flush();

    }

}
