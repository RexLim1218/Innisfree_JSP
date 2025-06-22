/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DataAccess;

;
import Domain.Employee;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

/**
 *
 * @author Rex Lim
 */


public class DAEmployee {

    private String host = "jdbc:derby://localhost:1527/Innisfree";
    private String user = "nbuser";
    private String password = "nbuser";
    private Connection conn;
    private PreparedStatement stmt;

    public Employee empLogin(String empUsername, String empPwd) throws SQLException, NullPointerException {
        Employee e = new Employee();

        try {
            createConnection();
            String sqll = "select empid,position,empusername,emppwd FROM employeelist where empusername = ? and emppwd = ?";
            stmt = conn.prepareStatement(sqll);

            stmt.setString(1, empUsername);
            stmt.setString(2, empPwd);

            ResultSet rs = stmt.executeQuery();

            if (rs.next()) {

                e.setEmpID(Integer.parseInt(rs.getString(1)));
                e.setPosition(rs.getString(2));
                e.setEmpUsername(rs.getString(3));
                e.setEmpPwd(rs.getString(4));
            }

        } catch (SQLException ex) {
//        JOptionPane.showMessageDialog(null, ex.getMessage(), "ERROR", JOptionPane.ERROR_MESSAGE);
            throw ex;
        } catch (NullPointerException ex) {
            throw ex;
        }
        return e;
    }

    
   
    public ResultSet checkUsername_Email(String username, String email) {

        ResultSet rs = null;

        try {
            createConnection();
            String sqll = "select COUNT(EMPID),empusername,EMPEMAIL from employeelist where empusername = ? OR empemail=? GROUP BY EMPUSERNAME,EMPEMAIL";
            stmt = conn.prepareStatement(sqll);
            stmt.setString(1, username);
            stmt.setString(2, email);
            rs = stmt.executeQuery();

        } catch (SQLException ex) {
            System.err.println(username);
            System.err.println(email);
            System.err.println(ex.getMessage());

        }
        return rs;

    }
    
    public ResultSet checkPasswordExist(String password,int empID){
        ResultSet rs =null;
        try{
            createConnection();
            String sqll = "select count(empid), emppwd from employeelist where emppwd = ? and empid = ? group by emppwd";
            stmt = conn.prepareStatement(sqll);
            stmt.setString(1, password);
            stmt.setInt(2,empID);
            rs=stmt.executeQuery();
        
        }catch(SQLException ex){
        
            System.out.println(ex.getMessage());
        }     
        
        
        
        return rs;
    
    }
    
    public int insertUser(Employee e){
        int row=0;
    
    
        try{
        createConnection();
            String sqll = "insert into employeelist (position,empusername,empname,emppwd,empcrdate,empcrby,empupdate,empupby,emphp,empemail,empstatus) values (?,?,?,?,?,?,?,?,?,?,?)";
            stmt = conn.prepareStatement(sqll);
            stmt.setString(1, e.getPosition());
            stmt.setString(2, e.getEmpUsername());
            stmt.setString(3, e.getEmpName());
            stmt.setString(4, e.getEmpPwd());
            stmt.setTimestamp(5, e.getEmpCrDate());
            stmt.setString(6, e.getEmpCrBy());
            stmt.setTimestamp(7, e.getEmpUpDate());
            stmt.setString(8, e.getEmpUpBy());
            stmt.setString(9, e.getEmpHp());
            stmt.setString(10, e.getEmpEmail());
            stmt.setString(11, e.getEmpStatus());
            
            row = stmt.executeUpdate();
            
            
        }catch(SQLException ex){
        
        System.out.println(ex.getMessage());
        }
        
    
        return row;
    }
    
    public int deactiveActiveUser (Employee e){
        int row = 0;
    
        try{
            createConnection();
            String sqll = "update employeelist set empstatus = ?, empupdate=?,empupby=? where empID=?";
            stmt = conn.prepareStatement(sqll);
            stmt.setString(1, e.getEmpStatus());
            stmt.setTimestamp(2, e.getEmpUpDate());
            stmt.setString(3, e.getEmpUpBy());
            stmt.setInt(4, e.getEmpID());
            row = stmt.executeUpdate();
            
            
        }catch(SQLException ex){
            System.out.println(ex.getMessage());
        }
        
        return row;
    }
    
    
    public int updatePassword (Employee e){
        int row = 0;
    
        try{
            createConnection();
            String sqll = "update employeelist set emppwd = ?, empupdate=?,empupby=? where empID=?";
            stmt = conn.prepareStatement(sqll);
            stmt.setString(1, e.getEmpPwd());
            stmt.setTimestamp(2, e.getEmpUpDate());
            stmt.setString(3, e.getEmpUpBy());
            stmt.setInt(4, e.getEmpID());
            row = stmt.executeUpdate();
            
            
        }catch(SQLException ex){
            System.out.println(ex.getMessage());
        }
        
        return row;
    }
    
    public int updateUser (Employee e){
        int row = 0;
    
        try{
            createConnection();
            String sqll = "update employeelist set empname = ?, empemail=?,emphp=?,empupdate=?,empupby=? where empID=?";
            stmt = conn.prepareStatement(sqll);
            stmt.setString(1, e.getEmpName());
            stmt.setString(2, e.getEmpEmail());
            stmt.setString(3, e.getEmpHp());
            stmt.setTimestamp(4, e.getEmpUpDate());
            stmt.setString(5, e.getEmpUpBy());
            stmt.setInt(6, e.getEmpID());
            row = stmt.executeUpdate();
            
            
        }catch(SQLException ex){
            System.out.println(ex.getMessage());
        }
        
        return row;
    }
    
    
    
    
    public ArrayList<Employee>getAllEmployeeList(){
        ArrayList<Employee>elist= new ArrayList<>();
        
        
        try{
            createConnection();
            String sqll = "select*from employeelist";
            stmt=conn.prepareStatement(sqll);
            
            ResultSet rs = stmt.executeQuery();
            
            while(rs.next()){
                Employee e = new Employee();
                
                e.setEmpID(rs.getInt(1));
                e.setPosition(rs.getString(2));
                e.setEmpUsername(rs.getString(3));
                e.setEmpName(rs.getString(4));
                e.setEmpCrDate(rs.getTimestamp(6));
                e.setEmpCrBy(rs.getString(7));
                e.setEmpUpDate(rs.getTimestamp(8));
                e.setEmpUpBy(rs.getString(9));
                e.setEmpStatus(rs.getString(12));
                
                elist.add(e);
            }
        
        }catch(SQLException ex){
        
            System.out.println(ex.getMessage());
        
        }
   
        
        return elist;
    }

    
    public Employee getEmployeeByID(int empID){
        Employee e = new Employee();
        
        try{
            createConnection();
            String sqll = "Select * from employeelist where empID = ?";
            stmt = conn.prepareStatement(sqll);
            stmt.setInt(1, empID);
            ResultSet rs = stmt.executeQuery();
            while(rs.next()){
                e.setEmpID(rs.getInt(1));
                e.setPosition(rs.getString(2));
                e.setEmpUsername(rs.getString(3));
                e.setEmpName(rs.getString(4));
                e.setEmpPwd(rs.getString(5));
                e.setEmpHp(rs.getString(10));
                e.setEmpEmail(rs.getString(11));
                e.setEmpStatus(rs.getString(12));
            }
        }catch(SQLException ex){
        
            System.out.println(ex.getMessage());
        }
        
        
        return e;
    
    }
    
    
    public Employee login(String empUsername, String empPwd) throws SQLException,NullPointerException {
        Employee e = new Employee();
        try {
            createConnection();
            String sqll = "select empID, position,empusername, empName, empPwd, empCrDate, empCrBy, empUpDate, empUpBy, empHP, empEmail, empStatus FROM employeeList where empUsername = ? and empPwd = ? and empstatus='Active'";
            stmt = conn.prepareStatement(sqll);

            stmt.setString(1, empUsername);
            stmt.setString(2, empPwd);

            ResultSet rs = stmt.executeQuery();

            if (rs.next()) {
                e.setEmpID(rs.getInt(1));
                e.setPosition(rs.getString(2));
                e.setEmpUsername(rs.getString(3));
                e.setEmpName(rs.getString(4));
                e.setEmpPwd(rs.getString(5));
                e.setEmpCrDate(rs.getTimestamp(6));
                e.setEmpCrBy(rs.getString(7));
                e.setEmpUpDate(rs.getTimestamp(8));
                e.setEmpUpBy(rs.getString(9));
                e.setEmpHp(rs.getString(10));
                e.setEmpEmail(rs.getString(11));
                e.setEmpStatus(rs.getString(11));
            }
            System.out.println(e.getEmpUsername());

        } catch (SQLException ex) {

            throw ex;
        } catch (NullPointerException ex) {
            throw ex;
        }
        return e;
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
