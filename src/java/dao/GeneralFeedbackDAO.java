/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import context.DBContext;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.GeneralFeedback;

/**
 *
 * @author tiend
 */
public class GeneralFeedbackDAO extends DBContext {

   public ArrayList<GeneralFeedback> getAllFeedback() {
      ArrayList<GeneralFeedback> feedbackList = new ArrayList<>();
      try {
         this.connection = getConnection();
         String sql = "SELECT * FROM mydb.generalfeedback "
                 + "JOIN mydb.user ON generalfeedback.user_id = user.id";
         PreparedStatement statement = connection.prepareStatement(sql);
         ResultSet rs = statement.executeQuery();
         while (rs.next()) {
            GeneralFeedback feedback = new GeneralFeedback(
                    rs.getInt("id"),
                    rs.getString("full_name"),
                    rs.getString("gender"),
                    rs.getString("email"),
                    rs.getString("phone"),
                    rs.getInt("rating"),
                    rs.getString("image"),
                    rs.getString("comment"),
                    rs.getInt("user_id"),
                    rs.getInt("status"),
                    rs.getString("image_status")
            );
            feedbackList.add(feedback);
         }
      } catch (SQLException ex) {
         Logger.getLogger(GeneralFeedbackDAO.class.getName()).log(Level.SEVERE, null, ex);
      }
      return feedbackList;
   }

   public void insertGeneralFeedback(String full_name, String gender, String email, String phone,
           int rating, String image, String comment, String status, String image_status) {
      try {
         this.connection = getConnection();
         String sql = "INSERT INTO mydb.generalfeedback "
                 + "(full_name, gender, email, phone, rating, image, comment, User_id, status, image_status) "
                 + "VALUES (?, ?, ?, ?, ?, ?, ?, (SELECT id FROM mydb.user WHERE email = ?), ?, ?)";
         PreparedStatement statement = connection.prepareStatement(sql);

         statement.setString(1, full_name);
         statement.setString(2, gender);
         statement.setString(3, email);
         statement.setString(4, phone);
         statement.setInt(5, rating);
         statement.setString(6, image);
         statement.setString(7, comment);
         statement.setString(8, email); // Assuming email is unique in the user table
         statement.setString(9, status);
         statement.setString(10, image_status);

         statement.executeUpdate();
      } catch (SQLException ex) {
         Logger.getLogger(GeneralFeedbackDAO.class.getName()).log(Level.SEVERE, null, ex);
      }
   }

   public String getProductWithMostFeedback() {
      String productName = "No data";
      String query = "SELECT p.name, COUNT(f.id) AS feedback_count FROM GeneralFeedback f JOIN Product p ON f.productId = p.ID GROUP BY p.name ORDER BY feedback_count DESC LIMIT 1";
      Connection connection = null;
      PreparedStatement ps = null;
      ResultSet rs = null;

      try {
         connection = new DBContext().getConnection();
         ps = connection.prepareStatement(query);
         rs = ps.executeQuery();
         if (rs.next()) {
            productName = rs.getString("name");
         }
      } catch (Exception e) {
         e.printStackTrace();
      } finally {
         try {
            if (rs != null) {
               rs.close();
            }
            if (ps != null) {
               ps.close();
            }
            if (connection != null) {
               connection.close();
            }
         } catch (SQLException e) {
            e.printStackTrace();
         }
      }
      return productName;
   }

   public static void main(String[] args) {
      // Create an instance of GeneralFeedDAO
      GeneralFeedbackDAO generalFeedDAO = new GeneralFeedbackDAO();

      // Insert a sample feedback
      generalFeedDAO.insertGeneralFeedback(
              "John Doe",
              "Male",
              "john.doe@example.com",
              "123456789",
              5,
              "path/to/image.jpg",
              "Great service!",
              "Approved",
              "path/to/status/image.jpg"
      );

      // Call the getAllFeedback method to retrieve all feedback
      ArrayList<GeneralFeedback> feedbackList = generalFeedDAO.getAllFeedback();

      // Print the feedback
      for (GeneralFeedback feedback : feedbackList) {
         System.out.println(feedback);
      }
   }

}
