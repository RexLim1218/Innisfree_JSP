/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DataAccess;

import Domain.Product;
import Domain.ProductImage;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.sql.Blob;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
import javax.servlet.http.Part;
import javax.sql.rowset.serial.SerialBlob;

/**
 *
 * @author Rex Lim
 */
public class DAProductImage {

    private String host = "jdbc:derby://localhost:1527/Innisfree";
    private String user = "nbuser";
    private String password = "nbuser";
    private Connection conn;
    private PreparedStatement stmt;

    public DAProductImage() {
        createConnection();
    }

    public int insertImage(ProductImage pi) {
        int row = 0;
        try {
            createConnection();
            String sqll = "insert into prodimage (PRODID, PRODIMGCRDATE, PRODIMGCRBY, PRODIMGUPDATE, PRODIMGUPBY, PRODIMG, PRODIMG_STATUS) values(?,?,?,?,?,?,?)";
            stmt = conn.prepareStatement(sqll);
            stmt.setInt(1, pi.getProdID());
            stmt.setTimestamp(2, pi.getProdImgCrDate());
            stmt.setString(3, pi.getProdImgCrBy());
            stmt.setTimestamp(4, pi.getProdImgUpDate());
            stmt.setString(5, pi.getProdImgUpBy());
            stmt.setBlob(6, pi.getProdImg());
            stmt.setString(7, pi.getProdImg_Status());
            row = stmt.executeUpdate();
            if (row > 0) {
                return 1;
            } else {
                return 0;
            }

        } catch (SQLException ex) {
        }

        return row;
        //return 1;
    }

    public int updateDateOnly(int detailID, String username, Timestamp update) {
        int row = 0;

        try {
            createConnection();

            String sqll = "update prodimage set prodimgupdate=?,prodimgupby = ? where PRODIMGID =?";
            stmt = conn.prepareStatement(sqll);
            stmt.setTimestamp(1, update);
            stmt.setString(2, username);

            stmt.setInt(3, detailID);
            row = stmt.executeUpdate();
            if (row > 0) {
                return 1;
            } else {
                return 0;
            }

        } catch (SQLException ex) {
            System.out.println("ERROR: " + ex.toString() + "<br /><br />");
            return 0;

        }
    }

    public int updateUsingID(ProductImage pi) {
        int row = 0;

        try {
            createConnection();

            String sqll = "update prodimage set prodimgupdate=?,prodimgupby = ?,prodimg=? where PRODIMGID =?";
            stmt = conn.prepareStatement(sqll);
            stmt.setTimestamp(1, pi.getProdImgUpDate());
            stmt.setString(2, pi.getProdImgUpBy());

            stmt.setBlob(3, pi.getProdImg());
            stmt.setInt(4, pi.getProdImgID());
            row = stmt.executeUpdate();
            if (row > 0) {
                return 1;
            } else {
                return 0;
            }

        } catch (SQLException ex) {
            System.out.println("ERROR: " + ex.toString() + "<br /><br />");
            return 0;

        }
    }

    public int deleteProductImage(int prodID, String username, Timestamp update) {
        int row = 0;

        try {
            createConnection();

            String sqll = "update prodimage set prodimgupdate=?,prodimgupby = ?, prodimg_status = ? where prodid =?";
            stmt = conn.prepareStatement(sqll);
            stmt.setTimestamp(1, update);
            stmt.setString(2, username);
            stmt.setString(3, "Deactive");
            stmt.setInt(4, prodID);
            row = stmt.executeUpdate();
            if (row > 0) {
                return 1;
            } else {
                return 0;
            }

        } catch (SQLException ex) {
            System.out.println("ERROR: " + ex.toString() + "<br /><br />");
            return 0;
        }
    }

    public ArrayList<ProductImage> getAllProductImg(ArrayList<Product> p) throws SQLException {

        ArrayList<ProductImage> imageList = new ArrayList<>();

        try {
            createConnection();
            for (Product list : p) {

                String sqll = "select prodimgid, prodid, prodimgcrdate, prodimgcrby, prodimgupdate, prodimgupby, prodimg, prodimg_status from prodimage where prodimg_status = 'Active' and prodID =? FETCH FIRST 1 ROWS ONLY";
                stmt = conn.prepareStatement(sqll);
                stmt.setInt(1, list.getProdID());

                ResultSet rs = stmt.executeQuery();

                ProductImage pi = new ProductImage();

                while (rs.next()) {
                    pi.setProdImgID(rs.getInt(1));
                    pi.setProdID(rs.getInt(2));
                    pi.setProdImgCrDate(rs.getTimestamp(3));
                    pi.setProdImgCrBy(rs.getString(4));
                    pi.setProdImgUpDate(rs.getTimestamp(5));
                    pi.setProdImgUpBy(rs.getString(6));

                    Blob blob = rs.getBlob(7);
                    byte[] imageData = blob.getBytes(1, (int) blob.length());
                    pi.setGetImg(imageData);

                    pi.setProdImg_Status(rs.getString(8));

                    imageList.add(pi);
                }
            }

        } catch (SQLException ex) {
            throw ex;
        }
        return imageList;

    }

    public ArrayList<ProductImage> getProductImgById(int prodID) throws SQLException {

        ArrayList<ProductImage> list = new ArrayList<>();
        try {
            createConnection();

            String sqll = "select prodimgid, prodimg from prodimage where prodimg_status = 'Active' and prodID =?";
            stmt = conn.prepareStatement(sqll);
            stmt.setInt(1, prodID);

            ResultSet rs = stmt.executeQuery();

            while (rs.next()) {
                ProductImage pi = new ProductImage();
                pi.setProdImgID(rs.getInt(1));

                Blob blob = rs.getBlob(2);
                byte[] imageData = blob.getBytes(1, (int) blob.length());
                pi.setGetImg(imageData);

                list.add(pi);

            }

        } catch (SQLException ex) {
            throw ex;
        }
        return list;

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

    public ProductImage changeToBlob(int prodId, Timestamp prodImgCrDate, String prodImgCrBy, Timestamp prodImgUpDate, String prodImgUpBy, Part filePart, String prodImg_Status) throws IOException {
        InputStream inputStream = null;

        ProductImage pi = new ProductImage();

        if (filePart != null) {
            inputStream = filePart.getInputStream();
        }
        byte[] imageData = null;
        if (inputStream != null) {
            ByteArrayOutputStream outputStream = new ByteArrayOutputStream();
            byte[] buffer = new byte[4096];
            int bytesRead = -1;
            while ((bytesRead = inputStream.read(buffer)) != -1) {
                outputStream.write(buffer, 0, bytesRead);
            }
            imageData = outputStream.toByteArray();
        }
        Blob image = null;
        if (imageData != null) {
            try {
                image = new SerialBlob(imageData);
            } catch (SQLException ex) {

            }
        }

        pi.setProdID(prodId);
        pi.setProdImgCrDate(prodImgCrDate);
        pi.setProdImgCrBy(prodImgCrBy);
        pi.setProdImgUpDate(prodImgUpDate);
        pi.setProdImgUpBy(prodImgUpBy);
        pi.setProdImg(image);
        pi.setProdImg_Status(prodImg_Status);
        return pi;
    }

    public ProductImage changeToBlobFORUPDATE(int prodImgID, Timestamp prodImgUpDate, String prodImgUpBy, Part filePart) throws IOException {
        InputStream inputStream = null;

        ProductImage pi = new ProductImage();

        if (filePart != null) {
            inputStream = filePart.getInputStream();
        }
        byte[] imageData = null;
        if (inputStream != null) {
            ByteArrayOutputStream outputStream = new ByteArrayOutputStream();
            byte[] buffer = new byte[4096];
            int bytesRead = -1;
            while ((bytesRead = inputStream.read(buffer)) != -1) {
                outputStream.write(buffer, 0, bytesRead);
            }
            imageData = outputStream.toByteArray();
        }
        Blob image = null;
        if (imageData != null) {
            try {
                image = new SerialBlob(imageData);
            } catch (SQLException ex) {

            }
        }

        pi.setProdImgID(prodImgID);
        pi.setProdImgUpDate(prodImgUpDate);
        pi.setProdImgUpBy(prodImgUpBy);
        pi.setProdImg(image);
        
        return pi;
    }
}
