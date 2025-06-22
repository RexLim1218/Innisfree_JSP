/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DataAccess;

import Domain.Address;
import Domain.DeliveryStatus;
import Domain.OrderDetails;
import Domain.Orders;
import Domain.Payment;
import Domain.Product;
import Domain.ProductCategory;
import static java.lang.System.out;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Rex Lim
 */
public class DAOrders {

    private String host = "jdbc:derby://localhost:1527/Innisfree";
    private String user = "nbuser";
    private String password = "nbuser";
    private Connection conn;
    private PreparedStatement stmt;

    public DAOrders() {
    }

    public ArrayList<Orders> getAllOrder() {

        ArrayList<Orders> o = new ArrayList<>();

        try {
            createConnection();
            ResultSet rs = null;
            String sqll = "select o.orderrow,orderno,custid,ordercrdate,ordercrby,orderupdate,orderupby,orderttlamt,trackingno,order_status,deliveryid,deliverystatus from orders o inner join deliverystatus d on o.ORDERROW = d.ORDERROW";
            stmt = conn.prepareStatement(sqll);
            rs = stmt.executeQuery();

            while (rs.next()) {

                DeliveryStatus ds = new DeliveryStatus();
                ds.setDeliveryID(rs.getInt(11));
                ds.setDeliveryStatus(rs.getString(12));

                o.add(new Orders(rs.getInt(1), rs.getString(2), rs.getInt(3), rs.getTimestamp(4), rs.getString(5), rs.getTimestamp(6), rs.getString(7), rs.getDouble(8), rs.getString(9), rs.getString(10), ds));

            }

        } catch (SQLException ex) {
            System.out.println(ex.getMessage());

        }

        return o;
    }

    public ArrayList<Orders> get5LatestOrder() {

        ArrayList<Orders> o = new ArrayList<>();

        try {
            createConnection();
            ResultSet rs = null;
            String sqll = "select o.orderrow,orderno,custid,ordercrdate,ordercrby,orderupdate,orderupby,orderttlamt,trackingno,order_status,deliveryid,deliverystatus from orders o inner join deliverystatus d on o.ORDERROW = d.ORDERROW order by o.ORDERUPDATE desc fetch first 5 rows only";
            stmt = conn.prepareStatement(sqll);
            rs = stmt.executeQuery();

            while (rs.next()) {

                DeliveryStatus ds = new DeliveryStatus();
                ds.setDeliveryID(rs.getInt(11));
                ds.setDeliveryStatus(rs.getString(12));

                o.add(new Orders(rs.getInt(1), rs.getString(2), rs.getInt(3), rs.getTimestamp(4), rs.getString(5), rs.getTimestamp(6), rs.getString(7), rs.getDouble(8), rs.getString(9), rs.getString(10), ds));

            }

        } catch (SQLException ex) {
            System.out.println(ex.getMessage());

        }

        return o;
    }

    public double getTotalEarningOnDay() {

        double totalEarning = 0.00;
        try {

            String sqll = "SELECT SUM(orderttlAmt) as daily_earning FROM orders WHERE DATE(ordercrdate) = CURRENT_DATE";
            stmt = conn.prepareStatement(sqll);
            ResultSet rs = stmt.executeQuery();
            if (rs.next()) {
                totalEarning = rs.getDouble(1);

            }

        } catch (SQLException ex) {

            System.out.println(ex.getMessage());
        }

        return totalEarning;

    }

    public double getTotalEarningOnMonth() {

        double totalEarning = 0.00;
        try {

            String sqll = "SELECT SUM(orderttlamt) as monthly_earnings FROM orders WHERE YEAR(ordercrdate) = YEAR(CURRENT_DATE) AND MONTH(ordercrdate) = MONTH(CURRENT_DATE)";
            stmt = conn.prepareStatement(sqll);
            ResultSet rs = stmt.executeQuery();
            if (rs.next()) {
                totalEarning = rs.getDouble(1);

            }

        } catch (SQLException ex) {

            System.out.println(ex.getMessage());
        }

        return totalEarning;

    }

    public ArrayList<OrderDetails> salesReportDate(String startDateStr, String endDateStr) {
        ResultSet rs = null;
        ArrayList<OrderDetails> odList = new ArrayList<>();

        try {
            // Convert the input date strings to timestamp objects using a SimpleDateFormat
//            DateFormat dateFormat = new SimpleDateFormat("yy-MM-dd HH:mm:ss");
//            Timestamp startDate = new Timestamp(dateFormat.parse(startDateStr).getTime());
//            Timestamp endDate = new Timestamp(dateFormat.parse(endDateStr).getTime());
            startDateStr = startDateStr + " 00:00:00";
            endDateStr = endDateStr + " 23:59:59";

            createConnection();
            String sqll = "SELECT P.PRODNAME, PC.PRODCATNAME, P.PRODAVAILABLE_QTY, P.PROD_FINALPRICE, SUM(OD.ORDQTY), SUM(OD.ORDPRICE) FROM ORDERDETAILS OD INNER JOIN PRODUCTLIST P ON P.PRODID = OD.PRODID INNER JOIN PRODCATEGORY PC ON PC.PRODCATID = P.PRODCATID INNER JOIN ORDERS O ON OD.ORDERROW = O.ORDERROW WHERE O.ORDER_STATUS = 'Successful' AND O.ORDERCRDATE BETWEEN ? AND ? GROUP BY P.PRODID, P.PRODNAME, PC.PRODCATNAME, P.PRODAVAILABLE_QTY, P.PROD_FINALPRICE";
            stmt = conn.prepareStatement(sqll);
            stmt.setString(1, startDateStr);
            stmt.setString(2, endDateStr);
           rs = stmt.executeQuery();
            while (rs.next()) {
                OrderDetails od = new OrderDetails();
                Product prod = new Product();
                ProductCategory pc = new ProductCategory();

                prod.setProdName(rs.getString(1));
                pc.setProdCatName(rs.getString(2));
                prod.setProdCat(pc);
                prod.setProdAvailable_Qty(rs.getInt(3));
                prod.setProd_FinalPrice(rs.getDouble(4));
                od.setProduct(prod);
                od.setOrdQty(rs.getInt(5));
                od.setOrdPrice(rs.getDouble(6));

                odList.add(od);

            }
            for (OrderDetails od : odList) {

                System.out.println("IS DATE");
                System.out.println(od.getProduct().getProdName());
                System.out.println(od.getProduct().getProdCat().getProdCatName());
                System.out.println(od.getProduct().getProdAvailable_Qty());
                System.out.println(od.getProduct().getProd_FinalPrice());
                System.out.println(od.getOrdQty());
                System.out.println(od.getOrdPrice());

            }


        } catch (SQLException ex) {
            System.out.println(ex.getMessage());
        }

        return odList;
    }

    public ArrayList<OrderDetails> salesReportYear(int year) {
        ResultSet rs = null;
        ArrayList<OrderDetails> odList = new ArrayList<>();

        try {

            createConnection();
            String sqll = "SELECT P.PRODNAME, PC.PRODCATNAME, P.PRODAVAILABLE_QTY,P.PROD_FINALPRICE, SUM(OD.ORDQTY), SUM(OD.ORDPRICE)FROM ORDERDETAILS OD INNER JOIN PRODUCTLIST P ON P.PRODID = OD.PRODID INNER JOIN PRODCATEGORY PC ON PC.PRODCATID = P.PRODCATID INNER JOIN ORDERS O ON OD.ORDERROW=O.ORDERROW WHERE YEAR(OD.ORDDECRDATE) = ? AND O.ORDER_STATUS='Successful' GROUP BY P.PRODID, P.PRODNAME, PC.prodcatname,P.PRODAVAILABLE_QTY,P.PROD_FINALPRICE";
            stmt = conn.prepareStatement(sqll);
            stmt.setInt(1, year);
            rs = stmt.executeQuery();
            while (rs.next()) {
                OrderDetails od = new OrderDetails();
                Product prod = new Product();
                ProductCategory pc = new ProductCategory();

                prod.setProdName(rs.getString(1));
                pc.setProdCatName(rs.getString(2));
                prod.setProdCat(pc);
                prod.setProdAvailable_Qty(rs.getInt(3));
                prod.setProd_FinalPrice(rs.getDouble(4));
                od.setProduct(prod);
                od.setOrdQty(rs.getInt(5));
                od.setOrdPrice(rs.getDouble(6));

                odList.add(od);

            }
        } catch (SQLException ex) {
            System.out.println(ex.getMessage());
        }

        return odList;
    }

    public ArrayList<OrderDetails> salesReportMonth(int year, int month) {
        ResultSet rs = null;
        ArrayList<OrderDetails> odList = new ArrayList<>();

        try {

            createConnection();
            String sqll = "SELECT P.PRODNAME, PC.PRODCATNAME, P.PRODAVAILABLE_QTY,P.PROD_FINALPRICE, SUM(OD.ORDQTY), SUM(OD.ORDPRICE) FROM ORDERDETAILS OD INNER JOIN PRODUCTLIST P ON P.PRODID = OD.PRODID INNER JOIN PRODCATEGORY PC ON PC.PRODCATID = P.PRODCATID INNER JOIN ORDERS O ON OD.ORDERROW=O.ORDERROW WHERE YEAR(OD.ORDDECRDATE) = ? AND MONTH(OD.ORDDECRDATE)=? AND O.ORDER_STATUS='Successful' GROUP BY P.PRODID, P.PRODNAME, PC.prodcatname,P.PRODAVAILABLE_QTY,P.PROD_FINALPRICE";
            stmt = conn.prepareStatement(sqll);
            stmt.setInt(1, year);
            stmt.setInt(2, month);
            rs = stmt.executeQuery();
            while (rs.next()) {
                OrderDetails od = new OrderDetails();
                Product prod = new Product();
                ProductCategory pc = new ProductCategory();

                prod.setProdName(rs.getString(1));
                pc.setProdCatName(rs.getString(2));
                prod.setProdCat(pc);
                prod.setProdAvailable_Qty(rs.getInt(3));
                prod.setProd_FinalPrice(rs.getDouble(4));
                od.setProduct(prod);
                od.setOrdQty(rs.getInt(5));
                od.setOrdPrice(rs.getDouble(6));

                odList.add(od);

            }
            for (OrderDetails od : odList) {

                System.out.println(od.getProduct().getProdName());
                System.out.println(od.getProduct().getProdCat().getProdCatName());
                System.out.println(od.getProduct().getProdAvailable_Qty());
                System.out.println(od.getProduct().getProd_FinalPrice());
                System.out.println(od.getOrdQty());
                System.out.println(od.getOrdPrice());

            }

        } catch (SQLException ex) {
            System.out.println(ex.getMessage());
        }

        return odList;
    }

    public int getOrderQuantity() {

        int totalEarning = 0;
        try {

            String sqll = "SELECT COUNT(ORDERROW) as daily_earning FROM orders WHERE DATE(ordercrdate) = CURRENT_DATE";
            stmt = conn.prepareStatement(sqll);
            ResultSet rs = stmt.executeQuery();
            if (rs.next()) {
                totalEarning = rs.getInt(1);

            }

        } catch (SQLException ex) {

            System.out.println(ex.getMessage());
        }

        return totalEarning;

    }

    public Orders getOrderByRow(int orderRow) {
        Orders o = new Orders();

        try {
            createConnection();
            String sqll = "SELECT O.ORDERNO,O.TRACKINGNO,O.ORDERTTLAMT,PA.DELIVERYFEE,PA.PAYMENTMETHOD,PA.PAYMENTAMOUNT,O.ORDERCRDATE,D.DELIVERYID,D.DELIVERYSTATUS,D.DELIVERYDETAILS,A.ADDR_STATE,A.TOWN,A.ZIPCODE,A.ADDR_DETAILS,A.RECEIVERNAME,A.RECEIVERHP,D.DEL_UPDATE FROM ORDERS O INNER JOIN PAYMENT PA ON PA.ORDERROW = O.ORDERROW INNER JOIN DELIVERYSTATUS D ON D.ORDERROW=O.ORDERROW INNER JOIN ADDRESSLIST A ON D.ADDRESSID = A.ADDRESSID WHERE O.ORDERROW=?";
            // String sqll = "SELECT O.ORDERNO,O.TRACKINGNO,O.ORDERTTLAMT,P.PRODNAME,OD.ORDQTY,OD.ORDPRICE,PA.DELIVERYFEE,PA.PAYMENTMETHOD,PA.PAYMENTAMOUNT,PA.PAYMENTDATE,D.DELIVERYID,D.DELIVERYSTATUS,D.DELIVERYDETAILS,A.ADDR_STATE,A.TOWN,A.ZIPCODE,A.ADDR_DETAILS,A.RECEIVERNAME,A.RECEIVERHP FROM ORDERS O INNER JOIN ORDERDETAILS OD ON O.ORDERROW = OD.ORDERROW INNER JOIN PRODUCTLIST P ON OD.PRODID = P.PRODID INNER JOIN PAYMENT PA ON PA.ORDERROW = O.ORDERROW INNER JOIN DELIVERYSTATUS D ON D.ORDERROW=O.ORDERROW INNER JOIN ADDRESSLIST A ON D.ADDRESSID = A.ADDRESSID WHERE O.ORDERROW=?";

            stmt = conn.prepareStatement(sqll);
            stmt.setInt(1, orderRow);
            ResultSet rs = stmt.executeQuery();

            while (rs.next()) {

                o.setOrderNo(rs.getString(1));
                o.setTrackingno(rs.getString(2));
                o.setOrderTtlAmt(rs.getDouble(3));

//            OrderDetails od = new OrderDetails();
//            
//            Product p = new Product();
//            p.setProdName(rs.getString(4));
//            od.setProduct(p);
//            
//            od.setOrdQty(rs.getInt(5));
//            od.setOrdPrice(rs.getDouble(6));
//            o.setOrderDetails(od);
                Payment pa = new Payment();
                pa.setDeliveryFee(rs.getDouble(4));
                pa.setPaymentMethod(rs.getString(5));
                pa.setPaymentAmount(rs.getDouble(6));
                o.setOrderCrDate(rs.getTimestamp(7));
                o.setPayment(pa);

                DeliveryStatus d = new DeliveryStatus();
                d.setDeliveryID(rs.getInt(8));
                d.setDeliveryStatus(rs.getString(9));
                d.setDeliveryDetails(rs.getString(10));
                d.setDel_UpDate(rs.getTimestamp(17));

                Address a = new Address();
                a.setAddr_State(rs.getString(11));
                a.setTown(rs.getString(12));
                a.setZipcode(rs.getString(13));
                a.setAddr_Details(rs.getString(14));
                a.setReceiverName(rs.getString(15));
                a.setReceiverHP(rs.getString(16));
                d.setAddr(a);

                o.setDelivery_Status(d);
            }

        } catch (SQLException ex) {

            System.out.println(ex.getMessage());
        }

        return o;
    }

    public int insertTrackingNo(Orders o) {

        int row = 0;

        try {
            createConnection();
            String sqll = "update orders set trackingNo=?, orderupdate=?,orderupby=? where orderrow =?";
            stmt = conn.prepareStatement(sqll);
            stmt.setString(1, o.getTrackingno());
            stmt.setTimestamp(2, o.getOrderUpDate());
            stmt.setString(3, o.getOrderUpBy());
            stmt.setInt(4, o.getOrderRow());

            row = stmt.executeUpdate();

            System.out.println("NUMBER OF ROWS INSEERT: " + row);

        } catch (SQLException ex) {

            System.out.println(ex.getMessage());
        }

        return row;
    }

    public int updateDeliveryStatus(Orders o) {
        int row = 0;

        try {
            createConnection();
            String sqll = "UPDATE DELIVERYSTATUS SET DELIVERYSTATUS = ?, DELIVERYDETAILS=?, DEL_UPDATE = ?, DEL_UPBY=? where deliveryid=?";
            stmt = conn.prepareStatement(sqll);
            stmt.setString(1, o.getDelivery_Status().getDeliveryStatus());
            stmt.setString(2, o.getDelivery_Status().getDeliveryDetails());
            stmt.setTimestamp(3, o.getDelivery_Status().getDel_UpDate());
            stmt.setString(4, o.getDelivery_Status().getDel_UpBy());
            stmt.setInt(5, o.getDelivery_Status().getDeliveryID());
            row = stmt.executeUpdate();
            System.out.println("DATA INSERT : " + row);

        } catch (SQLException ex) {

        }
        return row;
    }

    
    
    
    //Zhiyi


    public int getOrderRow() {
        int orderrow = 0;
        try {
            createConnection();
            String sqll = "SELECT MAX(ORDERROW) FROM ORDERS";
            stmt = conn.prepareStatement(sqll);

            ResultSet rs = stmt.executeQuery();

            while (rs.next()) {

                orderrow = rs.getInt(1) + 1;

            }
        } catch (SQLException ex) {

            System.out.println(ex.getMessage());
        }
        return orderrow;
    }

    public int getOrderRow2() {
        int orderrow = 0;
        try {
            createConnection();
            String sqll = "SELECT MAX(ORDERROW) FROM ORDERS";
            stmt = conn.prepareStatement(sqll);

            ResultSet rs = stmt.executeQuery();

            while (rs.next()) {

                orderrow = rs.getInt(1);

            }
        } catch (SQLException ex) {

            System.out.println(ex.getMessage());
        }
        return orderrow;
    }





    public int addOrder(Orders o) {

        try {
            createConnection();
            String sqll = "INSERT INTO ORDERS (ORDERNO,CUSTID,ORDERCRDATE,ORDERCRBY,ORDERUPDATE,ORDERUPBY,ORDERTTLAMT,ORDER_STATUS) values(?,?,?,?,?,?,?,?)";
            stmt = conn.prepareStatement(sqll);
            stmt.setString(1, o.getOrderNo());
            stmt.setInt(2, o.getCustID());
            stmt.setTimestamp(3, o.getOrderCrDate());
            stmt.setString(4, o.getOrderCrBy());
            stmt.setTimestamp(5, o.getOrderUpDate());
            stmt.setString(6, o.getOrderUpBy());
            stmt.setDouble(7, o.getOrderTtlAmt());
            stmt.setString(8, o.getOrder_Status());

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

    public Orders getOrdersBycustID(int custid) {
        Orders o = new Orders();
        try {

            createConnection();
            ResultSet rs = null;
            String sqll = "SELECT ORDERROW, ORDERNO, ORDERCRDATE, ORDERTTLAMT FROM ORDERS WHERE CUSTID = ? ORDER BY ORDERROW DESC FETCH FIRST 1 ROW ONLY";

            stmt = conn.prepareStatement(sqll);
            stmt.setInt(1, custid);
            rs = stmt.executeQuery();

            if (rs.next()) {
                o.setOrderRow(rs.getInt(1));
                o.setOrderNo(rs.getString(2));
                o.setOrderCrDate(rs.getTimestamp(3));
                o.setOrderTtlAmt(rs.getDouble(4));
                Timestamp orderCrDate = o.getOrderCrDate();
                LocalDateTime localDateTime = orderCrDate.toLocalDateTime().plusDays(3);
                Timestamp newTimestamp = Timestamp.valueOf(localDateTime);
                o.setExpectedTime(newTimestamp);
            }

        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        shutDown();
        return o;
    }

    public ArrayList<Orders> getAllOrdersByCustID(int custid) {
        ArrayList<Orders> OrdersList = new ArrayList<>();

        try {
            createConnection();
            //SELECT C.CARTID, CD.CARTDETAILID, CD.PRODID, CD.CARTDETAILQTY, PL.PRODNAME, PL.PROD_FINALPRICE, (SELECT PI.PRODIMG FROM PRODIMAGE PI WHERE PI.PRODID = PL.PRODID FETCH FIRST 1 ROWS ONLY) AS PRODIMG FROM CART AS C INNER JOIN CARTDETAIL CD ON C.CARTID = CD.CARTID INNER JOIN PRODUCTLIST PL ON CD.PRODID = PL.PRODID WHERE C.CUSTID =100001;
            // String sqll2 = "SELECT C.CARTID, CD.CARTDETAILID, CD.PRODID, CD.CARTDETAILQTY, PL.PRODNAME, PL.PROD_FINALPRICE, (SELECT PI.PRODIMG FROM PRODIMAGE PI WHERE PI.PRODID = PL.PRODID FETCH FIRST 1 ROWS ONLY) AS PRODIMG FROM CART AS C INNER JOIN CARTDETAIL CD ON C.CARTID = CD.CARTID INNER JOIN PRODUCTLIST PL ON CD.PRODID = PL.PRODID WHERE C.CUSTID =?";

            String sqll = "SELECT O.ORDERROW, O.ORDERNO, O.ORDERCRDATE,O.ORDER_STATUS, O.TRACKINGNO, P.PAYMENTAMOUNT, DS.DELIVERYSTATUS FROM ORDERS AS O INNER JOIN PAYMENT P ON O.ORDERROW = P.ORDERROW INNER JOIN DELIVERYSTATUS DS ON O.ORDERROW = DS.ORDERROW WHERE CUSTID =?";

            stmt = conn.prepareStatement(sqll);
            stmt.setInt(1, custid);
            ResultSet rs = stmt.executeQuery();

            while (rs.next()) {
                Orders o = new Orders();
                Payment pay = new Payment();
                DeliveryStatus ds = new DeliveryStatus();

                o.setOrderRow(rs.getInt(1));
                o.setOrderNo(rs.getString(2));
                o.setOrderCrDate(rs.getTimestamp(3));
                o.setOrder_Status(rs.getString(4));
                o.setTrackingno(rs.getString(5));
                pay.setPaymentAmount(rs.getDouble(6));
                ds.setDeliveryStatus(rs.getString(7));

                o.setPayment(pay);
                o.setDelivery_Status(ds);

                OrdersList.add(o);

            }

        } catch (SQLException ex) {
        }
        return OrdersList;
    }

    public Orders getOrdersByOrderrow(int orderrow) {
        Orders o = new Orders();
        try {

            createConnection();
            ResultSet rs = null;
            String sqll = "SELECT ORDERNO, ORDERCRDATE, ORDERTTLAMT,TRACKINGNO FROM ORDERS WHERE ORDERROW = ?";

            stmt = conn.prepareStatement(sqll);
            stmt.setInt(1, orderrow);
            rs = stmt.executeQuery();

            if (rs.next()) {
                o.setOrderNo(rs.getString(1));
                o.setOrderCrDate(rs.getTimestamp(2));
                o.setOrderTtlAmt(rs.getDouble(3));
                o.setTrackingno(rs.getString(4));
            }

        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        shutDown();
        return o;
    }

    public int updateOrderStatusToCancel(int orderrow) {

        try {

            createConnection();
            String sqll = "UPDATE ORDERS SET ORDER_STATUS = 'Cancelled' WHERE ORDERROW = ?";
            stmt = conn.prepareStatement(sqll);
            stmt.setInt(1, orderrow);
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
