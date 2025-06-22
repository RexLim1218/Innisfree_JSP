/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import DataAccess.AddressDA;
import Domain.Address;
import Domain.Customer;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Yu Xuan
 */
@WebServlet(name = "NewAddress", urlPatterns = {"/NewAddress"})
@MultipartConfig
public class NewAddress extends HttpServlet {

    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        // Retrieve the customer ID from the session
        HttpSession session = request.getSession();
        Customer c = (Customer)session.getAttribute("customerLogin");
        int custID = c.getCustID();
        
        System.out.println("HERE IS CUST ID"+custID);
        
        // Retrieve the address details from the request parameters
        String addr_Type = request.getParameter("addr_Type");
        
        System.out.println("This is address typw is -->"+addr_Type);
        String addr_State = request.getParameter("addr_state");
        String town = request.getParameter("town");
        String zipcode = request.getParameter("zipcode");
        String addr_Details = request.getParameter("addr_details");
        String receiverName = request.getParameter("receiverName");
        String receiverHP = request.getParameter("receiverHP");

        System.out.println("This is addr_State is -->"+addr_State);
        System.out.println("This is address town is -->"+town);
        System.out.println("This is address zipcode is -->"+zipcode);
        System.out.println("This is address addr_Details is -->"+addr_Details);
        System.out.println("This is address receiverName is -->"+receiverName);
        System.out.println("This is address receiverHP is -->"+receiverHP);
        
        
        // Create a new Address object and set its properties
        Address a = new Address();
        a.setCustID(custID);
        a.setAddr_Type(addr_Type);
        a.setAddr_State(addr_State);
        a.setTown(town);
        a.setZipcode(zipcode);
        a.setAddr_Details(addr_Details);
        a.setReceiverName(receiverName);
        a.setReceiverHP(receiverHP);
        a.setAddr_Status("Active");

        
        // Insert the address details into the database
        AddressDA addressDA = new AddressDA(); // Forward to error page
        addressDA.addAddressRecord(a);
        response.sendRedirect(request.getContextPath()+"/View/Front-End/Customer/Address.jsp"); // Redirect to success page
        
//         PrintWriter out = response.getWriter();
//         out.println("addr_State");
         
}
}
