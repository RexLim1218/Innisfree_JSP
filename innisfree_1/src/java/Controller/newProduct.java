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
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.sql.Blob;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.Date;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;
import javax.sql.rowset.serial.SerialBlob;

/**
 *
 * @author Rex Lim
 */
@WebServlet(name = "newProduct", urlPatterns = {"/newProduct"})
@MultipartConfig
public class newProduct extends HttpServlet {

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

        Date date = new Date();

        //For the productlist 
        int prodCatID = Integer.parseInt(request.getParameter("prodCatInNP"));
        String prodName = request.getParameter("prodName");
        Timestamp prodCrDate = new Timestamp(date.getTime());
        String prodCrBy = c.getEmpUsername();
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
        boolean isDeleted = false;

//        out.println(prodCatID);
//        out.println(prodName);
//        out.println(prodCrDate);
//        out.println(prodCrBy);
//        out.println(prodUpDate);
//        out.println(prodUpBy);
//        out.println(prodDesc);
//        out.println(prodManual);
//        out.println(prodIngredients);
//        out.println(prodAvailable_Qty);
//        out.println(discount);
//        out.println(prod_OriPrice);
//        out.println(prod_FinalPrice);
//        out.println(prod_Status);
//        out.println(isDeleted);
        Product prod = new Product();

        prod.setProdCatID(prodCatID);
        prod.setProdName(prodName);
        prod.setProdCrDate(prodCrDate);
        prod.setProdCrBy(prodCrBy);
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
        prod.setIsdeleted(isDeleted);

        // InputStream inputStream = null;
        //for prodimage 1
        int prodID;
        Timestamp prodImgCrDate = new Timestamp(date.getTime());
        String prodImgCrBy = c.getEmpUsername();
        Timestamp prodImgUpDate = new Timestamp(date.getTime());
        String prodImgUpBy = c.getEmpUsername();
        Part filePart1 = request.getPart("prodImg1");
        Part filePart2 = request.getPart("prodImg2");

        String prodImg_Status = "Active";

        DAProduct daProd = new DAProduct();
        int row = daProd.insertProd(prod);
        if (row > 0) {

            prodID = daProd.selectProdID();

            DAProductImage daProdImg = new DAProductImage();
            ProductImage i1 = daProdImg.changeToBlob(prodID, prodImgCrDate, prodImgCrBy, prodImgUpDate, prodImgUpBy, filePart1, prodImg_Status);
            ProductImage i2 = daProdImg.changeToBlob(prodID, prodImgCrDate, prodImgCrBy, prodImgUpDate, prodImgUpBy, filePart2, prodImg_Status);

            int img1 = daProdImg.insertImage(i1);
            int img2 = daProdImg.insertImage(i2);

            if (img1 > 0 && img2 > 0) {
                response.setContentType("application/json");
                response.setCharacterEncoding("UTF-8");
                response.getWriter().write("{\"message\": \"All data Update successful\"}");
            } else {
                response.setContentType("application/json");
                response.setCharacterEncoding("UTF-8");
                response.getWriter().write("{\"message\": \"Image Update Unsucessully\"}");
            }

        } else {
            response.setContentType("application/json");
            response.setCharacterEncoding("UTF-8");
            response.getWriter().write("{\"message\": \"All Data Update UNSUCCESSFULLY\"}");
        }

    }

//    public ProductImage changeToBlob(int prodId, Timestamp prodImgCrDate, String prodImgCrBy, Timestamp prodImgUpDate, String prodImgUpBy, Part filePart, String prodImg_Status) throws IOException {
//        InputStream inputStream = null;
//
//        ProductImage pi = new ProductImage();
//
//        if (filePart != null) {
//            inputStream = filePart.getInputStream();
//        }
//        byte[] imageData = null;
//        if (inputStream != null) {
//            ByteArrayOutputStream outputStream = new ByteArrayOutputStream();
//            byte[] buffer = new byte[4096];
//            int bytesRead = -1;
//            while ((bytesRead = inputStream.read(buffer)) != -1) {
//                outputStream.write(buffer, 0, bytesRead);
//            }
//            imageData = outputStream.toByteArray();
//        }
//        Blob image = null;
//        if (imageData != null) {
//            try {
//                image = new SerialBlob(imageData);
//            } catch (SQLException ex) {
//
//            }
//        }
//
//        pi.setProdID(prodId);
//        pi.setProdImgCrDate(prodImgCrDate);
//        pi.setProdImgCrBy(prodImgCrBy);
//        pi.setProdImgUpDate(prodImgUpDate);
//        pi.setProdImgUpBy(prodImgUpBy);
//        pi.setProdImg(image);
//        pi.setProdImg_Status(prodImg_Status);
//        return pi;
//    }

}
