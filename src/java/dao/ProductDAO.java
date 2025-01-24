package dao;

/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */

/**
 *
 * @author tiend
 */
/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */

/**
 *
 * @author tiend
 */
import model.Product;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class ProductDAO {

    private final String jdbcURL = "jdbc:mysql://localhost:3306/mydb";
    private final String jdbcUsername = "root";
    private final String jdbcPassword = "123456";

    // Kết nối cơ sở dữ liệu
    private Connection getConnection() throws SQLException {
        return DriverManager.getConnection(jdbcURL, jdbcUsername, jdbcPassword);
    }

    // Lấy danh sách sản phẩm theo phân trang
    public List<Product> getProductsPaginated(int page, int pageSize) {
        List<Product> products = new ArrayList<>();
        String sql = "SELECT * FROM product ORDER BY updatedDate DESC LIMIT ? OFFSET ?";

        try (Connection connection = getConnection();
             PreparedStatement statement = connection.prepareStatement(sql)) {

            statement.setInt(1, pageSize);
            statement.setInt(2, (page - 1) * pageSize);

            ResultSet resultSet = statement.executeQuery();
            while (resultSet.next()) {
                // Lấy dữ liệu và tạo đối tượng Product
                Product product = new Product(
                        resultSet.getInt("ID"),
                        resultSet.getString("name"),
                        resultSet.getDouble("originalPrice"),
                        resultSet.getDouble("salePrice"),
                        resultSet.getString("details"),
                        resultSet.getString("image"),
                        resultSet.getInt("stock"),
                        resultSet.getInt("ProductCategory_ID"),
                        resultSet.getTimestamp("updatedDate"),  // Trường updatedDate là kiểu DATETIME
                        resultSet.getInt("status"),
                        resultSet.getDouble("cost_price"),
                        resultSet.getInt("settings_id"),
                        resultSet.getInt("brandID")
                );
                products.add(product);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return products;
    }

    // Đếm tổng số sản phẩm
    public int getTotalProductCount() {
        String sql = "SELECT COUNT(*) FROM product";
        try (Connection connection = getConnection();
             PreparedStatement statement = connection.prepareStatement(sql)) {

            ResultSet resultSet = statement.executeQuery();
            if (resultSet.next()) {
                return resultSet.getInt(1);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return 0;
    }
    
    public static void main(String[] args) {
        ProductDAO productDAO = new ProductDAO();
        int page = 1;
        int pageSize = 5;

        // Kiểm tra lấy danh sách sản phẩm
        List<Product> products = productDAO.getProductsPaginated(page, pageSize);
        if (products.isEmpty()) {
            System.out.println("Không có sản phẩm nào được lấy ra.");
        } else {
            System.out.println("Danh sách sản phẩm:");
            for (Product product : products) {
                System.out.println(product);
            }
        }

        // Kiểm tra tổng số sản phẩm
        int totalProducts = productDAO.getTotalProductCount();
        System.out.println("Tổng số sản phẩm trong cơ sở dữ liệu: " + totalProducts);
    }
}
