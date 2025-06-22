/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Domain;

import java.sql.Timestamp;

/**
 *
 * @author Rex Lim
 */
public class OrderDetails {
        
    private int orderDetailID;
    private int orderRow;
    private int prodID;
    private int ordQty;
    private double ordPrice;
    private Timestamp orderCrDate;
    private String orderCrBy;
    private Timestamp orderUpDate;
    private String orderUpBy;
    private Product product;
    
    private ProductImage productImage;
    public OrderDetails() {
    }

    public OrderDetails(int orderDetailID, int orderRow, int prodID, int ordQty, double ordPrice, Timestamp orderCrDate, String orderCrBy, Timestamp orderUpDate, String orderUpBy) {
        this.orderDetailID = orderDetailID;
        this.orderRow = orderRow;
        this.prodID = prodID;
        this.ordQty = ordQty;
        this.ordPrice = ordPrice;
        this.orderCrDate = orderCrDate;
        this.orderCrBy = orderCrBy;
        this.orderUpDate = orderUpDate;
        this.orderUpBy = orderUpBy;
    }

    public int getOrderDetailID() {
        return orderDetailID;
    }

    public int getOrderRow() {
        return orderRow;
    }

    public int getProdID() {
        return prodID;
    }

    public int getOrdQty() {
        return ordQty;
    }

    public double getOrdPrice() {
        return ordPrice;
    }

    public Timestamp getOrderCrDate() {
        return orderCrDate;
    }

    public String getOrderCrBy() {
        return orderCrBy;
    }

    public Timestamp getOrderUpDate() {
        return orderUpDate;
    }

    public String getOrderUpBy() {
        return orderUpBy;
    }

    public Product getProduct() {
        return product;
    }
    
            public ProductImage getProductImage() {
        return productImage;
    }
    

    public void setOrderDetailID(int orderDetailID) {
        this.orderDetailID = orderDetailID;
    }

    public void setOrderRow(int orderRow) {
        this.orderRow = orderRow;
    }

    public void setProdID(int prodID) {
        this.prodID = prodID;
    }

    public void setOrdQty(int ordQty) {
        this.ordQty = ordQty;
    }

    public void setOrdPrice(double ordPrice) {
        this.ordPrice = ordPrice;
    }

    public void setOrderCrDate(Timestamp orderCrDate) {
        this.orderCrDate = orderCrDate;
    }

    public void setOrderCrBy(String orderCrBy) {
        this.orderCrBy = orderCrBy;
    }

    public void setOrderUpDate(Timestamp orderUpDate) {
        this.orderUpDate = orderUpDate;
    }

    public void setOrderUpBy(String orderUpBy) {
        this.orderUpBy = orderUpBy;
    }

    public void setProduct(Product product) {
        this.product = product;
    }
    
        public void setProductImage(ProductImage productImage) {
        this.productImage = productImage;
    }
           
    
            
    
    
    
}
