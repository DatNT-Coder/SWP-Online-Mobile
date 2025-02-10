/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author tiend
 */
public class ProductCategory {

    private int id;
    private String categoryName;
    private int status;

    public ProductCategory() {
    }

    public ProductCategory(int id, String categoryName, int status) {
        this.id = id;
        this.categoryName = categoryName;
        this.status = status;
    }

    public ProductCategory(String categoryName, int status) {
        this.categoryName = categoryName;
        this.status = status;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getCategoryName() {
        return categoryName;
    }

    public void setCategoryName(String categoryName) {
        this.categoryName = categoryName;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    @Override
    public String toString() {
        return "ProductCategory{" + "id=" + id + ", categoryName=" + categoryName + ", status=" + status + '}';
    }
}

