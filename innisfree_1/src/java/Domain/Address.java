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
 * @author Yu Xuan111
 */

public class Address implements Serializable {
    private int addressID;
    private int custID;
    private String addr_State;
    private String town;
    private String zipcode;
    private String addr_Details;
    private String receiverName;
    private String receiverHP;
    private String addr_Type;
    private String addr_Status;
    
//    private Programme programme;

    public Address() {
    }

    public Address(int addressID) {
        this.addressID = addressID;
    }

    public Address(int addressID, int custID, String addr_State, String town, String zipcode, String addr_Details, String receiverName, String receiverHP, String addr_Type, String addr_Status) {
        this.addressID = addressID;
        this.custID = custID;
        this.addr_State = addr_State;
        this.town = town;
        this.zipcode = zipcode;
        this.addr_Details = addr_Details;
        this.receiverName = receiverName;
        this.receiverHP = receiverHP;
        this.addr_Type = addr_Type;
        this.addr_Status = addr_Status;
    }

    public void setAddressID(int addressID) {
        this.addressID = addressID;
    }
    
    public void setCustID (int custID) {
        this.custID = custID;
    }
    
    public void setAddr_State (String addr_State) {
        this.addr_State = addr_State;
    } 
    
    public void setTown (String town) {
        this.town = town;
    }
    
     public void setZipcode (String zipcode) {
        this.zipcode = zipcode;
    }
     
     public void setAddr_Details(String addr_Details) {
        this.addr_Details = addr_Details;
    }
     
     public void setReceiverName(String receiverName) {
        this.receiverName = receiverName;
    }
    
    public void setReceiverHP (String receiverHP) {
        this.receiverHP = receiverHP;
    }
    
     public void setAddr_Type (String addr_Type) {
        this.addr_Type = addr_Type;
    }
     
      public void setAddr_Status (String addr_Status) {
        this.addr_Status = addr_Status;
    }
      
     
     
     public int getAddressID(){
         return addressID;
     }
   
    public int getCustID() {
        return custID;
    }
    
    public String getAddr_State() {
        return addr_State;
    }

    public String getTown() {
        return town;
    }

    public String getZipcode() {
        return zipcode;
    }
    
    public String getAddr_Details() {
        return addr_Details;
    }
    
    public String getReceiverName() {
        return receiverName;
    }
    
    public String getReceiverHP() {
        return receiverHP;
    }
    
    public String getAddr_Type() {
        return addr_Type;
    }
    
    public String getAddr_Status() {
        return addr_Status;
    }
    
    
   
    
}
