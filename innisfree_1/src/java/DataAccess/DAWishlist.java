/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DataAccess;

import Domain.Wishlist;
import static java.lang.System.out;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Asus
 */
public class DAWishlist {
    private String host = "jdbc:derby://localhost:1527/Innisfree";
    private String user = "nbuser";
    private String password = "nbuser";
    private Connection conn;
    private PreparedStatement stmt;

    public DAWishlist() {
        createConnection();
    }
    
    public int addWishlist(Wishlist wishlist) {
        try {
            createConnection();
            String sqll = "INSERT INTO WISHITEM (CUSTID,PRODID) VALUES(?,?)";
            stmt = conn.prepareStatement(sqll);
            stmt.setInt(1, wishlist.getCustID());
            stmt.setInt(2, wishlist.getProdID());

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
    
    public int deleteWishlist(int wishid) {
        try {
            createConnection();
            String sqll = "DELETE FROM WISHITEM WHERE WISHID = ?";
            stmt = conn.prepareStatement(sqll);
            stmt.setInt(1, wishid);

            int row = stmt.executeUpdate();
            if(row > 0){
                return 1;
            }else{
                return 0;
            }
        } catch (SQLException ex) {
            out.println("ERROR: " + ex.toString() + "<br /><br />");
            return 0;
        }
    }
    
    public int updateWishlist(Wishlist wishlist) {
        try {
            createConnection();
            String sqll = "UPDATE WISHLIST SET CUSTID = ?, PRODID = ? WHERE WISHID = ?";
            stmt = conn.prepareStatement(sqll);
            stmt.setInt(1, wishlist.getCustID());
            stmt.setInt(2, wishlist.getProdID());
            stmt.setInt(3, wishlist.getWishID());

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
    
    public ArrayList<Wishlist> getAllWishItem() {
        ArrayList<Wishlist> wishItemList = new ArrayList<>();
        try {
            createConnection();
            ResultSet rs = null;
            String sqll = "SELECT WISHID, CUSTID, PRODID FROM WISHITEM";
            stmt = conn.prepareStatement(sqll);
            rs = stmt.executeQuery();

            while (rs.next()) {
                int wishID = rs.getInt(1);
                int custID = rs.getInt(2);
                int prodID = rs.getInt(3);
                wishItemList.add(new Wishlist(wishID, custID, prodID));
            }

        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        return wishItemList;
    }

    public Wishlist getWishItemByID(String id) {
        Wishlist wl = new Wishlist();
        
        try {
            createConnection();
            ResultSet rs = null;
            String sqll = "SELECT WISHID, CUSTID, PRODID FROM WISHITEM WHERE PRODID = ?";
            stmt = conn.prepareStatement(sqll);
            stmt.setString(1, id);
            rs = stmt.executeQuery();

            while (rs.next()) {
                int wishID = rs.getInt(1);
                int custID = rs.getInt(2);
                int prodID = rs.getInt(3);

                wl.setWishID(wishID);
                wl.setCustID(custID);
                wl.setProdID(prodID);
            }

        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        return wl;
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
