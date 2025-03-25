/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import context.DBContext;
import java.sql.Connection;
import java.sql.Date;
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
import model.CartItem;
import model.Order;
import model.OrderDetail;
import model.User;

/**
 *
 * @author Asus
 */
public class OrderDAO {

   private final Connection connection; // Kết nối cơ sở dữ liệu

   public OrderDAO() {
      DBContext dbContext = new DBContext();
      this.connection = dbContext.getConnection(); // Lấy kết nối từ DBContext
   }

   public OrderDetail addOrderDetail(OrderDetail orderDetail) {
      String sql = "insert into orderdetails(Product_ID, Orders_ID, price, quantity)\n"
              + "values  (?, ?, ?, ?)";
      try (PreparedStatement ps = connection.prepareStatement(sql)) {
         ps.setInt(1, orderDetail.getProductId());
         ps.setInt(2, orderDetail.getOrderId());
         ps.setDouble(3, orderDetail.getPrice());
         ps.setDouble(4, orderDetail.getQuantity());
         int re = ps.executeUpdate();
         if (re > 0) {
            return orderDetail;
         }
      } catch (SQLException ex) {
         Logger.getLogger(OrderDAO.class.getName()).log(Level.SEVERE, null, ex);
      }
      return null;
   }

   public Order addOrder(Order order) {
      String sql = "insert into orders(User_id, order_date, total, status, address, phone, email, notes, saleID, settings_id)\n"
              + "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
      try (PreparedStatement ps = connection.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS)) {
         ps.setInt(1, order.getuId());
         ps.setDate(2, order.getDate());
         ps.setDouble(3, order.getTotalMoney());
         ps.setInt(4, order.getStatus());
         ps.setString(5, order.getAddress());
         ps.setString(6, order.getPhone());
         ps.setString(7, order.getEmail());
         ps.setString(8, order.getNote());
         ps.setInt(9, order.getSaleId());
         ps.setInt(10, order.getSettingId());
         int re = ps.executeUpdate();
         if (re > 0) {
            try (ResultSet generatedKeys = ps.getGeneratedKeys()) {
               if (generatedKeys.next()) {
                  int id = generatedKeys.getInt(1);
                  order.setId(id);
               }
            }
            return order;
         }

      } catch (SQLException ex) {
         Logger.getLogger(OrderDAO.class.getName()).log(Level.SEVERE, null, ex);
      }
      return null;
   }

   public User getCustomerById(int id) {

      try {
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
         Logger.getLogger(OrderDAO.class.getName()).log(Level.SEVERE, null, ex);
      }
      return null;
   }

   public ArrayList<Order> getAllUserOrder(int userId) {
      String sql = "select id, user_id, order_date, total, status, discount,\n"
              + " address, phone, email, notes, gender, saleid, settings_id from orders where User_id = ?";
      try (PreparedStatement ps = connection.prepareStatement(sql)) {
         ps.setInt(1, userId);
         try (ResultSet rs = ps.executeQuery()) {
            ArrayList<Order> orders = new ArrayList<>();
            while (rs.next()) {
               int id = rs.getInt("id");
               Date orderDate = rs.getDate("order_date");
               double total = rs.getDouble("total");
               int status = rs.getInt("status");
               String address = rs.getString("address");
               String phone = rs.getString("phone");
               String email = rs.getString("email");
               String note = rs.getString("notes");
               int settingId = rs.getInt("settings_id");
               Order order = new Order();
               order.setId(id);
               order.setDate(orderDate);
               order.setTotalMoney(total);
               order.setStatus(status);
               order.setAddress(address);
               order.setPhone(phone);
               order.setEmail(email);
               order.setNote(note);
               order.setSettingId(settingId);
               orders.add(order);
            }
            return orders;
         }
      } catch (SQLException ex) {
         Logger.getLogger(OrderDAO.class.getName()).log(Level.SEVERE, null, ex);
      }
      return null;
   }

   public Order getOrderById(int orderId) {
      String sql = "select id, user_id, order_date, total, status, discount,\n"
              + " address, phone, email, notes, gender, saleid, settings_id from orders where id = ?";
      try (PreparedStatement ps = connection.prepareStatement(sql)) {
         ps.setInt(1, orderId);
         try (ResultSet rs = ps.executeQuery()) {
            if (rs.next()) {
               int id = rs.getInt("id");
               Date orderDate = rs.getDate("order_date");
               double total = rs.getDouble("total");
               int status = rs.getInt("status");
               String address = rs.getString("address");
               String phone = rs.getString("phone");
               String email = rs.getString("email");
               String note = rs.getString("notes");
               int settingId = rs.getInt("settings_id");
               Order order = new Order();
               order.setId(id);
               order.setDate(orderDate);
               order.setTotalMoney(total);
               order.setStatus(status);
               order.setAddress(address);
               order.setPhone(phone);
               order.setEmail(email);
               order.setNote(note);
               order.setSettingId(settingId);
               return order;
            }
         }
      } catch (SQLException ex) {
         Logger.getLogger(OrderDAO.class.getName()).log(Level.SEVERE, null, ex);
      }
      return null;
   }

   public ArrayList<CartItem> getOrderDetailsAsCart(Integer orderId) {
      String sql = "select user_id, product_ID, quantity, p.status as status, price, name, image\n"
              + "from orders join orderdetails on orders.ID = orderdetails.Orders_ID and Orders_ID = ?\n"
              + "join mydb.product p on orderdetails.Product_ID = p.ID;";
      try (PreparedStatement ps = connection.prepareStatement(sql)) {
         ps.setInt(1, orderId);
         try (ResultSet rs = ps.executeQuery()) {
            ArrayList<CartItem> items = new ArrayList<>();
            while (rs.next()) {
               int userId = rs.getInt("user_id");
               int productId = rs.getInt("product_id");
               int quantity = rs.getInt("quantity");
               int status = rs.getInt("status");
               double price = rs.getDouble("price");
               double total = price * quantity;
               String name = rs.getString("name");
               String image = rs.getString("image");
               CartItem item = new CartItem(userId, productId, quantity, status);
               item.setPrice(price);
               item.setTotal(total);
               item.setName(name);
               item.setImage(image);
               items.add(item);
            }
            return items;
         }
      } catch (SQLException ex) {
         Logger.getLogger(OrderDAO.class.getName()).log(Level.SEVERE, null, ex);
      }
      return null;
   }

   public boolean checkUserHasPurchased(int userId, int productId) {
      String sql = "SELECT COUNT(*) FROM orders o "
              + "JOIN orderdetails od ON o.id = od.Orders_ID "
              + "WHERE o.user_id = ? AND od.Product_ID = ?";

      try (PreparedStatement ps = connection.prepareStatement(sql)) {
         ps.setInt(1, userId);
         ps.setInt(2, productId);
         ResultSet rs = ps.executeQuery();

         if (rs.next()) {
            return rs.getInt(1) > 0; // Trả về true nếu người dùng đã từng mua sản phẩm
         }
      } catch (SQLException e) {
         e.printStackTrace();
      }
      return false;
   }

   public int getTotalEarningsMonthly() {
      String query = "select sum(total) as total from orders where YEAR(order_date) = Year(curdate()) and Month(order_date) = Month(curdate())";
      try {
         PreparedStatement ps = connection.prepareStatement(query);
         ResultSet rs = ps.executeQuery();
         if (rs.next()) {
            return rs.getInt(1);
         }
      } catch (SQLException e) {
         System.out.println(e);
      }
      return 0;
   }

   public int getTotalEarningsAnnual() {
      String query = "select sum(total) as total from orders where YEAR(order_date) = Year(CURDATE())";
      try {
         PreparedStatement ps = connection.prepareStatement(query);
         ResultSet rs = ps.executeQuery();
         if (rs.next()) {
            return rs.getInt(1);
         }
      } catch (SQLException e) {
         System.out.println(e);
      }
      return 0;
   }

   public int getTotalUser() {
      String query = "Select COUNT(*) as total from User where status = 1";
      try {
         PreparedStatement ps = connection.prepareStatement(query);
         ResultSet rs = ps.executeQuery();
         if (rs.next()) {
            return rs.getInt(1);
         }
      } catch (SQLException e) {
         System.out.println(e);
      }
      return 0;
   }

   public int getTotalUserInLastWeek() {
      String query = "Select COUNT(*) as total from User where registration_date >= date_sub(now(),interval 7 day);";
      try {
         PreparedStatement ps = connection.prepareStatement(query);
         ResultSet rs = ps.executeQuery();
         if (rs.next()) {
            return rs.getInt(1);
         }
      } catch (SQLException e) {
         System.out.println(e);
      }
      return 0;
   }

   public int getTotalProducts() {
      String query = "Select count(*) as total from Product where status = 1";
      try {
         PreparedStatement ps = connection.prepareStatement(query);
         ResultSet rs = ps.executeQuery();
         if (rs.next()) {
            return rs.getInt(1);
         }
      } catch (SQLException e) {
         System.out.println(e);
      }
      return 0;
   }

   public HashMap<Integer, Integer> getEarningsByMonths() {
      HashMap<Integer, Integer> maps = new HashMap<>();
      String query = "WITH months AS (\n"
              + "    SELECT 1 AS month_num UNION ALL\n"
              + "    SELECT 2 UNION ALL\n"
              + "    SELECT 3 UNION ALL\n"
              + "    SELECT 4 UNION ALL\n"
              + "    SELECT 5 UNION ALL\n"
              + "    SELECT 6 UNION ALL\n"
              + "    SELECT 7 UNION ALL\n"
              + "    SELECT 8 UNION ALL\n"
              + "    SELECT 9 UNION ALL\n"
              + "    SELECT 10 UNION ALL\n"
              + "    SELECT 11 UNION ALL\n"
              + "    SELECT 12\n"
              + ")\n"
              + "SELECT \n"
              + "    m.month_num AS month,\n"
              + "    COALESCE(SUM(t.total), 0) AS total_amount\n"
              + "FROM \n"
              + "    months m\n"
              + "LEFT JOIN \n"
              + "    mydb.orders t ON MONTH(t.order_date) = m.month_num and Year(t.order_date) = year(CURDATE())\n"
              + "GROUP BY \n"
              + "    YEAR(t.order_date),\n"
              + "    m.month_num";
      try {
         PreparedStatement ps = connection.prepareStatement(query);
         ResultSet rs = ps.executeQuery();
         while (rs.next()) {
            maps.put(rs.getInt(1), rs.getInt(2));
         }
         return maps;
      } catch (SQLException e) {
         System.out.println(e);
      }
      return null;
   }

   public Map<String, Object> getInformationUser(int ID) {
      Map<String, Object> details = new HashMap<>();
      try {
         String sql = "SELECT user.full_name AS user_name, sales.full_name AS sales_name, orders.*\n"
                 + "                FROM orders\n"
                 + "                INNER JOIN user ON orders.User_id = user.id\n"
                 + "                INNER JOIN user AS sales ON orders.saleID = sales.id\n"
                 + "                WHERE orders.ID = ? ";
         PreparedStatement ps = connection.prepareStatement(sql);
         ps.setInt(1, ID);
         ResultSet rs = ps.executeQuery();
         if (rs.next()) {
            Order order = new Order(rs.getInt("ID"),
                    rs.getInt("User_id"),
                    rs.getDate("order_date"),
                    rs.getDouble("total"),
                    rs.getInt("status"),
                    rs.getDouble("discount"),
                    rs.getString("address"),
                    rs.getString("phone"),
                    rs.getString("email"),
                    rs.getString("notes"),
                    rs.getString("gender"),
                    rs.getInt("saleID"),
                    rs.getInt("settings_id"));
            details.put("order", order);
            details.put("customerName", rs.getString("user_name"));
            details.put("saleName", rs.getString("sales_name"));

         }
      } catch (Exception e) {
         System.out.println(e.getMessage());
      }
      return details;
   }

   public LinkedHashMap<Integer, Map<String, Object>> getOrderDetails(String orderId) {
      LinkedHashMap<Integer, Map<String, Object>> orderDetail = new LinkedHashMap<>();
      String query = "SELECT\n"
              + "    o.ID AS order_id,\n"
              + "    p.name AS product_name,p.salePrice\n"
              + "    ,pc.categoryName AS product_category,\n"
              + "    od.quantity,\n"
              + "    (od.quantity * p.salePrice) AS total_price\n"
              + "FROM\n"
              + "    orders o\n"
              + "JOIN\n"
              + "    orderdetails od ON o.ID = od.Orders_ID\n"
              + "JOIN\n"
              + "    product p ON od.Product_ID = p.ID\n"
              + "JOIN\n"
              + "    productcategory pc ON p.ProductCategory_ID = pc.ID\n"
              + "    where o.ID = ? ;";

      try {
         PreparedStatement ps = connection.prepareStatement(query);
         ps.setString(1, orderId);
         ResultSet rs = ps.executeQuery();
         int id = 1;
         while (rs.next()) {
            Map<String, Object> details = new HashMap<>();
            details.put("order_id", rs.getInt("order_id"));
            details.put("product_name", rs.getString("product_name"));
            details.put("product_category", rs.getString("product_category"));
            details.put("salePrice", rs.getDouble("salePrice"));
            details.put("quantity", rs.getInt("quantity"));
            details.put("total_price", rs.getDouble("total_price"));
//              
            orderDetail.put(id, details);
            id++;
         }
      } catch (SQLException ex) {
         ex.printStackTrace();
      }
      return orderDetail;

   }

   public static void main(String[] args) {
      // Tạo đối tượng DAO để truy vấn dữ liệu
      OrderDAO userDAO = new OrderDAO();
//
//      // ID của khách hàng cần tìm (thay đổi tùy vào dữ liệu có trong DB)
//      int customerId = 1;
//
//      // Gọi phương thức để tìm khách hàng
//      User user = userDAO.getCustomerById(customerId);
//
//      // Kiểm tra kết quả và hiển thị
//      if (user != null) {
//         System.out.println("User found:");
//         System.out.println("ID: " + user.getId());
//         System.out.println("Email: " + user.getEmail());
//         System.out.println("Full Name: " + user.getFull_name());
//         System.out.println("Phone: " + user.getPhone());
//         System.out.println("Gender: " + user.getGender());
//         System.out.println("Registration Date: " + user.getRegistration_date());
//         System.out.println("Status: " + user.getStatus());
//         System.out.println("Updated By: " + user.getUpdatedBy());
//         System.out.println("Updated Date: " + user.getUpdatedDate());
//         System.out.println("Image: " + user.getImage());
//         System.out.println("Settings ID: " + user.getSettings_id());
//      } else {
//         System.out.println("User not found with ID: " + customerId);
//      }
      List<Order> a = userDAO.getAllOrders();
      System.out.println(a.get(0).getUserName());

   }

   public ArrayList<Order> getAllOrders() {
      String sql = "SELECT o.id, o.user_id, u.full_name AS user_name, o.order_date, o.total, o.status, o.discount, "
              + "o.address, o.phone, o.email, o.notes, o.gender, s.full_name AS sale_name, o.saleid, o.settings_id "
              + "FROM orders o "
              + "JOIN user u ON o.user_id = u.id "
              + "JOIN user s ON o.saleid = s.id";

      ArrayList<Order> orders = new ArrayList<>();

      try (PreparedStatement ps = connection.prepareStatement(sql); ResultSet rs = ps.executeQuery()) {

         while (rs.next()) {
            Order order = new Order();
            order.setId(rs.getInt("id"));
            order.setuId(rs.getInt("user_id"));
            order.setDate(rs.getDate("order_date"));
            order.setTotalMoney(rs.getDouble("total"));
            order.setStatus(rs.getInt("status"));
            order.setDiscount(rs.getDouble("discount"));
            order.setAddress(rs.getString("address"));
            order.setPhone(rs.getString("phone"));
            order.setEmail(rs.getString("email"));
            order.setNote(rs.getString("notes"));
            order.setGender(rs.getString("gender"));
            order.setSaleId(rs.getInt("saleid"));
            order.setSettingId(rs.getInt("settings_id"));
            order.setUserName(rs.getString("user_name"));  // Fetch customer name
            order.setSaleName(rs.getString("sale_name"));  // Fetch salesperson name

            orders.add(order);
         }
      } catch (SQLException ex) {
         Logger.getLogger(OrderDAO.class.getName()).log(Level.SEVERE, null, ex);
      }

      return orders;
   }

   public ArrayList<Order> getOrdersBySaleId(int saleId) {
      String sql = "SELECT id, user_id, order_date, total, status, discount, "
              + "address, phone, email, notes, gender, saleid, settings_id FROM orders WHERE saleid = ?";

      ArrayList<Order> orders = new ArrayList<>();

      try (PreparedStatement ps = connection.prepareStatement(sql)) {
         ps.setInt(1, saleId);
         try (ResultSet rs = ps.executeQuery()) {
            while (rs.next()) {
               Order order = new Order();
               order.setId(rs.getInt("id"));
               order.setuId(rs.getInt("user_id"));
               order.setDate(rs.getDate("order_date"));
               order.setTotalMoney(rs.getDouble("total"));
               order.setStatus(rs.getInt("status"));
               order.setDiscount(rs.getDouble("discount"));
               order.setAddress(rs.getString("address"));
               order.setPhone(rs.getString("phone"));
               order.setEmail(rs.getString("email"));
               order.setNote(rs.getString("notes"));
               order.setGender(rs.getString("gender"));
               order.setSaleId(rs.getInt("saleid"));
               order.setSettingId(rs.getInt("settings_id"));

               orders.add(order);
            }
         }
      } catch (SQLException ex) {
         Logger.getLogger(OrderDAO.class.getName()).log(Level.SEVERE, null, ex);
      }

      return orders;
   }

   public ArrayList<Order> getFilteredOrders(String searchType, String searchValue, String sortBy, 
                                          String fromDate, String toDate, Integer saleId, Integer status) {
    StringBuilder sql = new StringBuilder("SELECT o.id, o.user_id, u.full_name AS username, o.order_date, "
            + "o.total, o.status, o.discount, o.address, o.phone, o.email, o.notes, o.gender, "
            + "o.saleid, s.full_name AS salename, o.settings_id "
            + "FROM orders o "
            + "JOIN user u ON o.user_id = u.id "
            + "LEFT JOIN user s ON o.saleid = s.id "
            + "WHERE 1=1");

    // Danh sách tham số
    List<Object> params = new ArrayList<>();

    // Lọc theo searchType
    if (searchType != null && searchValue != null && !searchValue.isEmpty()) {
        if (searchType.equals("order_id")) {
            sql.append(" AND o.id = ?");
            params.add(Integer.parseInt(searchValue)); // Chuyển searchValue thành số nguyên
        } else if (searchType.equals("user_id")) {
            sql.append(" AND o.user_id = ?");
            params.add(Integer.parseInt(searchValue));
        }
    }

    // Lọc theo khoảng ngày
    if (fromDate != null && !fromDate.isEmpty()) {
        sql.append(" AND o.order_date >= ?");
        params.add(Date.valueOf(fromDate));
    }
    if (toDate != null && !toDate.isEmpty()) {
        sql.append(" AND o.order_date <= ?");
        params.add(Date.valueOf(toDate));
    }

    // Lọc theo saleId (nếu có)
    if (saleId != null) {
        sql.append(" AND o.saleid = ?");
        params.add(saleId);
    }

    // Lọc theo status (nếu có)
    if (status != null) {
        sql.append(" AND o.status = ?");
        params.add(status);
    }

    // Sắp xếp kết quả
    if (sortBy != null) {
        switch (sortBy) {
            case "order_date":
                sql.append(" ORDER BY o.order_date DESC");
                break;
            case "customer_id":
                sql.append(" ORDER BY o.user_id");
                break;
            case "total_cost":
                sql.append(" ORDER BY o.total DESC");
                break;
            case "status":
                sql.append(" ORDER BY o.status");
                break;
            default:
                sql.append(" ORDER BY o.order_date DESC"); // Sắp xếp mặc định
        }
    } else {
        sql.append(" ORDER BY o.order_date DESC"); // Sắp xếp mặc định nếu sortBy = null
    }

    ArrayList<Order> orders = new ArrayList<>();

    try (PreparedStatement ps = connection.prepareStatement(sql.toString())) {
        // Gán tham số vào PreparedStatement
        for (int i = 0; i < params.size(); i++) {
            ps.setObject(i + 1, params.get(i));
        }

        try (ResultSet rs = ps.executeQuery()) {
            while (rs.next()) {
                Order order = new Order();
                order.setId(rs.getInt("id"));
                order.setuId(rs.getInt("user_id"));
                order.setDate(rs.getDate("order_date"));
                order.setTotalMoney(rs.getDouble("total"));
                order.setStatus(rs.getInt("status"));
                order.setDiscount(rs.getDouble("discount"));
                order.setAddress(rs.getString("address"));
                order.setPhone(rs.getString("phone"));
                order.setEmail(rs.getString("email"));
                order.setNote(rs.getString("notes"));
                order.setGender(rs.getString("gender"));
                order.setSaleId(rs.getInt("saleid"));
                order.setSettingId(rs.getInt("settings_id"));
                
                // Gán thêm username và salename
                order.setUserName(rs.getString("username"));
                order.setSaleName(rs.getString("salename"));

                orders.add(order);
            }
        }
    } catch (SQLException ex) {
        Logger.getLogger(OrderDAO.class.getName()).log(Level.SEVERE, null, ex);
    }

    return orders;
}


}
