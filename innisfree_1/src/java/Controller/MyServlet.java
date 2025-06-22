/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import DataAccess.DAOrderDetails;
import DataAccess.DAOrders;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.json.JSONArray;
import org.json.JSONObject;

/**
 *
 * @author Rex Lim
 */
@WebServlet(name = "MyServlet", urlPatterns = {"/MyServlet"})
public class MyServlet extends HttpServlet {

    @Override
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        JSONArray jsonArray = new JSONArray();

        DAOrderDetails daod = new DAOrderDetails();

        ResultSet rs = daod.getTop5Prods();

        try {
            while (rs.next()) {
                JSONObject jsonObj = new JSONObject();
                jsonObj.put("name", rs.getString("name"));
                jsonObj.put("sales", rs.getInt("sales"));
                jsonArray.put(jsonObj);
            }

            // Convert data to JSON string
            String jsonString = jsonArray.toString();

            // Set response headers
            response.setContentType("application/json");
            response.setCharacterEncoding("UTF-8");

            // Send JSON response to client
            PrintWriter out = response.getWriter();
            out.print(jsonString);
            out.flush();

        } catch (SQLException ex) {

            System.out.println(ex.getMessage());
        }
    }

}
