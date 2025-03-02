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
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Order;
import model.OrderDetail;

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
    public static void main(String[] args) {
    OrderDAO orderDAO = new OrderDAO(); // Đảm bảo đã khởi tạo connection trong OrderDAO
    Order newOrder = new Order();
    
    // Thiết lập dữ liệu cho Order (Thay thế giá trị phù hợp với database của bạn)
    newOrder.setuId(1);
    newOrder.setDate(java.sql.Date.valueOf("2025-03-02"));
    newOrder.setTotalMoney(500.0);
    newOrder.setStatus(1);
    newOrder.setAddress("Hà Nội");
    newOrder.setPhone("0123456789");
    newOrder.setEmail("test@example.com");
    newOrder.setNote("Giao hàng nhanh");
    newOrder.setSaleId(1);
    newOrder.setSettingId(1);
    
    // Gọi addOrder
    Order addedOrder = orderDAO.addOrder(newOrder);
    
    if (addedOrder != null) {
        System.out.println("Thêm đơn hàng thành công! ID: " + addedOrder.getId());
    } else {
        System.out.println("Thêm đơn hàng thất bại!");
    }
}

}
