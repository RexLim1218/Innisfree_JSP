package Controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class ValidateOtp
 */
@WebServlet(name = "ValidateOtp", urlPatterns = {"/ValidateOtp"})
public class ValidateOtp extends HttpServlet {

    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int value = Integer.parseInt(request.getParameter("otp"));
        HttpSession session = request.getSession();
        int otp = (int) session.getAttribute("otp");
        System.out.print(otp);

        RequestDispatcher dispatcher = null;

        if (value == otp) {

            request.setAttribute("custEmail", request.getParameter("custEmail"));
            request.setAttribute("status", "success");
            dispatcher = request.getRequestDispatcher("View/Front-End/newPassword.jsp");
            dispatcher.forward(request, response);

        } else {
            response.sendRedirect("View/Front-End/EnterOTP.jsp");

        }

    }

}
