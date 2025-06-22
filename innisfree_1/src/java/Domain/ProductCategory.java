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

public class ProductCategory {
    
    private int prodCatID;
    private Timestamp prodCatCrDate;
    private String prodCatCrBy;
    private Timestamp prodCatUpDate;
    private String prodCatUpBy;
    private String prodCatName;
    private String prodCatDesc;
    private String prodCat_Status;
    private Boolean isdeleted;

    public ProductCategory() {
    }

    public ProductCategory(int prodCatID,Timestamp prodCatCrDate, String prodCatCrBy, Timestamp prodCatUpDate, String prodCatUpBy, String prodCatName, String prodCatDesc, String prodCat_Status, Boolean isdeleted) {
        this.prodCatID=prodCatID;
        this.prodCatCrDate = prodCatCrDate;
        this.prodCatCrBy = prodCatCrBy;
        this.prodCatUpDate = prodCatUpDate;
        this.prodCatUpBy = prodCatUpBy;
        this.prodCatName = prodCatName;
        this.prodCatDesc = prodCatDesc;
        this.prodCat_Status = prodCat_Status;
        this.isdeleted=isdeleted;
    }

    
    
    //getter
    
    public int getProdCatID() {
        return prodCatID;
    }

    public Timestamp getProdCatCrDate() {
        return prodCatCrDate;
    }

    public String getProdCatCrBy() {
        return prodCatCrBy;
    }

    public Timestamp getProdCatUpDate() {
        return prodCatUpDate;
    }

    public String getProdCatUpBy() {
        return prodCatUpBy;
    }

    public String getProdCatName() {
        return prodCatName;
    }

    public String getProdCatDesc() {  
        return prodCatDesc;
    }
    
    public String getProdCat_Status() {
        return prodCat_Status;
    }

    public Boolean getIsdeleted() {
        return isdeleted;
    }
 
    
    //setter
    
    public void setProdCatID(int prodCatID) {
        this.prodCatID = prodCatID;
    }

    public void setProdCatCrDate(Timestamp prodCatCrDate) {
        this.prodCatCrDate = prodCatCrDate;
    }

    public void setProdCatCrBy(String prodCatCrBy) {
        this.prodCatCrBy = prodCatCrBy;
    }

    public void setProdCatUpDate(Timestamp prodCatUpDate) {
        this.prodCatUpDate = prodCatUpDate;
    }

    public void setProdCatUpBy(String prodCatUpBy) {
        this.prodCatUpBy = prodCatUpBy;
    }

    public void setProdCatName(String prodCatName) {
        this.prodCatName = prodCatName;
    }

    public void setProdCatDesc(String prodCatDesc) {
        this.prodCatDesc = prodCatDesc;
    }

    public void setProdCat_Status(String prodcatstatus) {
        this.prodCat_Status = prodcatstatus;
    } 

    public void setIsdeleted(Boolean isdeleted) {
        this.isdeleted = isdeleted;
    }
    
}
