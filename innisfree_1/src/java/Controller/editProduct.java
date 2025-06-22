/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import DataAccess.DAProduct;
import DataAccess.DAProductImage;
import Domain.Customer;
import Domain.Employee;
import Domain.Product;
import Domain.ProductImage;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.Date;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

/**
 *
 * @author Rex Lim
 */
@WebServlet(name = "editProduct", urlPatterns = {"/editProduct"})
@MultipartConfig
public class editProduct extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        PrintWriter out = response.getWriter();
        HttpSession session = request.getSession();
        Employee c = (Employee) session.getAttribute("EmpLogin");

        System.out.println(c.getPosition());
        
        if (c.getPosition().equals("Manager")) {

            Date date = new Date();

            int prodID = Integer.parseInt(request.getParameter("prodID"));
            int prodCatID = Integer.parseInt(request.getParameter("prodCatInNP"));

            String prodName = request.getParameter("prodName");
            Timestamp prodUpDate = new Timestamp(date.getTime());
            String prodUpBy = c.getEmpUsername();

            String prodDesc = request.getParameter("prodDesc");
            String prodManual = request.getParameter("prodManual");
            String prodIngredients = request.getParameter("prodIngredients");
            int prodAvailable_Qty = Integer.parseInt(request.getParameter("prodAvailable_Qty"));
            int discount = Integer.parseInt(request.getParameter("discount"));
            double prod_OriPrice = Double.parseDouble(request.getParameter("prod_OriPrice"));
            double prod_FinalPrice = Double.parseDouble(request.getParameter("prod_FinalPrice"));
            String prod_Status = request.getParameter("prod_Status");

            Product prod = new Product();

            prod.setProdID(prodID);
            prod.setProdCatID(prodCatID);
            prod.setProdName(prodName);
            prod.setProdUpDate(prodUpDate);
            prod.setProdUpBy(prodUpBy);
            prod.setProdDesc(prodDesc);
            prod.setProdManual(prodManual);
            prod.setProdIngredients(prodIngredients);
            prod.setProdAvailable_Qty(prodAvailable_Qty);
            prod.setDiscount(discount);
            prod.setProd_OriPrice(prod_OriPrice);
            prod.setProd_FinalPrice(prod_FinalPrice);
            prod.setProd_Status(prod_Status);

            int row = 0;

            try {
                DAProduct daProd = new DAProduct();

                row = daProd.updateProd(prod);
            } catch (SQLException ex) {
                response.setContentType("application/json");
                response.setCharacterEncoding("UTF-8");
                response.getWriter().write("{\"message\": \"Data Update VELI UNSUCCESSFUL\"}");
            }

            if (row > 0) {

                int prodImgID1 = Integer.parseInt(request.getParameter("prodImgID1"));
                int prodImgID2 = Integer.parseInt(request.getParameter("prodImgID2"));

                int useDDAImg1 = Integer.parseInt(request.getParameter("useDDAImg1"));
                int useDDAImg2 = Integer.parseInt(request.getParameter("useDDAImg2"));

                if (useDDAImg1 == 1 && useDDAImg2 == 1) {
                    DAProductImage dpi = new DAProductImage();

                    int updateTIMEonly1 = dpi.updateDateOnly(prodImgID1, prodUpBy, prodUpDate);
                    int updateTIMEonly2 = dpi.updateDateOnly(prodImgID2, prodUpBy, prodUpDate);

                } else if (useDDAImg1 == 0 && useDDAImg2 == 0) {
                    Part filePart1 = request.getPart("prodImg1");
                    Part filePart2 = request.getPart("prodImg2");
                    DAProductImage daProdImg = new DAProductImage();
                    ProductImage i1 = daProdImg.changeToBlobFORUPDATE(prodImgID1, prodUpDate, prodUpBy, filePart1);
                    ProductImage i2 = daProdImg.changeToBlobFORUPDATE(prodImgID2, prodUpDate, prodUpBy, filePart2);
                    int updateTIMEonly1 = daProdImg.updateUsingID(i1);
                    int updateTIMEonly2 = daProdImg.updateUsingID(i2);

                } else if (useDDAImg1 == 1 && useDDAImg2 == 0) {

                    DAProductImage dpi = new DAProductImage();

                    int updateTIMEonly1 = dpi.updateDateOnly(prodImgID1, prodUpBy, prodUpDate);

                    Part filePart2 = request.getPart("prodImg2");
                    ProductImage i2 = dpi.changeToBlobFORUPDATE(prodImgID2, prodUpDate, prodUpBy, filePart2);

                    int updateTIMEonly2 = dpi.updateUsingID(i2);

                } else if (useDDAImg1 == 0 && useDDAImg2 == 1) {

                    DAProductImage dpi = new DAProductImage();

                    int updateTIMEonly2 = dpi.updateDateOnly(prodImgID2, prodUpBy, prodUpDate);

                    Part filePart1 = request.getPart("prodImg1");
                    ProductImage i1 = dpi.changeToBlobFORUPDATE(prodImgID1, prodUpDate, prodUpBy, filePart1);

                    int updateTIMEonly1 = dpi.updateUsingID(i1);

                }

                response.setContentType("application/json");
                response.setCharacterEncoding("UTF-8");
                response.getWriter().write("{\"message\": \"Data Update successful\"}");
            } else {
                response.setContentType("application/json");
                response.setCharacterEncoding("UTF-8");
                response.getWriter().write("{\"message\": \"Data Update UNSUCCESSFUL\"}");
            }

        } else {
            Date date = new Date();
            Timestamp prodUpDate = new Timestamp(date.getTime());
            String prodUpBy = c.getEmpUsername();
            int prodAvailable_Qty = 0;
            int prodID = Integer.parseInt(request.getParameter("prodID"));
            if(request.getParameter("prodAvailable_Qty")!=null){
                prodAvailable_Qty=Integer.parseInt(request.getParameter("prodAvailable_Qty"));
            }else{
            
            prodAvailable_Qty=Integer.parseInt(request.getParameter("qtyhidden"));
            }
            System.out.println(prodAvailable_Qty);
            
            Product prod = new Product();
            prod.setProdID(prodID);
            prod.setProdUpDate(prodUpDate);
            prod.setProdUpBy(prodUpBy);
            
            prod.setProdAvailable_Qty(prodAvailable_Qty);
            
            DAProduct daProd = new DAProduct();
int row=0;
            try {
                row = daProd.updateProdQty(prod);
            } catch (SQLException ex) {
                Logger.getLogger(editProduct.class.getName()).log(Level.SEVERE, null, ex);
            }
            if(row>0){
            response.setContentType("application/json");
                response.setCharacterEncoding("UTF-8");
                response.getWriter().write("{\"message\": \"Product Update Successfully\"}");
            
            }else{
            
            response.setContentType("application/json");
                response.setCharacterEncoding("UTF-8");
                response.getWriter().write("{\"message\": \"Hidden\"}");
            }
        }
    }

}
