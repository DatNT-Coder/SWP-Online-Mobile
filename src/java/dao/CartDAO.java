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
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import java.util.stream.Collectors;
import model.CartItem;

/**
 *
 * @author Asus
 */
public class CartDAO extends DBContext {
      private final Connection connection; // Kết nối cơ sở dữ liệu

    public CartDAO() {
        DBContext dbContext = new DBContext();
        this.connection = dbContext.getConnection(); // Lấy kết nối từ DBContext
    }
 public CartItem addCartItem(CartItem item) {
    String checkSql = "SELECT quantity FROM cart_item WHERE user_id = ? AND product_ID = ?";
    String updateSql = "UPDATE cart_item SET quantity = quantity + 1 WHERE user_id = ? AND product_ID = ?";
    String insertSql = "INSERT INTO cart_item (user_id, product_ID, quantity, status) VALUES (?, ?, ?, ?)";

    try (PreparedStatement checkStmt = connection.prepareStatement(checkSql)) {
        checkStmt.setInt(1, item.getUserId());
        checkStmt.setInt(2, item.getProductId());

        ResultSet rs = checkStmt.executeQuery();
        if (rs.next()) {
            // Nếu sản phẩm đã có trong giỏ hàng, tăng số lượng lên 1
            try (PreparedStatement updateStmt = connection.prepareStatement(updateSql)) {
                updateStmt.setInt(1, item.getUserId());
                updateStmt.setInt(2, item.getProductId());
                int re = updateStmt.executeUpdate();
                if (re > 0) {
                    item.setQuantity(rs.getInt("quantity") + 1); // Cập nhật số lượng mới
                    return item;
                }
            }
        } else {
            // Nếu sản phẩm chưa có trong giỏ hàng, thêm mới
            try (PreparedStatement insertStmt = connection.prepareStatement(insertSql)) {
                insertStmt.setInt(1, item.getUserId());
                insertStmt.setInt(2, item.getProductId());
                insertStmt.setInt(3, item.getQuantity());
                insertStmt.setInt(4, item.getStatus());
                int re = insertStmt.executeUpdate();
                if (re > 0) {
                    return item;
                }
            }
        }
    } catch (SQLException ex) {
        Logger.getLogger(CartDAO.class.getName()).log(Level.SEVERE, null, ex);
    }
    return null;
}
    public CartItem updateCartItem(CartItem item) {
        String sql = "update cart_item set quantity = ?, status = ? where user_id = ? and product_ID = ?;";
        try ( PreparedStatement ps = connection.prepareStatement(sql)) {
            ps.setInt(1, item.getQuantity());
            ps.setInt(2, item.getStatus());
            ps.setInt(3, item.getUserId());
            ps.setInt(4, item.getProductId());
            int re = ps.executeUpdate();
            if (re > 0) {
                return item;
            }
        } catch (SQLException ex) {
            Logger.getLogger(CartDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public boolean deleteCartItem(int userId, int productId) {
    String sql = "DELETE FROM cart_item WHERE user_id = ? AND product_id = ?";
    try (PreparedStatement ps = connection.prepareStatement(sql)) {
        ps.setInt(1, userId);
        ps.setInt(2, productId);
        int result = ps.executeUpdate();
        return result > 0; // Trả về true nếu xóa thành công
    } catch (SQLException ex) {
        Logger.getLogger(CartDAO.class.getName()).log(Level.SEVERE, null, ex);
    }
    return false; // Trả về false nếu có lỗi xảy ra
}

    public CartItem deleteCartItem(CartItem item) {
        
        try   {
            
        String sql = "delete from cart_item where user_id = ? and product_ID = ?;";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, item.getUserId());
            ps.setInt(2, item.getProductId());
            int re = ps.executeUpdate();
            if (re > 0) {
                return item;
            }
        } catch (SQLException ex) {
            Logger.getLogger(CartDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }
    
    public boolean deleteCart(int userId) {
        String sql = "delete from cart_item where user_id = ?;";
        try ( PreparedStatement ps = connection.prepareStatement(sql)) {
            ps.setInt(1, userId);
            int re = ps.executeUpdate();
            if (re > 0) {
                return true;
            }
        } catch (SQLException ex) {
            Logger.getLogger(CartDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }

    public ArrayList<CartItem> getUserCart(Integer userId) {
        String sql = "select user_id, product_ID, quantity, c.status as status,\n"
                + "       ifnull(p.salePrice, p.originalPrice) as price, p.name as name, p.image as image\n"
                + "from cart_item c join mydb.product p on p.ID = c.product_ID and user_id = ?";
        try ( PreparedStatement ps = connection.prepareStatement(sql)) {
            ps.setInt(1, userId);
            try ( ResultSet rs = ps.executeQuery()) {
                ArrayList<CartItem> items = new ArrayList<>();
                while (rs.next()) {
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
            Logger.getLogger(CartDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }
    
    public CartItem getCartItem(Integer userId, Integer productId) {
        String sql = "select user_id, product_ID, quantity, c.status as status,\n"
                + "       ifnull(p.salePrice, p.originalPrice) as price, p.name as name, p.image as image\n"
                + "from cart_item c join mydb.product p on p.ID = c.product_ID and c.product_ID = ? and user_id = ?";
        try ( PreparedStatement ps = connection.prepareStatement(sql)) {
            ps.setInt(1, productId);
            ps.setInt(2, userId);
            try ( ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
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
                    return item;
                }
            }
        } catch (SQLException ex) {
            Logger.getLogger(CartDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }
    
    public CartItem stock(CartItem item) {
        
        try   {
            String sql2 = "update product set stock=stock-? where ID=?;";
            PreparedStatement ps2 = connection.prepareStatement(sql2);
            ps2.setInt(1, item.getQuantity());
            ps2.setInt(2, item.getProductId());
            
        
            int re = ps2.executeUpdate();
            if (re > 0) {
                return item;
            }
        } catch (SQLException ex) {
            Logger.getLogger(CartDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }
     public String getUserAddress(int userId) {
        String sql = "select * from useraddress where user_id = ?";
        try ( PreparedStatement ps = connection.prepareStatement(sql)) {
            ps.setInt(1, userId);
            try ( ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    String address = rs.getString("user_address");
                    return address;
                }
            }
        } catch (SQLException ex) {
            Logger.getLogger(CartDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return "";}
    public String getUserPhone(int userId) {
    String sql = "SELECT phone FROM User WHERE id = ?";
    try (PreparedStatement ps = connection.prepareStatement(sql)) {
        ps.setInt(1, userId);
        try (ResultSet rs = ps.executeQuery()) {
            if (rs.next()) {
                return rs.getString("phone");  // Lấy số điện thoại từ cột "phone"
            }
        }
    } catch (SQLException ex) {
        Logger.getLogger(CartDAO.class.getName()).log(Level.SEVERE, null, ex);
    }
    return "";
}
public ArrayList<CartItem> getSelectedCartItems(int userId, List<Integer> productIds) {
    if (productIds.isEmpty()) {
        return new ArrayList<>();
    }
    
    String sql = "SELECT user_id, product_ID, quantity, c.status, " +
                 "IFNULL(p.salePrice, p.originalPrice) AS price, p.name, p.image " +
                 "FROM cart_item c JOIN product p ON p.ID = c.product_ID " +
                 "WHERE user_id = ? AND product_ID IN (" + 
                 productIds.stream().map(id -> "?").collect(Collectors.joining(",")) + ")";
    
    try (PreparedStatement ps = connection.prepareStatement(sql)) {
        ps.setInt(1, userId);
        for (int i = 0; i < productIds.size(); i++) {
            ps.setInt(i + 2, productIds.get(i));
        }
        ResultSet rs = ps.executeQuery();
        ArrayList<CartItem> items = new ArrayList<>();
        while (rs.next()) {
            CartItem item = new CartItem(rs.getInt("user_id"), rs.getInt("product_ID"), rs.getInt("quantity"), rs.getInt("status"));
            item.setPrice(rs.getDouble("price"));
            item.setName(rs.getString("name"));
            item.setImage(rs.getString("image"));
            items.add(item);
        }
        return items;
    } catch (SQLException ex) {
        ex.printStackTrace();
    }
    return new ArrayList<>();
}


   public static void main(String[] args) {
        // 1. Khởi tạo CartDAO
        CartDAO cartDAO = new CartDAO();

        // 2. Tạo một CartItem mới
        CartItem item = new CartItem(3, 3, 2, 1); // user_id=1, product_id=101, quantity=2, status=1

        // 3. Thêm vào giỏ hàng
        CartItem addedItem = cartDAO.addCartItem(item);

        // 4. Kiểm tra kết quả
        if (addedItem != null) {
            System.out.println("🎉 Thêm sản phẩm thành công: " + addedItem);
        } else {
            System.out.println("❌ Thêm sản phẩm thất bại.");
        }
    }
}
