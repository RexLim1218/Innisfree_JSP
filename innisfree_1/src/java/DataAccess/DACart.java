/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DataAccess;

import Domain.*;
import static java.lang.System.out;
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
 * @author Asus
 */
public class DACart {

    private String host = "jdbc:derby://localhost:1527/Innisfree";
    private String user = "nbuser";
    private String password = "nbuser";
    private Connection conn;
    private PreparedStatement stmt;

    public DACart() {
        createConnection();
    }

//    CART TABLE 
//-CARTID
//-CUSTID
//-CARTUPDATE
//INSERT INTO CART (CLOUMN NAMW) VALUES(?,?,?)
//
//
//CARTDETAIL TABLE
//-CARTDETAILID 
//-CARTID
//-PRODID
//-CARTDETAILQTY
//
//
//INSERT INTO  CARTDETAIL 
    public int addCart(Cart cart) {

        try {
            createConnection();
            String sqll = "insert into CART (CUSTID,CARTUPDATE) values(?,?)";
            stmt = conn.prepareStatement(sqll);
            stmt.setInt(1, cart.getcustID());
            stmt.setTimestamp(2, cart.getcartUpDate());

            int row = stmt.executeUpdate();
            if (row > 0) {
                return 1;
            } else {
                return 0;
            }
        } catch (SQLException ex) {
            out.println("ERROR: " + ex.toString() + "<br /><br />");
            return 0;
        }
    }

    public Cart getCartIDBycustID(int id) {
        Cart c = new Cart();
        try {

            createConnection();
            ResultSet rs = null;
            String sqll = "SELECT CARTID, CARTUPDATE FROM CART WHERE CUSTID = ? FETCH FIRST 1 ROWS ONLY";
            stmt = conn.prepareStatement(sqll);
            stmt.setInt(1, id);
            rs = stmt.executeQuery();

            if (rs.next()) {

                c.setcartID(rs.getInt(1));
                c.setcartUpDate(rs.getTimestamp(2));
                //  c.setcartID(rs.getInt(1));
            }

        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        shutDown();
        return c;
    }

    public Cart getCartIDBycustID2(int custid) {
        Cart c = new Cart();
        try {

            createConnection();
            ResultSet rs = null;
            String sqll = "SELECT CARTID FROM CART WHERE CUSTID = ? FETCH FIRST 1 ROWS ONLY";
            stmt = conn.prepareStatement(sqll);
            stmt.setInt(1, custid);
            rs = stmt.executeQuery();

            if (rs.next()) {

                c.setcartID(rs.getInt(1));
               
            }

        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        shutDown();
        return c;
    }

    public Cart getCartID() throws SQLException {
        Cart c = new Cart();
        try {

            createConnection();
            ResultSet rs = null;
            String sqll = "SELECT MAX(CARTID) FROM CART";
            stmt = conn.prepareStatement(sqll);

            rs = stmt.executeQuery();

            if (rs.next()) {
                int cartID = rs.getInt(1);

                c.setcartID(cartID);
                //  c.setcartID(rs.getInt(1));
            }

        } catch (SQLException e) {
            throw e;
        }
        return c;
    }

    public ResultSet getCartById(int custID) {

        Cart c = new Cart();
        ResultSet rs2 = null;

        try {
            createConnection();
            String sqll = "select CARTID,CARTUPDATE from CART WHERE CUSTID = ?";
            stmt = conn.prepareStatement(sqll);
            stmt.setInt(1, custID);
            rs2 = stmt.executeQuery();

            if (rs2.next()) {

            }
        } catch (SQLException ex) {

        }

        return rs2;
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
