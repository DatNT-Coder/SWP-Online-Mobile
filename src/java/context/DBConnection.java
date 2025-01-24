package context;

/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */

/**
 *
 * @author tiend
 */
import java.sql.Connection;
import java.sql.DriverManager;

public class DBConnection {
    private static final String URL = "jdbc:mysql://localhost:3306/mydb";
    private static final String USER = "root"; // Thay bằng tài khoản của bạn
    private static final String PASSWORD = "123456";

    public static Connection getConnection() {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            return DriverManager.getConnection(URL, USER, PASSWORD);
        } catch (Exception e) {
            e.printStackTrace();
            throw new RuntimeException("Cannot connect to the database.");
        }
    }
     public static void main(String[] args) {
        try (Connection connection = DBConnection.getConnection()) {
            if (connection != null) {
                System.out.println("Kết nối thành công!");
            } else {
                System.out.println("Kết nối thất bại.");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}

