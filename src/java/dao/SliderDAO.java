/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import model.Slider;
import context.DBContext;
import java.sql.*;
import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

/**
 *
 * @author naokh
 *
 */
public class SliderDAO extends DBContext {

          // Get sliders with pagination
          public List<Slider> getSlidersByPage(int page, int pageSize) {
                    List<Slider> sliders = new ArrayList<>();
                    String query = "SELECT * FROM slider LIMIT ? OFFSET ?";
                    try {
                              connection = getConnection();
                              statement = connection.prepareStatement(query);
                              statement.setInt(1, pageSize);
                              statement.setInt(2, (page - 1) * pageSize);
                              resultSet = statement.executeQuery();
                              while (resultSet.next()) {
                                        Slider slider = new Slider(
                                                resultSet.getInt("id"),
                                                resultSet.getString("title"),
                                                resultSet.getString("image"),
                                                resultSet.getString("backlink"),
                                                resultSet.getInt("status"),
                                                resultSet.getString("notes"),
                                                resultSet.getInt("marketing_id"),
                                                resultSet.getDate("updated_date")
                                        );
                                        sliders.add(slider);
                              }
                    } catch (SQLException e) {
                              System.err.println("Error in getSlidersByPage: " + e.getMessage());
                    }
                    return sliders;
          }

          // Get total count of sliders for pagination
          public int getTotalSliders() {
                    String query = "SELECT COUNT(*) FROM slider";
                    try {
                              connection = getConnection();
                              statement = connection.prepareStatement(query);
                              resultSet = statement.executeQuery();
                              if (resultSet.next()) {
                                        return resultSet.getInt(1);
                              }
                    } catch (SQLException e) {
                              System.err.println("Error in getTotalSliders: " + e.getMessage());
                    }
                    return 0;
          }

          public List<Slider> getAllSliders() {
                    List<Slider> sliders = new ArrayList<>();
                    String sql = "SELECT * FROM Slider WHERE status = 1"; // Adjust table and column names if needed

                    try (Connection conn = getConnection(); PreparedStatement ps = conn.prepareStatement(sql); ResultSet rs = ps.executeQuery()) {

                              while (rs.next()) {
                                        Slider slider = new Slider();
                                        slider.setId(rs.getInt("id"));
                                        slider.setImage(rs.getString("image"));
                                        slider.setStatus(rs.getInt("status"));
                                        sliders.add(slider);
                              }
                    } catch (Exception e) {
                              e.printStackTrace();
                    }

                    return sliders;
          }

          public int getSliderPage(int sliderId, int pageSize) {
                    String query = "SELECT COUNT(*) FROM slider WHERE id < ?";
                    try (Connection conn = getConnection(); PreparedStatement ps = conn.prepareStatement(query)) {

                              ps.setInt(1, sliderId);
                              ResultSet rs = ps.executeQuery();
                              if (rs.next()) {
                                        int position = rs.getInt(1) + 1; // Get position (1-based index)
                                        return (int) Math.ceil((double) position / pageSize);
                              }
                    } catch (SQLException e) {
                              System.err.println("Error in getSliderPage: " + e.getMessage());
                    }
                    return 1; // Default to first page if error
          }

   public int updateSliderStatus(int productID, int i) {
      throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
   }

   public Object getSliderById(int productID) {
      throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
   }

   public LinkedHashMap<Integer, Map<String, Object>> showSliderWithOrder(String id, String asc) {
      throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
   }

   public LinkedHashMap<Integer, Map<String, Object>> showSliderWithSearch(String pSearch) {
      throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
   }

   public LinkedHashMap<Integer, Map<String, Object>> getSliderByStatus(int status) {
      throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
   }

   public int addSlider(Slider slider) {
      throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
   }

   public Map<String, Object> getSliderBySliderID(int productID) {
      throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
   }

   public int updateSlider(Slider slider) {
      throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
   }

}
