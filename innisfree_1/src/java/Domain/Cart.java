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
public class Cart extends Product  {

    private int cartQty;
    private int cartID;
    private int custID;
    private Timestamp cartUpDate;

    public Cart() {
    }

    public Cart(int cartID, int custID, Timestamp cartUpDate) {
        this.cartID = cartID;
        this.custID = custID;
        this.cartUpDate = cartUpDate;

    }

    public int getcartQty() {
        return cartQty;
    }

    public void setcartQty(int cartQty) {
        this.cartQty = cartQty;

    }

    //getter
    public int getcartID() {
        return cartID;
    }

    public int getcustID() {
        return custID;
    }

    public Timestamp getcartUpDate() {
        return cartUpDate;
    }

    //setter
    public void setcartID(int cartID) {
        this.cartID = cartID;
    }

    public void setcustID(int custID) {
        this.custID = custID;
    }

    public void setcartUpDate(Timestamp cartUpDate) {
        this.cartUpDate = cartUpDate;
    }

}
