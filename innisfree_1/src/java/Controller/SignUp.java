/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import DataAccess.AddressDA;
import DataAccess.CustomerDA;
import DataAccess.DACart;
import Domain.Address;
import Domain.Cart;
import Domain.Customer;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.Date;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Yu Xuan
 */
@WebServlet(name = "SignUp", urlPatterns = {"/SignUp"})
public class SignUp extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        Date date = new Date();

        String custUsername = request.getParameter("custUsername");
        String custName = request.getParameter("custName");
        String custPWD = request.getParameter("password1");
        String custEmail = request.getParameter("custEmail");
        String custHP = request.getParameter("custHP");

        Timestamp custCrDate = new Timestamp(date.getTime());
        String custCrBy = request.getParameter("custUsername");
        Timestamp custUpDate = new Timestamp(date.getTime());
        String custUpBy = request.getParameter("custUsername");
        String cust_Status = "Active";

        CustomerDA custDA = new CustomerDA();
        Customer c = new Customer();

        c.setCustUsername(custUsername);
        c.setCustName(custName);
        c.setCustPWD(custPWD);
        c.setCustEmail(custEmail);
        c.setCustHP(custHP);
        c.setCustCrDate(custCrDate);
        c.setCustCrBy(custCrBy);
        c.setCustUpDate(custUpDate);
        c.setCustUpBy(custUpBy);
        c.setCust_Status(cust_Status);

        
        int custID = 0;
        String addr_Type = "Default";
        String addr_State = request.getParameter("addr_state");
        String town = request.getParameter("town");
        String zipcode = request.getParameter("zipcode");
        String addr_Details = request.getParameter("addr_details");
        String receiverName = request.getParameter("custUsername");
        String receiverHP = request.getParameter("custHP");
        String addr_Status = "Active";

  
        AddressDA addressDA = new AddressDA();
        Address a = new Address();

        int row = custDA.addCustRecord(c);
      
        if (row > 0) {

            try {
                ResultSet rs = custDA.getCustID();
                while (rs.next()) {
                    custID = rs.getInt(1);
                }

                a.setCustID(custID);
                a.setAddr_Type(addr_Type);
                a.setAddr_State(addr_State);
                a.setTown(town);
                a.setZipcode(zipcode);
                a.setAddr_Details(addr_Details);
                a.setReceiverName(receiverName);
                a.setReceiverHP(receiverHP);
                a.setAddr_Status(addr_Status);
                addressDA.addAddressRecord(a);
                
                DACart dac= new  DACart();
                Cart ca = new Cart();
                ca.setcustID(custID);
                ca.setcartUpDate(custUpDate);
                dac.addCart(ca);
                
                response.sendRedirect("View/Front-End/login.jsp");
//                      PrintWriter out = response.getWriter();
//        out.println(addr_Type+","+addr_State+","+zipcode+","+addr_Details+","+receiverName+","+receiverHP);
            } catch (SQLException ex) {
                System.out.println("Error: " + ex.getMessage());
            }
        }
        
        
    }
}
