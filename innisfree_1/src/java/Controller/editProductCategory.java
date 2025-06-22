/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import DataAccess.DAProductCategory;
import Domain.Customer;
import Domain.Employee;
import Domain.ProductCategory;
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
@WebServlet(name = "editProductCategory", urlPatterns = {"/editProductCategory"})
public class editProductCategory extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("application/json");

        HttpSession session = request.getSession();
        Employee c = (Employee) session.getAttribute("EmpLogin");
        
        BufferedReader reader = request.getReader();
        String jsonData = "";
        String line;
        while ((line = reader.readLine()) != null) {
            jsonData += line;
        }

        // Parse the JSON data
        JSONObject jsonObject = new JSONObject(jsonData);

        // Retrieve the values of the individual keys
        String tempID = jsonObject.getString("tempID");
        String prodCatName2 = jsonObject.getString("prodCatName2");
        String prodCatDesc2 = jsonObject.getString("prodCatDesc2");
        String prodCat_Status2 = jsonObject.getString("prodCat_Status2");

        Date date = new Date();
        Timestamp prodCatUpDate = new Timestamp(date.getTime());
        String prodCatUpBy = c.getEmpUsername();
        int prodCatID = Integer.parseInt(tempID);

        ProductCategory prodCategory = new ProductCategory();

        prodCategory.setProdCatID(prodCatID);
        prodCategory.setProdCatUpDate(prodCatUpDate);
        prodCategory.setProdCatUpBy(prodCatUpBy);
        prodCategory.setProdCatName(prodCatName2);
        prodCategory.setProdCatDesc(prodCatDesc2);
        prodCategory.setProdCat_Status(prodCat_Status2);

        DAProductCategory da = new DAProductCategory();
        int row = da.updateProdCategory(prodCategory);

        JSONObject jsonResponse = new JSONObject();

        if (row > 0) {
            jsonResponse.put("status", "success");
            jsonResponse.put("message", "Category: < "+prodCatName2+" > Update Successfully!!!");
        } else {
            jsonResponse.put("status", "success");
            jsonResponse.put("message", "Data Update UN-Successfully!!!");

        }

        // Send the JSON response back to the client
        response.setContentType("application/json");
        PrintWriter out = response.getWriter();
        out.print(jsonResponse.toString());
        out.flush();

    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }

}
