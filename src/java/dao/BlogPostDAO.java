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
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.Map;
import java.util.Vector;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.BlogPost;
import java.sql.Connection;
import java.util.List;

/**
 *
 * @author Asus
 */
public class BlogPostDAO extends DBContext {

   private final Connection connection; // Kết nối cơ sở dữ liệu

   public BlogPostDAO() {
      DBContext dbContext = new DBContext();
      this.connection = dbContext.getConnection(); // Lấy kết nối từ DBContext
   }

   public ArrayList<BlogPost> BlogListHot() {
      ArrayList<BlogPost> list = new ArrayList<>();

      try {
         String sql = "SELECT * FROM mydb.blogs_posts ORDER BY updatedDate DESC LIMIT 4";
         PreparedStatement statement = connection.prepareStatement(sql);

         ResultSet rs = statement.executeQuery();

         while (rs.next()) {
            list.add(new BlogPost(
                    rs.getInt(1), // id
                    rs.getString(2), // title
                    rs.getString(3), // brief_info
                    rs.getString(4), // thumbnail
                    rs.getString(5), // details
                    rs.getDate(6), // updatedDate
                    rs.getInt(7), // PostCategories_id
                    rs.getInt(8), // User_id
                    rs.getBoolean(9), // flag_feature
                    rs.getInt(10), // status
                    rs.getString(11),
                    rs.getString(12)
            ));
         }

      } catch (SQLException ex) {
         Logger.getLogger(BlogPostDAO.class.getName()).log(Level.SEVERE, null, ex);
      }
      return list;
   }

   public BlogPost BlogLastPost() {
      String query = "SELECT * FROM mydb.blogs_posts ORDER BY updatedDate DESC LIMIT 1";
      try {
         PreparedStatement ps = connection.prepareStatement(query);
         ResultSet rs = ps.executeQuery();
         if (rs.next()) {
            return new BlogPost(
                    rs.getInt(1), // id
                    rs.getString(2), // title
                    rs.getString(3), // brief_info
                    rs.getString(4), // thumbnail
                    rs.getString(5), // details
                    rs.getDate(6), // updatedDate
                    rs.getInt(7), // PostCategories_id
                    rs.getInt(8), // User_id
                    rs.getBoolean(9), // flag_feature
                    rs.getInt(10), // status
                    rs.getString(11),
                    rs.getString(12)
            );
         }
      } catch (SQLException e) {
         System.out.println(e);
      }
      return null;
   }

   public ArrayList<BlogPost> BlogList() {
      ArrayList<BlogPost> list = new ArrayList<>();

      try {
         String sql = "SELECT bp.*, u.full_name \n"
                 + "FROM `mydb`.`blogs_posts` AS bp \n"
                 + "LEFT JOIN `mydb`.`user` AS u ON bp.User_id = u.id \n"
                 + "WHERE bp.status != 0 \n"
                 + "ORDER BY bp.updatedDate ASC \n"
                 + "LIMIT 3;";
         PreparedStatement statement = connection.prepareStatement(sql);

         ResultSet rs = statement.executeQuery();

         while (rs.next()) {
            list.add(new BlogPost(
                    rs.getInt(1), // id
                    rs.getString(2), // title
                    rs.getString(3), // brief_info
                    rs.getString(4), // thumbnail
                    rs.getString(5), // details
                    rs.getDate(6), // updatedDate
                    rs.getInt(7), // PostCategories_id
                    rs.getInt(8), // User_id
                    rs.getBoolean(9), // flag_feature
                    rs.getInt(10), // status
                    rs.getString(11), // full_name
                    rs.getString(12)
            ));
         }

      } catch (SQLException ex) {
         Logger.getLogger(BlogPostDAO.class.getName()).log(Level.SEVERE, null, ex);
      }
      return list;
   }

   public ArrayList<BlogPost> BlogList2() {
      ArrayList<BlogPost> list = new ArrayList<>();

      try {
         String sql = "SELECT bp.*, u.full_name, COUNT(*) AS total_count\n"
                 + "FROM `mydb`.`blogs_posts` AS bp\n"
                 + "LEFT JOIN `mydb`.`user` AS u ON bp.User_id = u.id\n"
                 + "WHERE bp.status != 0\n"
                 + "GROUP BY bp.id, bp.title, bp.brief_info, bp.thumbnail, bp.details, bp.updatedDate, \n"
                 + "         bp.PostCategories_id, bp.User_id, bp.flag_feature, bp.status, u.full_name\n"
                 + "ORDER BY bp.updatedDate DESC\n"
                 + "LIMIT 3;";
         PreparedStatement statement = connection.prepareStatement(sql);

         ResultSet rs = statement.executeQuery();

         while (rs.next()) {
            list.add(new BlogPost(
                    rs.getInt(1), // id
                    rs.getString(2), // title
                    rs.getString(3), // brief_info
                    rs.getString(4), // thumbnail
                    rs.getString(5), // details
                    rs.getDate(6), // updatedDate
                    rs.getInt(7), // PostCategories_id
                    rs.getInt(8), // User_id
                    rs.getBoolean(9), // flag_feature
                    rs.getInt(10), // status
                    rs.getString(11), // full_name
                    rs.getString(12)
            ));
         }

      } catch (SQLException ex) {
         Logger.getLogger(BlogPostDAO.class.getName()).log(Level.SEVERE, null, ex);
      }
      return list;
   }

   public int getPostListQuantity() {
      int n = 0;
      String query = "SELECT COUNT(*) AS total_posts\n"
              + "FROM mydb.blogs_posts bp\n"
              + "WHERE bp.status != 0;";
      try {
         PreparedStatement ps = connection.prepareStatement(query);
         ResultSet rs = ps.executeQuery();
         if (rs.next()) {
            n = rs.getInt(1);
         }
      } catch (SQLException e) {
         System.out.println(e);
      }
      return n;
   }

   public Vector<BlogPost> pagingPost(int index, int numberPerPage) {
      Vector<BlogPost> list = new Vector<>();
      String query = "SELECT bp.*, u.full_name,pc.name\n"
              + "FROM mydb.blogs_posts AS bp\n"
              + "INNER JOIN postcategories pc ON bp.PostCategories_id = pc.id\n"
              + "LEFT JOIN mydb.user AS u ON bp.User_id = u.id\n"
              + "WHERE bp.status != 0\n"
              + "LIMIT ? OFFSET ?;";
      try {
         PreparedStatement ps = connection.prepareStatement(query);
         ps.setInt(1, numberPerPage);
         ps.setInt(2, (index - 1) * numberPerPage);
         ResultSet rs = ps.executeQuery();
         while (rs.next()) {
            list.add(new BlogPost(
                    rs.getInt(1), // id
                    rs.getString(2), // title
                    rs.getString(3), // brief_info
                    rs.getString(4), // thumbnail
                    rs.getString(5), // details
                    rs.getDate(6), // updatedDate
                    rs.getInt(7), // PostCategories_id
                    rs.getInt(8), // User_id
                    rs.getBoolean(9), // flag_feature
                    rs.getInt(10), // status
                    rs.getString(11), // full_name
                    rs.getString(12),
                    rs.getString(13)
            )
            );

         }
      } catch (SQLException e) {
         System.out.println(e);
      }
      return list;
   }

   public Vector<BlogPost> searchBlogs(String keyword) {
      Vector<BlogPost> list = new Vector<>();

      try {
         String sql = "SELECT bp.*,u.full_name,pc.name, u.* \n"
                 + "FROM mydb.blogs_posts AS bp\n"
                 + "JOIN mydb.user AS u ON bp.User_id = u.id\n"
                 + "INNER JOIN postcategories pc ON bp.PostCategories_id = pc.id\n"
                 + "WHERE bp.title LIKE ? OR bp.details LIKE ? OR pc.name LIKE?;";
         PreparedStatement statement = connection.prepareStatement(sql);
         String searchTerm = "%" + keyword + "%";
         statement.setString(1, searchTerm);
         statement.setString(2, searchTerm);
         statement.setString(3, searchTerm);
         ResultSet rs = statement.executeQuery();

         while (rs.next()) {
            list.add(new BlogPost(
                    rs.getInt(1), // id
                    rs.getString(2), // title
                    rs.getString(3), // brief_info
                    rs.getString(4), // thumbnail
                    rs.getString(5), // details
                    rs.getDate(6), // updatedDate
                    rs.getInt(7), // PostCategories_id
                    rs.getInt(8), // User_id
                    rs.getBoolean(9), // flag_feature
                    rs.getInt(10),
                    rs.getString(11), // full_name
                    rs.getString(12),
                    rs.getString(13)
            ));
         }
      } catch (SQLException ex) {
         Logger.getLogger(BlogPostDAO.class.getName()).log(Level.SEVERE, null, ex);
      }
      return list;

   }

   public BlogPost getPostbyID(int id) {
      try {
         String query = "SELECT p.*, pc.name, u.full_name\n"
                 + "FROM blogs_posts p\n"
                 + "INNER JOIN postcategories pc ON p.PostCategories_id = pc.id\n"
                 + "INNER JOIN user u ON p.User_id = u.id\n"
                 + "WHERE p.id = ?\n"
                 + "ORDER BY p.id ASC;";
         PreparedStatement statement = connection.prepareStatement(query);
         statement.setInt(1, id);
         ResultSet rs = statement.executeQuery();
         if (rs.next()) {
            BlogPost post = new BlogPost(rs.getInt("id"), // id
                    rs.getString(2), // title
                    rs.getString(3), // brief_info
                    rs.getString(4), // thumbnail
                    rs.getString(5), // details
                    rs.getDate(6), // updatedDate
                    rs.getInt(7), // PostCategories_id
                    rs.getInt(8), // User_id
                    rs.getBoolean(9), // flag_feature
                    rs.getInt(10),
                    rs.getString(11), // full_name
                    rs.getString(12));

            return post;
         }
      } catch (SQLException ex) {
         Logger.getLogger(BlogPostDAO.class.getName()).log(Level.SEVERE, null, ex);
      }
      return null;
   }

   public BlogPost getPostbyID2(int id) {
      try {
         String query = "SELECT p.*, u.full_name,pc.name\n"
                 + "FROM blogs_posts p\n"
                 + "INNER JOIN postcategories pc ON p.PostCategories_id = pc.id\n"
                 + "INNER JOIN user u ON p.User_id = u.id\n"
                 + "WHERE p.id = ?\n"
                 + "ORDER BY p.id ASC;";
         PreparedStatement statement = connection.prepareStatement(query);
         statement.setInt(1, id);
         ResultSet rs = statement.executeQuery();
         if (rs.next()) {
            BlogPost post = new BlogPost(rs.getInt("id"), // id
                    rs.getString(2), // title
                    rs.getString(3), // brief_info
                    rs.getString(4), // thumbnail
                    rs.getString(5), // details
                    rs.getDate(6), // updatedDate
                    rs.getInt(7), // PostCategories_id
                    rs.getInt(8), // User_id
                    rs.getBoolean(9), // flag_feature
                    rs.getInt(10),
                    rs.getString(11), // full_name
                    rs.getString(12),
                    rs.getString(13));

            return post;
         }
      } catch (SQLException ex) {
         Logger.getLogger(BlogPostDAO.class.getName()).log(Level.SEVERE, null, ex);
      }
      return null;
   }

   public static void main(String[] args) {
      // Khởi tạo DAOProduct
      BlogPostDAO daoProduct = new BlogPostDAO();

//        // Gọi phương thức showProductWithOrder với tham số là "name"
//        LinkedHashMap<Integer, Map<String, Object>> products = daoProduct.getProductByBrandId(1);
//
//        // In ra thông tin sản phẩm
//        for (Map.Entry<Integer, Map<String, Object>> entry : products.entrySet()) {
//
//            Map<String, Object> details = entry.getValue();
//
//            Product product = (Product) details.get("product");
//            System.out.println("Product ID: " + product.getID());
//            System.out.println("Product Name: " + product.getName());
//            System.out.println("Brand Name: " + details.get("brandName"));
//            System.out.println("Category Name: " + details.get("categoryName"));
//            System.out.println("-------------------------");
//        }
      BlogPost p = daoProduct.getPostbyID(2);
      System.out.println(p);
   }

   public List<BlogPost> getAllPosts() {
      List<BlogPost> posts = new ArrayList<>(); // Always initialize the list
      String query = "SELECT * FROM blogs_posts"; // Use correct table name

      try (Connection conn = getConnection(); PreparedStatement ps = conn.prepareStatement(query); ResultSet rs = ps.executeQuery()) {

         while (rs.next()) {
            posts.add(new BlogPost(
                    rs.getInt("id"),
                    rs.getString("title"),
                    rs.getString("brief_info"),
                    rs.getString("thumbnail"),
                    rs.getString("details"),
                    rs.getDate("updatedDate"),
                    rs.getInt("PostCategories_id"),
                    rs.getInt("User_id"),
                    rs.getBoolean("flag_feature"),
                    rs.getInt("status"),
                    rs.getString("blogs_postscol") // Ensure all fields match the database schema
            ));
         }

      } catch (SQLException e) {
         System.err.println("Error fetching blog posts: " + e.getMessage());
         e.printStackTrace();
      }

      System.out.println("Debug: posts list size = " + posts.size()); // Check if data is retrieved
      return posts;
   }

   public void updatePost(int postId, String title, String briefInfo, String thumbnail, String details) {
      String sql = "UPDATE BlogPost SET title = ?, brief_info = ?, thumbnail = ?, details = ? WHERE id = ?";
      try (Connection conn = getConnection(); PreparedStatement stmt = conn.prepareStatement(sql)) {
         stmt.setString(1, title);
         stmt.setString(2, briefInfo);
         stmt.setString(3, thumbnail);
         stmt.setString(4, details);
         stmt.setInt(5, postId);
         stmt.executeUpdate();
      } catch (SQLException e) {
         e.printStackTrace();
      }
   }

   public void hidePost(int postId) {
      String sql = "UPDATE BlogPost SET status = 0 WHERE id = ?";
      try (Connection conn = getConnection(); PreparedStatement stmt = conn.prepareStatement(sql)) {
         stmt.setInt(1, postId);
         stmt.executeUpdate();
      } catch (SQLException e) {
         e.printStackTrace();
      }
   }

   public void addPost(BlogPost newPost) {
      String sql = "INSERT INTO BlogPost (title, brief_info, thumbnail, details, updatedDate, PostCategories_id, User_id, status) VALUES (?, ?, ?, ?, NOW(), ?, ?, ?)";
      try (Connection conn = getConnection(); PreparedStatement stmt = conn.prepareStatement(sql)) {
         stmt.setString(1, newPost.getTitle());
         stmt.setString(2, newPost.getBrief_info());
         stmt.setString(3, newPost.getThumbnail());
         stmt.setString(4, newPost.getDetails());
         stmt.setInt(5, newPost.getPostCategories_id());
         stmt.setInt(6, newPost.getUser_id());
         stmt.setInt(8, newPost.getStatus());
         stmt.executeUpdate();
      } catch (SQLException e) {
         e.printStackTrace();
      }
   }

   public LinkedHashMap<Integer, Map<String, Object>> showPostWithOrder(String id, String asc) {
      LinkedHashMap<Integer, Map<String, Object>> postDetails = new LinkedHashMap<>();
      String query = "SELECT b.*, u.full_name, p.name\n"
              + "FROM blogs_posts b\n"
              + "INNER JOIN postcategories p ON p.id = b.PostCategories_id\n"
              + "INNER JOIN user u ON b.User_id = u.id\n"
              + "ORDER BY " + sortBy + " " + order + ";";
      try {
         PreparedStatement ps = conn.prepareStatement(query);
         ResultSet rs = ps.executeQuery();
         int id = 1;
         while (rs.next()) {
            BlogPost blog = new BlogPost(rs.getInt("id"), // id
                    rs.getString(2), // title
                    rs.getString(3), // brief_info
                    rs.getString(4), // thumbnail
                    rs.getString(5), // details
                    rs.getDate(6), // updatedDate
                    rs.getInt(7), // PostCategories_id
                    rs.getInt(8), // User_id
                    rs.getBoolean(9), // flag_feature
                    rs.getInt(10),
                    rs.getString(11), // full_name
                    rs.getString(12)
            );
            Map<String, Object> details = new HashMap<>();
            details.put("post", blog);
            details.put("full_name", rs.getString("full_name"));
            details.put("name", rs.getString("name"));
            postDetails.put(id, details);
            id++;
         }
      } catch (SQLException ex) {
         ex.printStackTrace();
      }
      return postDetails;

   }

   public LinkedHashMap<Integer, Map<String, Object>> showPostWithSearch(String pSearch) {
      LinkedHashMap<Integer, Map<String, Object>> postDetails = new LinkedHashMap<>();
      String query = "SELECT b.*, u.full_name, p.name\n"
              + "FROM blogs_posts b\n"
              + "INNER JOIN postcategories p ON p.id = b.PostCategories_id\n"
              + "INNER JOIN user u ON b.User_id = u.id\n"
              + "AND (b.title LIKE CONCAT('%', ?, '%') \n"
              + "       OR b.details LIKE CONCAT('%',?, '%') \n"
              + "       OR u.full_name LIKE CONCAT('%', ? '%') \n"
              + "       OR p.name LIKE CONCAT('%', ?, '%'))\n"
              + "ORDER BY b.ID ASC;";

      try {
         PreparedStatement ps = conn.prepareStatement(query);
         ps.setString(1, pSearch);
         ps.setString(2, pSearch);
         ps.setString(3, pSearch);
         ps.setString(4, pSearch);
         ResultSet rs = ps.executeQuery();
         int id = 1;
         while (rs.next()) {
            BlogPost blog = new BlogPost(rs.getInt("id"), // id
                    rs.getString(2), // title
                    rs.getString(3), // brief_info
                    rs.getString(4), // thumbnail
                    rs.getString(5), // details
                    rs.getDate(6), // updatedDate
                    rs.getInt(7), // PostCategories_id
                    rs.getInt(8), // User_id
                    rs.getBoolean(9), // flag_feature
                    rs.getInt(10),
                    rs.getString(11), // full_name
                    rs.getString(12)
            );
            Map<String, Object> details = new HashMap<>();
            details.put("post", blog);
            details.put("full_name", rs.getString("full_name"));
            details.put("name", rs.getString("name"));
            postDetails.put(id, details);
            id++;
         }
      } catch (SQLException ex) {
         ex.printStackTrace();
      }
      return postDetails;
   }

   public LinkedHashMap<Integer, Map<String, Object>> getPostByCategoryId(int cid) {
      LinkedHashMap<Integer, Map<String, Object>> postDetails = new LinkedHashMap<>();
      String query = "SELECT b.*, u.full_name, p.name\n"
              + "FROM blogs_posts b\n"
              + "INNER JOIN postcategories p ON p.id = b.PostCategories_id\n"
              + "INNER JOIN user u ON b.User_id = u.id\n"
              + "WHERE p.id = ?\n"
              + "ORDER BY b.ID ASC;";

      try {
         PreparedStatement ps = conn.prepareStatement(query);
         ps.setInt(1, cid);
         ResultSet rs = ps.executeQuery();
         int id = 1;
         while (rs.next()) {
            BlogPost blog = new BlogPost(rs.getInt("id"), // id
                    rs.getString(2), // title
                    rs.getString(3), // brief_info
                    rs.getString(4), // thumbnail
                    rs.getString(5), // details
                    rs.getDate(6), // updatedDate
                    rs.getInt(7), // PostCategories_id
                    rs.getInt(8), // User_id
                    rs.getBoolean(9), // flag_feature
                    rs.getInt(10),
                    rs.getString(11), // full_name
                    rs.getString(12)
            );
            Map<String, Object> details = new HashMap<>();
            details.put("post", blog);
            details.put("full_name", rs.getString("full_name"));
            details.put("name", rs.getString("name"));
            postDetails.put(id, details);
            id++;
         }
      } catch (SQLException ex) {
         ex.printStackTrace();
      }
      return postDetails;
   }

   public LinkedHashMap<Integer, Map<String, Object>> getPostByUserId(int bId) {
      LinkedHashMap<Integer, Map<String, Object>> postDetails = new LinkedHashMap<>();
      String query = "SELECT b.*, u.full_name, p.name\n"
              + "FROM blogs_posts b\n"
              + "INNER JOIN postcategories p ON p.id = b.PostCategories_id\n"
              + "INNER JOIN user u ON b.User_id = u.id\n"
              + "WHERE u.id = ?\n"
              + "ORDER BY b.ID ASC;";

      try {
         PreparedStatement ps = conn.prepareStatement(query);
         ps.setInt(1, bid);
         ResultSet rs = ps.executeQuery();
         int id = 1;
         while (rs.next()) {
            BlogPost blog = new BlogPost(rs.getInt("id"), // id
                    rs.getString(2), // title
                    rs.getString(3), // brief_info
                    rs.getString(4), // thumbnail
                    rs.getString(5), // details
                    rs.getDate(6), // updatedDate
                    rs.getInt(7), // PostCategories_id
                    rs.getInt(8), // User_id
                    rs.getBoolean(9), // flag_feature
                    rs.getInt(10),
                    rs.getString(11), // full_name
                    rs.getString(12)
            );
            Map<String, Object> details = new HashMap<>();
            details.put("post", blog);
            details.put("full_name", rs.getString("full_name"));
            details.put("name", rs.getString("name"));
            postDetails.put(id, details);
            id++;
         }
      } catch (SQLException ex) {
         ex.printStackTrace();
      }
      return postDetails;
   }

   public LinkedHashMap<Integer, Map<String, Object>> getPostByStatus(int status) {
      LinkedHashMap<Integer, Map<String, Object>> postDetails = new LinkedHashMap<>();
      String query = "SELECT b.*, u.full_name, p.name\n"
              + "FROM blogs_posts b\n"
              + "INNER JOIN postcategories p ON p.id = b.PostCategories_id\n"
              + "INNER JOIN user u ON b.User_id = u.id\n"
              + "WHERE b.status = ?\n"
              + "ORDER BY b.ID ASC;";

      try {
         PreparedStatement ps = conn.prepareStatement(query);
         ps.setInt(1, status);
         ResultSet rs = ps.executeQuery();
         int id = 1;
         while (rs.next()) {
            BlogPost blog = new BlogPost(rs.getInt("id"), // id
                    rs.getString(2), // title
                    rs.getString(3), // brief_info
                    rs.getString(4), // thumbnail
                    rs.getString(5), // details
                    rs.getDate(6), // updatedDate
                    rs.getInt(7), // PostCategories_id
                    rs.getInt(8), // User_id
                    rs.getBoolean(9), // flag_feature
                    rs.getInt(10),
                    rs.getString(11), // full_name
                    rs.getString(12)
            );
            Map<String, Object> details = new HashMap<>();
            details.put("post", blog);
            details.put("full_name", rs.getString("full_name"));
            details.put("name", rs.getString("name"));
            postDetails.put(id, details);
            id++;
         }
      } catch (SQLException ex) {
         ex.printStackTrace();
      }
      return postDetails;
   }

   public int updatePostStatus(int productID, int i) {
      String query = "UPDATE mydb.blogs_posts SET status = ? WHERE id = ?";
      int n = 0;
      try {
         PreparedStatement ps = conn.prepareStatement(query);
         ps.setInt(1, status);
         ps.setInt(2, pid);
         n = ps.executeUpdate();
      } catch (SQLException ex) {
         ex.printStackTrace();
      }
      return n;
   }

   public Map<String, Object> getPostbyPostID(int postID) {
      throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
   }

   public int updatePost(BlogPost blogPost) {
      throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
   }

}
