/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DataAccess;

import Domain.*;
import static java.lang.System.out;
import java.sql.Blob;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author User
 */
public class DAPayment {

    private String host = "jdbc:derby://localhost:1527/Innisfree";
    private String user = "nbuser";
    private String password = "nbuser";
    private Connection conn;
    private PreparedStatement stmt;

    public DAPayment() {
        createConnection();
    }

    public int addPayment(Payment pay) {

        try {
            createConnection();
            String sqll = "INSERT INTO PAYMENT (ORDERROW,PAYMENTAMOUNT,DELIVERYFEE,PAYMENTMETHOD,PAYMENTDATE,TRANSACTION_ID,IS_DELETED) values(?,?,?,?,?,?,?)";
            stmt = conn.prepareStatement(sqll);
            stmt.setInt(1, pay.getOrderRow());
            stmt.setDouble(2, pay.getPaymentAmount());
            stmt.setDouble(3, pay.getDeliveryFee());
            stmt.setString(4, pay.getPaymentMethod());
            stmt.setTimestamp(5, pay.getPaymentDate());
            stmt.setString(6, pay.getTransaction_ID());
            stmt.setBoolean(7, pay.getIs_Deleted());

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

    public Payment getPaymentByOrderRow(int orderrow) {
        Payment pay = new Payment();
        try {

            createConnection();
            ResultSet rs = null;
            String sqll = "SELECT PAYMENTAMOUNT, DELIVERYFEE, PAYMENTMETHOD, TRANSACTION_ID FROM PAYMENT WHERE ORDERROW = ?";
            stmt = conn.prepareStatement(sqll);
            stmt.setInt(1, orderrow);
            rs = stmt.executeQuery();

            if (rs.next()) {

                pay.setPaymentAmount(rs.getDouble(1));
                pay.setDeliveryFee(rs.getDouble(2));
                pay.setPaymentMethod(rs.getString(3));
                pay.setTransaction_ID(rs.getString(4));

            }

        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        shutDown();
        return pay;
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
