
/*
* To change this license header, choose License Headers in Project Properties.
* To change this template file, choose Tools | Templates
* and open the template in the editor.
 */
package DataAccess;

import Domain.ProductCategory;
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
 * @author Rex Lim
 */
public class DAProductCategory {

    private String host = "jdbc:derby://localhost:1527/Innisfree";
    private String user = "nbuser";
    private String password = "nbuser";
    private Connection conn;
    private PreparedStatement stmt;

    public DAProductCategory() {
        createConnection();
    }

    public int addProdCategory(ProductCategory productCategory) {

        try {
            createConnection();
            String sqll = "insert into PRODCATEGORY (PRODCATNAME,PRODCATDESC,PRODCATCRDATE,PRODCATCRBY,PRODCATUPDATE,PRODCATUPBY,PRODCAT_STATUS,ISDELETED) values(?,?,?,?,?,?,?,?)";
            stmt = conn.prepareStatement(sqll);
            stmt.setString(1, productCategory.getProdCatName());
            stmt.setString(2, productCategory.getProdCatDesc());
            stmt.setTimestamp(3, productCategory.getProdCatCrDate());
            stmt.setString(4, productCategory.getProdCatCrBy());
            stmt.setTimestamp(5, productCategory.getProdCatUpDate());
            stmt.setString(6, productCategory.getProdCatUpBy());
            stmt.setString(7, productCategory.getProdCat_Status());
            stmt.setBoolean(8, productCategory.getIsdeleted());

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

    public int deleteProdCategory(String username, Timestamp upDate, int prodcatid) {

        try {
            createConnection();
            String sqll = "update PRODCATEGORY set isdeleted = ?, prodcatupby=?, prodcatupdate =? where prodcatid = ?";
            stmt = conn.prepareStatement(sqll);
            stmt.setBoolean(1, true);
            stmt.setString(2, username);
            stmt.setTimestamp(3, upDate);
            stmt.setInt(4, prodcatid);
            

            int row = stmt.executeUpdate();
            if(row>0){
                return 1;
            }else{
                return 0;
            }
        } catch (SQLException ex) {
            out.println("ERROR: " + ex.toString() + "<br /><br />");
            return 0;
        }
    }

    public ArrayList<ProductCategory> getAllProductsCategory() {
        ArrayList<ProductCategory> productsCategoryList = new ArrayList<>();
        try {
            createConnection();
            ResultSet rs = null;
            String sqll = "SELECT PRODCATID, PRODCATNAME,PRODCATDESC,PRODCATCRDATE,PRODCATCRBY,PRODCATUPDATE,PRODCATUPBY,PRODCAT_STATUS, ISDELETED FROM PRODCATEGORY WHERE ISDELETED = false";
            stmt = conn.prepareStatement(sqll);
            rs = stmt.executeQuery();

            while (rs.next()) {
                int prodCatID = rs.getInt(1);
                Timestamp prodCatCrDate = rs.getTimestamp(4);
                String prodCatCrBy = rs.getString(5);
                Timestamp prodCatUpDate = rs.getTimestamp(6);
                String prodCatUpBy = rs.getString(7);
                String prodCatName = rs.getString(2);
                String prodCatDesc = rs.getString(3);
                String prodCat_Status = rs.getString(8);
                Boolean isdeleted = rs.getBoolean(9);
                productsCategoryList.add(new ProductCategory(prodCatID, prodCatCrDate, prodCatCrBy, prodCatUpDate, prodCatUpBy, prodCatName, prodCatDesc, prodCat_Status, isdeleted));

            }

        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        return productsCategoryList;

    }

    
    
    public ArrayList<ProductCategory> getAllActiveProductsCategory() {
        ArrayList<ProductCategory> productsCategoryList = new ArrayList<>();
        try {
            createConnection();
            ResultSet rs = null;
            String sqll = "SELECT PRODCATID, PRODCATNAME,PRODCATDESC,PRODCATCRDATE,PRODCATCRBY,PRODCATUPDATE,PRODCATUPBY,PRODCAT_STATUS, ISDELETED FROM PRODCATEGORY WHERE ISDELETED = false and PRODCAT_STATUS='Active'";
            stmt = conn.prepareStatement(sqll);
            rs = stmt.executeQuery();

            while (rs.next()) {
                int prodCatID = rs.getInt(1);
                Timestamp prodCatCrDate = rs.getTimestamp(4);
                String prodCatCrBy = rs.getString(5);
                Timestamp prodCatUpDate = rs.getTimestamp(6);
                String prodCatUpBy = rs.getString(7);
                String prodCatName = rs.getString(2);
                String prodCatDesc = rs.getString(3);
                String prodCat_Status = rs.getString(8);
                Boolean isdeleted = rs.getBoolean(9);
                productsCategoryList.add(new ProductCategory(prodCatID, prodCatCrDate, prodCatCrBy, prodCatUpDate, prodCatUpBy, prodCatName, prodCatDesc, prodCat_Status, isdeleted));

            }

        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        return productsCategoryList;

    }
    public ProductCategory getProductsCategoryByID(String id) {
        ProductCategory pc = new ProductCategory();
        try {

            createConnection();
            ResultSet rs = null;
            String sqll = "SELECT PRODCATID, PRODCATNAME,PRODCATDESC,PRODCATCRDATE,PRODCATCRBY,PRODCATUPDATE,PRODCATUPBY,PRODCAT_STATUS, ISDELETED FROM PRODCATEGORY WHERE ISDELETED = false AND PRODCATID = ?";
            stmt = conn.prepareStatement(sqll);
            stmt.setString(1, id);
            rs = stmt.executeQuery();

            while (rs.next()) {
                int prodCatID = rs.getInt(1);
                Timestamp prodCatCrDate = rs.getTimestamp(4);
                String prodCatCrBy = rs.getString(5);
                Timestamp prodCatUpDate = rs.getTimestamp(6);
                String prodCatUpBy = rs.getString(7);
                String prodCatName = rs.getString(2);
                String prodCatDesc = rs.getString(3);
                String prodCat_Status = rs.getString(8);
                Boolean isdeleted = rs.getBoolean(9);

                pc.setProdCatID(prodCatID);
                pc.setProdCatCrDate(prodCatCrDate);
                pc.setProdCatCrBy(prodCatCrBy);
                pc.setProdCatUpDate(prodCatUpDate);
                pc.setProdCatUpBy(prodCatUpBy);
                pc.setProdCatName(prodCatName);
                pc.setProdCatDesc(prodCatDesc);
                pc.setProdCat_Status(prodCat_Status);
                pc.setIsdeleted(isdeleted);
            }

        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        return pc;
    }

    public int updateProdCategory(ProductCategory productCategory) {

        try {
            createConnection();
            String sqll = "UPDATE PRODCATEGORY SET PRODCATNAME = ?,PRODCATDESC=?,PRODCATUPDATE=?,PRODCATUPBY=?,PRODCAT_STATUS=? WHERE PRODCATID = ?";
            stmt = conn.prepareStatement(sqll);
            stmt.setString(1, productCategory.getProdCatName());
            stmt.setString(2, productCategory.getProdCatDesc());
            
            stmt.setTimestamp(3, productCategory.getProdCatUpDate());
            stmt.setString(4, productCategory.getProdCatUpBy());
            stmt.setString(5, productCategory.getProdCat_Status());
            stmt.setInt(6, productCategory.getProdCatID());

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
