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
public class Product {
    private int prodID;
    private int prodCatID;
    private String prodName;
    private Timestamp prodCrDate;
    private String prodCrBy;
    private Timestamp prodUpDate;
    private String prodUpBy;
    private String prodDesc;
    private String prodManual;
    private String prodIngredients;
    private int prodAvailable_Qty;
    private int discount;
    private double prod_OriPrice;
    private double prod_FinalPrice;
    private String prod_Status;
    private Boolean isdeleted;
    
    private ProductImage prodImg;
    
    private ProductCategory prodCat;
       private double singleProductTotalPrice;

    public Product() {
    }

    public Product(int prodID, int prodCatID, String prodName, Timestamp prodCrDate, String prodCrBy, Timestamp prodUpDate, String prodUpBy, String prodDesc, String prodManual, String prodIngredients, int prodAvailable_Qty, int discount, double prod_OriPrice, double prod_FinalPrice, String prod_Status, Boolean isdeleted) {
        this.prodID = prodID;
        this.prodCatID = prodCatID;
        this.prodName = prodName;
        this.prodCrDate = prodCrDate;
        this.prodCrBy = prodCrBy;
        this.prodUpDate = prodUpDate;
        this.prodUpBy = prodUpBy;
        this.prodDesc = prodDesc;
        this.prodManual = prodManual;
        this.prodIngredients = prodIngredients;
        this.prodAvailable_Qty = prodAvailable_Qty;
        this.discount = discount;
        this.prod_OriPrice = prod_OriPrice;
        this.prod_FinalPrice = prod_FinalPrice;
        this.prod_Status = prod_Status;
        this.isdeleted = isdeleted;
    }

    public Product(int prodID, int prodCatID, String prodName, Timestamp prodCrDate, String prodCrBy, Timestamp prodUpDate, String prodUpBy, String prodDesc, String prodManual, String prodIngredients, int prodAvailable_Qty, int discount, double prod_OriPrice, double prod_FinalPrice, String prod_Status, Boolean isdeleted, ProductImage prodImg, ProductCategory prodCat) {
        this.prodID = prodID;
        this.prodCatID = prodCatID;
        this.prodName = prodName;
        this.prodCrDate = prodCrDate;
        this.prodCrBy = prodCrBy;
        this.prodUpDate = prodUpDate;
        this.prodUpBy = prodUpBy;
        this.prodDesc = prodDesc;
        this.prodManual = prodManual;
        this.prodIngredients = prodIngredients;
        this.prodAvailable_Qty = prodAvailable_Qty;
        this.discount = discount;
        this.prod_OriPrice = prod_OriPrice;
        this.prod_FinalPrice = prod_FinalPrice;
        this.prod_Status = prod_Status;
        this.isdeleted = isdeleted;
        this.prodImg = prodImg;
        this.prodCat = prodCat;
    }

    
    
    
    public int getProdID() {
        return prodID;
    }

    public int getProdCatID() {
        return prodCatID;
    }

    public String getProdName() {
        return prodName;
    }

    public Timestamp getProdCrDate() {
        return prodCrDate;
    }

    public String getProdCrBy() {
        return prodCrBy;
    }

    public Timestamp getProdUpDate() {
        return prodUpDate;
    }

    public String getProdUpBy() {
        return prodUpBy;
    }

    public String getProdDesc() {
        return prodDesc;
    }

    public String getProdManual() {
        return prodManual;
    }

    public String getProdIngredients() {
        return prodIngredients;
    }

    public int getProdAvailable_Qty() {
        return prodAvailable_Qty;
    }

    public int getDiscount() {
        return discount;
    }

    public double getProd_OriPrice() {
        return prod_OriPrice;
    }

    public double getProd_FinalPrice() {
        return prod_FinalPrice;
    }

    public String getProd_Status() {
        return prod_Status;
    }

    public Boolean getIsdeleted() {
        return isdeleted;
    }

    public ProductImage getProdImg() {
        return prodImg;
    }

    public ProductCategory getProdCat() {
        return prodCat;
    }

               public double getsingleProductTotalPrice() {
        return singleProductTotalPrice;
    }
    
    public void setsingleProductTotalPrice(double singleProductTotalPrice) {
        this.singleProductTotalPrice = singleProductTotalPrice;
    }
    
    
    
    public void setProdID(int prodID) {
        this.prodID = prodID;
    }

    public void setProdCatID(int prodCatID) {
        this.prodCatID = prodCatID;
    }

    public void setProdName(String prodName) {
        this.prodName = prodName;
    }

    public void setProdCrDate(Timestamp prodCrDate) {
        this.prodCrDate = prodCrDate;
    }

    public void setProdCrBy(String prodCrBy) {
        this.prodCrBy = prodCrBy;
    }

    public void setProdUpDate(Timestamp prodUpDate) {
        this.prodUpDate = prodUpDate;
    }

    public void setProdUpBy(String prodUpBy) {
        this.prodUpBy = prodUpBy;
    }

    public void setProdDesc(String prodDesc) {
        this.prodDesc = prodDesc;
    }

    public void setProdManual(String prodManual) {
        this.prodManual = prodManual;
    }

    public void setProdIngredients(String prodIngredients) {
        this.prodIngredients = prodIngredients;
    }

    public void setProdAvailable_Qty(int prodAvailable_Qty) {
        this.prodAvailable_Qty = prodAvailable_Qty;
    }

    public void setDiscount(int discount) {
        this.discount = discount;
    }

    public void setProd_OriPrice(double prod_OriPrice) {
        this.prod_OriPrice = prod_OriPrice;
    }

    public void setProd_FinalPrice(double prod_FinalPrice) {
        this.prod_FinalPrice = prod_FinalPrice;
    }

    public void setProd_Status(String prod_Status) {
        this.prod_Status = prod_Status;
    }

    public void setIsdeleted(Boolean isdeleted) {
        this.isdeleted = isdeleted;
    }

    public void setProdImg(ProductImage prodImg) {
        this.prodImg = prodImg;
    }
    
    public void setProdCat(ProductCategory prodCat) {
        this.prodCat = prodCat;
    }

    
    
}
