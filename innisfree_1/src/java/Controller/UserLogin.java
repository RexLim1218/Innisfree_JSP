/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import Domain.Employee;
import DataAccess.*;
import java.io.BufferedReader;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
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
@WebServlet(name = "UserLogin", urlPatterns = {"/UserLogin"})
public class UserLogin extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
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

        String empUsername = jsonObject.getString("empUsername");
        String empPwd = jsonObject.getString("empPwd");
        System.out.println(empUsername);
        System.out.println(empPwd);

        try {

            DAEmployee daEmp = new DAEmployee();

            System.out.println(empUsername);
            System.out.println(empPwd);

            Employee e = daEmp.login(empUsername, empPwd);

            JSONObject jsonResponse = new JSONObject();

            if (e.getEmpUsername() != null) { //dont write c!=null, need write c.getUserName!=null or the c.getPasswd so that it can compare the value, if c!=null, it cannot be compared!!!!

                HttpSession session = request.getSession();
                session.setAttribute("EmpLogin", e);
                jsonResponse.put("status", "success");
                jsonResponse.put("message", "Login Successfully!!!");

            } else {

                jsonResponse.put("status", "error");
                jsonResponse.put("message", "Login UNSuccessfully!!!");
            }
            response.setContentType("application/json");

            out.print(jsonResponse.toString());
            out.flush();

        } catch (NullPointerException ex) {
            out.println("ERROR" + ex.toString() + "<br/><br/>");
            StackTraceElement[] elements = ex.getStackTrace();
            for (StackTraceElement e : elements) {
                out.println("File Name: " + e.getFileName() + "<br/>");
                out.println("Class Name: " + e.getClassName() + "<br/>");
                out.println("Method Name: " + e.getMethodName() + "<br/>");
                out.println("Line Number: " + e.getLineNumber() + "<br/><br/>");
            }
        } catch (SQLException ex) {
            Logger.getLogger(UserLogin.class.getName()).log(Level.SEVERE, null, ex);
        }

    }

}
