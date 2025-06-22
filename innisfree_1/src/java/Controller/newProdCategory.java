package Controller;

import DataAccess.DAProductCategory;
import Domain.Customer;
import Domain.Employee;
import Domain.ProductCategory;
import java.io.BufferedReader;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Timestamp;
import java.util.Date;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
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
@WebServlet(name = "newProdCategory", urlPatterns = {"/newProdCategory"})
@MultipartConfig
public class newProdCategory extends HttpServlet {

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

        Date date = new Date();
        Timestamp prodCatCrDate = new Timestamp(date.getTime());
        String prodCatCrBy = c.getEmpUsername();
        Timestamp prodCatUpDate = new Timestamp(date.getTime());
        String prodCatUpBy = c.getEmpUsername();
        String prodCatName = jsonObject.getString("prodCatName");
        String prodCatDesc = jsonObject.getString("prodCatDesc");
        String prodCat_Status = jsonObject.getString("prodCat_Status");
        Boolean isdeleted = false;

        ProductCategory prodCategory = new ProductCategory();

        prodCategory.setProdCatCrDate(prodCatCrDate);
        prodCategory.setProdCatCrBy(prodCatCrBy);
        prodCategory.setProdCatUpDate(prodCatUpDate);
        prodCategory.setProdCatUpBy(prodCatUpBy);
        prodCategory.setProdCatName(prodCatName);
        prodCategory.setProdCatDesc(prodCatDesc);
        prodCategory.setProdCat_Status(prodCat_Status);
        prodCategory.setIsdeleted(isdeleted);

        DAProductCategory da = new DAProductCategory();
        int row = da.addProdCategory(prodCategory);

       
        JSONObject jsonResponse = new JSONObject();

        if (row > 0) {
            jsonResponse.put("status", "success");
            jsonResponse.put("message", "Category: < " + prodCatName + " > Added Successfully!!!");
        } else {
            jsonResponse.put("status", "success");
            jsonResponse.put("message", "Data Update UN-Successfully!!!");

        }

        // Send the JSON response back to the client
        response.setContentType("application/json");

        out.print(jsonResponse.toString());
        out.flush();

    }

}
