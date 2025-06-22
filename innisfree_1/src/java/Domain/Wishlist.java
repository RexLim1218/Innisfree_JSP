/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Domain;

/**
 *
 * @author yokec
 */

public class Wishlist {
    private int wishID;
    private int custID;
    private int prodID;

    public Wishlist() {
    }

    public Wishlist(int wishID, int custID, int prodID) {
        this.wishID = wishID;
        this.custID = custID;
        this.prodID = prodID;
    }
    
    
    
    //getter
    public int getWishID() {
        return wishID;
    }

    public int getCustID() {
        return custID;
    }

    public int getProdID() {
        return prodID;
    }
    
    
    
    //setter
    public void setWishID(int wishID) {
        this.wishID = wishID;
    }

    public void setCustID(int custID) {
        this.custID = custID;
    }

    public void setProdID(int prodID) {
        this.prodID = prodID;
    }

    

    
}
