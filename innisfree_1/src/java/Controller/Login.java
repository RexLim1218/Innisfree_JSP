/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import DataAccess.CustomerDA;
import Domain.Customer;
import java.io.BufferedReader;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.json.JSONObject;

/**
 *
 * @author Yu Xuan
 */
@WebServlet(name = "Login", urlPatterns = {"/Login"})
public class Login extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
//        response.setContentType("text/html");
//        PrintWriter out = response.getWriter();
//        try {
//            String custUsername = request.getParameter("custUsername");
//            String custPWD = request.getParameter("custPWD");
//            
//            CustomerDA custDA = new CustomerDA();
//
//            Customer c = custDA.testing(custUsername, custPWD);
//
//            if (c.getCustUsername() != null) { //dont write c!=null, need write c.getUserName!=null or the c.getPasswd so that it can compare the value, if c!=null, it cannot be compared!!!!
//                
//                HttpSession session = request.getSession();
//                session.setAttribute("customerLogin", c);
//               response.sendRedirect("View/Front-End/homepage/homepage.jsp");
//           
//
//            } else {
//
//                out.println("User not found");
//            }
//
//        } catch (SQLException ex) {
//            
//            out.println("ERROR" + ex.toString() + "<br/><br/>");
//            StackTraceElement[] elements = ex.getStackTrace();
//            for (StackTraceElement e : elements) {
//                out.println("File Name: " + e.getFileName() + "<br/>");
//                out.println("Class Name: " + e.getClassName() + "<br/>");
//                out.println("Method Name: " + e.getMethodName() + "<br/>");
//                out.println("Line Number: " + e.getLineNumber() + "<br/><br/>");
//            }
//        } catch (NullPointerException ex) {
//            out.println("ERROR" + ex.toString() + "<br/><br/>");
//            StackTraceElement[] elements = ex.getStackTrace();
//            for (StackTraceElement e : elements) {
//                out.println("File Name: " + e.getFileName() + "<br/>");
//                out.println("Class Name: " + e.getClassName() + "<br/>");
//                out.println("Method Name: " + e.getMethodName() + "<br/>");
//                out.println("Line Number: " + e.getLineNumber() + "<br/><br/>");
//            }
//        }

System.out.println("FOUND");
        response.setContentType("application/json");
        PrintWriter out = response.getWriter();
        BufferedReader reader = request.getReader();
        String jsonData = "";
        String line;
        while ((line = reader.readLine()) != null) {
            jsonData += line;
        }

        
        
        JSONObject jsonObject = new JSONObject(jsonData);

        String custUsername = jsonObject.getString("custUsername");
        String custPWD = jsonObject.getString("custPWD");
System.out.println(custUsername);
System.out.println(custPWD);
        
        
        try {

            CustomerDA custDA = new CustomerDA();

            Customer c = custDA.testing(custUsername, custPWD);

            JSONObject jsonResponse = new JSONObject();

            if (c.getCustUsername() != null) { //dont write c!=null, need write c.getUserName!=null or the c.getPasswd so that it can compare the value, if c!=null, it cannot be compared!!!!

                System.out.println(c.getCustUsername());
                
                HttpSession session = request.getSession();
                session.setAttribute("customerLogin", c);
                session.setAttribute("custID", c.getCustID());
                jsonResponse.put("status", "success");
                jsonResponse.put("message", "Login Successfully!!!");

            } else {

                jsonResponse.put("status", "error");
                jsonResponse.put("message", "Login UNSuccessfully!!!");
            }
                         // Send the JSON response back to the client
        response.setContentType("application/json");
        
        out.print(jsonResponse.toString());
        out.flush();

        } catch (SQLException ex) {

            out.println("ERROR" + ex.toString() + "<br/><br/>");
            StackTraceElement[] elements = ex.getStackTrace();
            for (StackTraceElement e : elements) {
                out.println("File Name: " + e.getFileName() + "<br/>");
                out.println("Class Name: " + e.getClassName() + "<br/>");
                out.println("Method Name: " + e.getMethodName() + "<br/>");
                out.println("Line Number: " + e.getLineNumber() + "<br/><br/>");
            }
        } catch (NullPointerException ex) {
            out.println("ERROR" + ex.toString() + "<br/><br/>");
            StackTraceElement[] elements = ex.getStackTrace();
            for (StackTraceElement e : elements) {
                out.println("File Name: " + e.getFileName() + "<br/>");
                out.println("Class Name: " + e.getClassName() + "<br/>");
                out.println("Method Name: " + e.getMethodName() + "<br/>");
                out.println("Line Number: " + e.getLineNumber() + "<br/><br/>");
            }
        }
        

    }

}
