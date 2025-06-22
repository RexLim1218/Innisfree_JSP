/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import DataAccess.*;
import Domain.*;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Asus
 */
@WebServlet(name = "RemoveFromCart", urlPatterns = {"/RemoveFromCart"})
public class RemoveFromCart extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        try (PrintWriter out = response.getWriter()) {
            //ArrayList<CartDetail> cartProductList
            HttpSession session = request.getSession();
          Customer c = (Customer) session.getAttribute("customerLogin");
            String cartdetailid = request.getParameter("cartdetailid");
             DACartDetail dacd = new DACartDetail();
             
             
            if (cartdetailid != null) {
                ArrayList<CartDetail> cartProductList = dacd.getAllCartProductByCustID(c.getCustID());

                for (CartDetail cd : cartProductList) {
                    if (cd.getcartDetailID() == Integer.parseInt(cartdetailid)) {
                        //database remove
                        dacd.removeCartListProduct(Integer.parseInt(cartdetailid));
                        break;
                    }
                }

                response.sendRedirect("View/Front-End/Cart/Cart.jsp");

            } else {
                response.sendRedirect("View/Front-End/Cart/Cart.jsp");
            }

        }
    }

}
