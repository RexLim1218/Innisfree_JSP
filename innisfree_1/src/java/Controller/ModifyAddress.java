/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import DataAccess.AddressDA;
import Domain.Address;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Yu Xuan
 */
@WebServlet(name = "ModifyAddress", urlPatterns = {"/ModifyAddress"})
@MultipartConfig
public class ModifyAddress extends HttpServlet {
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        int addressID = Integer.parseInt(request.getParameter("addr_ID"));
        System.out.println("ADDRESS ID -->"+addressID);
        String addr_Type = request.getParameter("addr_Type");
        System.out.println("ADDRESS Type -->"+addr_Type);
        String addr_State = request.getParameter("addr_state");
        String town = request.getParameter("town");
        String zipcode = request.getParameter("zipcode");
        String addr_Details = request.getParameter("addr_details");
        String receiverName = request.getParameter("receiverName");
        String receiverHP = request.getParameter("receiverHP");
        
        Address a = new Address();
        a.setAddressID(addressID);
        a.setAddr_Type(addr_Type);
        a.setAddr_State(addr_State);
        a.setTown(town);
        a.setZipcode(zipcode);
        a.setAddr_Details(addr_Details);
        a.setReceiverName(receiverName);
        a.setReceiverHP(receiverHP);
        
        AddressDA addressDA = new AddressDA();
        addressDA.updateAddrRecord(a);
        
        response.sendRedirect(request.getContextPath() + "/View/Front-End/Customer/Address.jsp");
        
    }
    
}
