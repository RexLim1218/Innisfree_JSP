/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import Domain.*;
import DataAccess.*;
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
@WebServlet(name = "QuantityIncDes", urlPatterns = {"/QuantityIncDes"})
public class QuantityIncDes extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try (PrintWriter out = response.getWriter()) {
            String action = request.getParameter("action");
            int cartdetailid = Integer.parseInt(request.getParameter("cartdetailid"));
            
             HttpSession session = request.getSession();
           Customer c = (Customer) session.getAttribute("customerLogin");;
            
           // ArrayList<Cart> cart_list = (ArrayList<Cart>) request.getSession().getAttribute("cart-list");
            DACartDetail dacd = new DACartDetail();
            ArrayList<CartDetail> cartProductList = dacd.getAllCartProductByCustID(c.getCustID());
            
            //update quantity
            //get cartdetail to update the quantity
            

            
            if (action != null && cartdetailid >= 1) {
                if (action.equals("inc")) {
                    for (CartDetail cd : cartProductList) {
                            if (cd.getcartDetailID() == cartdetailid) {
                            int quantity = cd.getcartDetailQty();
                            quantity++;
                            cd.setcartDetailQty(quantity);
                            dacd.updateCartProductQty(cd);
                            response.sendRedirect("View/Front-End/Cart/Cart.jsp");
                        }
                    }
                }

                if (action.equals("dec")) {
                       for (CartDetail cd : cartProductList) {
                        if (cd.getcartDetailID() == cartdetailid && cd.getcartDetailQty() > 1) {
                            int quantity = cd.getcartDetailQty();
                            quantity--;
                            cd.setcartDetailQty(quantity);
                             dacd.updateCartProductQty(cd);
                            break;
                        }
                    }
                    response.sendRedirect("View/Front-End/Cart/Cart.jsp");
                }
            } else {
                response.sendRedirect("View/Front-End/Cart/Cart.jsp");
            }
        }
    }

}
