/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import DataAccess.DAProduct;
import DataAccess.DAProductImage;
import Domain.Product;
import Domain.ProductImage;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Rex Lim
 */
@WebServlet(name = "tryImg", urlPatterns = {"/tryImg"})
public class tryImg extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet tryImg</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet tryImg at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        PrintWriter out = response.getWriter();
        
        try{
        DAProduct dp = new DAProduct();
        ArrayList<Product> getAllProduct = dp.getAllProduct();

        DAProductImage dpi = new DAProductImage();
        ArrayList<ProductImage> getAllImage = dpi.getAllProductImg(getAllProduct);
        
        for(Product p : getAllProduct){
        
            out.println(p.getProdDesc());
        }
        
        for(ProductImage pi : getAllImage){
            out.println(pi.getProdImg_Status());
        }
        
        
        }catch(SQLException ex){
        
            out.println(ex.getMessage());
        }
        
        
    }

}
