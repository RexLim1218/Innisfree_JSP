/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Domain;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.Date;

/**
 *
 * @author Rex Lim
 */
public class Orders {

    private int orderRow;
    private String orderNo;
    private int custID;
    private Timestamp orderCrDate;
    private String orderCrBy;
    private Timestamp orderUpDate;
    private String orderUpBy;
    private double orderTtlAmt;
    private String trackingno;
    private String order_Status;
 private Timestamp ExpectedTime;
    private DeliveryStatus delivery_Status;
    private OrderDetails orderDetails;
    private Payment payment;

    public Orders() {
    }

    public Orders(int orderRow, String orderNo, int custID, Timestamp orderCrDate, String orderCrBy, Timestamp orderUpDate, String orderUpBy, double orderTtlAmt, String trackingno, String order_Status) {
        this.orderRow = orderRow;
        this.orderNo = orderNo;
        this.custID = custID;
        this.orderCrDate = orderCrDate;
        this.orderCrBy = orderCrBy;
        this.orderUpDate = orderUpDate;
        this.orderUpBy = orderUpBy;
        this.orderTtlAmt = orderTtlAmt;
        this.trackingno = trackingno;
        this.order_Status = order_Status;
    }

    public Orders(int orderRow, String orderNo, int custID, Timestamp orderCrDate, String orderCrBy, Timestamp orderUpDate, String orderUpBy, double orderTtlAmt, String trackingno, String order_Status, DeliveryStatus delivery_Status) {
        this.orderRow = orderRow;
        this.orderNo = orderNo;
        this.custID = custID;
        this.orderCrDate = orderCrDate;
        this.orderCrBy = orderCrBy;
        this.orderUpDate = orderUpDate;
        this.orderUpBy = orderUpBy;
        this.orderTtlAmt = orderTtlAmt;
        this.trackingno = trackingno;
        this.order_Status = order_Status;
        this.delivery_Status = delivery_Status;
    }

    public Orders(int orderRow, String orderNo, int custID, Timestamp orderCrDate, String orderCrBy, Timestamp orderUpDate, String orderUpBy, double orderTtlAmt, String trackingno, String order_Status, DeliveryStatus delivery_Status, OrderDetails orderDetails, Payment payment) {
        this.orderRow = orderRow;
        this.orderNo = orderNo;
        this.custID = custID;
        this.orderCrDate = orderCrDate;
        this.orderCrBy = orderCrBy;
        this.orderUpDate = orderUpDate;
        this.orderUpBy = orderUpBy;
        this.orderTtlAmt = orderTtlAmt;
        this.trackingno = trackingno;
        this.order_Status = order_Status;
        this.delivery_Status = delivery_Status;
        this.orderDetails = orderDetails;
        this.payment = payment;
    }

    public int getOrderRow() {
        return orderRow;
    }

    public String getOrderNo() {
        return orderNo;
    }

    public int getCustID() {
        return custID;
    }

    public Timestamp getOrderCrDate() {
        return orderCrDate;
    }

    public String getOrderCrBy() {
        return orderCrBy;
    }

    public Timestamp getOrderUpDate() {
        return orderUpDate;
    }

    public String getOrderUpBy() {
        return orderUpBy;
    }

    public double getOrderTtlAmt() {
        return orderTtlAmt;
    }

    public String getTrackingno() {
        return trackingno;
    }

    public String getOrder_Status() {
        return order_Status;
    }

    public DeliveryStatus getDelivery_Status() {
        return delivery_Status;
    }

    public OrderDetails getOrderDetails() {
        return orderDetails;
    }

    public Payment getPayment() {
        return payment;
    }
    public Timestamp getExpectedTime() {
        return ExpectedTime;
    }
    public void setOrderRow(int orderRow) {
        this.orderRow = orderRow;
    }

    public void setOrderNo(String orderNo) {
        this.orderNo = orderNo;
    }

    public void setCustID(int custID) {
        this.custID = custID;
    }

    public void setOrderCrDate(Timestamp orderCrDate) {
        this.orderCrDate = orderCrDate;
    }

    public void setOrderCrBy(String orderCrBy) {
        this.orderCrBy = orderCrBy;
    }

    public void setOrderUpDate(Timestamp orderUpDate) {
        this.orderUpDate = orderUpDate;
    }

    public void setOrderUpBy(String orderUpBy) {
        this.orderUpBy = orderUpBy;
    }

    public void setOrderTtlAmt(double orderTtlAmt) {
        this.orderTtlAmt = orderTtlAmt;
    }

    public void setTrackingno(String trackingno) {
        this.trackingno = trackingno;
    }

    public void setOrder_Status(String order_Status) {
        this.order_Status = order_Status;
    }

    public void setDelivery_Status(DeliveryStatus delivery_Status) {
        this.delivery_Status = delivery_Status;
    }

    public void setOrderDetails(OrderDetails orderDetails) {
        this.orderDetails = orderDetails;
    }

    public void setPayment(Payment payment) {
        this.payment = payment;
    }
    public void setExpectedTime(Timestamp ExpectedTime) {
        this.ExpectedTime = ExpectedTime;
    }
    public String generateOrderID(int orderRow) {
        String row = String.valueOf(orderRow);
        String output = "O";

        Date date = new Date();
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        String dateString = sdf.format(date);

        String[] words = dateString.replace("-", "").split("\\s+");
        StringBuilder sb = new StringBuilder();
        for (String word : words) {
            sb.append(word);
        }
        output = output + sb.toString()+row;
        System.out.println(output);
        return output;
    }

}
