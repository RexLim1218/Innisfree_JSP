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
public class DeliveryStatus {

    private int deliveryID;
    private int orderRow;
    private int AddressID;
    private String deliveryStatus;
    private String deliveryDetails;
    private Timestamp del_CrDate;
    private String del_CrBy;
    private Timestamp del_UpDate;
    private String del_UpBy;
    private Address addr;

    public DeliveryStatus() {
    }

    public DeliveryStatus(int deliveryID, int orderRow, int AddressID, String deliveryStatus, String deliveryDetails, Timestamp del_CrDate, String del_CrBy, Timestamp del_UpDate, String del_UpBy) {
        this.deliveryID = deliveryID;
        this.orderRow = orderRow;
        this.AddressID = AddressID;
        this.deliveryStatus = deliveryStatus;
        this.deliveryDetails = deliveryDetails;
        this.del_CrDate = del_CrDate;
        this.del_CrBy = del_CrBy;
        this.del_UpDate = del_UpDate;
        this.del_UpBy = del_UpBy;
    }

    public DeliveryStatus(int deliveryID, int orderRow, String deliveryStatus, String deliveryDetails, Timestamp del_CrDate, String del_CrBy, Timestamp del_UpDate, String del_UpBy, Address addr) {
        this.deliveryID = deliveryID;
        this.orderRow = orderRow;
        this.deliveryStatus = deliveryStatus;
        this.deliveryDetails = deliveryDetails;
        this.del_CrDate = del_CrDate;
        this.del_CrBy = del_CrBy;
        this.del_UpDate = del_UpDate;
        this.del_UpBy = del_UpBy;
        this.addr = addr;
    }

    public int getDeliveryID() {
        return deliveryID;
    }

    public int getOrderRow() {
        return orderRow;
    }

    public int getAddressID() {
        return AddressID;
    }

    public String getDeliveryStatus() {
        return deliveryStatus;
    }

    public String getDeliveryDetails() {
        return deliveryDetails;
    }

    public Timestamp getDel_CrDate() {
        return del_CrDate;
    }

    public String getDel_CrBy() {
        return del_CrBy;
    }

    public Timestamp getDel_UpDate() {
        return del_UpDate;
    }

    public String getDel_UpBy() {
        return del_UpBy;
    }

    public Address getAddr() {
        return addr;
    }

    public void setDeliveryID(int deliveryID) {
        this.deliveryID = deliveryID;
    }

    public void setOrderRow(int orderRow) {
        this.orderRow = orderRow;
    }

    public void setAddressID(int AddressID) {
        this.AddressID = AddressID;
    }

    public void setDeliveryStatus(String deliveryStatus) {
        this.deliveryStatus = deliveryStatus;
    }

    public void setDeliveryDetails(String deliveryDetails) {
        this.deliveryDetails = deliveryDetails;
    }

    public void setDel_CrDate(Timestamp del_CrDate) {
        this.del_CrDate = del_CrDate;
    }

    public void setDel_CrBy(String del_CrBy) {
        this.del_CrBy = del_CrBy;
    }

    public void setDel_UpDate(Timestamp del_UpDate) {
        this.del_UpDate = del_UpDate;
    }

    public void setDel_UpBy(String del_UpBy) {
        this.del_UpBy = del_UpBy;
    }

    public void setAddr(Address addr) {
        this.addr = addr;
    }

    
    
}
