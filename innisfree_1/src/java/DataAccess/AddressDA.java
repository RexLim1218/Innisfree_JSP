/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DataAccess;

import Domain.Address;
import Domain.Customer;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
import javax.swing.JOptionPane;

/**
 *
 * @author Yu Xuan
 */
public class AddressDA {

    private String host = "jdbc:derby://localhost:1527/Innisfree";
    private String user = "nbuser";
    private String password = "nbuser";
    private String tableName = "AddressList";
    private Connection conn;
    private PreparedStatement stmt;

    public int addAddressRecord(Address a) {
        try {
            createConnection();

            String addStr = "INSERT INTO ADDRESSLIST(custid,addr_type,addr_state,town,zipcode,addr_details,receivername,receiverhp,addr_status) VALUES(?, ?, ?, ?, ?, ?, ?, ?, ?)";

            stmt = conn.prepareStatement(addStr);

            stmt.setInt(1, a.getCustID());
            stmt.setString(2, a.getAddr_Type());
            stmt.setString(3, a.getAddr_State());
            stmt.setString(4, a.getTown());
            stmt.setString(5, a.getZipcode());
            stmt.setString(6, a.getAddr_Details());
            stmt.setString(7, a.getReceiverName());
            stmt.setString(8, a.getReceiverHP());
            stmt.setString(9, a.getAddr_Status());

            int row = stmt.executeUpdate();
            return 1;

        } catch (SQLException e) {
            System.out.println(e.getMessage());
            return 0;
        }
    }

    public Address getAddrRecord(int custID) {
        Address a = null;
        try {
            createConnection();
            String getStr = "SELECT addressID, custID, addr_type, addr_state, town, zipcode, addr_details, receiverName, receiverHP, addr_status FROM addressList WHERE custID = ?";

            stmt = conn.prepareStatement(getStr);
            stmt.setInt(1, custID);
            ResultSet rs = stmt.executeQuery();

            while (rs.next()) {
                a.setAddressID(rs.getInt("addressID"));
                a.setAddr_Type(rs.getString("addr_type"));
                a.setAddr_State(rs.getString("addr_state"));
                a.setTown(rs.getString("town"));
                a.setZipcode(rs.getString("zipcode"));
                a.setAddr_Details(rs.getString("addr_details"));
                a.setReceiverName(rs.getString("receiverName"));
                a.setReceiverHP(rs.getString("receiverHP"));
                a.setAddr_Status(rs.getString("addr_status"));

            }
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        return a;
    }

    public ArrayList<Address> getAllAddress(int custID) {
        ArrayList<Address> addressArray = new ArrayList<>();

        try {
            createConnection();
            ResultSet rs = null;
            String sql = "SELECT addressID, custID, addr_type, addr_state, town, zipcode, addr_details, receiverName, receiverHP, addr_status FROM addressList WHERE custID = ?";
            PreparedStatement stmt = conn.prepareStatement(sql);
            stmt.setInt(1, custID); // set the customer ID parameter for the query
            rs = stmt.executeQuery();

            while (rs.next()) {
                Address a = new Address();
                a.setAddressID(rs.getInt("addressID"));
                a.setCustID(rs.getInt("custID"));
                a.setAddr_Type(rs.getString("addr_type"));
                a.setAddr_State(rs.getString("addr_state"));
                a.setTown(rs.getString("town"));
                a.setZipcode(rs.getString("zipcode"));
                a.setAddr_Details(rs.getString("addr_details"));
                a.setReceiverName(rs.getString("receiverName"));
                a.setReceiverHP(rs.getString("receiverHP"));
                a.setAddr_Status(rs.getString("addr_status"));
                addressArray.add(a);
            }

        } catch (SQLException e) {
            System.out.println(e.getMessage());

        }
        return addressArray;

    }

    public Address getAddressByAddressID(int addressID) {
        Address a = new Address();
        try {
            createConnection();
            ResultSet rs = null;
            String sql = "SELECT addressID, custID, addr_type, addr_state, town, zipcode, addr_details, receiverName, receiverHP, addr_status FROM addressList WHERE addressid = ?";
            PreparedStatement stmt = conn.prepareStatement(sql);
            stmt.setInt(1, addressID); // set the customer ID parameter for the query
            rs = stmt.executeQuery();
            if (rs.next()) {

                a.setAddressID(rs.getInt("addressID"));
                System.out.println("addressID" + rs.getInt("addressID"));
                a.setCustID(rs.getInt("custID"));
                System.out.println(rs.getInt("custID"));
                a.setAddr_Type(rs.getString("addr_type"));
                System.out.println(rs.getString("addr_type"));
                a.setAddr_State(rs.getString("addr_state"));
                a.setTown(rs.getString("town"));
                a.setZipcode(rs.getString("zipcode"));
                a.setAddr_Details(rs.getString("addr_details"));
                a.setReceiverName(rs.getString("receiverName"));
                a.setReceiverHP(rs.getString("receiverHP"));
                a.setAddr_Status(rs.getString("addr_status"));

            }

        } catch (SQLException ex) {
            System.out.println(ex.getMessage());

        }
        return a;
    }

    public int updateAddrRecord(Address a) {

        try {
            createConnection();
            String updateAddrStr = "UPDATE addressList SET addr_Type =? , addr_State=?, town =?, zipcode=?, addr_Details = ?, receiverName = ?, receiverHP = ? where addressID = ?";
            stmt = conn.prepareStatement(updateAddrStr);

            
            stmt.setString(1, a.getAddr_Type());
            stmt.setString(2, a.getAddr_State());
            stmt.setString(3, a.getTown());
            stmt.setString(4, a.getZipcode());
            stmt.setString(5, a.getAddr_Details());
            stmt.setString(6, a.getReceiverName());
            stmt.setString(7, a.getReceiverHP());
            
            stmt.setInt(8, a.getAddressID());

            int row = stmt.executeUpdate();
            return row;

        } catch (SQLException e) {
            System.out.println(e.getMessage());
            return 0;
        }
    }

    private void createConnection() {
        try {

            conn = DriverManager.getConnection(host, user, password);
        } catch (SQLException ex) {
            JOptionPane.showMessageDialog(null, ex.getMessage(), "ERROR", JOptionPane.ERROR_MESSAGE);
        }
    }
}
