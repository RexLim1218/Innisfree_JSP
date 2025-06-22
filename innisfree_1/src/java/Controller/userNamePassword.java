/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

//import DataAccess.DAEmployee;
import DataAccess.CustomerDA;
import DataAccess.DAEmployee;
import java.io.BufferedReader;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.json.JSONObject;

/**
 *
 * @author Rex Lim
 */
@WebServlet(name = "userNamePassword", urlPatterns = {"/userNamePassword"})
public class userNamePassword extends HttpServlet {

//    @Override
//    protected void doGet(HttpServletRequest request, HttpServletResponse response)
//            throws ServletException, IOException {
//        String action = request.getParameter("action");
//        
//
//        if (action.equals("emp")) {
//
//            String username = request.getParameter("username");
//            String email = request.getParameter("email");
//
//            // Set the default response object to indicate that both fields do not exist
//            boolean existsUsername = false;
//            boolean existsEmail = false;
//
//            DAEmployee dae = new DAEmployee();
//            ResultSet rs = dae.checkUsername_Email(username, email);
//
//            try {
//
//                if (rs.next()) {
//                    int count = rs.getInt(1);
//                    existsUsername = count > 0 && rs.getString(2).equals(username);
//                    existsEmail = count > 0 && rs.getString(3).equals(email);
//                }
//
//            } catch (SQLException ex) {
//                System.out.println(ex.getMessage());
//            }
//
//            // Create a response object with the results of the query
//            String jsonResponse = "{\"existsUsername\": " + existsUsername + ", \"existsEmail\": " + existsEmail + "}";
//            response.setContentType("application/json");
//            response.setCharacterEncoding("UTF-8");
//            response.getWriter().write(jsonResponse);
//        } else if (action.equals("cust")) {
//
//        }else if(action.equals("passwordCheck")){
//            String currentPwd = request.getParameter("empCurentPwd");
//            String empID = request.getParameter("empID");
//        
//        
//        }
//    }

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
        String action = jsonObject.getString("action");

        if (action.equals("emp")) {

            String username = jsonObject.getString("username");
            String email = jsonObject.getString("email");

            // Set the default response object to indicate that both fields do not exist
            boolean existsUsername = false;
            boolean existsEmail = false;

            DAEmployee dae = new DAEmployee();
            ResultSet rs = dae.checkUsername_Email(username, email);

            try {

                if (rs.next()) {
                    int count = rs.getInt(1);
                    existsUsername = count > 0 && rs.getString(2).equals(username);
                    existsEmail = count > 0 && rs.getString(3).equals(email);
                }

            } catch (SQLException ex) {
                System.out.println(ex.getMessage());
            }

            // Create a response object with the results of the query
            String jsonResponse = "{\"existsUsername\": " + existsUsername + ", \"existsEmail\": " + existsEmail + "}";
            response.setContentType("application/json");
            response.setCharacterEncoding("UTF-8");
            response.getWriter().write(jsonResponse);
            
            
        }else if(action.equals("passwordCheck")){
            String password = jsonObject.getString("empCurentPwd");
            int empID = jsonObject.getInt("empID");
             boolean existsUsername = false;
            

            DAEmployee dae = new DAEmployee();
            ResultSet rs = dae.checkPasswordExist(password, empID);
            
            try {

                if (rs.next()) {
                    int count = rs.getInt(1);
                    existsUsername = count > 0 && rs.getString(2).equals(password);
                    System.out.println(rs.getInt(1));
                    System.out.println(rs.getString(2));
                }

            } catch (SQLException ex) {
                System.out.println(ex.getMessage());
            }
            System.out.println(existsUsername);
            String jsonResponse = "{\"existsUsername\": " + existsUsername + "}";
            response.setContentType("application/json");
            response.setCharacterEncoding("UTF-8");
            response.getWriter().write(jsonResponse);
            
        }else if(action.equals("cust")){
        String username = jsonObject.getString("username");
            String email = jsonObject.getString("email");

            // Set the default response object to indicate that both fields do not exist
            boolean existsUsername = false;
            boolean existsEmail = false;

            CustomerDA dae = new CustomerDA();
            ResultSet rs = dae.checkUsername_Email(username, email);

            try {

                if (rs.next()) {
                    int count = rs.getInt(1);
                    existsUsername = count > 0 && rs.getString(2).equals(username);
                    existsEmail = count > 0 && rs.getString(3).equals(email);
                }

            } catch (SQLException ex) {
                System.out.println(ex.getMessage());
            }

            // Create a response object with the results of the query
            String jsonResponse = "{\"existsUsername\": " + existsUsername + ", \"existsEmail\": " + existsEmail + "}";
            response.setContentType("application/json");
            response.setCharacterEncoding("UTF-8");
            response.getWriter().write(jsonResponse);
        
        
        }

    }

}
