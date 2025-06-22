package Controller;

import DataAccess.CustomerDA;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class NewPassword
 */
@WebServlet(name = "newPassword", urlPatterns = {"/newPassword"})
public class NewPassword extends HttpServlet {

    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession();
        String newPassword = request.getParameter("password");
        String confPassword = request.getParameter("confPassword");

        System.out.println(newPassword);
        System.out.println(confPassword);
        System.out.println((String) session.getAttribute("custEmail"));

        RequestDispatcher dispatcher = null;
        if (newPassword != null && confPassword != null && newPassword.equals(confPassword)) {

            CustomerDA ca = new CustomerDA();
            int row = ca.updatePassword(newPassword, (String) session.getAttribute("custEmail"));

            if (row > 0) {
                String message = "Password Update Successfully";
                request.getSession().setAttribute("message", message);
                response.sendRedirect("View/Front-End/login.jsp");

            }else{
            
            String message = "Password Update UN-Successfully";
                request.getSession().setAttribute("message", message);
                response.sendRedirect("View/Front-End/login.jsp");
            }
        }
    }

}
