/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DataAccess;

import Domain.Product;
import Domain.ProductCategory;
import static java.lang.System.out;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;

/**
 *
 * @author Rex Lim
 */
public class DAProduct {

    private String host = "jdbc:derby://localhost:1527/Innisfree";
    private String user = "nbuser";
    private String password = "nbuser";
    private Connection conn;
    private PreparedStatement stmt;

    public DAProduct() {
        createConnection();
    }

    public int insertProd(Product p) {

        try {
            createConnection();
            String sqll = "insert into productlist (PRODCATID, PRODNAME, PRODCRDATE, PRODCRBY, PRODUPDATE, PRODUPBY, PRODDESC, PRODMANUAL, PRODINGREDIENTS, PRODAVAILABLE_QTY, DISCOUNT, PROD_ORIPRICE, PROD_FINALPRICE, PROD_STATUS, ISDELETED) values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
            stmt = conn.prepareStatement(sqll);
            stmt.setInt(1, p.getProdCatID());
            stmt.setString(2, p.getProdName());
            stmt.setTimestamp(3, p.getProdCrDate());
            stmt.setString(4, p.getProdCrBy());
            stmt.setTimestamp(5, p.getProdUpDate());
            stmt.setString(6, p.getProdUpBy());
            stmt.setString(7, p.getProdDesc());
            stmt.setString(8, p.getProdManual());
            stmt.setString(9, p.getProdIngredients());
            stmt.setInt(10, p.getProdAvailable_Qty());
            stmt.setInt(11, p.getDiscount());
            stmt.setDouble(12, p.getProd_OriPrice());
            stmt.setDouble(13, p.getProd_FinalPrice());
            stmt.setString(14, p.getProd_Status());
            stmt.setBoolean(15, p.getIsdeleted());

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

    public int updateProd(Product p) throws SQLException{
        int row = 0;

        String sqll = "update PRODUCTLIST set PRODCATID = ?, PRODNAME = ?, PRODUPDATE = ?, PRODUPBY = ?, PRODDESC = ?, PRODMANUAL = ?, PRODINGREDIENTS = ?, PRODAVAILABLE_QTY = ?, DISCOUNT = ?, PROD_ORIPRICE = ?, PROD_FINALPRICE = ?, PROD_STATUS = ? WHERE PRODID = ?";

        try{
           createConnection();
        stmt = conn.prepareStatement(sqll);
        stmt.setInt(1, p.getProdCatID());
        stmt.setString(2, p.getProdName());
        stmt.setTimestamp(3, p.getProdUpDate());
        stmt.setString(4, p.getProdUpBy());
        stmt.setString(5, p.getProdDesc());
        stmt.setString(6, p.getProdManual());
        stmt.setString(7,p.getProdIngredients());
        stmt.setInt(8, p.getProdAvailable_Qty());
        stmt.setInt(9, p.getDiscount());
        stmt.setDouble(10, p.getProd_OriPrice());
        stmt.setDouble(11, p.getProd_FinalPrice());
        stmt.setString(12, p.getProd_Status());
        stmt.setInt(13, p.getProdID());
        
        row = stmt.executeUpdate();
        
        }catch(SQLException ex){
            throw ex;
        }
        
        return row;
    }
    public int updateProdQty(Product p) throws SQLException{
        int row = 0;

        String sqll = "update productlist set PRODUPDATE = ?, PRODUPBY = ?, PRODAVAILABLE_QTY = ? WHERE PRODID = ?";

        try{
            createConnection();
        stmt = conn.prepareStatement(sqll);
       
        stmt.setTimestamp(1, p.getProdUpDate());
        stmt.setString(2, p.getProdUpBy());
       
        stmt.setInt(3, p.getProdAvailable_Qty());
        
       
        stmt.setInt(4, p.getProdID());
        
        row = stmt.executeUpdate();
        
        }catch(SQLException ex){
            throw ex;
        }
        
        return row;
    }

    
    public int deleteProduct(int prodID,String username, Timestamp UpDate){
        int row = 0;
        
        try{
            createConnection();
            
            String sqll = "update productlist set produpdate=?, produpby=?, isdeleted = ? where prodid =?";
            stmt=conn.prepareStatement(sqll);
            stmt.setTimestamp(1, UpDate);
            stmt.setString(2, username);
            stmt.setBoolean(3, true);
            stmt.setInt(4, prodID);
            row = stmt.executeUpdate();
            if(row>0){
                return 1;
            }else{
                return 0;
            }
            
        }catch(SQLException ex){
            System.out.println("ERROR: " + ex.toString() + "<br /><br />");
            return 0;
        }
    }
    
    
    public ArrayList<Product> getAllProduct() {
        ArrayList<Product> productList = new ArrayList<>();

        try {
            createConnection();
            String sqll = "select P.PRODID,P.PRODCATID, P.PRODNAME, P.PRODCRDATE, P.PRODCRBY, P.PRODUPDATE, P.PRODUPBY, P.PRODDESC, P.PRODMANUAL, P.PRODINGREDIENTS, P.PRODAVAILABLE_QTY, P.DISCOUNT, P.PROD_ORIPRICE, P.PROD_FINALPRICE, P.PROD_STATUS, P.ISDELETED, PC.PRODCATNAME from PRODUCTLIST AS P INNER JOIN PRODCATEGORY PC ON P.PRODCATID = PC.PRODCATID WHERE P.ISDELETED = false";
            //String sqll = "select P.PRODID,P.PRODCATID, P.PRODNAME, P.PRODCRDATE, P.PRODCRBY, P.PRODUPDATE, P.PRODUPBY, P.PRODDESC, P.PRODMANUAL, P.PRODINGREDIENTS, P.PRODAVAILABLE_QTY, P.DISCOUNT, P.PROD_ORIPRICE, P.PROD_FINALPRICE, P.PROD_STATUS, P.ISDELETED, PC.PRODCATNAME from PRODUCTLIST P,PRODCATEGORY PC WHERE P.PRODCATID = PC.PRODCATID";
            stmt = conn.prepareStatement(sqll);

            ResultSet rs = stmt.executeQuery();

            while (rs.next()) {
                Product p = new Product();
                ProductCategory pc = new ProductCategory();
                p.setProdID(rs.getInt(1));
                p.setProdCatID(rs.getInt(2));
                p.setProdName(rs.getString(3));
                p.setProdCrDate(rs.getTimestamp(4));
                p.setProdCrBy(rs.getString(5));
                p.setProdUpDate(rs.getTimestamp(6));
                p.setProdUpBy(rs.getString(7));
                p.setProdDesc(rs.getString(8));
                p.setProdManual(rs.getString(9));
                p.setProdIngredients(rs.getString(10));
                p.setProdAvailable_Qty(rs.getInt(11));
                p.setDiscount(rs.getInt(12));
                p.setProd_OriPrice(rs.getDouble(13));
                p.setProd_FinalPrice(rs.getDouble(14));
                p.setProd_Status(rs.getString(15));
                p.setIsdeleted(rs.getBoolean(16));
                pc.setProdCatName(rs.getString(17));

                p.setProdCat(pc);
                productList.add(p);
            }

        } catch (SQLException ex) {
        }
        return productList;
    }

    public Product getProductById(int id) {

        Product p = new Product();
        ProductCategory pc = new ProductCategory();

        try {
            createConnection();
            String sqll = "select P.PRODID,P.PRODCATID, P.PRODNAME, P.PRODCRDATE, P.PRODCRBY, P.PRODUPDATE, P.PRODUPBY, P.PRODDESC, P.PRODMANUAL, P.PRODINGREDIENTS, P.PRODAVAILABLE_QTY, P.DISCOUNT, P.PROD_ORIPRICE, P.PROD_FINALPRICE, P.PROD_STATUS, P.ISDELETED, PC.PRODCATNAME from PRODUCTLIST AS P INNER JOIN PRODCATEGORY PC ON P.PRODCATID = PC.PRODCATID WHERE P.ISDELETED = false and PRODID = ?";
            stmt = conn.prepareStatement(sqll);
            stmt.setInt(1, id);
            ResultSet rs = stmt.executeQuery();

            if (rs.next()) {
                p.setProdID(rs.getInt(1));
                p.setProdCatID(rs.getInt(2));
                p.setProdName(rs.getString(3));
                p.setProdCrDate(rs.getTimestamp(4));
                p.setProdCrBy(rs.getString(5));
                p.setProdUpDate(rs.getTimestamp(6));
                p.setProdUpBy(rs.getString(7));
                p.setProdDesc(rs.getString(8));
                p.setProdManual(rs.getString(9));
                p.setProdIngredients(rs.getString(10));
                p.setProdAvailable_Qty(rs.getInt(11));
                p.setDiscount(rs.getInt(12));
                p.setProd_OriPrice(rs.getDouble(13));
                p.setProd_FinalPrice(rs.getDouble(14));
                p.setProd_Status(rs.getString(15));
                p.setIsdeleted(rs.getBoolean(16));
                pc.setProdCatName(rs.getString(17));

                p.setProdCat(pc);

            }

        } catch (SQLException ex) {

        }
        return p;
    }

    public int selectProdID() {
        int prodID = 0;
        try {
            String sqll = "select max(prodid) from productlist";
            stmt = conn.prepareStatement(sqll);

            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                prodID = rs.getInt(1);

            }
        } catch (SQLException ex) {
        } finally {
            return prodID;
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
