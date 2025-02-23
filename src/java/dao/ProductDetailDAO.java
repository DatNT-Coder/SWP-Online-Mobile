/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import context.DBContext;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import model.Product;
import model.ProductDetail;

/**
 *
 * @author tiend
 */
public class ProductDetailDAO extends DBContext {

    public ProductDetail getProductById(String id) {
        try {
        this.connection = getConnection();
            String sql = "SELECT product.ID, productcategory.categoryName, product.name,product.originalPrice, product.salePrice, product.details,product.image\n"
                    + "FROM product \n"
                    + "INNER JOIN productcategory ON product.ProductCategory_ID = productcategory.ID\n"
                    + "WHERE product.ID = ? ";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, id);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                ProductDetail product = new ProductDetail();
                product.setID(rs.getInt("ID"));
                product.setCategoryName(rs.getString("categoryName"));
                product.setName(rs.getString("name"));
                product.setOriginalPrice(rs.getDouble("originalPrice"));
                product.setSalePrice(rs.getDouble("salePrice"));
                product.setDetails(rs.getString("details"));
                product.setImage(rs.getString("image"));
                return product;
            }
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return null;
    }

    public List<Product> latestProduct() {
        try {
            this.connection = getConnection();
            String sql = "SELECT * FROM `mydb`.`product` ORDER BY `updatedDate` DESC LIMIT 6";
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            List<Product> products = new ArrayList<>();
            while (rs.next()) {
                Product product = new Product();
                product.setID(rs.getInt("ID"));
                product.setName(rs.getString("name"));
                product.setOriginalPrice(rs.getDouble("originalPrice"));
                product.setSalePrice(rs.getDouble("salePrice"));
                product.setImage(rs.getString("image"));
                products.add(product);
            }
            return products;
        } catch (Exception e) {
            System.out.println(e.getMessage());
            return null;
        }
    }

    public static void main(String[] args) {
    ProductDetailDAO productDetailDAO = new ProductDetailDAO();

    // Test getProductById
    System.out.println("===== Test getProductById =====");
    String testId = "1";  // Thay bằng ID thực tế có trong database của bạn
    ProductDetail productDetail = productDetailDAO.getProductById(testId);
    if (productDetail != null) {
        System.out.println("ID: " + productDetail.getID());
        System.out.println("Category Name: " + productDetail.getCategoryName());
        System.out.println("Name: " + productDetail.getName());
        System.out.println("Original Price: " + productDetail.getOriginalPrice());
        System.out.println("Sale Price: " + productDetail.getSalePrice());
        System.out.println("Details: " + productDetail.getDetails());
        System.out.println("Image: " + productDetail.getImage());
    } else {
        System.out.println("No product found with ID: " + testId);
    }

    // Test latestProduct
    System.out.println("\n===== Test latestProduct =====");
    List<Product> latestProducts = productDetailDAO.latestProduct();
    if (latestProducts != null && !latestProducts.isEmpty()) {
        for (Product product : latestProducts) {
            System.out.println("ID: " + product.getID());
            System.out.println("Name: " + product.getName());
            System.out.println("Original Price: " + product.getOriginalPrice());
            System.out.println("Sale Price: " + product.getSalePrice());
            System.out.println("Image: " + product.getImage());
            System.out.println("---------------------------");
        }
    } else {
        System.out.println("No latest products found.");
    }
}

}

