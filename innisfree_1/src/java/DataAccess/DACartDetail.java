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
import java.util.ArrayList;

/**
 *
 * @author Asus
 */
public class DACartDetail {

    private String host = "jdbc:derby://localhost:1527/Innisfree";
    private String user = "nbuser";
    private String password = "nbuser";
    private Connection conn;
    private PreparedStatement stmt;

    public DACartDetail() {
        createConnection();
    }

    public ResultSet getCartDetailById(int prodID, int custID) {

        CartDetail cd = new CartDetail();
        Cart c = new Cart();
        ResultSet rs = null;

        try {
            createConnection();
            String sqll = "select CD.CARTDETAILID, CD.CARTID, CD.PRODID, CD.CARTDETAILQTY from CARTDETAIL AS CD INNER JOIN CART AS C ON CD.CARTID = C.CARTID WHERE CD.PRODID = ? and C.CUSTID = ?";
            stmt = conn.prepareStatement(sqll);
            stmt.setInt(1, prodID);
            stmt.setInt(2, custID);
            rs = stmt.executeQuery();

            if (rs.next()) {
                cd.setcartDetailID(rs.getInt(1));
                cd.setcartID(rs.getInt(2));
                cd.setprodID(rs.getInt(3));
                cd.setcartDetailQty(rs.getInt(4));
            }

        } catch (SQLException ex) {

        }

        return rs;
    }

    public CartDetail getCartDetailById2(int prodID, int custID) throws SQLException {

        CartDetail cd = new CartDetail();
        Cart c = new Cart();
        ResultSet rs = null;

        try {
            createConnection();
            String sqll = "select CD.CARTDETAILID, CD.CARTID, CD.PRODID, CD.CARTDETAILQTY from CARTDETAIL AS CD INNER JOIN CART AS C ON CD.CARTID = C.CARTID WHERE CD.PRODID = ? and C.CUSTID = ?";
            stmt = conn.prepareStatement(sqll);
            stmt.setInt(1, prodID);
            stmt.setInt(2, custID);
            rs = stmt.executeQuery();

            if (rs.next()) {
                cd.setcartDetailID(rs.getInt(1));
                cd.setcartID(rs.getInt(2));
                cd.setprodID(rs.getInt(3));
                cd.setcartDetailQty(rs.getInt(4));
            }

        } catch (SQLException ex) {
            throw ex;
        }
        shutDown();

        return cd;
    }

    public CartDetail getCartDetailById3(int prodID, int custID) throws SQLException {

        CartDetail cd = new CartDetail();
        Cart c = new Cart();
        ResultSet rs = null;

        try {
            createConnection();
            String sqll = "select CD.CARTDETAILID, CD.CARTID, CD.PRODID, CD.CARTDETAILQTY from CARTDETAIL AS CD INNER JOIN CART AS C ON CD.CARTID = C.CARTID WHERE CD.PRODID = ? and C.CUSTID = ?";
            stmt = conn.prepareStatement(sqll);
            stmt.setInt(1, prodID);
            stmt.setInt(2, custID);
            rs = stmt.executeQuery();

            if (rs.next()) {
                cd.setcartDetailID(rs.getInt(1));
                cd.setcartID(rs.getInt(2));
                cd.setprodID(rs.getInt(3));
                cd.setcartDetailQty(rs.getInt(4));
            }

        } catch (SQLException ex) {
            throw ex;
        }
        shutDown();

        return cd;
    }

    public int addCartDetail(CartDetail cartDetail) {

        try {
            createConnection();
            String sqll = "insert into CARTDETAIL (CARTID,PRODID,CARTDETAILQTY) values(?,?,?)";
            stmt = conn.prepareStatement(sqll);
            stmt.setInt(1, cartDetail.getcartID());
            stmt.setInt(2, cartDetail.getprodID());
            stmt.setInt(3, cartDetail.getcartDetailQty());

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

    public CartDetail getProdIDByCartID(int cartid) {
        CartDetail cd = new CartDetail();
        try {

            createConnection();
            ResultSet rs = null;
            String sqll = "SELECT PRODID FROM CARTDETAIL WHERE CARTID = ?";
            stmt = conn.prepareStatement(sqll);
            stmt.setInt(1, cartid);
            rs = stmt.executeQuery();

            if (rs.next()) {

                cd.setprodID(rs.getInt(1));

            }

        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        shutDown();
        return cd;
    }
    
    
    public int getCountofCartDetail(int custid){
    int row=0;
        try{
            createConnection();
            String sqll = "SELECT COUNT(CARTDETAILID) FROM CARTDETAIL CD INNER JOIN CART C ON C.CARTID = CD.CARTID WHERE C.CUSTID = ?";
            stmt = conn.prepareStatement(sqll);
            stmt.setInt(1, custid);
            ResultSet rs = stmt.executeQuery();
            if(rs.next()){
                row=rs.getInt(1);
            }
        }catch(SQLException ex){System.out.println(ex.getMessage());}
    return row;
    }
    

    public ArrayList<CartDetail> getAllCartProductByCustID(int custid) {
        ArrayList<CartDetail> cartProductList = new ArrayList<>();

        try {
            createConnection();

            String sqll = "SELECT C.CARTID, CD.CARTDETAILID, CD.PRODID, CD.CARTDETAILQTY, PL.PRODNAME, PL.PROD_FINALPRICE, (SELECT PI.PRODIMG FROM PRODIMAGE PI WHERE PI.PRODID = PL.PRODID FETCH FIRST 1 ROWS ONLY) AS PRODIMG FROM CART AS C INNER JOIN CARTDETAIL CD ON C.CARTID = CD.CARTID INNER JOIN PRODUCTLIST PL ON CD.PRODID = PL.PRODID WHERE C.CUSTID =?";


            stmt = conn.prepareStatement(sqll);
            stmt.setInt(1, custid);
            ResultSet rs = stmt.executeQuery();

            while (rs.next()) {
                Cart c = new Cart();
                CartDetail cd = new CartDetail();
                Product pl = new Product();
                ProductImage pi = new ProductImage();

                c.setcartID(rs.getInt(1));
                cd.setcartDetailID(rs.getInt(2));
                cd.setprodID(rs.getInt(3));
                cd.setcartDetailQty(rs.getInt(4));
                pl.setProdName(rs.getString(5));
                pl.setProd_FinalPrice(rs.getDouble(6));
                pl.setsingleProductTotalPrice(rs.getDouble("prod_FinalPrice") * cd.getcartDetailQty());

                // pi.setProdImg(rs.getBlob(7));
                Blob blob = rs.getBlob(7);
                byte[] imageData = blob.getBytes(1, (int) blob.length());
                pi.setGetImg(imageData);

                cd.setCart(c);
                cd.setProduct(pl);
                cd.setProductImage(pi);

                cartProductList.add(cd);
                // cd.getCart().getcartID();   //array list

            }

        } catch (SQLException ex) {
        }
        return cartProductList;
    }

    public void updateCartProductQty(CartDetail cd) {

        try {

            createConnection();
            String sqll = "UPDATE CARTDETAIL SET CARTDETAILQTY = ? WHERE CARTDETAILID = ?";
            stmt = conn.prepareStatement(sqll);
            stmt.setInt(1, cd.getcartDetailQty());
            stmt.setInt(2, cd.getcartDetailID());

            stmt.executeUpdate();

        } catch (SQLException ex) {
            out.println("ERROR: " + ex.toString() + "<br /><br />");
        }
        shutDown();
    }

    public double getTotalCartPrice(ArrayList<CartDetail> cartProductList) {
        ResultSet rs = null;
        double sum = 0;
        try {
            createConnection();
            if (cartProductList.size() > 0) {
                for (CartDetail cd : cartProductList) {
                    // String sqll = "SELECT PL.PROD_FINALPRICE FROM CARTDETAIL AS CD INNER JOIN PRODUCTLIST PL ON CD.PRODID = PL.PRODID WHERE CD.CARTDETAILID = ?";
                    String sqll = "select prod_FinalPrice from productList where prodID=?";
                    stmt = conn.prepareStatement(sqll);
                    stmt.setInt(1, cd.getprodID());
                    rs = stmt.executeQuery();
                    while (rs.next()) {
                        sum += rs.getDouble("prod_FinalPrice") * cd.getcartDetailQty();
                    }
                }
            }

            
            sum = Math.round(sum * 100.0) / 100.0;
        } catch (SQLException e) {

            System.out.println(e.getMessage());
        }
        return sum;
    }

    public int removeCartListProduct(int cartdetailid) {

        try {
            createConnection();
            String sqll = "DELETE FROM CARTDETAIL WHERE CARTDETAILID=?";
            stmt = conn.prepareStatement(sqll);
            stmt.setInt(1, cartdetailid);

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

    public ArrayList<CartDetail> getAllCartDetailByCartID2(int cartid) {
        ArrayList<CartDetail> cartProductList = new ArrayList<>();

        try {
            createConnection();
            //SELECT C.CARTID, CD.CARTDETAILID, CD.PRODID, CD.CARTDETAILQTY, PL.PRODNAME, PL.PROD_FINALPRICE, (SELECT PI.PRODIMG FROM PRODIMAGE PI WHERE PI.PRODID = PL.PRODID FETCH FIRST 1 ROWS ONLY) AS PRODIMG FROM CART AS C INNER JOIN CARTDETAIL CD ON C.CARTID = CD.CARTID INNER JOIN PRODUCTLIST PL ON CD.PRODID = PL.PRODID WHERE C.CUSTID =100001;

            String sqll = "SELECT cd.CARTDETAILID, cd.PRODID, cd.CARTDETAILQTY, (cd.CARTDETAILQTY * p.PROD_FINALPRICE) AS ORDERPRICE FROM CARTDETAIL cd INNER JOIN productList p ON cd.PRODID = p.prodid  WHERE cartid = ? GROUP BY cd.PRODID, cd.CARTDETAILQTY, p.PROD_FINALPRICE,cd.cartdetailid";
//            String sqll = "SELECT C.CARTID, CD.CARTDETAILID, CD.PRODID, CD.CARTDETAILQTY, PL.PRODNAME, PL.PROD_FINALPRICE, \n"
//                    + "(SELECT PI.PRODIMG FROM PRODIMAGE PI WHERE PI.PRODID = PL.PRODID FETCH FIRST 1 ROWS ONLY) AS PRODIMG\n"
//                    + "FROM CART AS C \n"
//                    + "INNER JOIN CARTDETAIL CD ON C.CARTID = CD.CARTID \n"
//                    + "INNER JOIN PRODUCTLIST PL ON CD.PRODID = PL.PRODID \n"
//                    + "WHERE C.CUSTID =?";

            stmt = conn.prepareStatement(sqll);
            stmt.setInt(1, cartid);
            ResultSet rs = stmt.executeQuery();

            while (rs.next()) {
                CartDetail cd = new CartDetail();

                cd.setcartDetailID(rs.getInt(1));
                cd.setprodID(rs.getInt(2));
                cd.setcartDetailQty(rs.getInt(3));
                cd.setorderPrice(rs.getDouble(4));

                cartProductList.add(cd);

            }

        } catch (SQLException ex) {
        }
        return cartProductList;
    }

    public int removeCartListProduct2(int cartid) {

        try {
            createConnection();
            String sqll = "DELETE FROM CARTDETAIL WHERE CARTID=?";
            stmt = conn.prepareStatement(sqll);
            stmt.setInt(1, cartid);

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
    
    
     public int countCartDetailQtyBycustID(int custid) {
       int row =0;
        try {

            createConnection();
            ResultSet rs = null;
            String sqll = "SELECT COUNT(CD.CARTDETAILID) FROM CARTDETAIL AS CD INNER JOIN CART C ON CD.CARTID = C.CARTID WHERE C.CUSTID = ?";
            stmt = conn.prepareStatement(sqll);
            stmt.setInt(1, custid);
            rs = stmt.executeQuery();

            if (rs.next()) {

                row=rs.getInt(1);

            }

        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        shutDown();
        return row;
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
