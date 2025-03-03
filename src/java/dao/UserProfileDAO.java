/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import context.DBContext;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import java.sql.Connection;
import model.User;

/**
 *
 * @author naokh
 */
public class UserProfileDAO {

   private final Connection connection;

   public UserProfileDAO() {
      DBContext dbContext = new DBContext();
      this.connection = dbContext.getConnection();
   }

   public User getUserById(int id) {
      String sql = "SELECT * FROM mydb.user WHERE id = ?";
      try (PreparedStatement ps = connection.prepareStatement(sql)) {
         ps.setInt(1, id);
         try (ResultSet rs = ps.executeQuery()) {
            if (rs.next()) {
               return new User(
                       rs.getInt("ID"),
                       rs.getString("email"),
                       rs.getString("password"),
                       rs.getString("full_name"),
                       rs.getString("phone"),
                       rs.getString("gender"),
                       rs.getDate("registration_date"),
                       rs.getInt("status"),
                       rs.getInt("updatedBy"),
                       rs.getDate("updatedDate"),
                       rs.getString("image"),
                       rs.getInt("settings_id"));
            }
         }
      } catch (SQLException e) {
         Logger.getLogger(UserProfileDAO.class.getName()).log(Level.SEVERE, "Error fetching user by ID", e);
      }
      return null;
   }

   public void editUserInfo(int id, String image, String fullname, String gender, String phone) {
      String sql = "UPDATE mydb.user SET image = ?, full_name = ?, gender = ?, phone = ? WHERE id = ?";
      try (PreparedStatement ps = connection.prepareStatement(sql)) {
         ps.setString(1, image);
         ps.setString(2, fullname);
         ps.setString(3, gender);
         ps.setString(4, phone);
         ps.setInt(5, id);
         ps.executeUpdate();
      } catch (SQLException ex) {
         Logger.getLogger(UserProfileDAO.class.getName()).log(Level.SEVERE, "Error updating user info", ex);
      }
   }
}
