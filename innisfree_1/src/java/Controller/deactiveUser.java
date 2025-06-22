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
@WebServlet(name = "deactiveUser", urlPatterns = {"/deactiveUser"})
public class deactiveUser extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("application/json");

        HttpSession session = request.getSession();
        Employee c = (Employee) session.getAttribute("EmpLogin");
        Date date = new Date();
        Timestamp empUpDate = new Timestamp(date.getTime());

        BufferedReader reader = request.getReader();
        String jsonData = "";
        String line;
        while ((line = reader.readLine()) != null) {
            jsonData += line;
        }

        // Parse the JSON data
        JSONObject jsonObject = new JSONObject(jsonData);
        int empID = jsonObject.getInt("empID");
        String empName = jsonObject.getString("empName");
        String deactive = "Deactive";

        Employee e = new Employee();
        e.setEmpUpDate(empUpDate);
        e.setEmpUpBy(c.getEmpUsername());
        e.setEmpID(empID);
        e.setEmpStatus(deactive);
        
        
        DAEmployee dae = new DAEmployee();
        int row = dae.deactiveActiveUser(e);

        JSONObject jsonResponse = new JSONObject();
        if (row > 0) {
            jsonResponse.put("status", "success");
            jsonResponse.put("message", "User: ' " + empName + " ' Deactive Successfully!!!");
        } else {
            jsonResponse.put("status", "error");
            jsonResponse.put("message", "User: ' " + empName + " ' Deactive UnSuccessfully!!!");
        }
        response.setContentType("application/json");
        PrintWriter out = response.getWriter();
        out.print(jsonResponse.toString());
        out.flush();

    }

}
