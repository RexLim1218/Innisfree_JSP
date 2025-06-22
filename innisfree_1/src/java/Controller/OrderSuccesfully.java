/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import DataAccess.DACartDetail;
import DataAccess.*;

import Domain.*;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Date;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author User
 */
@WebServlet(name = "OrderSuccesfully", urlPatterns = {"/OrderSuccesfully"})
@MultipartConfig
public class OrderSuccesfully extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        PrintWriter out = response.getWriter();

        String name = request.getParameter("name");
        String phone = request.getParameter("phone");
        String addressdetail = request.getParameter("addressdetail");
        String town = request.getParameter("town");
        String state = request.getParameter("state");
        String zipcode = request.getParameter("zipcode");
        String paymentMethod = request.getParameter("paymentMethod");
        int addressid = Integer.parseInt(request.getParameter("address").toString());
        System.out.println("ADDRESS STATE:   " + addressid);

//        String prodname = request.getParameter("prodname");
//        int prodid = Integer.parseInt(request.getParameter("prodid"));
//        String prodfinalprice = request.getParameter("prodfinalprice");
//        int cartdetailid = Integer.parseInt(request.getParameter("cartdetailid"));
//        String cartdetailqty = request.getParameter("cartdetailqty");
        
HttpSession session = request.getSession();
                 Customer c = (Customer) session.getAttribute("customerLogin");
        String custname = c.getCustName();
        System.out.println("CustName:" + custname);
        int custid = c.getCustID();


        double subtotal = Double.parseDouble(request.getParameter("subtotal"));
        double shippingfee = Double.parseDouble(request.getParameter("shippingfee"));
        double totalamount = Double.parseDouble(request.getParameter("totalamount"));

        

//            out.print(name);
        DAOrders dao = new DAOrders();
        int orderRow = dao.getOrderRow();

        Orders o = new Orders();
        String orderid = o.generateOrderID(orderRow);
        Date date = new Date();
        Timestamp orderCrDate = new Timestamp(date.getTime());
        Timestamp OrderUpDate = new Timestamp(date.getTime());
        String orderstatus = "Successful";

        o.setOrderNo(orderid);
        o.setCustID(custid);
        o.setOrderCrDate(orderCrDate);
        o.setOrderCrBy(custname);
        o.setOrderUpDate(OrderUpDate);
        o.setOrderUpBy(custname);
        o.setOrderTtlAmt(subtotal);
        o.setOrder_Status(orderstatus);

        int row2 = dao.addOrder(o);

        //USE USER ID TO GET CART ID 
        DACart dac = new DACart();
        Cart ca = dac.getCartIDBycustID2(custid);
        int cartid = ca.getcartID();
//        out.println(c.getcartID());
        System.out.println("paymentmethod:" +paymentMethod);

        //get order row
        int orderRow2 = dao.getOrderRow2();

        //cart id to get cart detial
        //for loop (cartdetail)
        DACartDetail dacd = new DACartDetail();
        ArrayList<CartDetail> cartProductList = dacd.getAllCartDetailByCartID2(cartid);
        for (CartDetail cartdetail : cartProductList) {
            //inser into order detail
            DAOrderDetails daod = new DAOrderDetails();
            OrderDetails od = new OrderDetails();

            od.setOrderRow(orderRow2);
            od.setProdID(cartdetail.getprodID());
            od.setOrdQty(cartdetail.getcartDetailQty());
            od.setOrdPrice(cartdetail.getorderPrice());
            od.setOrderCrDate(orderCrDate);
            od.setOrderCrBy(custname);
            od.setOrderUpDate(OrderUpDate);
            od.setOrderUpBy(custname);

            int row3 = daod.addOrderDetail(od);

         int prodid = cartdetail.getprodID();
           int cartdetailqty = cartdetail.getcartDetailQty();
           
            //get product available qty from productlist (cartdetail.getprodID())
               Product p = daod.getProductAvailableQTYByProdID(prodid);
               int prodavailableqty = p.getProdAvailable_Qty();

            
            //update the product available qty (prodid and cartdetailqty)
            daod.updateProductAvailableQty(prodid, cartdetailqty, prodavailableqty);


        }

        //insert payment
           DAPayment dap = new DAPayment();
            Payment pay = new Payment();

            pay.setOrderRow(orderRow2);
            pay.setPaymentAmount(totalamount);
            pay.setDeliveryFee(shippingfee);
            pay.setPaymentMethod(paymentMethod);
            pay.setPaymentDate(orderCrDate);
            pay.setTransaction_ID(pay.generateTransactionID());
            pay.setIs_Deleted(false);
        

            int row4 = dap.addPayment(pay);
            
            //insert delivery 
            DADeliveryStatus dads = new DADeliveryStatus();
            DeliveryStatus ds = new DeliveryStatus();
            
            String stat="Pending";
            String details="The order is PENDING...";
            
            ds.setOrderRow(orderRow2);
            ds.setAddressID(addressid);
            ds.setDeliveryStatus(stat);
            ds.setDeliveryDetails(details);
            ds.setDel_CrDate(orderCrDate);
            ds.setDel_CrBy(custname);
            ds.setDel_UpDate(OrderUpDate);
            ds.setDel_UpBy(custname);
            
            
            System.out.println(ds.getOrderRow());
            System.out.println(ds.getAddressID());
            System.out.println(ds.getDeliveryStatus());
            System.out.println(ds.getDeliveryDetails());
            System.out.println(ds.getDel_CrDate());
            System.out.println(ds.getDel_CrBy());
            System.out.println(ds.getDel_UpDate());
            System.out.println(ds.getDel_UpBy());
            
             int row5 = dads.addDelivery(ds);
            
        //delete cartdetail 
       dacd.removeCartListProduct2(cartid);
    }

}
