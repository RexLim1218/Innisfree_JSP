/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import DataAccess.*;
import Domain.*;
import java.io.BufferedReader;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Timestamp;
import java.util.Date;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.json.JSONObject;
/**
 *
 * @author User
 */
@WebServlet(name = "cancelOrder", urlPatterns = {"/cancelOrder"})
public class cancelOrder extends HttpServlet {


    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
     
         response.setContentType("application/json");

        HttpSession session = request.getSession();
//        Employee c = (Employee) session.getAttribute("EmpLogin");
                  Customer c = (Customer) session.getAttribute("customerLogin");
//        Date date = new Date();
//        Timestamp empUpDate = new Timestamp(date.getTime());

        BufferedReader reader = request.getReader();
        String jsonData = "";
        String line;
        while ((line = reader.readLine()) != null) {
            jsonData += line;
        }

        // Parse the JSON data
        JSONObject jsonObject = new JSONObject(jsonData);
        int orderRow = jsonObject.getInt("orderRow");
  
        DADeliveryStatus dads= new DADeliveryStatus();
        DAOrders dao= new DAOrders();
         int row = dads.updateDeliveryStatusToCancel(orderRow);
         int row2 = dao.updateOrderStatusToCancel(orderRow);

        
        
        JSONObject jsonResponse = new JSONObject();
        if (row > 0 && row2 > 0) {
            jsonResponse.put("status", "success");
            jsonResponse.put("message", "Cancel Order Successfully!!!");
        } else {
            jsonResponse.put("status", "error");
            jsonResponse.put("message", "Cancel Order UnSuccessfully!!!");
        }
        response.setContentType("application/json");
        PrintWriter out = response.getWriter();
        out.print(jsonResponse.toString());
        out.flush();
        
    }
        
    

}
