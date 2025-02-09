/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.util.Date;

/**
 *
 * @author tiend
 */
public class Product {

          private int ID;
          private String name;
          private double originalPrice;
          private double salePrice;
          private String details;
          private String image;
          private int Stock;
          private int ProductCategory_ID;
          private java.sql.Date updatedDate;
          private int status;
          private int brandId;
          private double cost_price;
          private int settings_id;

          public Product() {
          }

          public Product(int ID, String name, double originalPrice, double salePrice, String details, String image, int Stock, int ProductCategory_ID, java.sql.Date updatedDate, int status, int brand, double cost_price, int settings_id) {
                    this.ID = ID;
                    this.name = name;
                    this.originalPrice = originalPrice;
                    this.salePrice = salePrice;
                    this.details = details;
                    this.image = image;
                    this.Stock = Stock;
                    this.ProductCategory_ID = ProductCategory_ID;
                    this.updatedDate = updatedDate;
                    this.status = status;
                    this.brandId = brand;
                    this.cost_price = cost_price;
                    this.settings_id = settings_id;

          }

          public Product(String name, double originalPrice, double salePrice, String details, String image, int Stock, int ProductCategory_ID, java.sql.Date updatedDate, int status, int brand, double cost_price, int settings_id) {
                    this.name = name;
                    this.originalPrice = originalPrice;
                    this.salePrice = salePrice;
                    this.details = details;
                    this.image = image;
                    this.Stock = Stock;
                    this.ProductCategory_ID = ProductCategory_ID;
                    this.updatedDate = updatedDate;
                    this.status = status;
                    this.brandId = brand;
                    this.cost_price = cost_price;
                    this.settings_id = settings_id;
          }

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
                    return Stock;
          }

          public void setStock(int Stock) {
                    this.Stock = Stock;
          }

          public int getProductCategory_ID() {
                    return ProductCategory_ID;
          }

          public void setProductCategory_ID(int ProductCategory_ID) {
                    this.ProductCategory_ID = ProductCategory_ID;
          }

          public java.sql.Date getUpdatedDate() {
                    return updatedDate;
          }

          public void setUpdatedDate(java.sql.Date updatedDate) {
                    this.updatedDate = updatedDate;
          }

          public int getStatus() {
                    return status;
          }

          public void setStatus(int status) {
                    this.status = status;
          }

          public int getBrandId() {
                    return brandId;
          }

          public void setBrandId(int brandId) {
                    this.brandId = brandId;
          }

          public double getCost_price() {
                    return cost_price;
          }

          public void setCost_price(double cost_price) {
                    this.cost_price = cost_price;
          }

          public int getSettings_id() {
                    return settings_id;
          }

          public void setSettings_id(int settings_id) {
                    this.settings_id = settings_id;
          }

          @Override
          public String toString() {
                    return "Product{" + "ID=" + ID + ", name=" + name + ", originalPrice=" + originalPrice + ", salePrice=" + salePrice + ", details=" + details + ", image=" + image + ", Stock=" + Stock + ", ProductCategory_ID=" + ProductCategory_ID + ", updatedDate=" + updatedDate + ", status=" + status + ", brandId=" + brandId + ", cost_price=" + cost_price + ", settings_id=" + settings_id + '}';
          }
}
