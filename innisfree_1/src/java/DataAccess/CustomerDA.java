/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DataAccess;

import Domain.Customer;

import java.sql.*;
import java.util.ArrayList;
import javax.swing.*;


/**
 *
 * @author Yu Xuan
 */
public class CustomerDA {

    private String host = "jdbc:derby://localhost:1527/Innisfree";
    private String user = "nbuser";
    private String password = "nbuser";
    private String tableName = "CustomerList";
    private Connection conn;
    private PreparedStatement stmt;

    public int addCustRecord(Customer c) {
        try {
            createConnection();

            String addStr = "INSERT INTO CustomerList (custusername,custname,custpwd,custemail,custhp,custcrdate,custcrby,custupdate,custupby,cust_status) VALUES(?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";

            stmt = conn.prepareStatement(addStr);

            stmt.setString(1, c.getCustUsername());
            stmt.setString(2, c.getCustName());
            stmt.setString(3, c.getCustPWD());
            stmt.setString(4, c.getCustEmail());
            stmt.setString(5, c.getCustHP());
            stmt.setTimestamp(6, c.getCustCrDate());
            stmt.setString(7, c.getCustUsername());
            stmt.setTimestamp(8, c.getCustUpDate());
            stmt.setString(9, c.getCustUpBy());
            stmt.setString(10, c.getCust_Status());

            int row = stmt.executeUpdate();
            if (row > 0) {
                return 1;
            } else {
                return 0;
            }

        } catch (SQLException ex) {
            JOptionPane.showMessageDialog(null, ex);
            return 0;
        }
    }

    public ResultSet getCustID() {
        ResultSet rs = null;
        try {
            String sqlCustID = "Select max(custID) from CustomerList";
            stmt = conn.prepareStatement(sqlCustID);

            rs = stmt.executeQuery();

        } catch (SQLException ex) {
            JOptionPane.showMessageDialog(null, ex);
        } finally {
            return rs;
        }
    }

    public Customer userLogin(String custUsername, String custPWD) throws SQLException, NullPointerException {
        Customer c = new Customer();

        try {
            createConnection();
            String sqll = "select custid,custusername,custpwd FROM customerlist where custusername = ? and custpwd = ?";
            stmt = conn.prepareStatement(sqll);

            stmt.setString(1, custUsername);
            stmt.setString(2, custPWD);

            ResultSet rs = stmt.executeQuery();

            if (rs.next()) {

                c.setCustID(Integer.parseInt(rs.getString(1)));
                c.setCustUsername(rs.getString(2));
                c.setCustPWD(rs.getString(3));
            }

        } catch (SQLException ex) {
//        JOptionPane.showMessageDialog(null, ex.getMessage(), "ERROR", JOptionPane.ERROR_MESSAGE);
            throw ex;
        } catch (NullPointerException ex) {
            throw ex;
        }
        return c;
    }

    public Customer testing(String custUsername, String custPWD) throws SQLException, NullPointerException {
        Customer c = new Customer();
        try {
            createConnection();
            String sqll = "select custID, custUsername, custName, custPWD, custEmail, custHP, custCrDate, custCrBy, custUpDate, custUpBy, cust_status FROM customerlist where custusername = ? and custpwd = ? and cust_status='Active'";
            stmt = conn.prepareStatement(sqll);

            stmt.setString(1, custUsername);
            stmt.setString(2, custPWD);

            ResultSet rs = stmt.executeQuery();

            if (rs.next()) {
                c.setCustID(rs.getInt(1));
                c.setCustUsername(rs.getString(2));
                c.setCustName(rs.getString(3));
                c.setCustPWD(rs.getString(4));
                c.setCustEmail(rs.getString(5));
                c.setCustHP(rs.getString(6));
                c.setCustCrDate(rs.getTimestamp(7));
                c.setCustCrBy(rs.getString(8));
                c.setCustUpDate(rs.getTimestamp(9));
                c.setCustUpBy(rs.getString(10));
                c.setCust_Status(rs.getString(11));
            }

        } catch (SQLException ex) {
//        JOptionPane.showMessageDialog(null, ex.getMessage(), "ERROR", JOptionPane.ERROR_MESSAGE);
            throw ex;
        } catch (NullPointerException ex) {
            throw ex;
        }
        return c;
    }

    public Customer getCustRecord(int custID) {
        Customer c = new Customer();
        try {
            createConnection();
            String getCustStr = "SELECT custID, custUsername, custName, custPWD, custEmail, custHP, custCrDate, custCrBy, custUpDate, custUpBy, cust_status FROM customerList WHERE custID = ?";

            stmt = conn.prepareStatement(getCustStr);
            stmt.setInt(1, custID);
            ResultSet rs = stmt.executeQuery();

            while (rs.next()) {
                System.out.println(rs.getInt("custID"));
                System.out.println(rs.getString("custUsername"));
                System.out.println(rs.getString("custName"));
                System.out.println(rs.getString("custPWD"));
                System.out.println(rs.getString("custEmail"));
                System.out.println(rs.getString("custHP"));
                System.out.println(rs.getTimestamp("custCrDate"));
                System.out.println(rs.getString("custCrBy"));
                System.out.println(rs.getTimestamp("custUpDate"));
                System.out.println(rs.getString("custUpBy"));
                System.out.println(rs.getString("cust_status"));

                c.setCustID(rs.getInt("custID"));
                c.setCustUsername(rs.getString("custUsername"));
                c.setCustName(rs.getString("custName"));
                c.setCustPWD(rs.getString("custPWD"));
                c.setCustEmail(rs.getString("custEmail"));
                c.setCustHP(rs.getString("custHP"));
                c.setCustCrDate(rs.getTimestamp("custCrDate"));
                c.setCustCrBy(rs.getString("custCrBy"));
                c.setCustUpDate(rs.getTimestamp("custUpDate"));
                c.setCustUpBy(rs.getString("custUpBy"));
                c.setCust_Status(rs.getString("cust_status"));
            }
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        return c;
    }

    public int checkEmailExist(String email) {
        int exist = 0;
        try {
            createConnection();
            System.out.println(email);
            String sqll = "SELECT * FROM CUSTOMERLIST where custemail=?";
            stmt = conn.prepareStatement(sqll);
            stmt.setString(1, email);
            ResultSet rs = stmt.executeQuery();
            if (rs.next()) {
                exist = 1;
            }

        } catch (SQLException ex) {

            System.out.println(ex.getMessage());

        }
        return exist;

    }

    public int updatePassword(String password, String email) {

        
        java.util.Date date = new java.util.Date();
        Timestamp custUpDate = new Timestamp(date.getTime());
        int row = 0;
        try {
            createConnection();

            String sqll = "UPDATE CUSTOMERLIST SET CUSTPWD = ?, custupdate = ? where custemail=?";
            stmt = conn.prepareStatement(sqll);
            stmt.setString(1, password);
            stmt.setTimestamp(2, custUpDate);
            stmt.setString(3, email);
            row = stmt.executeUpdate();

        } catch (SQLException ex) {

            System.out.println(ex.getMessage());

        }
        return row;
    }

    public int trygetid(String username, String passwd) throws SQLException, NullPointerException {
        int id = 0;
        try {
            createConnection();
            String sqll = "select custid,custusername,custpwd FROM customerlist where custusername = ? and custpwd = ?";
//        String sqll = "select custid,custusername,custpwd from customerlist where custusername =? and custpwd=?";
            stmt = conn.prepareStatement(sqll);

            stmt.setString(1, username);
            stmt.setString(2, passwd);

            ResultSet rs = stmt.executeQuery();

            if (rs.next()) {

                id = Integer.parseInt(rs.getString(1));
            }

        } catch (SQLException ex) {
//        JOptionPane.showMessageDialog(null, ex.getMessage(), "ERROR", JOptionPane.ERROR_MESSAGE);
            throw ex;
        } catch (NullPointerException ex) {
            throw ex;
        } finally {
            return id;
        }

    }

    public int updateRecord(Customer c) {
        int row = 0;
        try {
            createConnection();
            String updateStr = "UPDATE customerList SET custUsername = ?, custName =? , custPWD=?, custEmail =?, custHP=?, custUpDate = ?, custUpBy = ?, cust_Status =? where custID = ?";
            stmt = conn.prepareStatement(updateStr);

            stmt.setString(1, c.getCustUsername());
            stmt.setString(2, c.getCustName());
            stmt.setString(3, c.getCustPWD());
            stmt.setString(4, c.getCustEmail());
            stmt.setString(5, c.getCustHP());
            stmt.setTimestamp(6, c.getCustUpDate());
            stmt.setString(7, c.getCustUpBy());
            stmt.setString(8, c.getCust_Status());
            stmt.setInt(9, c.getCustID());

            row = stmt.executeUpdate();
            if (row > 0) {
                return 1;
            } else {
                return 0;
            }

        } catch (SQLException ex) {
            JOptionPane.showMessageDialog(null, ex);
            return 0;
        }
    }

    //ZHEXIAN
    public int deactiveActiveCust(Customer c) {
        int row = 0;

        try {
            createConnection();
            String sqll = "update customerlist set cust_status = ?, custupdate=?,custupby=? where custid=?";
            stmt = conn.prepareStatement(sqll);
            stmt.setString(1, c.getCust_Status());
            stmt.setTimestamp(2, c.getCustUpDate());
            stmt.setString(3, c.getCustUpBy());
            stmt.setInt(4, c.getCustID());
            row = stmt.executeUpdate();

        } catch (SQLException ex) {
            System.out.println(ex.getMessage());
        }

        return row;
    }

    public ArrayList<Customer> getAllCustomer() {
        ArrayList<Customer> custList = new ArrayList<>();

        try {
            createConnection();
            String sqll = "select * from customerlist";
            stmt = conn.prepareStatement(sqll);
            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                Customer c = new Customer();
                c.setCustID(rs.getInt(1));
                c.setCustUsername(rs.getString(2));
                c.setCustName(rs.getString(3));
                c.setCustEmail(rs.getString(5));
                c.setCustHP(rs.getString(6));
                c.setCust_Status(rs.getString(11));
                custList.add(c);
            }

        } catch (SQLException ex) {

            System.out.println(ex.getMessage());

        }
        return custList;
    }

    public int NoCustomerRegister() {
        int count = 0;
        try {
            createConnection();
            String sqll = "SELECT COUNT(CUSTID) FROM CUSTOMERLIST WHERE YEAR(CUSTCRDATE) = YEAR(CURRENT_DATE) AND MONTH(CUSTCRDATE) = MONTH(CURRENT_DATE)";
            stmt = conn.prepareStatement(sqll);
            ResultSet rs = stmt.executeQuery();
            if (rs.next()) {
                count = rs.getInt(1);
            }

        } catch (SQLException ex) {

            System.out.println(ex.getMessage());
        }
        return count;

    }
    
    public ResultSet checkUsername_Email(String custUsername, String custEmail){
    
        ResultSet rs =null;
        
        try{
            createConnection();
            String sqll = "select COUNT(custID),custUsername,custEmail from customerList where custUsername = ? OR custEmail=? GROUP BY custUsername,custEmail";
            stmt=conn.prepareStatement(sqll);
            stmt.setString(1, custUsername);
            stmt.setString(2, custEmail);
            rs=stmt.executeQuery();
            
        }catch(SQLException ex){
            System.err.println(custUsername);
            System.err.println(custEmail);
            System.err.println(ex.getMessage());
        
        }
    return rs;
    
    }

    
    

    

    private void createConnection() {
        try {

            conn = DriverManager.getConnection(host, user, password);
        } catch (SQLException ex) {
            JOptionPane.showMessageDialog(null, ex.getMessage(), "ERROR", JOptionPane.ERROR_MESSAGE);
        }
    }

}
