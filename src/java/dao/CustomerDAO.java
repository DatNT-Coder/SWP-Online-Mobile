/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import context.DBContext;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import model.User;

/**
 *
 * @author admin
 */
public class CustomerDAO extends DBContext {

    public List<User> getAllCustomers() {
        List<User> customers = new ArrayList<>();
        String query = "SELECT id, full_name, gender, email, phone, status FROM mydb.user;";

        try {
            this.connection = getConnection();
            PreparedStatement ps = connection.prepareStatement(query);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                User customer = new User();
                customer.setId(rs.getInt("id"));
                customer.setFull_name(rs.getString("full_name"));
                customer.setGender(rs.getString("gender"));
                customer.setEmail(rs.getString("email"));
                customer.setPhone(rs.getString("phone"));
                customer.setStatus(rs.getInt("status"));
                customers.add(customer);
            }
        } catch (SQLException e) {
            System.out.println("Error fetching customers: " + e.getMessage());
        } finally {
            try {
                if (connection != null) {
                    connection.close();
                }
            } catch (SQLException e) {
                System.out.println("Error closing connection: " + e.getMessage());
            }
        }
        return customers;

    }

    public int getCustomerCount() {
        String query = "SELECT COUNT(*) FROM mydb.user;";
        try {
            this.connection = getConnection();
            PreparedStatement ps = connection.prepareStatement(query);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                return rs.getInt(1);
            }
        } catch (SQLException e) {
            System.out.println("Error counting customers: " + e.getMessage());
        } finally {
            closeConnection();
        }
        return 0;
    }

    public List<User> getCustomersByPage(int offset, int limit, String sortField, String sortOrder) {
        List<User> customers = new ArrayList<>();
        List<String> validFields = Arrays.asList("id", "full_name", "email", "phone", "status");

        if (!validFields.contains(sortField)) {
            sortField = "id"; // Mặc định sắp xếp theo ID
        }

        String query = "SELECT id, full_name, gender, email, phone, status FROM mydb.user "
                + "ORDER BY " + sortField + " " + ("desc".equalsIgnoreCase(sortOrder) ? "DESC" : "ASC")
                + " LIMIT ? OFFSET ?";

        try {
            this.connection = getConnection();
            PreparedStatement ps = connection.prepareStatement(query);
            ps.setInt(1, limit);
            ps.setInt(2, offset);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                User customer = new User();
                customer.setId(rs.getInt("id"));
                customer.setFull_name(rs.getString("full_name"));
                customer.setGender(rs.getString("gender"));
                customer.setEmail(rs.getString("email"));
                customer.setPhone(rs.getString("phone"));
                customer.setStatus(rs.getInt("status"));
                customers.add(customer);
            }
        } catch (SQLException e) {
            System.out.println("Error fetching customers: " + e.getMessage());
        } finally {
            closeConnection();
        }
        return customers;
    }

    private void closeConnection() {
        try {
            if (connection != null && !connection.isClosed()) {
                connection.close();
            }
        } catch (SQLException e) {
            System.out.println("Error closing connection: " + e.getMessage());
        }
    }

    public List<User> searchCustomers(String keyword) {
        List<User> customers = new ArrayList<>();
        String query = "SELECT id, full_name, gender, email, phone, status FROM mydb.user\n"
                + "WHERE full_name LIKE ? OR email LIKE ? OR phone LIKE ?";

        try {
            this.connection = getConnection();
            PreparedStatement ps = connection.prepareStatement(query);
            String searchKeyword = "%" + keyword + "%";
            ps.setString(1, searchKeyword);
            ps.setString(2, searchKeyword);
            ps.setString(3, searchKeyword);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                User customer = new User();
                customer.setId(rs.getInt("id"));
                customer.setFull_name(rs.getString("full_name"));
                customer.setGender(rs.getString("gender"));
                customer.setEmail(rs.getString("email"));
                customer.setPhone(rs.getString("phone"));
                customer.setStatus(rs.getInt("status"));
                customers.add(customer);
            }
        } catch (SQLException e) {
            System.out.println("Error searching customers: " + e.getMessage());
        } finally {
            try {
                if (connection != null) {
                    connection.close();
                }
            } catch (SQLException e) {
                System.out.println("Error closing connection: " + e.getMessage());
            }
        }
        return customers;
    }

    public List<User> filterCustomersByStatus(int status) {
        List<User> customers = new ArrayList<>();
        String query = "SELECT id, full_name, gender, email, phone, status FROM mydb.user WHERE status = ?";

        try {
            this.connection = getConnection();
            PreparedStatement ps = connection.prepareStatement(query);
            ps.setInt(1, status);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                User customer = new User();
                customer.setId(rs.getInt("id"));
                customer.setFull_name(rs.getString("full_name"));
                customer.setGender(rs.getString("gender"));
                customer.setEmail(rs.getString("email"));
                customer.setPhone(rs.getString("phone"));
                customer.setStatus(rs.getInt("status"));
                customers.add(customer);
            }
        } catch (SQLException e) {
            System.out.println("Error filtering customers: " + e.getMessage());
        } finally {
            try {
                if (connection != null) {
                    connection.close();
                }
            } catch (SQLException e) {
                System.out.println("Error closing connection: " + e.getMessage());
            }
        }
        return customers;
    }

    public List<User> getSortedCustomers(String sortField, String sortOrder) {
        List<User> customers = new ArrayList<>();

        // Danh sách cột hợp lệ để tránh SQL Injection
        List<String> validFields = Arrays.asList("id", "full_name", "email", "phone", "status");

        if (!validFields.contains(sortField)) {
            sortField = "id"; // Mặc định sắp xếp theo ID
        }

        String query = "SELECT id, full_name, gender, email, phone, status FROM mydb.user "
                + "ORDER BY " + sortField + " " + ("desc".equalsIgnoreCase(sortOrder) ? "DESC" : "ASC");

        try {
            this.connection = getConnection();
            PreparedStatement ps = connection.prepareStatement(query);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                User customer = new User();
                customer.setId(rs.getInt("id"));
                customer.setFull_name(rs.getString("full_name"));
                customer.setGender(rs.getString("gender"));
                customer.setEmail(rs.getString("email"));
                customer.setPhone(rs.getString("phone"));
                customer.setStatus(rs.getInt("status"));
                customers.add(customer);
            }
        } catch (SQLException e) {
            System.out.println("Error fetching sorted customers: " + e.getMessage());
        } finally {
            closeConnection();
        }
        return customers;
    }

    public void addCustomer(User u) {
        try {
            String sql = "INSERT INTO user (full_name, email, password, phone, gender, registration_date, status, updatedBy, updatedDate, image, settings_id) "
                    + "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, u.getFull_name());
            stm.setString(2, u.getEmail());
            stm.setString(3, u.getPassword());
            stm.setString(4, u.getPhone());
            stm.setString(5, u.getGender());
            stm.setDate(6, new java.sql.Date(u.getRegistration_date().getTime()));
            stm.setInt(7, u.getStatus());
            stm.setInt(8, u.getUpdatedBy());
            stm.setDate(9, new java.sql.Date(u.getUpdatedDate().getTime()));
            stm.setString(10, u.getImage());
//            stm.setDate(9, new java.sql.Date(u.getUpdatedDate().getTime()));

            stm.executeUpdate();
            stm.close();
        } catch (Exception e) {
            System.out.println("Error adding customer: " + e.getMessage());
        }
    }
    


}
