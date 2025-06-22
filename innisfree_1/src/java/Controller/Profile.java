/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;


import DataAccess.CustomerDA;

import Domain.Customer;
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

/**
 *
 * @author Yu Xuan
 */
@WebServlet(name = "Profile", urlPatterns = {"/Profile"})
public class Profile extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
     
     PrintWriter out = response.getWriter();
        Date date = new Date();
        
        String custUsername = request.getParameter("custUsername");
        String custName = request.getParameter("custName");
        String custPWD = request.getParameter("custPWD");
        String custEmail = request.getParameter("custEmail");
        String custHP = request.getParameter("custHP");

        HttpSession session = request.getSession();
        Customer c = (Customer)session.getAttribute("customerLogin");
        
        Timestamp custUpDate = new Timestamp(date.getTime());
        //who is up by
        String custUpBy = c.getCustUsername();
        c.setCustUsername(custUsername);
        c.setCustName(custName);
        c.setCustPWD(custPWD);
        c.setCustEmail(custEmail);
        c.setCustHP(custHP);
        c.setCustUpDate(custUpDate);
        c.setCustUpBy(custUpBy);
        c.setCust_Status("Active");

        CustomerDA custDA = new CustomerDA();
        custDA.updateRecord(c);
            
response.sendRedirect(request.getContextPath()+"/View/Front-End/Customer/Profile.jsp");





}

    }
    

