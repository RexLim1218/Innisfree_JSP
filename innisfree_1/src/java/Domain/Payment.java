/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Domain;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Random;

/**
 *
 * @author Rex Lim
 */
public class Payment {
    private int paymentID;
    private int orderRow;
    private double paymentAmount;
    private double deliveryFee;
    private String paymentMethod;
    private Timestamp paymentDate;
    private String transaction_ID;
    private Boolean is_Deleted;

    public Payment() {
    }

    public Payment(int paymentID, int orderRow, double paymentAmount, double deliveryFee, String paymentMethod, Timestamp paymentDate, String transaction_ID, Boolean is_Deleted) {
        this.paymentID = paymentID;
        this.orderRow = orderRow;
        this.paymentAmount = paymentAmount;
        this.deliveryFee = deliveryFee;
        this.paymentMethod = paymentMethod;
        this.paymentDate = paymentDate;
        this.transaction_ID = transaction_ID;
        this.is_Deleted = is_Deleted;
    }

    public int getPaymentID() {
        return paymentID;
    }

    public int getOrderRow() {
        return orderRow;
    }

    public double getPaymentAmount() {
        return paymentAmount;
    }

    public double getDeliveryFee() {
        return deliveryFee;
    }

    public String getPaymentMethod() {
        return paymentMethod;
    }

    public Timestamp getPaymentDate() {
        return paymentDate;
    }

    public String getTransaction_ID() {
        return transaction_ID;
    }

    public Boolean getIs_Deleted() {
        return is_Deleted;
    }

    public void setPaymentID(int paymentID) {
        this.paymentID = paymentID;
    }

    public void setOrderRow(int orderRow) {
        this.orderRow = orderRow;
    }

    public void setPaymentAmount(double paymentAmount) {
        this.paymentAmount = paymentAmount;
    }

    public void setDeliveryFee(double deliveryFee) {
        this.deliveryFee = deliveryFee;
    }

    public void setPaymentMethod(String paymentMethod) {
        this.paymentMethod = paymentMethod;
    }

    public void setPaymentDate(Timestamp paymentDate) {
        this.paymentDate = paymentDate;
    }

    public void setTransaction_ID(String transaction_ID) {
        this.transaction_ID = transaction_ID;
    }

    public void setIs_Deleted(Boolean is_Deleted) {
        this.is_Deleted = is_Deleted;
    }
    
    public String generateTransactionID() {

        Random rand = new Random();
        int randomNum = rand.nextInt(90000) + 10000;
        String randomNumber = String.valueOf(randomNum);
        String output = "P";

        Date date = new Date();
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        String dateString = sdf.format(date);

        String[] words = dateString.replace("-", "").split("\\s+");
        StringBuilder sb = new StringBuilder();
        for (String word : words) {
            sb.append(word);
        }
        output = output + sb.toString() + randomNumber;
        System.out.println(output);
        return output;
    }
    
    
    
    
    
}
