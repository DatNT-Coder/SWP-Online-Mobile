/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import context.DBContext;
import java.sql.ResultSet;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import model.User;
import model.UserAddress;

/**
 *
 * @author admin
 */
public class CustomerDetailDAO extends DBContext {
   // Lưu thông tin khách hàng vào bảng User

   public void saveCustomer(String fullName, String gender, String email, String phone, String address, int updatedBy) {
      String insertUserQuery = "INSERT INTO user (email, full_name, gender, phone, updatedBy, updatedDate) VALUES (?, ?, ?, ?, ?, NOW())";
      String insertAddressQuery = "INSERT INTO useraddress (user_id, user_address) VALUES (?, ?)";

      try {
         this.connection = getConnection();

         // Thêm User và lấy ID của User vừa được thêm
         PreparedStatement psUser = connection.prepareStatement(insertUserQuery, PreparedStatement.RETURN_GENERATED_KEYS);
         psUser.setString(1, email);
         psUser.setString(2, fullName);
         psUser.setString(3, gender);
         psUser.setString(4, phone);
         psUser.setInt(5, updatedBy);
         psUser.executeUpdate();

         ResultSet rs = psUser.getGeneratedKeys();
         int userId = -1;
         if (rs.next()) {
            userId = rs.getInt(1);
         }

         // Nếu User được thêm thành công, thêm địa chỉ vào bảng UserAddress
         if (userId != -1) {
            PreparedStatement psAddress = connection.prepareStatement(insertAddressQuery);
            psAddress.setInt(1, userId);
            psAddress.setString(2, address);
            psAddress.executeUpdate();
         }
      } catch (SQLException e) {
         e.printStackTrace();
      }
   }

   // Lấy danh sách khách hàng từ bảng User
   public List<User> getCustomerList() {
      List<User> customers = new ArrayList<>();
      String query = "SELECT u.id, u.email, u.full_name, u.gender, u.phone, "
              + "ua.address, u.updatedBy, u.updatedDate, ua.user_id "
              + "FROM User u "
              + "LEFT JOIN UserAddress ua ON u.id = ua.user_id "
              + "ORDER BY u.updatedDate DESC";

      try {
         this.connection = getConnection();
         PreparedStatement ps = connection.prepareStatement(query);
         ResultSet rs = ps.executeQuery();
         while (rs.next()) {
            User customer = new User();
            customer.setId(rs.getInt("id"));
            customer.setEmail(rs.getString("email"));
            customer.setFull_name(rs.getString("full_name"));
            customer.setGender(rs.getString("gender"));
            customer.setPhone(rs.getString("phone"));
            customer.setUpdatedBy(rs.getInt("updatedBy"));
            customer.setUpdatedDate(rs.getTimestamp("updatedDate"));

            // Tạo đối tượng UserAddress
            UserAddress userAddress = new UserAddress(rs.getString("address"), rs.getInt("user_id"));
            customer.setUserAddress(userAddress); // Gán vào User

            customers.add(customer);
         }
      } catch (SQLException e) {
         e.printStackTrace();
      }
      return customers;
   }

}
