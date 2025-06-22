/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;


import DataAccess.DAEmployee;
import Domain.Employee;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


/**
 *
 * @author Rex Lim
 */
@WebServlet(name = "empLogin", urlPatterns = {"/empLogin"})
public class empLogin extends HttpServlet {

    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        PrintWriter out = response.getWriter();

        try {
            String username = request.getParameter("username");
            String password = request.getParameter("password");

            out.println(username);
            DAEmployee daemp = new DAEmployee();

            Employee c = daemp.empLogin(username, username);

            if (c.getEmpUsername()!= null) { //dont write c!=null, need write c.getUserName!=null or the c.getPasswd so that it can compare the value, if c!=null, it cannot be compared!!!!
                
                HttpSession session = request.getSession();
                session.setAttribute("EmpLogin", c);
                response.sendRedirect(request.getContextPath()+"/View/Back-End/Dashboard/Dashboard.jsp");

            } else {

                out.println("User not found");
            }

            
        } catch (Exception ex) {
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
