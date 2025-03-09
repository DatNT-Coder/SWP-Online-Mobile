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
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.ProductFeedback;
import model.GeneralFeedback;

/**
 *
 * @author tiend
 */
public class FeedbackDAO extends DBContext {
    public Map<String, Object> getFeedbackByID(int pid) {
        Map<String, Object> feedbackDetails = new LinkedHashMap<>();
        String query = "SELECT pf.*, p.name\n"
                + "FROM mydb.productfeedback pf\n"
                + "INNER JOIN mydb.product p ON pf.product_id = p.id\n"
                + "WHERE pf.id = ?;";

        try {
            this.connection = getConnection();
            PreparedStatement ps = connection.prepareStatement(query);
            ps.setInt(1, pid);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                ProductFeedback feedback = new ProductFeedback(
                        rs.getInt("id"),
                        rs.getString("full_name"),
                        rs.getString("gender"),
                        rs.getString("email"),
                        rs.getString("phone"),
                        rs.getInt("rating"),
                        rs.getString("image"),
                        rs.getString("comment"),
                        rs.getInt("Product_ID"),
                        rs.getInt("User_id"),
                        rs.getInt("status"),
                        rs.getInt("image_status")
                );
                feedbackDetails.put("feed", feedback);
                feedbackDetails.put("name", rs.getString("name"));
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return feedbackDetails;
    }

    public int countProductFeedback() {
        int total = 0;
        try {
            this.connection = getConnection();
            String sql = "SELECT COUNT(*) AS count_feedback FROM productfeedback";
            PreparedStatement statement = connection.prepareStatement(sql);
            ResultSet rs = statement.executeQuery();
            if (rs.next()) {
                total = rs.getInt("count_feedback");
            }
        } catch (SQLException ex) {
            Logger.getLogger(GeneralFeedbackDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return total;
    }

    public int updateImageStatus(int pid, int status) {
        String query = "UPDATE mydb.productfeedback SET image_status = ? WHERE id = ?";
        int n = 0;
        try {
            this.connection = getConnection();
            PreparedStatement ps = connection.prepareStatement(query);
            ps.setInt(1, status);
            ps.setInt(2, pid);
            n = ps.executeUpdate();
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return n;
    }

    public LinkedHashMap<Integer, Map<String, Object>> showFeedbackList(String sortBy,String order) {
        LinkedHashMap<Integer, Map<String, Object>> feedbackList = new LinkedHashMap<>();
        String query = " SELECT pf.`id`,pf.`full_name`, p.`name` AS productname,\n"
                + "pf.`rating`,\n"
                + "pf.`status`,\n"
                + "pf.`comment`\n"
                + "FROM\n"
                + "`mydb`.`productfeedback` pf\n"
                + "JOIN\n"
                + "`mydb`.`product` p ON pf.`Product_ID` = p.`ID` "
                 + "ORDER BY " + sortBy + " "+order+";";

        try {
            this.connection = getConnection();
            PreparedStatement ps = connection.prepareStatement(query);
            ResultSet rs = ps.executeQuery();
            int id = 1;
            while (rs.next()) {
                ProductFeedback feedback = new ProductFeedback(
                        rs.getInt("id"),
                        rs.getString("full_name"),
                        rs.getInt("rating"),
                        rs.getInt("status"),
                        rs.getString("comment")
                );
                Map<String, Object> list = new HashMap<>();
                list.put("feedback", feedback);
                list.put("productname", rs.getString("productname"));
                feedbackList.put(id, list);
                id++;
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return feedbackList;
    }

    public LinkedHashMap<Integer, Map<String, Object>> showFeedbackWithSearch(String searchQuery) {
        LinkedHashMap<Integer, Map<String, Object>> feedbackList = new LinkedHashMap<>();
        String query = "SELECT\n"
                + "pf.`id`,pf.`full_name`,\n"
                + "p.`name` AS productname,\n"
                + "pf.`rating`,\n"
                + "pf.`status`,\n"
                + "pf.`comment`\n"
                + "FROM `mydb`.`productfeedback` pf\n"
                + "JOIN `mydb`.`product` p ON pf.`Product_ID` = p.`ID`\n"
                + "WHERE\n"
                + "pf.`full_name` LIKE CONCAT('%', ?, '%')\n"
                + "OR pf.`comment` LIKE CONCAT('%', ?, '%')\n"
                + "ORDER BY pf.`id` ASC;";
        try {
            this.connection = getConnection();
            PreparedStatement ps = connection.prepareStatement(query);
            ps.setString(1, searchQuery);
            ps.setString(2, searchQuery);
            ResultSet rs = ps.executeQuery();
            int id = 1;
            while (rs.next()) {
                ProductFeedback feedback = new ProductFeedback(
                        rs.getInt("id"),
                        rs.getString("full_name"),
                        rs.getInt("rating"),
                        rs.getInt("status"),
                        rs.getString("comment")
                );
                Map<String, Object> list = new HashMap<>();
                list.put("feedback", feedback);
                list.put("productname", rs.getString("productname"));
                feedbackList.put(id, list);
                id++;
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return feedbackList;
    }

    public LinkedHashMap<Integer, Map<String, Object>> getFeedbackByStatus(int status) {
        LinkedHashMap<Integer, Map<String, Object>> listFeedback = new LinkedHashMap<>();
        String query = "SELECT\n"
                + "pf.`id`,pf.`full_name`,\n"
                + "p.`name` AS productname,\n"
                + "pf.`rating`,\n"
                + "pf.`status`,\n"
                + "pf.`comment`\n"
                + "FROM `mydb`.`productfeedback` pf\n"
                + "JOIN `mydb`.`product` p ON pf.`Product_ID` = p.`ID`\n"
                + "WHERE pf.`status` = ?\n"
                + "ORDER BY pf.`id` ASC;";

        try {
            this.connection = getConnection();
            PreparedStatement ps = connection.prepareStatement(query);
            ps.setInt(1, status);
            ResultSet rs = ps.executeQuery();
            int id = 1;
            while (rs.next()) {
                ProductFeedback feedback = new ProductFeedback(
                        rs.getInt("id"),
                        rs.getString("full_name"),
                        rs.getInt("rating"),
                        rs.getInt("status"),
                        rs.getString("comment")
                );
                Map<String, Object> list = new HashMap<>();
                list.put("feedback", feedback);
                list.put("productname", rs.getString("productname"));
                listFeedback.put(id, list);
                id++;
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return listFeedback;
    }

    public int updateFeedbackStatus(int feedbackId, int status) {
        String query = "UPDATE `mydb`.`productfeedback` SET `status` = ? WHERE (`id` = ? );";
        int n = 0;
        try {
            this.connection = getConnection();
            PreparedStatement ps = connection.prepareStatement(query);
            ps.setInt(1, status);
            ps.setInt(2, feedbackId);
            n = ps.executeUpdate();
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return n;
    }

    public ProductFeedback getFeedbackById(int id) {
        try {
            this.connection = getConnection();
            String sql = "SELECT * FROM mydb.productfeedback\n"
                    + "where id = ?;";
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setInt(1, id);
            ResultSet rs = statement.executeQuery();
            if (rs.next()) {
                ProductFeedback feedback = new ProductFeedback(
                        rs.getInt("id"),
                        rs.getString("full_name"),
                        rs.getInt("rating"),
                        rs.getInt("status"),
                        rs.getString("comment")
                );
                return feedback;
            }
        } catch (SQLException ex) {
            Logger.getLogger(SliderDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public int addGeneralFeedback(GeneralFeedback feedback) {
        String query = "INSERT INTO `mydb`.`generalfeedback` (\n"
                + "    `full_name`,\n"
                + "    `gender`,\n"
                + "    `email`,\n"
                + "    `phone`,\n"
                + "    `rating`,\n"
                + "    `comment`,\n"
                + "    `User_id`,\n"
                + "    `status`,\n"
                + "    `image_status`\n"
                + ") VALUES\n"
                + "(?, ?, ?, ?, ?, ?, ?, ?,?);";
        int generalFeedbackId = 0;
        try {
            this.connection = getConnection();
            PreparedStatement ps = connection.prepareStatement(query, Statement.RETURN_GENERATED_KEYS);
            ps.setString(1, feedback.getFull_name());
            ps.setString(2, feedback.getGender());
            ps.setString(3, feedback.getEmail());
            ps.setString(4, feedback.getPhone());
            ps.setInt(5, feedback.getRating());
            ps.setString(6, feedback.getComment());
            ps.setInt(7, feedback.getUser_id());
            ps.setInt(8, feedback.getStatus());
            ps.setString(9, feedback.getImage_status());
            ps.executeUpdate();
            try ( ResultSet generatedKeys = ps.getGeneratedKeys()) {
                if (generatedKeys.next()) {
                    generalFeedbackId = generatedKeys.getInt(1);
                } else {
                    throw new SQLException("Tạo phản hồi không thành công");
                }
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return generalFeedbackId;
    }

    public int addFeedback(ProductFeedback feedback) {
        String query = "INSERT INTO mydb.productfeedback (\n"
                + "    full_name, \n"
                + "    gender, \n"
                + "    email, \n"
                + "    phone, \n"
                + "    rating, \n"
                + "    image, \n"
                + "    comment, \n"
                + "    Product_ID, \n"
                + "    User_id, \n"
                + "    status, \n"
                + "    image_status\n"
                + ") VALUES (\n"
                + "   ?, \n"
                + "    ?, \n"
                + "    ?, \n"
                + "    ?, \n"
                + "    ?, \n"
                + "    ?, \n"
                + "    ?, \n"
                + "    ?, \n"
                + "    ?, \n"
                + "    ?, \n"
                + "    ?\n"
                + ");";
        int FeedbackId = 0;
        try {
            this.connection = getConnection();
            PreparedStatement ps = connection.prepareStatement(query, Statement.RETURN_GENERATED_KEYS);
            ps.setString(1, feedback.getFull_name());
            ps.setString(2, feedback.getGender());
            ps.setString(3, feedback.getEmail());
            ps.setString(4, feedback.getPhone());
            ps.setInt(5, feedback.getRating());
            ps.setString(6, feedback.getImage());
            ps.setString(7, feedback.getComment());
            ps.setInt(8, feedback.getProduct_Id());
            ps.setInt(9, feedback.getUser_Id());
            ps.setInt(10, feedback.getStatus());
            ps.setInt(11, feedback.getImageStatus());
            ps.executeUpdate();
            try ( ResultSet generatedKeys = ps.getGeneratedKeys()) {
                if (generatedKeys.next()) {
                    FeedbackId = generatedKeys.getInt(1);
                } else {
                    throw new SQLException("Tạo phản hồi không thành công");
                }
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return FeedbackId;
    }

    public List<ProductFeedback> findFeedbackbyProductID(int testProductId) {
        List<ProductFeedback> feedbacks = new ArrayList<>();
        String sql = "SELECT\n"
                + "    full_name,\n"
                + "    rating,\n"
                + "    image,\n"
                + "    comment,\n"
                + "    Product_ID,\n"
                + "    User_id,\n"
                + "    status,\n"
                + "    image_status\n"
                + "FROM\n"
                + "    mydb.productfeedback\n"
                + "WHERE\n"
                + "    Product_ID = ?;";
        try ( 
            Connection connection = getConnection(); 

            PreparedStatement statement = connection.prepareStatement(sql)) {
            statement.setInt(1, testProductId);
            try ( ResultSet rs = statement.executeQuery()) {
                while (rs.next()) {
                    ProductFeedback feedback = new ProductFeedback();
                    feedback.setFull_name(rs.getString("full_name"));
                    feedback.setRating(rs.getInt("rating"));
                    feedback.setImage(rs.getString("image"));
                    feedback.setComment(rs.getString("comment"));
                    feedback.setProduct_Id(rs.getInt("Product_ID"));
                    feedback.setUser_Id(rs.getInt("User_id"));
                    feedback.setStatus(rs.getInt("status"));
                    feedback.setImageStatus(rs.getInt("image_status"));
                    feedbacks.add(feedback);
                }
            }
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        return feedbacks;
    }
    
     public double getAverageRating(int productId) {
        double avgRating = 0;
        String query = "SELECT AVG(rating) FROM productfeedback WHERE Product_ID = ?";
        
        try (            Connection connection = getConnection(); 

             PreparedStatement stmt = connection.prepareStatement(query)) {
            stmt.setInt(1, productId);
            ResultSet rs = stmt.executeQuery();
            
            if (rs.next()) {
                avgRating = rs.getDouble(1);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return avgRating;
    }

    public static void main(String[] args) {
        FeedbackDAO feedbackDAO = new FeedbackDAO();

        int testProductId = 1; // ID sản phẩm để kiểm tra
        List<ProductFeedback> feedbacks = feedbackDAO.findFeedbackbyProductID(testProductId);
        if (feedbacks != null && !feedbacks.isEmpty()) {
            System.out.println("Danh sách phản hồi cho sản phẩm có ID " + testProductId + " là:");
            for (ProductFeedback feedback : feedbacks) {
                System.out.println("Tên: " + feedback.getFull_name());
                System.out.println("Đánh giá: " + feedback.getRating());
                System.out.println("Bình luận: " + feedback.getComment());
                System.out.println("ID người dùng: " + feedback.getUser_Id());
                System.out.println("Trạng thái: " + feedback.getStatus());
                System.out.println("-------------------------");
            }
        } else {
            System.out.println("Không tìm thấy phản hồi nào cho sản phẩm có ID " + testProductId);
        }
    }
}

