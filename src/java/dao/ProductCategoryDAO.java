/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import context.DBContext;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Vector;
import model.ProductCategory;

/**
 *
 * @author tiend
 */
public class ProductCategoryDAO extends DBContext {

    public Vector<ProductCategory> getAllCategories() {
        Vector<ProductCategory> listC = new Vector<>();
        String query = "SELECT * FROM `mydb`.`productcategory` where status != 0";
        try {
            this.connection = getConnection();            
            PreparedStatement ps = connection.prepareStatement(query);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                listC.add(new ProductCategory(rs.getInt("ID"), rs.getString("categoryName"), rs.getInt("status")));
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return listC;
    }

    public Vector<ProductCategory> getCategoryById(int pcid) {
        Vector<ProductCategory> listC = new Vector<>();
        String query = "SELECT * FROM `mydb`.`productcategory` where ID = ?";
        try {
            this.connection = getConnection();            
            PreparedStatement ps = connection.prepareStatement(query);
            ps.setInt(1, pcid);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                listC.add(new ProductCategory(rs.getInt("ID"), rs.getString("categoryName"), rs.getInt("status")));
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return listC;
    }

    public int updateCategoryStatusById(int pid, int status) {
        String query = "UPDATE mydb.productcategory SET status = ? WHERE ID = ?";
        int n = 0;
        try {
            this.connection = getConnection();            
            PreparedStatement ps = connection.prepareStatement(query);
            ps.setInt(1, status);
            ps.setInt(2, pid);
            n = ps.executeUpdate();
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return n;
    }
   
    public static void main(String[] args) {
        ProductCategoryDAO dao = new ProductCategoryDAO();
        Vector<ProductCategory> list = dao.getAllCategories();
        for (ProductCategory productCategory : list) {
            System.out.println(productCategory);
        }
    }
}

