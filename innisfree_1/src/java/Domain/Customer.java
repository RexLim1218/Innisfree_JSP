/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Domain;

import java.io.Serializable;
import java.sql.Timestamp;
import java.util.Objects;

/**
 *
 * @author Yu Xuan
 */

public class Customer implements Serializable {

    private int custID;
    private String custUsername;
    private String custName;
    private String custPWD;
    private String custEmail;
    private String custHP;
    private Timestamp custCrDate;
    private String custCrBy;
    private Timestamp custUpDate;
    private String custUpBy;
    private String cust_Status;
    private Address address;

    public Customer() {
    }

    public Customer(int custID) {
        this.custID = custID;
    }

    public Customer(int custID, String custUsername, String custName, String custPWD, String custEmail, String custHP, Timestamp custCrDate, String custCrBy, Timestamp custUpDate, String custUpBy, String cust_Status, Address address) {
        this.custID = custID;
        this.custUsername = custUsername;
        this.custName = custName;
        this.custPWD = custPWD;
        this.custEmail = custEmail;
        this.custHP = custHP;
        this.custCrDate = custCrDate;
        this.custCrBy = custCrBy;
        this.custUpDate = custUpDate;
        this.custUpBy = custUpBy;
        this.cust_Status = cust_Status;
        this.address = address;

    }

    public void setCustID(int custID) {
        this.custID = custID;
    }

    public void setCustUsername(String custUsername) {
        this.custUsername = custUsername;
    }

    public void setCustName(String custName) {
        this.custName = custName;
    }

    public void setCustPWD(String custPWD) {
        this.custPWD = custPWD;
    }

    public void setCustEmail(String custEmail) {
        this.custEmail = custEmail;
    }

    public void setCustHP(String custHP) {
        this.custHP = custHP;
    }

    public void setCustCrDate(Timestamp custCrDate) {
        this.custCrDate = custCrDate;
    }

    public void setCustCrBy(String custCrBy) {
        this.custCrBy = custCrBy;
    }

    public void setCustUpDate(Timestamp custUpDate) {
        this.custUpDate = custUpDate;
    }

    public void setCustUpBy(String custUpBy) {
        this.custUpBy = custUpBy;
    }

    public void setCust_Status(String cust_Status) {
        this.cust_Status = cust_Status;
    }

    public void address(Address address) {
        this.address = address;
    }

    public int getCustID() {
        return custID;
    }

    public String getCustUsername() {
        return custUsername;
    }

    public String getCustName() {
        return custName;
    }

    public String getCustPWD() {
        return custPWD;
    }

    public String getCustEmail() {
        return custEmail;
    }

    public String getCustHP() {
        return custHP;
    }

    public Timestamp getCustCrDate() {
        return custCrDate;
    }

    public String getCustCrBy() {
        return custCrBy;
    }

    public Timestamp getCustUpDate() {
        return custUpDate;
    }

    public String getCustUpBy() {
        return custUpBy;
    }

    public String getCust_Status() {
        return cust_Status;
    }

    public Address getAddress() {
        return address;
    }

}
