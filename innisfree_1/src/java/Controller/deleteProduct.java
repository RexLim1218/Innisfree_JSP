/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import DataAccess.DAProduct;
import DataAccess.DAProductImage;
import Domain.Customer;
import Domain.Employee;
import java.io.BufferedReader;
import java.io.IOException;
import java.io.PrintWriter;
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
 * @author Rex Lim
 */
@WebServlet(name = "deleteProduct", urlPatterns = {"/deleteProduct"})
public class deleteProduct extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        response.setContentType("application/json");

        BufferedReader reader = request.getReader();
        String jsonData = "";
        String line;
        while ((line = reader.readLine()) != null) {
            jsonData += line;
        }

        // Parse the JSON data
        JSONObject jsonObject = new JSONObject(jsonData);
        int prodID = jsonObject.getInt("prodID");
        String prodName = jsonObject.getString("prodName");

        HttpSession session = request.getSession();
        Employee c = (Employee) session.getAttribute("EmpLogin");

        Date date = new Date();
        Timestamp prodUpDate = new Timestamp(date.getTime());
        String username = c.getEmpUsername();
        
        
        DAProduct daProd = new DAProduct();
        int row = daProd.deleteProduct(prodID,username,prodUpDate);
        JSONObject jsonResponse = new JSONObject();
        if (row > 0) {
            DAProductImage daPI = new DAProductImage();
            int row2 = daPI.deleteProductImage(prodID,username,prodUpDate);
            if (row2 > 0) {
                jsonResponse.put("status", "success");
                jsonResponse.put("message", "Product: ' " + prodName + " ' Deleted Successfully!!!");
            } else {
                jsonResponse.put("status", "error");
                jsonResponse.put("message", "Product Image: < " + prodName + " > Deleted UN-Successfully!!!");
            }
        } else {
            jsonResponse.put("status", "warning");
            jsonResponse.put("message", "Product: < " + prodName + " > Deleted UN-Successfully!!!");
        }

        response.setContentType("application/json");
        PrintWriter out = response.getWriter();
        out.print(jsonResponse.toString());
        out.flush();
        
    }

}
