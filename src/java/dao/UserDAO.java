/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import com.sun.jdi.connect.spi.Connection;
import context.DBContext;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.Vector;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Role;
import model.User;

/**
 *
 * @author tiend
 */
public class UserDAO extends context.DBContext {

   public User getUserByEmail(String email) {
      String xSql = "select * from mydb.user where email=?";
      try {
         this.connection = getConnection();

         PreparedStatement ps = connection.prepareStatement(xSql);
         ps.setString(1, email);
         ResultSet rs = ps.executeQuery();
         while (rs.next()) {
            User a = new User(rs.getInt("ID"),
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
            ps.close();
            rs.close();
            return a;
         }

      } catch (Exception e) {
         e.printStackTrace();
      }
      return null;
   }

   public String getUserFullName(String email, String password) {
      String fullName = null;
      DBContext dbContext = new DBContext();
      connection = dbContext.getConnection();  // Use DBContext to get the connection

      String sql = "SELECT full_name FROM User WHERE email = ? AND password = ?";

      try {
         statement = connection.prepareStatement(sql);
         statement.setObject(1, email);
         statement.setObject(2, password);

         resultSet = statement.executeQuery();
         if (resultSet.next()) {
            fullName = resultSet.getString("full_name");
            System.out.println("Retrieved full_name: " + fullName);  // Debugging line
         }
      } catch (SQLException e) {
         System.out.println("Error: " + e.getMessage());
      } finally {
         // Close resources after use
         try {
            if (resultSet != null) {
               resultSet.close();
            }
            if (statement != null) {
               statement.close();
            }
            if (connection != null) {
               connection.close();
            }
         } catch (SQLException e) {
            System.out.println("Error closing resources: " + e.getMessage());
         }
      }

      return fullName;
   }

   public User checkUser(String email, String pass) {

      String xSql = "select * from mydb.user where email=? AND password=?";
      try {
         this.connection = getConnection();
         PreparedStatement ps = connection.prepareStatement(xSql);
         ps.setString(1, email);
         ps.setString(2, pass);
         ResultSet rs = ps.executeQuery();
         while (rs.next()) {
            User a = new User(
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
            ps.close();
            rs.close();
            return a;
         }
         ps.close();
         rs.close();
      } catch (Exception e) {
         e.printStackTrace();
      }
      return null;
   }

   public int addUser(String email, String password, String full_name, String phone, String gender, Date registration_date, Date updatedDate) {
      String xSql = "insert into mydb.user(email, password, full_name, phone, gender, registration_date, status, updatedDate,settings_id) values (?, ?, ?, ?, ?, ?, 1, ?, 1)";
      int userID = 0;
      try {
         this.connection = getConnection();
         PreparedStatement ps = connection.prepareStatement(xSql, Statement.RETURN_GENERATED_KEYS);
         ps.setString(1, email);
         ps.setString(2, password);
         ps.setString(3, full_name);
         ps.setString(4, phone);
         ps.setString(5, gender);
         ps.setDate(6, registration_date);
         ps.setDate(7, updatedDate);
         ps.executeUpdate();
         try (ResultSet generatedKeys = ps.getGeneratedKeys()) {
            if (generatedKeys.next()) {
               userID = generatedKeys.getInt(1);
            } else {
               throw new SQLException("Tạo sản phẩm mới thất bại, không có ID nào được tạo.");
            }
         }
      } catch (Exception e) {
         e.printStackTrace();
      }
      return userID;
   }

   public boolean addUser_role(int userId, int role_id) {
      String xSql = "INSERT INTO mydb.user_role(user_id, role_id) VALUES (?, ?)";
      try {
         this.connection = getConnection();
         PreparedStatement ps = connection.prepareStatement(xSql);
         ps.setInt(1, userId);
         ps.setInt(2, role_id);
         ps.executeUpdate();
         ps.close();
         return true;
      } catch (Exception e) {
         e.printStackTrace();
      }
      return false;
   }

   public boolean updateUser(String email, String newpass) {
      String xSql = "update mydb.user set password=? where email=?";
      try {
         this.connection = getConnection();
         PreparedStatement ps = connection.prepareStatement(xSql);
         ps.setString(1, newpass);
         ps.setString(2, email);
         ps.executeUpdate();
         ps.close();
         return true;
      } catch (SQLException e) {
      }
      return false;
   }

   public int getSettingIDByEmail(String email, String password) {
      String xSql = "select settings_id from mydb.user where email=? AND password=?";
      try {
         this.connection = getConnection();
         PreparedStatement ps = connection.prepareStatement(xSql);
         ps.setString(1, email);
         ps.setString(2, password);
         ResultSet rs = ps.executeQuery();
         if (rs.next()) {
            int a = rs.getInt("settings_id");
            return a;
         }
      } catch (Exception e) {
         e.printStackTrace();
      }
      return 1;
   }

   public int getUserRole(int userId) {
      String sql = "SELECT Role_id FROM user_role WHERE User_id = ?";
      int n = -1;
      try {
         this.connection = getConnection();
         PreparedStatement ps = connection.prepareStatement(sql);
         ps.setInt(1, userId);
         ResultSet rs = ps.executeQuery();
         if (rs.next()) {
            n = rs.getInt("Role_id");
         }
      } catch (Exception e) {
         e.printStackTrace();
      }
      return n;
   }

   //dao for order list sale
   public ArrayList<User> getAllSaleUser() {
    ArrayList<User> list = new ArrayList<>();
      String xSql = "SELECT user.*\n"
              + "FROM user\n"
              + "INNER JOIN user_role ON user.id = user_role.User_id\n"
              + "WHERE user_role.Role_id = 2;";
      try {
         this.connection = getConnection();
         PreparedStatement ps = connection.prepareStatement(xSql);
         ResultSet rs = ps.executeQuery();
         while (rs.next()) {
            User a = new User(rs.getInt("id"),
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
            list.add(a);
         }

      } catch (Exception e) {
         e.printStackTrace();
      }
      return list;
   }

   public String getUserAddress(int userId) {
      String sql = "select * from useraddress where user_id = ?";
      try (PreparedStatement ps = connection.prepareStatement(sql)) {
         this.connection = getConnection();
         ps.setInt(1, userId);
         try (ResultSet rs = ps.executeQuery()) {
            if (rs.next()) {
               String address = rs.getString("user_address");
               return address;
            }
         }
      } catch (SQLException ex) {
         Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
      }
      return "";
   }

   public int countUsers() {
      int total = 0;
      try {
         this.connection = getConnection();
         String sql = "SELECT COUNT(*) AS count_users \n"
                 + "FROM mydb.user AS u\n"
                 + "INNER JOIN user_role AS ur ON u.id = ur.User_id\n"
                 + "WHERE  ur.role_id = 1;";
         PreparedStatement statement = connection.prepareStatement(sql);
         ResultSet rs = statement.executeQuery();
         if (rs.next()) {
            total = rs.getInt("count_users");
         }
      } catch (SQLException ex) {
         Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
      }
      return total;
   }

   public List<User> getNewlyUser() {
      List<User> users = new ArrayList<>();
      String sql = "SELECT * FROM user";
      try {
         this.connection = getConnection();
         PreparedStatement statement = connection.prepareStatement(sql);
         ResultSet rs = statement.executeQuery();
         while (rs.next()) {
            User a = new User(
                    rs.getInt("id"),
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
            users.add(a);
         }
      } catch (SQLException ex) {
         System.out.println(ex.toString());
      }
      return users;
   }

   public List<User> searchUsersByRegistrationDate(Date startDate, Date endDate) {
      List<User> users = new ArrayList<>();
      String sql = "SELECT * \n"
              + "FROM user AS u\n"
              + "INNER JOIN user_role AS ur ON u.id = ur.User_id\n"
              + "WHERE ur.role_id = 1\n"
              + "AND u.registration_date >= ? \n"
              + "AND u.registration_date <= ?;";
      try {
         this.connection = getConnection();
         PreparedStatement statement = connection.prepareStatement(sql);
         statement.setDate(1, new java.sql.Date(startDate.getTime()));
         statement.setDate(2, new java.sql.Date(endDate.getTime()));
         ResultSet rs = statement.executeQuery();
         while (rs.next()) {
            User user = new User(
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
                    rs.getInt("settings_id")
            );
            users.add(user);
         }
      } catch (SQLException ex) {
         System.out.println(ex.toString());
      }
      return users;
   }

   public boolean updateExpireTime(String email) {
      String xSql = "UPDATE `mydb`.`user`\n"
              + "SET\n"
              + "`expireTime` = DATE_ADD(curdate(),INTERVAL 10 MINUTE_SECOND)\n"
              + "WHERE `email` = ?";
      try {
         this.connection = getConnection();
         PreparedStatement ps = connection.prepareStatement(xSql);
         ps.setString(1, email);
         ps.executeUpdate();
         ps.close();
         return true;
      } catch (SQLException e) {
      }
      return false;
   }

   public Timestamp getExpireTime(String email) {
      String xSql = "select expireTime from user where email = ?";
      try {
         this.connection = getConnection();
         PreparedStatement ps = connection.prepareStatement(xSql);
         ps.setString(1, email);
         ResultSet rs = ps.executeQuery();
         return rs.getTimestamp(1);
      } catch (SQLException e) {
      }
      return null;
   }

   public LinkedHashMap<Integer, Map<String, Object>> showUserWithOrder(String sortBy, String order) {
      LinkedHashMap<Integer, Map<String, Object>> userDetails = new LinkedHashMap<>();
      String query = "SELECT u.*\n"
              + "FROM mydb.user u\n"
              + "INNER JOIN mydb.user_role ur ON u.id = ur.user_id\n"
              + "WHERE ur.role_id = 1\n" // Thêm một khoảng trắng ở đây
              + "ORDER BY " + sortBy + " " + order + ";";

      try {
         this.connection = getConnection();
         PreparedStatement ps = connection.prepareStatement(query);
         ResultSet rs = ps.executeQuery();
         int id = 1;
         while (rs.next()) {
            User user = new User(rs.getInt("id"),
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

            Map<String, Object> details = new HashMap<>();
            details.put("cus", user);
            userDetails.put(id, details);
            id++;
         }
      } catch (SQLException ex) {
         ex.printStackTrace();
      }
      return userDetails;
   }

   public LinkedHashMap<Integer, Map<String, Object>> showUserWithSearch(String uSearch) {
      LinkedHashMap<Integer, Map<String, Object>> userDetails = new LinkedHashMap<>();
      String query = "SELECT u.*\n"
              + "FROM mydb.user u\n"
              + "INNER JOIN mydb.user_role ur ON u.id = ur.user_id\n"
              + "WHERE ur.role_id = 1\n"
              + "AND (u.full_name LIKE CONCAT('%', ?, '%') \n"
              + "    OR u.email LIKE CONCAT('%', ?, '%') \n"
              + "    OR u.phone LIKE CONCAT('%', ?, '%'))\n"
              + "ORDER BY u.id ASC";

      try {
         this.connection = getConnection();
         PreparedStatement ps = connection.prepareStatement(query);
         ps.setString(1, uSearch);
         ps.setString(2, uSearch);
         ps.setString(3, uSearch);
         ResultSet rs = ps.executeQuery();
         int id = 1;
         while (rs.next()) {
            User user = new User(rs.getInt("id"),
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
            Map<String, Object> details = new HashMap<>();
            details.put("cus", user);

            userDetails.put(id, details);
            id++;
         }
      } catch (SQLException ex) {
         ex.printStackTrace();
      }
      return userDetails;
   }

   public LinkedHashMap<Integer, Map<String, Object>> getUsersByStatus(int status) {
      LinkedHashMap<Integer, Map<String, Object>> userDetails = new LinkedHashMap<>();
      String query = "SELECT u.*\n"
              + "FROM mydb.user u\n"
              + "INNER JOIN mydb.user_role ur ON u.id = ur.user_id\n"
              + "WHERE ur.role_id = 1\n"
              + "AND u.status = ?\n"
              + "ORDER BY u.id ASC;";

      try {
         this.connection = getConnection();
         PreparedStatement ps = connection.prepareStatement(query);
         ps.setInt(1, status);
         ResultSet rs = ps.executeQuery();
         int id = 1;
         while (rs.next()) {
            User user = new User(
                    rs.getInt("id"),
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

            Map<String, Object> details = new HashMap<>();
            details.put("cus", user);
            userDetails.put(id, details);
            id++;
         }
      } catch (SQLException ex) {
         ex.printStackTrace();
      }
      return userDetails;
   }

   public int updateUserStatus(int pid, int status) {
      String query = "UPDATE mydb.user u\n"
              + "INNER JOIN mydb.user_role ur ON u.id = ur.user_id\n"
              + "SET u.status = ?\n"
              + "WHERE ur.role_id = 1\n"
              + "AND u.id = ?";
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

   public User getUserByID(int id) {
      try {
         this.connection = getConnection();
         String query = "SELECT u.*\n"
                 + "FROM mydb.user u\n"
                 + "INNER JOIN mydb.user_role ur ON u.id = ur.user_id\n"
                 + "WHERE u.id = ? AND ur.role_id = 1;";
         PreparedStatement statement = connection.prepareStatement(query);
         statement.setInt(1, id);
         ResultSet rs = statement.executeQuery();
         if (rs.next()) {
            User user = new User(
                    rs.getInt("id"),
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

            return user;
         }
      } catch (SQLException ex) {
         Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
      }
      return null;
   }

   public Map<String, Object> getCustomerByID(int userId) {
      Map<String, Object> userDetails = new LinkedHashMap<>();
      String query = "SELECT u.*\n"
              + "FROM mydb.user u\n"
              + "INNER JOIN settings s ON s.id = u.settings_id\n"
              + "WHERE u.id = ?";

      try {
         this.connection = getConnection();
         PreparedStatement ps = connection.prepareStatement(query);
         ps.setInt(1, userId);
         ResultSet rs = ps.executeQuery();
         if (rs.next()) {
            User user = new User(
                    rs.getInt("id"),
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
                    rs.getInt("settings_id")
            );

            userDetails.put("cus", user);

         }
      } catch (SQLException ex) {
         ex.printStackTrace();
      }
      return userDetails;
   }

   public User getCustomerById(int id) {

      try {
         this.connection = getConnection();
         String sql = "select * from mydb.user where ID = ?";
         PreparedStatement statement = connection.prepareStatement(sql);
         statement.setInt(1, id);
         ResultSet rs = statement.executeQuery();
         if (rs.next()) {
            User user = new User(
                    rs.getInt("id"),
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

            return user;
         }
      } catch (SQLException ex) {
         Logger.getLogger(ProductDAO.class.getName()).log(Level.SEVERE, null, ex);
      }
      return null;
   }

   //UserList_admin
   public LinkedHashMap<Integer, Map<String, Object>> showUserList(String sortBy) {
      LinkedHashMap<Integer, Map<String, Object>> userDetails = new LinkedHashMap<>();
      String query = "SELECT u.*, r.role_name\n"
              + "FROM mydb.user u\n"
              + "INNER JOIN mydb.user_role ur ON u.id = ur.user_id\n"
              + "INNER JOIN mydb.role r ON ur.role_id = r.id\n"
              + "ORDER BY " + sortBy + " ASC;";

      try {
         this.connection = getConnection();
         PreparedStatement ps = connection.prepareStatement(query);
         ResultSet rs = ps.executeQuery();
         int id = 1;
         while (rs.next()) {
            User user = new User(rs.getInt("id"),
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

            Map<String, Object> details = new HashMap<>();
            details.put("cus", user);
            details.put("roleName", rs.getString("role_name"));
            userDetails.put(id, details);
            id++;
         }
      } catch (SQLException ex) {
         ex.printStackTrace();
      }
      return userDetails;
   }

   public LinkedHashMap<Integer, Map<String, Object>> showAllUserWithSearch(String uSearch) {
      LinkedHashMap<Integer, Map<String, Object>> userDetails = new LinkedHashMap<>();
      String query = "SELECT u.*, r.role_name\n"
              + "FROM mydb.user u\n"
              + "INNER JOIN mydb.user_role ur ON u.id = ur.user_id\n"
              + "INNER JOIN mydb.role r ON ur.role_id = r.id\n"
              + "AND (u.full_name LIKE CONCAT('%', ?, '%') \n"
              + "    OR u.email LIKE CONCAT('%', ?, '%') \n"
              + "    OR u.phone LIKE CONCAT('%', ?, '%'))\n"
              + "ORDER BY u.id ASC";

      try {
         this.connection = getConnection();
         PreparedStatement ps = connection.prepareStatement(query);
         ps.setString(1, uSearch);
         ps.setString(2, uSearch);
         ps.setString(3, uSearch);
         ResultSet rs = ps.executeQuery();
         int id = 1;
         while (rs.next()) {
            User user = new User(rs.getInt("id"),
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
            Map<String, Object> details = new HashMap<>();
            details.put("cus", user);
            details.put("roleName", rs.getString("role_name"));
            userDetails.put(id, details);
            id++;
         }
      } catch (SQLException ex) {
         ex.printStackTrace();
      }
      return userDetails;
   }

   public LinkedHashMap<Integer, Map<String, Object>> showAllUserWithOrder(String sortBy) {
      LinkedHashMap<Integer, Map<String, Object>> userDetails = new LinkedHashMap<>();
      String query = "SELECT u.*, r.role_name\n"
              + "FROM mydb.user u\n"
              + "INNER JOIN mydb.user_role ur ON u.id = ur.user_id\n"
              + "INNER JOIN mydb.role r ON ur.role_id = r.id\n"
              + "ORDER BY " + sortBy + " ASC;";

      try {
         this.connection = getConnection();
         PreparedStatement ps = connection.prepareStatement(query);
         ResultSet rs = ps.executeQuery();
         int id = 1;
         while (rs.next()) {
            User user = new User(rs.getInt("id"),
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

            Map<String, Object> details = new HashMap<>();
            details.put("cus", user);
            details.put("roleName", rs.getString("role_name"));
            userDetails.put(id, details);
            id++;
         }
      } catch (SQLException ex) {
         ex.printStackTrace();
      }
      return userDetails;
   }

   public LinkedHashMap<Integer, Map<String, Object>> getAllUsersByStatus(int status) {
      LinkedHashMap<Integer, Map<String, Object>> userDetails = new LinkedHashMap<>();
      String query = "SELECT u.*, r.role_name\n"
              + "FROM mydb.user u\n"
              + "INNER JOIN mydb.user_role ur ON u.id = ur.user_id\n"
              + "INNER JOIN mydb.role r ON ur.role_id = r.id\n"
              + "AND u.status = ?\n"
              + "ORDER BY u.id ASC;";

      try {
         this.connection = getConnection();
         PreparedStatement ps = connection.prepareStatement(query);
         ps.setInt(1, status);
         ResultSet rs = ps.executeQuery();
         int id = 1;
         while (rs.next()) {
            User user = new User(
                    rs.getInt("id"),
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

            Map<String, Object> details = new HashMap<>();
            details.put("cus", user);
            details.put("roleName", rs.getString("role_name"));
            userDetails.put(id, details);
            id++;
         }
      } catch (SQLException ex) {
         ex.printStackTrace();
      }
      return userDetails;
   }

   public LinkedHashMap<Integer, Map<String, Object>> getAllUsersByGender(String gender) {
      LinkedHashMap<Integer, Map<String, Object>> userDetails = new LinkedHashMap<>();
      String query = "SELECT u.*, r.role_name\n"
              + "FROM mydb.user u\n"
              + "INNER JOIN mydb.user_role ur ON u.id = ur.user_id\n"
              + "INNER JOIN mydb.role r ON ur.role_id = r.id\n"
              + "AND u.gender = ?\n"
              + "ORDER BY u.id ASC";

      try {
         this.connection = getConnection();
         PreparedStatement ps = connection.prepareStatement(query);
         ps.setString(1, gender);
         ResultSet rs = ps.executeQuery();
         int id = 1;
         while (rs.next()) {
            User user = new User(
                    rs.getInt("id"),
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

            Map<String, Object> details = new HashMap<>();
            details.put("cus", user);
            details.put("roleName", rs.getString("role_name"));
            userDetails.put(id, details);
            id++;
         }
      } catch (SQLException ex) {
         ex.printStackTrace();
      }
      return userDetails;
   }

   public LinkedHashMap<Integer, Map<String, Object>> getAllUsersByRole(int role_name) {
      LinkedHashMap<Integer, Map<String, Object>> userDetails = new LinkedHashMap<>();
      String query = "SELECT u.*, r.role_name\n"
              + "FROM mydb.user u "
              + "INNER JOIN mydb.user_role ur ON u.id = ur.user_id "
              + "INNER JOIN mydb.role r ON ur.role_id = r.id\n"
              + "WHERE ur.role_id = ? "
              + "ORDER BY u.id ASC;";

      try {
         this.connection = getConnection();
         PreparedStatement ps = connection.prepareStatement(query);
         ps.setInt(1, role_name);
         ResultSet rs = ps.executeQuery();
         int id = 1;
         while (rs.next()) {
            User user = new User(
                    rs.getInt("id"),
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
                    rs.getInt("settings_id")
            );

            Map<String, Object> details = new HashMap<>();
            details.put("cus", user);
            details.put("roleName", rs.getString("role_name"));
            userDetails.put(id, details);
            id++;
         }
      } catch (SQLException ex) {
         ex.printStackTrace();
      }
      return userDetails;
   }

   public Vector<Role> getAllRole() {
      Vector<Role> list = new Vector<>();
      String query = "SELECT * FROM mydb.role;";
      try {
         this.connection = getConnection();
         PreparedStatement ps = connection.prepareStatement(query);
         ResultSet rs = ps.executeQuery();
         while (rs.next()) {
            list.add(new Role(rs.getInt("id"), rs.getString("role_name")));

         }
      } catch (Exception e) {
         System.out.println(e);
      }
      return list;
   }

   private String getRoleName(int role) {
      switch (role) {
         case 1:
            return "User";
         case 2:
            return "Sale";
         case 3:
            return "Sale Manager";
         case 4:
            return "Admin";
         case 5:
            return "Marketing";
         default:
            throw new AssertionError();
      }
   }

   //End userlist_admin
   public Map<String, Object> getUserById(int id) {
      Map<String, Object> details = new HashMap<>();

      try {
         this.connection = getConnection();
         String sql = "SELECT u.*, r.role_name "
                 + "FROM mydb.user u "
                 + "INNER JOIN mydb.user_role ur ON u.id = ur.user_id "
                 + "INNER JOIN mydb.role r ON ur.role_id = r.id "
                 + "WHERE u.id = ?";
         PreparedStatement statement = connection.prepareStatement(sql);
         statement.setInt(1, id);
         ResultSet rs = statement.executeQuery();
         if (rs.next()) {
            User user = new User(
                    rs.getInt("id"),
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

            details.put("cus", user);
            details.put("roleName", rs.getString("role_name"));

         }
      } catch (SQLException ex) {
         Logger.getLogger(ProductDAO.class.getName()).log(Level.SEVERE, null, ex);
      }
      return details;
   }

   public Map<String, Object> UpdateUser(int id) {
      Map<String, Object> details = new HashMap<>();

      try {
         this.connection = getConnection();
         String sql = "UPDATE mydb.user u "
                 + "INNER JOIN mydb.user_role ur ON u.id = ur.user_id "
                 + "INNER JOIN mydb.role r ON ur.role_id = r.id "
                 + "SET u.email = ?, u.password = ?, u.full_name = ?, u.phone = ?, u.gender = ?, u.registration_date = ?, u.status = ?, u.updatedBy = ?, u.updatedDate = ?, u.image = ?, u.settings_id = ?, r.role_name = ? "
                 + "WHERE u.id = ?";
         PreparedStatement statement = connection.prepareStatement(sql);
         statement.setInt(1, id);
         ResultSet rs = statement.executeQuery();
         if (rs.next()) {
            User user = new User(
                    rs.getInt("id"),
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

            details.put("cus", user);
            details.put("roleName", rs.getString("role_name"));

         }
      } catch (SQLException ex) {
         Logger.getLogger(ProductDAO.class.getName()).log(Level.SEVERE, null, ex);
      }
      return details;

   }

   public int updateStatusUser(int status, int id) {
      int n = 0;
      String xSql = "UPDATE mydb.user SET status = ? WHERE id = ?";
      try {
         this.connection = getConnection();
         PreparedStatement ps = connection.prepareStatement(xSql);
         ps.setInt(1, status);
         ps.setInt(2, id);
         n = ps.executeUpdate();
      } catch (Exception e) {
         e.printStackTrace();
      }
      return n;
   }

   public int updateRoleUser(int Role_id, int User_id) {
      int n = 0;
      String xSql = "UPDATE mydb.user_role set Role_id =? where User_id =?";
      try {
         this.connection = getConnection();
         PreparedStatement ps = connection.prepareStatement(xSql);
         ps.setInt(1, Role_id);
         ps.setInt(2, User_id);
         n = ps.executeUpdate();

      } catch (Exception e) {
         e.printStackTrace();
      }
      return n;
   }

   public int countUsersRegisteredBetween(Date startDate, Date endDate) {
      int count = 0;
      try {
         this.connection = getConnection();
         String sql = "SELECT COUNT(*) AS count_users \n"
                 + "FROM mydb.user AS u\n"
                 + "INNER JOIN user_role AS ur ON u.id = ur.User_id\n"
                 + "WHERE ur.role_id = 1 \n"
                 + "AND u.registration_date >= ? \n"
                 + "AND u.registration_date < ?";

         PreparedStatement statement = connection.prepareStatement(sql);
         statement.setDate(1, startDate);
         statement.setDate(2, endDate);

         ResultSet rs = statement.executeQuery();
         if (rs.next()) {
            count = rs.getInt("count_users");
         }
      } catch (SQLException ex) {
         Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
      } finally {
         // Close connection if your DBContext doesn't handle it automatically
         try {
            if (connection != null) {
               connection.close();
            }
         } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
         }
      }
      return count;
   }

   public static void main(String[] args) {
      // Thay đổi các giá trị này theo cấu hình của bạn
      int userIdToRetrieve = 3; // ID của người dùng bạn muốn lấy thông tin

      // Tạo một đối tượng DAO để sử dụng
      UserDAO dao = new UserDAO(); // Thay DAOProduct bằng tên của lớp DAO của bạn

      int update = dao.updateStatusUser(0, 49);
      System.out.println(update);
   }

}
