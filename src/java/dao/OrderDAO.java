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
        try ( PreparedStatement ps = connection.prepareStatement(sql)) {
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
        try ( PreparedStatement ps = connection.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS)) {
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
                try ( ResultSet generatedKeys = ps.getGeneratedKeys()) {
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
        try ( PreparedStatement ps = connection.prepareStatement(sql)) {
            ps.setInt(1, userId);
            try ( ResultSet rs = ps.executeQuery()) {
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
        try ( PreparedStatement ps = connection.prepareStatement(sql)) {
            ps.setInt(1, orderId);
            try ( ResultSet rs = ps.executeQuery()) {
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
        try ( PreparedStatement ps = connection.prepareStatement(sql)) {
            ps.setInt(1, orderId);
            try ( ResultSet rs = ps.executeQuery()) {
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

              
    public static void main(String[] args) {
        // Tạo đối tượng DAO để truy vấn dữ liệu
        OrderDAO userDAO = new OrderDAO();

        // ID của khách hàng cần tìm (thay đổi tùy vào dữ liệu có trong DB)
        int customerId = 1;

        // Gọi phương thức để tìm khách hàng
        User user = userDAO.getCustomerById(customerId);

        // Kiểm tra kết quả và hiển thị
        if (user != null) {
            System.out.println("User found:");
            System.out.println("ID: " + user.getId());
            System.out.println("Email: " + user.getEmail());
            System.out.println("Full Name: " + user.getFull_name());
            System.out.println("Phone: " + user.getPhone());
            System.out.println("Gender: " + user.getGender());
            System.out.println("Registration Date: " + user.getRegistration_date());
            System.out.println("Status: " + user.getStatus());
            System.out.println("Updated By: " + user.getUpdatedBy());
            System.out.println("Updated Date: " + user.getUpdatedDate());
            System.out.println("Image: " + user.getImage());
            System.out.println("Settings ID: " + user.getSettings_id());
        } else {
            System.out.println("User not found with ID: " + customerId);
        }
    }
    
//    public static void main(String[] args) {
//        OrderDAO orderDAO = new OrderDAO();
//        
//        // Giả sử bạn muốn kiểm tra user_id = 1 và product_id = 2
//        int userId = 50;
//        int productId = 2;
//
//        // Gọi phương thức kiểm tra
//        boolean hasPurchased = orderDAO.checkUserHasPurchased(userId, productId);
//
//        // In kết quả ra console
//        if (hasPurchased) {
//            System.out.println("Người dùng có ID = " + userId + " đã từng mua sản phẩm có ID = " + productId);
//        } else {
//            System.out.println("Người dùng có ID = " + userId + " chưa từng mua sản phẩm có ID = " + productId);
//        }
//    }
}



