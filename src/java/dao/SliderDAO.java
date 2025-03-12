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

   Connection con = null;
   PreparedStatement pst = null;
   ResultSet rs = null;
   // Get sliders with pagination

   public List<Slider> getSlidersByPage(int page, int pageSize) {
      List<Slider> sliders = new ArrayList<>();
      String query = "SELECT * FROM slider LIMIT ? OFFSET ?";

      // Use try-with-resources to automatically close resources
      try (Connection connection = getConnection(); PreparedStatement statement = connection.prepareStatement(query)) {

         statement.setInt(1, pageSize);  // Set page size
         statement.setInt(2, (page - 1) * pageSize);  // Set offset based on page

         try (ResultSet resultSet = statement.executeQuery()) {
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
            slider.setBacklink(rs.getString("backlink"));
            slider.setNotes(rs.getString("notes"));
            slider.setTitle(rs.getString("title"));
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

   public void insertSlider(String title, int status, String image, String notes, int marketingId, String backlink) {
      String sql = "INSERT INTO slider (title, status, image, notes, marketing_id, updated_date, backlink) VALUES (?, ?, ?, ?, ?, NOW(), ?)";
      try {
         con = getConnection();
         if (con != null) {
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, title);
            ps.setInt(2, status);
            ps.setString(3, image);
            ps.setString(4, notes);
            ps.setInt(5, marketingId);
            ps.setString(6, backlink);
            ps.executeUpdate();
         }
      } catch (Exception e) {
         e.printStackTrace();
      } finally {
         try {
            if (con != null) {
               con.close();
            }
         } catch (Exception e) {
            e.printStackTrace();
         }
      }
   }

   // Hàm lấy Slider theo ID
   public Slider getListSliderBySliderId(int sliderId) {
      Slider slider = null;
      try {
         con = getConnection();
         if (con != null) {
            String sql = "SELECT * FROM slider WHERE id = ?";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, sliderId);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
               slider = new Slider();
               slider.setId(rs.getInt("id"));
               slider.setTitle(rs.getString("title"));
               slider.setImage(rs.getString("image"));
               slider.setBacklink(rs.getString("backlink"));
               slider.setStatus(rs.getInt("status"));
               slider.setNotes(rs.getString("notes"));
               slider.setMarketingId(rs.getInt("marketing_id"));
               slider.setUpdatedDate(rs.getDate("updated_date"));
            }
         }
      } catch (Exception e) {
         e.printStackTrace();
      } finally {
         try {
            if (con != null) {
               con.close();
            }
         } catch (Exception e) {
            e.printStackTrace();
         }
      }
      return slider;
   }

   public void updateSlider(int sliderId, String title, int status, String image, String notes, int marketingId, String backlink) {
      String sql = "UPDATE slider "
              + "SET image = ?, "
              + "    status = ?, "
              + "    title = ?, "
              + "    notes = ?, "
              + "    marketing_id = ?, "
              + "    backlink = ?, "
              + "    updated_date = NOW() "
              + "WHERE id = ?";
      try {
         con = getConnection();
         if (con != null) {
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, image);
            ps.setInt(2, status);
            ps.setString(3, title);
            ps.setString(4, notes);
            ps.setInt(5, marketingId);
            ps.setString(6, backlink);
            ps.setInt(7, sliderId);
            ps.executeUpdate();
         }
      } catch (Exception e) {
         e.printStackTrace();
      } finally {
         try {
            if (con != null) {
               con.close();
            }
         } catch (Exception e) {
            e.printStackTrace();
         }
      }
   }

   public int getTotalSlider() {
      int total = 0;
      String sql = "SELECT COUNT(*) FROM slider";
      try {
         con = getConnection();
         if (con != null) {
            PreparedStatement ps = con.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
               total = rs.getInt(1);
            }
         }
      } catch (Exception e) {
         e.printStackTrace();
      } finally {
         try {
            if (con != null) {
               con.close();
            }
         } catch (Exception e) {
            e.printStackTrace();
         }
      }
      return total;
   }

   public boolean getStatusBySliderId(int sliderId) {
      boolean status = false;
      String sql = "SELECT status FROM slider WHERE id = ?";
      try {
         con = getConnection();
         if (con != null) {
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, sliderId);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
               status = rs.getInt(1) == 1; // Chuyển đổi từ INT sang BOOLEAN
            }
         }
      } catch (Exception e) {
         e.printStackTrace();
      } finally {
         try {
            if (con != null) {
               con.close();
            }
         } catch (Exception e) {
            e.printStackTrace();
         }
      }
      return status;
   }

   public void updateSliderHide(int sliderId) {
      String sql = "UPDATE slider SET status = 0, updated_date = NOW() WHERE id = ?";
      try {
         con = getConnection();
         if (con != null) {
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, sliderId);
            ps.executeUpdate();
         }
      } catch (Exception e) {
         e.printStackTrace();
      } finally {
         try {
            if (con != null) {
               con.close();
            }
         } catch (Exception e) {
            e.printStackTrace();
         }
      }
   }

   public void updateSliderShow(int sliderId) {
      String sql = "UPDATE slider SET status = 1, updated_date = NOW() WHERE id = ?";
      try {
         con = getConnection();
         if (con != null) {
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, sliderId);
            ps.executeUpdate();
         }
      } catch (Exception e) {
         e.printStackTrace();
      } finally {
         try {
            if (con != null) {
               con.close();
            }
         } catch (Exception e) {
            e.printStackTrace();
         }
      }
   }

   public List<Slider> getListSlidersByPagging(int page, int PAGE_SIZE_10) {
      List<Slider> list = new ArrayList<>();
      String sql = "SELECT * FROM slider ORDER BY id ASC LIMIT ? OFFSET ?";
      try {
         con = getConnection();
         if (con != null) {
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, PAGE_SIZE_10);
            ps.setInt(2, (page - 1) * PAGE_SIZE_10);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
               Slider slider = new Slider();
               slider.setId(rs.getInt("id"));
               slider.setTitle(rs.getString("title"));
               slider.setImage(rs.getString("image"));
               slider.setBacklink(rs.getString("backlink"));
               slider.setStatus(rs.getInt("status"));
               slider.setNotes(rs.getString("notes"));
               slider.setMarketingId(rs.getInt("marketing_id"));
               slider.setUpdatedDate(rs.getDate("updated_date"));
               list.add(slider);
            }
         }
      } catch (Exception e) {
         e.printStackTrace();
      } finally {
         try {
            if (con != null) {
               con.close();
            }
         } catch (Exception e) {
            e.printStackTrace();
         }
      }
      return list;
   }

   public int getTotalSlider(String keyword, int status) {
      int total = 0;
      String sql = "SELECT COUNT(*) FROM slider WHERE title LIKE ? AND status = ?";
      try {
         con = getConnection();
         if (con != null) {
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, "%" + keyword + "%");
            ps.setInt(2, status);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
               total = rs.getInt(1);
            }
         }
      } catch (Exception e) {
         e.printStackTrace();
      } finally {
         try {
            if (con != null) {
               con.close();
            }
         } catch (Exception e) {
            e.printStackTrace();
         }
      }
      return total;
   }

   public List<Slider> getListSliderByKeywordAndPagging(String keyword, int page, int PAGE_SIZE_3, int status) {
      List<Slider> list = new ArrayList<>();
      String sql = "SELECT * FROM slider WHERE title LIKE ? AND status = ? ORDER BY id ASC LIMIT ? OFFSET ?";
      try {
         con = getConnection();
         if (con != null) {
            PreparedStatement stm = con.prepareStatement(sql);
            stm.setString(1, "%" + keyword + "%");
            stm.setInt(2, status);
            stm.setInt(3, PAGE_SIZE_3);
            stm.setInt(4, (page - 1) * PAGE_SIZE_3);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
               Slider slider = new Slider();
               slider.setId(rs.getInt("id"));
               slider.setTitle(rs.getString("title"));
               slider.setImage(rs.getString("image"));
               slider.setBacklink(rs.getString("backlink"));
               slider.setStatus(rs.getInt("status"));
               slider.setNotes(rs.getString("notes"));
               slider.setMarketingId(rs.getInt("marketing_id"));
               slider.setUpdatedDate(rs.getDate("updated_date"));
               list.add(slider);
            }
         }
      } catch (Exception e) {
         e.printStackTrace();
      } finally {
         try {
            if (con != null) {
               con.close();
            }
         } catch (Exception e) {
            e.printStackTrace();
         }
      }
      return list;
   }

}
