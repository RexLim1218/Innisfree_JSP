/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import DataAccess.DAOrders;
import Domain.DeliveryStatus;
import Domain.Employee;
import Domain.Orders;
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
@WebServlet(name = "editOrder", urlPatterns = {"/editOrder"})
public class editOrder extends HttpServlet {

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

        JSONObject jsonObject = new JSONObject(jsonData);

        int deliveryID = jsonObject.getInt("deliveryID");
        int orderRow = jsonObject.getInt("orderRow");
        String deliveryStatus = jsonObject.getString("deliveryStatus");
        String trackingNo = jsonObject.getString("trackingNo");
//        int deliveryID = Integer.parseInt(request.getParameter("deliveryID"));
//        int orderRow = Integer.parseInt(request.getParameter("orderRow"));
//        String deliveryStatus = request.getParameter("deliveryStatus");
//        String trackingNo = request.getParameter("trackingNo");
        HttpSession session = request.getSession();
        Employee c = (Employee) session.getAttribute("EmpLogin");

        Date date = new Date();
        Timestamp orderUpDate = new Timestamp(date.getTime());

        PrintWriter out = response.getWriter();
        Orders o = new Orders();

        String deliveryDetails = "The order is PENDING...";

        switch (deliveryStatus) {
            case "Cancelled":
                deliveryDetails = "The order is CANCELLED!";
                break;
            case "Packaging":
                deliveryDetails = "The order is PACKAGING...";
                break;
            case "Shipping":
                deliveryDetails = "The order is SHIPPING...";
                break;
            case "Delivered":
                deliveryDetails = "The order is DELIVERED...";
                break;
            case "Completed":
                deliveryDetails = "The order is COMPLETED...";
                break;
            default:
                deliveryDetails = "The order is PENDING...";
        }
JSONObject jsonResponse = new JSONObject();
        if (trackingNo.isEmpty()) {
            DeliveryStatus ds = new DeliveryStatus();
            ds.setDeliveryID(deliveryID);
            ds.setDeliveryStatus(deliveryStatus);
            ds.setDeliveryDetails(deliveryDetails);
            ds.setOrderRow(orderRow);
            ds.setDel_UpDate(orderUpDate);
            ds.setDel_UpBy(c.getEmpUsername());
            o.setDelivery_Status(ds);
            DAOrders dao = new DAOrders();
            int row = dao.updateDeliveryStatus(o);
            if (row > 0) {
                
               
            } else {
            
            }

        } else {
            o.setOrderRow(orderRow);
            o.setTrackingno(trackingNo);
            o.setOrderUpDate(orderUpDate);
            o.setOrderUpBy(c.getEmpUsername());

            DAOrders dao = new DAOrders();

            int row2 = dao.insertTrackingNo(o);

            if (row2 > 0) {
                DeliveryStatus ds = new DeliveryStatus();
                ds.setDeliveryID(deliveryID);
                ds.setDeliveryStatus(deliveryStatus);
                ds.setDeliveryDetails(deliveryDetails);
                ds.setOrderRow(orderRow);
                ds.setDel_UpDate(orderUpDate);
                ds.setDel_UpBy(c.getEmpUsername());
                o.setDelivery_Status(ds);

                int row = dao.updateDeliveryStatus(o);
                if (row > 0) {
                    jsonResponse.put("status", "success");
            jsonResponse.put("message", "Order Update Successfully!!!");
                }else{
                
                jsonResponse.put("status", "error");
            jsonResponse.put("message", "Order Update UNSuccessfully!!!");
                }

            } else {
                jsonResponse.put("status", "error");
            jsonResponse.put("message", "Order Update UNSuccessfully!!!");
                }
             // Send the JSON response back to the client
        response.setContentType("application/json");
        
        out.print(jsonResponse.toString());
        out.flush();

        }

        
    }

}
