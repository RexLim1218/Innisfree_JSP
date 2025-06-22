/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;
import com.google.gson.Gson;
import DataAccess.DAProductCategory;
import Domain.ProductCategory;
import java.io.IOException;
import java.io.PrintWriter;
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
@WebServlet(name = "getProductCategoryByID", urlPatterns = {"/getProductCategoryByID"})
public class getProductCategoryByID extends HttpServlet {
    @Override
protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Retrieve the product ID from the request parameter
        String prodCatId = request.getParameter("prodCatID");

        // Call a service or DAO class to retrieve the product data from the database
        DAProductCategory da = new DAProductCategory();
        ProductCategory pc = da.getProductsCategoryByID(prodCatId);

        // Convert the product data to JSON format
        Gson gson = new Gson();
        String json = gson.toJson(pc);

        // Send the JSON response back to the client
        response.setContentType("application/json");
        response.getWriter().write(json);
        
    }
 
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
           }


 
}
