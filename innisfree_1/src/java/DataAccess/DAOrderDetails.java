/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DataAccess;

import Domain.OrderDetails;
import Domain.Product;
import Domain.ProductCategory;
import Domain.ProductImage;
import static java.lang.System.out;
import java.sql.Blob;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Date;

/**
 *
 * @author Rex Lim
 */
public class DAOrderDetails {
     private String host = "jdbc:derby://localhost:1527/Innisfree";
    private String user = "nbuser";
    private String password = "nbuser";
    private Connection conn;
    private PreparedStatement stmt;
    
    
    public ArrayList<OrderDetails>getAllOrderDetailsByRow(int orderRow){
        ArrayList<OrderDetails> od = new ArrayList<>();
    
        try{
            createConnection();
            String sqll = "SELECT p.PRODNAME,od.ORDQTY,od.ORDPRICE from ORDERDETAILS od INNER JOIN PRODUCTLIST p on od.PRODID= p.PRODID where od.orderrow = ?";
            stmt = conn.prepareStatement(sqll);
            stmt.setInt(1, orderRow);
            ResultSet rs = stmt.executeQuery();
            while(rs.next()){
                
                OrderDetails od2 = new OrderDetails();
                Product p = new Product();
                p.setProdName(rs.getString(1));
                od2.setProduct(p);
                od2.setOrdQty(rs.getInt(2));
                od2.setOrdPrice(rs.getDouble(3));
                od.add(od2);
            }
        
        }catch(SQLException ex){}
        
        
        return od;
    }
    
    
    
    public ResultSet getTop5Prods(){
        ResultSet rs = null;
        try{
        createConnection();
        String sqll= "SELECT p.PRODNAME, p.PRODID, SUM(od.ORDQTY), SUM(od.ORDPRICE), pc.PRODCATNAME FROM orders o INNER JOIN ORDERDETAILS od ON o.ORDERROW = od.ORDERROW INNER JOIN PRODUCTLIST p ON p.PRODID = od.PRODID INNER JOIN PRODCATEGORY pc ON pc.PRODCATID = p.PRODCATID WHERE p.PRODID = od.PRODID GROUP BY p.PRODID, p.PRODNAME, pc.PRODCATNAME ORDER BY SUM(od.ORDQTY) DESC FETCH FIRST 5 ROWS ONLY";
        
        stmt = conn.prepareStatement(sqll);
        rs= stmt.executeQuery();
        
        }catch(SQLException ex){
        
        System.out.println(ex.getMessage());
        }
        
    
    
    return rs;
    }
    public ResultSet getLeast5Prods(){
        ResultSet rs = null;
        try{
        createConnection();
        String sqll= "SELECT p.PRODNAME, p.PRODID, SUM(od.ORDQTY), SUM(od.ORDPRICE), pc.PRODCATNAME FROM orders o INNER JOIN ORDERDETAILS od ON o.ORDERROW = od.ORDERROW INNER JOIN PRODUCTLIST p ON p.PRODID = od.PRODID INNER JOIN PRODCATEGORY pc ON pc.PRODCATID = p.PRODCATID WHERE p.PRODID = od.PRODID GROUP BY p.PRODID, p.PRODNAME, pc.PRODCATNAME ORDER BY SUM(od.ORDQTY) ASC FETCH FIRST 5 ROWS ONLY";
        
        stmt = conn.prepareStatement(sqll);
        rs= stmt.executeQuery();
        
        }catch(SQLException ex){
        
        System.out.println(ex.getMessage());
        }
        
    
    
    return rs;
    }
    
    
    
    public ArrayList<OrderDetails> salesRecordDate(){
    ArrayList<OrderDetails>lists = new ArrayList<>();
    try{
        
        
        String sqll= "SELECT P.PRODNAME, PC.PRODCATNAME, SUM(OD.ORDQTY), AQ.PRODAVAILABLE_QTY FROM ORDERDETAILS OD INNER JOIN PRODUCTLIST P ON OD.PRODID = P.PRODID INNER JOIN PRODCATEGORY PC ON PC.PRODCATID = P.PRODCATID INNER JOIN (SELECT PRODID, SUM(PRODAVAILABLE_QTY) AS PRODAVAILABLE_QTY FROM PRODUCTLIST GROUP BY PRODID) AQ ON AQ.PRODID = P.PRODID WHERE OD.ORDDECRDATE BETWEEN '2023-04-01 00:00:00' AND '2023-04-29 23:59:59' GROUP BY P.PRODID, P.PRODNAME, PC.PRODCATNAME, AQ.PRODAVAILABLE_QTY";
    
        stmt = conn.prepareStatement(sqll);
        
        ResultSet rs =stmt.executeQuery();
        
        while(rs.next()){
            OrderDetails od = new OrderDetails();
            
            Product p = new Product();
            p.setProdName(rs.getString(1));
            
            ProductCategory pc = new ProductCategory();
            pc.setProdCatName(rs.getString(2));
            p.setProdCat(pc);
            
            od.setProduct(p);
            od.setOrdQty(rs.getInt(3));
        
        lists.add(od);
        
        }
        
        
    
    }catch(SQLException ex){System.out.println(ex.getMessage());}
    
    return lists;
    }
    
    public ArrayList<OrderDetails> salesRecordMonth(){
    ArrayList<OrderDetails>lists = new ArrayList<>();
    try{
        
        
        String sqll= "SELECT P.PRODNAME, PC.PRODCATNAME, SUM(OD.ORDQTY), AQ.PRODAVAILABLE_QTY FROM ORDERDETAILS OD INNER JOIN PRODUCTLIST P ON OD.PRODID = P.PRODID INNER JOIN PRODCATEGORY PC ON PC.PRODCATID = P.PRODCATID INNER JOIN (SELECT PRODID, SUM(PRODAVAILABLE_QTY) AS PRODAVAILABLE_QTY FROM PRODUCTLIST GROUP BY PRODID) AQ ON AQ.PRODID = P.PRODID WHERE OD.ORDDECRDATE BETWEEN '2023-04-01 00:00:00' AND '2023-04-29 23:59:59' GROUP BY P.PRODID, P.PRODNAME, PC.PRODCATNAME, AQ.PRODAVAILABLE_QTY";
    
        stmt = conn.prepareStatement(sqll);
        
        ResultSet rs =stmt.executeQuery();
        
        while(rs.next()){
            OrderDetails od = new OrderDetails();
            
            Product p = new Product();
            p.setProdName(rs.getString(1));
            
            ProductCategory pc = new ProductCategory();
            pc.setProdCatName(rs.getString(2));
            p.setProdCat(pc);
            
            od.setProduct(p);
            od.setOrdQty(rs.getInt(3));
        
        lists.add(od);
        
        }
        
        
    
    }catch(SQLException ex){System.out.println(ex.getMessage());}
    
    return lists;
    }
    
    public ArrayList<OrderDetails> salesRecordYear(int year){
    ArrayList<OrderDetails>lists = new ArrayList<>();
    try{
        
        
        String sqll= "SELECT P.PRODNAME, PC.PRODCATNAME, SUM(OD.ORDQTY), AQ.PRODAVAILABLE_QTY FROM ORDERDETAILS OD INNER JOIN PRODUCTLIST P ON OD.PRODID = P.PRODID INNER JOIN PRODCATEGORY PC ON PC.PRODCATID = P.PRODCATID INNER JOIN (SELECT PRODID, SUM(PRODAVAILABLE_QTY) AS PRODAVAILABLE_QTY FROM PRODUCTLIST GROUP BY PRODID) AQ ON AQ.PRODID = P.PRODID WHERE YEAR(OD.ORDDECRDATE) = ? GROUP BY P.PRODID, P.PRODNAME, PC.PRODCATNAME, AQ.PRODAVAILABLE_QTY";
    
        stmt = conn.prepareStatement(sqll);
        stmt.setInt(1,year);
        
        ResultSet rs =stmt.executeQuery();
        
        while(rs.next()){
            OrderDetails od = new OrderDetails();
            
            Product p = new Product();
            p.setProdName(rs.getString(1));
            
            ProductCategory pc = new ProductCategory();
            pc.setProdCatName(rs.getString(2));
            p.setProdCat(pc);
            
            od.setProduct(p);
            od.setOrdQty(rs.getInt(3));
        
        lists.add(od);
        
        }
        
        
    
    }catch(SQLException ex){System.out.println(ex.getMessage());}
    
    return lists;
    }
  
    
           public int addOrderDetail(OrderDetails od) {

        try {
            createConnection();
            String sqll = "INSERT INTO ORDERDETAILS (ORDERROW,PRODID,ORDQTY,ORDPRICE,ORDDECRDATE,ORDERCRBY,ORDERUPDATE,ORDERUPBY) values(?,?,?,?,?,?,?,?)";
            stmt = conn.prepareStatement(sqll);
            stmt.setInt(1, od.getOrderRow());
            stmt.setInt(2, od.getProdID());
            stmt.setInt(3, od.getOrdQty());
            stmt.setDouble(4, od.getOrdPrice());
            stmt.setTimestamp(5, od.getOrderCrDate());
            stmt.setString(6, od.getOrderCrBy());
            stmt.setTimestamp(7, od.getOrderUpDate());
            stmt.setString(8, od.getOrderUpBy());

            int row = stmt.executeUpdate();
            if (row > 0) {
                shutDown();
                return 1;

            } else {
                shutDown();
                return 0;
            }
        } catch (SQLException ex) {
            out.println("ERROR: " + ex.toString() + "<br /><br />");
            return 0;
        }

    }
    
       
           public ArrayList<OrderDetails> getAllOrderDetailsByOrderRow(int orderrow) {
        ArrayList<OrderDetails> orderDetails = new ArrayList<>();

        try {
            createConnection();
            //SELECT C.CARTID, CD.CARTDETAILID, CD.PRODID, CD.CARTDETAILQTY, PL.PRODNAME, PL.PROD_FINALPRICE, (SELECT PI.PRODIMG FROM PRODIMAGE PI WHERE PI.PRODID = PL.PRODID FETCH FIRST 1 ROWS ONLY) AS PRODIMG FROM CART AS C INNER JOIN CARTDETAIL CD ON C.CARTID = CD.CARTID INNER JOIN PRODUCTLIST PL ON CD.PRODID = PL.PRODID WHERE C.CUSTID =100001;
//            String sqll = "SELECT C.CARTID, CD.CARTDETAILID, CD.PRODID, CD.CARTDETAILQTY, PL.PRODNAME, PL.PROD_FINALPRICE, (SELECT PI.PRODIMG FROM PRODIMAGE PI WHERE PI.PRODID = PL.PRODID FETCH FIRST 1 ROWS ONLY) AS PRODIMG FROM CART AS C INNER JOIN CARTDETAIL CD ON C.CARTID = CD.CARTID INNER JOIN PRODUCTLIST PL ON CD.PRODID = PL.PRODID WHERE C.CUSTID =?";
String sqll = "SELECT OD.PRODID, OD.ORDQTY, OD.ORDPRICE, PL.PRODNAME, (SELECT PI.PRODIMG FROM PRODIMAGE PI WHERE PI.PRODID = PL.PRODID FETCH FIRST 1 ROWS ONLY) AS PRODIMG FROM ORDERDETAILS AS OD INNER JOIN PRODUCTLIST PL ON OD.PRODID = PL.PRODID WHERE OD.ORDERROW = ?";
//            String sqll = "SELECT C.CARTID, CD.CARTDETAILID, CD.PRODID, CD.CARTDETAILQTY, PL.PRODNAME, PL.PROD_FINALPRICE, \n"
//                    + "(SELECT PI.PRODIMG FROM PRODIMAGE PI WHERE PI.PRODID = PL.PRODID FETCH FIRST 1 ROWS ONLY) AS PRODIMG\n"
//                    + "FROM CART AS C \n"
//                    + "INNER JOIN CARTDETAIL CD ON C.CARTID = CD.CARTID \n"
//                    + "INNER JOIN PRODUCTLIST PL ON CD.PRODID = PL.PRODID \n"
//                    + "WHERE C.CUSTID =?";

            stmt = conn.prepareStatement(sqll);
            stmt.setInt(1, orderrow);
            ResultSet rs = stmt.executeQuery();

            while (rs.next()) {
                OrderDetails od = new OrderDetails();
                Product pl = new Product();
                ProductImage pi = new ProductImage();

                od.setProdID(rs.getInt(1));
                od.setOrdQty(rs.getInt(2));
                od.setOrdPrice(rs.getDouble(3));
                pl.setProdName(rs.getString(4));
                // pi.setProdImg(rs.getBlob(7));
                Blob blob = rs.getBlob(5);
                byte[] imageData = blob.getBytes(1, (int) blob.length());
                pi.setGetImg(imageData);

                od.setProduct(pl);
                od.setProductImage(pi);

                orderDetails.add(od);
                // cd.getCart().getcartID();   //array list

            }

        } catch (SQLException ex) {
        }
        return orderDetails;
    }
            
           
           
           public Product getProductAvailableQTYByProdID(int prodid) {
        Product p = new Product();
        try {

            createConnection();
            ResultSet rs = null;
            String sqll = "SELECT PRODAVAILABLE_QTY FROM PRODUCTLIST WHERE PRODID = ?";
            stmt = conn.prepareStatement(sqll);
            stmt.setInt(1, prodid);
            rs = stmt.executeQuery();

            if (rs.next()) {

                p.setProdAvailable_Qty(rs.getInt(1));

            }

        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        shutDown();
        return p;
    }

    public void updateProductAvailableQty(int prodid, int cartdetailqty, int prodavailableqty) {

        try {
            Date date = new Date();
            Timestamp OrderUpDate = new Timestamp(date.getTime());
            createConnection();
            String sqll = "UPDATE PRODUCTLIST SET PRODAVAILABLE_QTY = ?, PRODUPDATE = ? WHERE PRODID = ?";
            stmt = conn.prepareStatement(sqll);
            stmt.setInt(1, prodavailableqty - cartdetailqty);
            stmt.setTimestamp(2, OrderUpDate);
            stmt.setInt(3, prodid);

            stmt.executeUpdate();

        } catch (SQLException ex) {
            out.println("ERROR: " + ex.toString() + "<br /><br />");
        }
        shutDown();
    }

           
    private void shutDown() {
        if (conn != null) {
            try {
                conn.close();
            } catch (SQLException ex) {

            }
        }
    }
    
    private void createConnection() {
        try {
            conn = DriverManager.getConnection(host, user, password);
            System.out.println("TRACE: Connection established.");
        } catch (SQLException ex) {
            //display error when catch error message
            System.out.println("ERROR: " + ex.getMessage());
        }
    }
}
