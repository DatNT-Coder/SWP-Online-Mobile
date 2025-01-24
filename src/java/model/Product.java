package model;

import java.sql.Timestamp;

public class Product {
    private int ID;
    private String name;
    private double originalPrice;
    private double salePrice;
    private String details;
    private String image;
    private int stock;
    private int productCategoryID;
    private Timestamp updatedDate;
    private int status;
    private double costPrice;
    private int settingsID;
    private int brandID;

    // Constructor
    public Product(int ID, String name, double originalPrice, double salePrice, String details, String image, int stock,
                   int productCategoryID, Timestamp updatedDate, int status, double costPrice, int settingsID, int brandID) {
        this.ID = ID;
        this.name = name;
        this.originalPrice = originalPrice;
        this.salePrice = salePrice;
        this.details = details;
        this.image = image;
        this.stock = stock;
        this.productCategoryID = productCategoryID;
        this.updatedDate = updatedDate;
        this.status = status;
        this.costPrice = costPrice;
        this.settingsID = settingsID;
        this.brandID = brandID;
    }

    // Getters and Setters
    public int getID() {
        return ID;
    }

    public void setID(int ID) {
        this.ID = ID;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public double getOriginalPrice() {
        return originalPrice;
    }

    public void setOriginalPrice(double originalPrice) {
        this.originalPrice = originalPrice;
    }

    public double getSalePrice() {
        return salePrice;
    }

    public void setSalePrice(double salePrice) {
        this.salePrice = salePrice;
    }

    public String getDetails() {
        return details;
    }

    public void setDetails(String details) {
        this.details = details;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public int getStock() {
        return stock;
    }

    public void setStock(int stock) {
        this.stock = stock;
    }

    public int getProductCategoryID() {
        return productCategoryID;
    }

    public void setProductCategoryID(int productCategoryID) {
        this.productCategoryID = productCategoryID;
    }

    public Timestamp getUpdatedDate() {
        return updatedDate;
    }

    public void setUpdatedDate(Timestamp updatedDate) {
        this.updatedDate = updatedDate;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    public double getCostPrice() {
        return costPrice;
    }

    public void setCostPrice(double costPrice) {
        this.costPrice = costPrice;
    }

    public int getSettingsID() {
        return settingsID;
    }

    public void setSettingsID(int settingsID) {
        this.settingsID = settingsID;
    }

    public int getBrandID() {
        return brandID;
    }

    public void setBrandID(int brandID) {
        this.brandID = brandID;
    }

    // Ghi đè phương thức toString()
    @Override
    public String toString() {
        return "Product{" +
                "ID=" + ID +
                ", name='" + name + '\'' +
                ", originalPrice=" + originalPrice +
                ", salePrice=" + salePrice +
                ", details='" + details + '\'' +
                ", image='" + image + '\'' +
                ", stock=" + stock +
                ", productCategoryID=" + productCategoryID +
                ", updatedDate=" + updatedDate +
                ", status=" + status +
                ", costPrice=" + costPrice +
                ", settingsID=" + settingsID +
                ", brandID=" + brandID +
                '}';
    }
}
