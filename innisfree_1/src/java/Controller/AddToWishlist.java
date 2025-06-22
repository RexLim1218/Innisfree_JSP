/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import Domain.Wishlist;
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
 * @author yokec
 */
@WebServlet(name = "AddToWishlist", urlPatterns = {"/add-to-wishlist"})
public class AddToWishlist extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet AddToWishlist</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet AddToWishlist at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        
        try(PrintWriter out = response.getWriter()) {
            ArrayList<Wishlist> wishList = new ArrayList<>();

            int id = Integer.parseInt(request.getParameter("id"));
            Wishlist wl = new Wishlist();
            wl.setProdID(id);

            HttpSession session = request.getSession();
            ArrayList<Wishlist> wish_list = (ArrayList<Wishlist>) session.getAttribute("wish-list");

            if (wish_list == null) {
                wishList.add(wl);
                session.setAttribute("wish-list", wishList);
                response.sendRedirect("allproduct.jsp");
            } else {
                wishList = wish_list;
                wishList.add(wl);
                session.setAttribute("wish-list", wishList);
                response.sendRedirect("allproduct.jsp");
            }
        } catch(Exception ex){
            System.out.println(ex.getMessage());
        }
    }

    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
//        processRequest(request, response);
    }

    
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
