/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import DataAccess.DAEmployee;
import Domain.Employee;
import java.io.BufferedReader;
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
import org.json.JSONObject;

/**
 *
 * @author Rex Lim
 */
@WebServlet(name = "editUser", urlPatterns = {"/editUser"})
public class editUser extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("application/json");

        PrintWriter out = response.getWriter();

        BufferedReader reader = request.getReader();
        String jsonData = "";
        String line;
        while ((line = reader.readLine()) != null) {
            jsonData += line;
        }

        // Parse the JSON data
        JSONObject jsonObject = new JSONObject(jsonData);

        // Retrieve the values of the individual keys
        HttpSession session = request.getSession();
        Employee c = (Employee) session.getAttribute("EmpLogin");

        Employee e = new Employee();
        System.out.println(c.getEmpUsername());
        Date date = new Date();

        Timestamp empUpDate = new Timestamp(date.getTime());
        String empBUpy = c.getEmpUsername();

        int empID = jsonObject.getInt("empID");
        String empName = jsonObject.getString("empName");
        String empemail = jsonObject.getString("empemail");
        String empHp = jsonObject.getString("empHp");

        e.setEmpID(empID);
        e.setEmpUpDate(empUpDate);
        e.setEmpUpBy(empBUpy);
        e.setEmpName(empName);
        e.setEmpEmail(empemail);
        e.setEmpHp(empHp);

        DAEmployee dae = new DAEmployee();
        int row = dae.updateUser(e);

        JSONObject jsonResponse = new JSONObject();
        if (row > 0) {
            jsonResponse.put("status", "success");
            jsonResponse.put("message", "Name: < " + empName + " > Updated Successfully!!!");

        } else {
            jsonResponse.put("status", "error");
            jsonResponse.put("message", "Name: < " + empName + " > Updated UNSuccessfully!!!");

        }
        // Send the JSON response back to the client
        response.setContentType("application/json");

        out.print(jsonResponse.toString());
        out.flush();

    }

}
