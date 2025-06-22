package Controller;

import DataAccess.CustomerDA;
import java.io.IOException;
import java.util.Properties;
import java.util.Random;
import javax.mail.Authenticator;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class ForgotPassword
 */
@WebServlet(name = "forgotPassword", urlPatterns = {"/forgotPassword"})
public class ForgotPassword extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String custEmail = request.getParameter("email");
        int otpvalue = 0;
        HttpSession mySession = request.getSession();

        System.out.println(custEmail);
        CustomerDA c = new CustomerDA();
        int exist = 0;
        exist = c.checkEmailExist(custEmail);

        System.out.println(exist);
        if ((custEmail != null || !custEmail.equals("")) && exist != 0) {
            // sending otp
            Random rand = new Random();
            otpvalue = rand.nextInt(1255650);

            String to = custEmail;// change accordingly
            // Get the session object

            Properties properties = System.getProperties();
            properties.put("mail.smtp.auth", "true");
            properties.put("mail.smtp.starttls.enable", "true");
            properties.put("mail.smtp.port", "587");
            properties.put("mail.smtp.host", "smtp.gmail.com");

// creates a new session with an authenticator
            Authenticator auth = new Authenticator() {
                public PasswordAuthentication getPasswordAuthentication() {
                    return new PasswordAuthentication("limzx-pm21@student.tarc.edu.my", "rtyxeeomxcrfighn");
                }
            };

            Session session = Session.getInstance(properties, auth);

            // compose message
            try {
                Message message = new MimeMessage(session);
                message.setFrom(new InternetAddress(custEmail));// change accordingly
                message.addRecipient(Message.RecipientType.TO, new InternetAddress(to));
                message.setSubject("Reset Password");
                message.setText("your OTP is: " + otpvalue);
                // send message
                Transport.send(message);
                System.out.println("message sent successfully");
            } catch (MessagingException e) {
                throw new RuntimeException(e);
            }

            request.setAttribute("message", "OTP is sent to your email id");
            //request.setAttribute("connection", con);
            mySession.setAttribute("otp", otpvalue);
            mySession.setAttribute("custEmail", custEmail);
            response.sendRedirect("View/Front-End/EnterOTP.jsp");
            //request.setAttribute("status", "success");
        } else {
    String message = "Email address does not exist in the database.";
    request.getSession().setAttribute("message", message);
    response.sendRedirect("View/Front-End/login.jsp");
}


    }

}
