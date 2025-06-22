/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Domain;

import java.sql.Timestamp;

/**
 *
 * @author Asus
 */
//    CART TABLE 
//-CARTID
//-CUSTID
//-CARTUPDATE
//INSERT INTO CART (CLOUMN NAMW) VALUES(?,?,?)
//
//
//CARTDETAIL TABLE
//-CARTDETAILID 
//-CARTID
//-PRODID
//-CARTDETAILQTY
//
//
//INSERT INTO  CARTDETAIL 
public class CartDetail {

    private int cartQty;
    private int cartDetailID;
    private int cartID;
    private int prodID;
    private int cartDetailQty;
    private double orderPrice;
    
    private Cart cart;
    private Product product;
    private ProductImage productImage;

    
    
    public CartDetail() {
    }

    public CartDetail(int cartDetailID, int cartID, int prodID, int cartDetailQty, double orderPrice) {
        this.cartID = cartID;
        this.cartDetailID = cartDetailID;
        this.prodID = prodID;
        this.cartDetailQty = cartDetailQty;
        this.orderPrice = orderPrice;

    }

    public int getcartQty() {
        return cartQty;
    }

    public void setcartQty(int cartQty) {
        this.cartQty = cartQty;

    }
    
    public double getorderPrice(){
       return orderPrice;
    }
    
    public void setorderPrice(double orderPrice){
        this.orderPrice = orderPrice;
    }
    

    //getter
    
        public int getcartDetailID() {
        return cartDetailID;
    }

        
    public int getcartID() {
        return cartID;
    }

    public int getprodID() {
        return prodID;
    }

    public int getcartDetailQty() {
        return cartDetailQty;
    }

    public Cart getCart() {
        return cart;
    }

    public Product getProduct() {
        return product;
    }

    public ProductImage getProductImage() {
        return productImage;
    }

    
    //setter
    
     public void setcartDetailID(int cartDetailID) {
        this.cartDetailID = cartDetailID;
    }
     
     
    public void setcartID(int cartID) {
        this.cartID = cartID;
    }

    public void setprodID(int prodID) {
        this.prodID = prodID;
    }

    public void setcartDetailQty(int cartDetailQty) {
        this.cartDetailQty = cartDetailQty;
    }

    public void setCart(Cart cart) {
        this.cart = cart;
    }

    public void setProduct(Product product) {
        this.product = product;
    }

    public void setProductImage(ProductImage productImage) {
        this.productImage = productImage;
    }


}
