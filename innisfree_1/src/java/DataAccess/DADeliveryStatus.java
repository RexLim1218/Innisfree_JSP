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
public class DADeliveryStatus {
        private String host = "jdbc:derby://localhost:1527/Innisfree";
    private String user = "nbuser";
    private String password = "nbuser";
    private Connection conn;
    private PreparedStatement stmt;

    
     public DADeliveryStatus() {
        createConnection();
        
     }
     
       public int addDelivery(DeliveryStatus ds) {

        try {
            createConnection();
            String sqll = "INSERT INTO DELIVERYSTATUS (ORDERROW,ADDRESSID,DELIVERYSTATUS,DELIVERYDETAILS,DEL_CRDATE,DEL_CRBY,DEL_UPDATE,DEL_UPBY) values(?,?,?,?,?,?,?,?)";
            stmt = conn.prepareStatement(sqll);
            stmt.setInt(1, ds.getOrderRow());
            stmt.setInt(2, ds.getAddressID());
            stmt.setString(3, ds.getDeliveryStatus());
            stmt.setString(4, ds.getDeliveryDetails());
            stmt.setTimestamp(5, ds.getDel_CrDate());
            stmt.setString(6, ds.getDel_CrBy());
            stmt.setTimestamp(7, ds.getDel_UpDate());
            stmt.setString(8, ds.getDel_UpBy());

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
       
         public DeliveryStatus getAddressIDtByOrderRow(int orderrow) {
        DeliveryStatus ds = new DeliveryStatus();
        try {

            createConnection();
            ResultSet rs = null;
            String sqll = "SELECT ADDRESSID FROM DELIVERYSTATUS WHERE ORDERROW = ?";
            stmt = conn.prepareStatement(sqll);
            stmt.setInt(1, orderrow);
            rs = stmt.executeQuery();

            if (rs.next()) {

                ds.setAddressID(rs.getInt(1));
            }

        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        shutDown();
        return ds;
    }
         
         public int updateDeliveryStatusToCancel(int orderrow) {

        try {

            createConnection();
            String sqll = "UPDATE DELIVERYSTATUS SET DELIVERYSTATUS = 'Cancelled' WHERE ORDERROW = ?";
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
