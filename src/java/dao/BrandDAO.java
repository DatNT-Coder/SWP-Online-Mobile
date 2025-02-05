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
import model.Brand;

/**
 *
 * @author tiend
 */
public class BrandDAO extends DBContext {

    public Vector<Brand> getBrandByCategoryID(int cid) {
        Vector<Brand> list = new Vector<>();
        String query = "SELECT DISTINCT b.brandID, b.brandName, b.status\n"
                + "FROM brand b\n"
                + "INNER JOIN product p ON b.brandID = p.brandID\n"
                + "WHERE p.ProductCategory_ID = ? AND b.status != 0";
        try {
            this.connection = getConnection();
            PreparedStatement ps = connection.prepareStatement(query);
            ps.setInt(1, cid);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Brand(rs.getInt("brandID"), rs.getString("brandName"), rs.getInt("status")));
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public Vector<Brand> getAllBrand() {
        Vector<Brand> list = new Vector<>();
        String query = "SELECT b.brandID, b.brandName, b.status\n"
                + "FROM brand b\n"
                + "WHERE b.status != 0";
        try {
            this.connection = getConnection();
            PreparedStatement ps = connection.prepareStatement(query);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Brand(rs.getInt("brandID"), rs.getString("brandName"), rs.getInt("status")));
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }


    public static void main(String[] args) {
        BrandDAO dao = new BrandDAO();
        Vector<Brand> list = dao.getAllBrand();
        for (Brand brand : list) {
            System.out.println(brand);
        }
    }
}
