/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.util.logging.Level;
import java.util.logging.Logger;
import java.util.stream.Collectors;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.json.JSONException;
import org.json.JSONObject;
import org.json.simple.JSONValue;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;

/**
 *
 * @author Rex Lim
 */
@WebServlet(name = "tryName", urlPatterns = {"/tryName"})
public class tryName extends HttpServlet {

    private static final long serialVersionUID = 1L;

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


        // Parse the JSON data
        JSONObject jsonObject = new JSONObject(jsonData);

        // Retrieve the values of the individual keys
        String prodCatName2 = jsonObject.getString("prodCatName2");
        String prodCatDesc2 = jsonObject.getString("prodCatDesc2");
        String prodCat_Status2 = jsonObject.getString("prodCat_Status2");

        
             // Process the extracted data as needed
        System.out.println("prodCatName2: " + prodCatName2);
        System.out.println("prodCatDesc2: " + prodCatDesc2);
        System.out.println("prodCat_Status2: " + prodCat_Status2);
        
        JSONObject jsonResponse = new JSONObject();
        jsonResponse.put("status", "success");
        jsonResponse.put("message", "Data Update Successfully!!!");

        // Send the JSON response back to the client
        response.setContentType("application/json");
        PrintWriter out = response.getWriter();
        out.print(jsonResponse.toString());
        out.flush();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }
}
