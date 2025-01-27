package context;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

import java.sql.*;

public class DBContext {
    protected Connection connection;
    protected PreparedStatement statement;
    protected ResultSet resultSet;

    /**
     * get an connection
     *
     * @return connection or null
     */
    public Connection getConnection() {
        try {
            // Sử dụng driver của MySQL
            Class.forName("com.mysql.cj.jdbc.Driver");

            // URL kết nối MySQL
            String url = "jdbc:mysql://localhost:3306/mydb"; // Thay project_PRJ2 bằng tên database của bạn
            String user = "root"; // Thay root bằng username của bạn
            String password = "123456"; // Thay kali123 bằng password của bạn

            // Tạo kết nối
            connection = DriverManager.getConnection(url, user, password);
            return connection;
        } catch (SQLException | ClassNotFoundException e) {
            System.err.println("Error " + e.getMessage() + " at DBContext");
            return null;
        }
    }

    public static void main(String[] args) {
        DBContext test = new DBContext();
        test.connection = test.getConnection();
        System.out.println(test.connection);
    }
}
