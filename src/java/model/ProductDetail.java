/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author tiend
 */
public class ProductDetail {
    private int ID;
    private String categoryName;
    private String name;
    private double originalPrice;
    private double salePrice;
    private String details;
    private String image;

    public ProductDetail() {
    }

    public ProductDetail(int ID, String categoryName, String name, double originalPrice, double salePrice, String details, String image) {
        this.ID = ID;
        this.categoryName = categoryName;
        this.name = name;
        this.originalPrice = originalPrice;
        this.salePrice = salePrice;
        this.details = details;
        this.image = image;
    }

    public int getID() {
        return ID;
    }

    public void setID(int ID) {
        this.ID = ID;
    }

    public String getCategoryName() {
        return categoryName;
    }

    public void setCategoryName(String categoryName) {
        this.categoryName = categoryName;
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

    @Override
    public String toString() {
        return "ProductDetail{" + "ID=" + ID + ", categoryName=" + categoryName + ", name=" + name + ", originalPrice=" + originalPrice + ", salePrice=" + salePrice + ", details=" + details + ", image=" + image + '}';
    }
}
