/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Domain;

import java.sql.Blob;
import java.sql.Timestamp;

/**
 *
 * @author Rex Lim
 */
public class ProductImage {

    private int prodImgID;
    private int prodID;
    private Timestamp prodImgCrDate;
    private String prodImgCrBy;
    private Timestamp prodImgUpDate;
    private String prodImgUpBy;
    private Blob prodImg;
    private String prodImg_Status;
    private byte [] getImg;

    public ProductImage() {
    }

    public ProductImage(int prodImgID, int prodID, Timestamp prodImgCrDate, String prodImgCrBy, Timestamp prodImgUpDate, String prodImgUpBy, Blob prodImg, String prodImg_Status) {
        this.prodImgID = prodImgID;
        this.prodID = prodID;
        this.prodImgCrDate = prodImgCrDate;
        this.prodImgCrBy = prodImgCrBy;
        this.prodImgUpDate = prodImgUpDate;
        this.prodImgUpBy = prodImgUpBy;
        this.prodImg = prodImg;
        this.prodImg_Status = prodImg_Status;
    }
    
    public ProductImage(int prodID, Timestamp prodImgCrDate, String prodImgCrBy, Timestamp prodImgUpDate, String prodImgUpBy, Blob prodImg, String prodImg_Status) {
        
        this.prodID = prodID;
        this.prodImgCrDate = prodImgCrDate;
        this.prodImgCrBy = prodImgCrBy;
        this.prodImgUpDate = prodImgUpDate;
        this.prodImgUpBy = prodImgUpBy;
        this.prodImg = prodImg;
        this.prodImg_Status = prodImg_Status;
    }

    public int getProdImgID() {
        return prodImgID;
    }

    public int getProdID() {
        return prodID;
    }

    public Timestamp getProdImgCrDate() {
        return prodImgCrDate;
    }

    public String getProdImgCrBy() {
        return prodImgCrBy;
    }

    public Timestamp getProdImgUpDate() {
        return prodImgUpDate;
    }

    public String getProdImgUpBy() {
        return prodImgUpBy;
    }

    public Blob getProdImg() {
        return prodImg;
    }

    public String getProdImg_Status() {
        return prodImg_Status;
    }

    public byte[] getGetImg() {
        return getImg;
    }
    

    public void setProdImgID(int prodImgID) {
        this.prodImgID = prodImgID;
    }

    public void setProdID(int prodID) {
        this.prodID = prodID;
    }

    public void setProdImgCrDate(Timestamp prodImgCrDate) {
        this.prodImgCrDate = prodImgCrDate;
    }

    public void setProdImgCrBy(String prodImgCrBy) {
        this.prodImgCrBy = prodImgCrBy;
    }

    public void setProdImgUpDate(Timestamp prodImgUpDate) {
        this.prodImgUpDate = prodImgUpDate;
    }

    public void setProdImgUpBy(String prodImgUpBy) {
        this.prodImgUpBy = prodImgUpBy;
    }

    public void setProdImg(Blob prodImg) {
        this.prodImg = prodImg;
    }

    public void setProdImg_Status(String prodImg_Status) {
        this.prodImg_Status = prodImg_Status;
    }

    public void setGetImg(byte[] getImg) {
        this.getImg = getImg;
    }

    
    
}
