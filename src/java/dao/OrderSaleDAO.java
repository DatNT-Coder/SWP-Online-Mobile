/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import context.DBContext;
import java.sql.Connection;
import java.sql.Date;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import model.Order;

/**
 *
 * @author Asus
 */
public class OrderSaleDAO extends DBContext {
   private final Connection connection; // Kết nối cơ sở dữ liệu

   public OrderSaleDAO() {
      DBContext dbContext = new DBContext();
      this.connection = dbContext.getConnection(); // Lấy kết nối từ DBContext
   }
    public Integer getTotalOrders(String totalOrder) {
        try {
            String sql = "SELECT COUNT(*) \n"
                    + "		FROM mydb.orders\n"
                    + "			WHERE status = 1";
            statement = connection.prepareStatement(sql);

            resultSet = statement.executeQuery();
            if (resultSet.next()) {
                return resultSet.getInt(1);
            }
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return 0;
    }

    public Integer getTotalOrdersSuccess(String orderDone) {
        try {
            String sql = "SELECT COUNT(*) \n"
                    + "		FROM mydb.orders\n"
                    + "			WHERE status = 3";
            statement = connection.prepareStatement(sql);

            resultSet = statement.executeQuery();
            if (resultSet.next()) {
                return resultSet.getInt(1);
            }
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return 0;
    }

    public Map<Date, Integer> getTotalSuccessfulOrdersLast7Days() {
        Map<Date, Integer> result = new HashMap<>();
        try {
            String sql = "SELECT order_date, count(*) AS total_successful_orders "
                    + "FROM orders "
                    + "WHERE status = 3 "
                    + "AND order_date BETWEEN CURRENT_DATE - INTERVAL 6 DAY AND CURRENT_DATE "
                    + "GROUP BY order_date order by order_date";
            statement = connection.prepareStatement(sql);

            resultSet = statement.executeQuery();
            while (resultSet.next()) {
                Date orderDate = resultSet.getDate("order_date");
                Integer totalSuccessfulOrders = resultSet.getInt("total_successful_orders");
                result.put(orderDate, totalSuccessfulOrders);
            }
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return result;
    }

    public Map<Date, Integer> getTotalOrdersLast7Days() {
        Map<Date, Integer> result = new HashMap<>();
        try {
            String sql = "SELECT order_date, count(*) AS total_successful_orders "
                    + "FROM orders "
                    + "WHERE order_date BETWEEN CURRENT_DATE - INTERVAL 6 DAY AND CURRENT_DATE "
                    + "GROUP BY order_date order by order_date";
            statement = connection.prepareStatement(sql);

            resultSet = statement.executeQuery();
            while (resultSet.next()) {
                Date orderDate = resultSet.getDate("order_date");
                Integer totalSuccessfulOrders = resultSet.getInt("total_successful_orders");
                result.put(orderDate, totalSuccessfulOrders);
            }
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return result;
    }

//    public HashMap<String, Integer> getTopSelling() {
//        HashMap<String, Integer> products = new HashMap<>();
//        try {
//            String sql = "SELECT p.name, od.quantity\n"
//                    + "FROM mydb.orderdetails od\n"
//                    + "JOIN mydb.product p ON od.Product_ID = p.ID\n"
//                    + "ORDER BY od.quantity DESC\n"
//                    + "LIMIT 10;";
//
//            ps = conn.prepareStatement(sql);
//            rs = ps.executeQuery();
//            while (rs.next()) {
//                String name = rs.getString("name");
//                int quantity = rs.getInt("quantity");
//                products.put(name, quantity);
//            }
//            return products;
//        } catch (Exception e) {
//            System.out.println(e.getMessage());
//            return null;
//        }
//    }
    public HashMap<String, Integer> getTopSelling() {
        HashMap<String, Integer> products = new HashMap<>();
        try {
            String sql = "SELECT p.name, od.quantity\n"
                    + "FROM mydb.orderdetails od\n"
                    + "JOIN mydb.product p ON od.Product_ID = p.ID\n"
                    + "LIMIT 10;";

            statement = connection.prepareStatement(sql);
            resultSet = statement.executeQuery();
            while (resultSet.next()) {
                String name = resultSet.getString("name");
                int quantity = resultSet.getInt("quantity");
                products.put(name, quantity);
            }
            return products;
        } catch (Exception e) {
            System.out.println(e.getMessage());
            return null;
        }
    }

    public List<Order> getRevenue7Days() {
        try {
            String sql = "SELECT DATE(order_date) AS order_day, SUM(total) AS total_revenue\n"
                    + "FROM mydb.orders\n"
                    + "WHERE status = 3\n"
                    + "  AND order_date >= CURDATE() - INTERVAL 7 DAY\n"
                    + "GROUP BY order_day\n"
                    + "ORDER BY order_day ASC\n"
                    + "LIMIT 7;";

            statement = connection.prepareStatement(sql);
            resultSet = statement.executeQuery();
            List<Order> revenue7Days = new ArrayList<>();
            while (resultSet.next()) {
                Order revenues = new Order();
                revenues.setDate(resultSet.getDate("order_day"));
                revenues.setTotalMoney(resultSet.getDouble("total_revenue"));
                revenue7Days.add(revenues);
            }
            return revenue7Days;
        } catch (Exception e) {
            System.out.println(e.getMessage());
            return null;
        }
    }
//Danh cho loc theo ngay

    public Map<Date, Integer> getTotalOrdersInRange(String fromDate, String toDate) {
        Map<Date, Integer> result = new HashMap<>();
        try {
            String sql = "SELECT order_date, COUNT(*) AS total_orders "
                    + "FROM orders "
                    + "WHERE order_date BETWEEN ? AND ? "
                    + "GROUP BY order_date ORDER BY order_date";
            statement = connection.prepareStatement(sql);
            statement.setString(1, fromDate);
            statement.setString(2, toDate);

            resultSet = statement.executeQuery();
            while (resultSet.next()) {
                Date orderDate = resultSet.getDate("order_date");
                Integer totalOrders = resultSet.getInt("total_orders");
                result.put(orderDate, totalOrders);
            }
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return result;
    }

    public List<Order> getRevenueInRange(String fromDate, String toDate) {
        try {
            String sql = "SELECT DATE(order_date) AS order_day, SUM(total) AS total_revenue "
                    + "FROM mydb.orders "
                    + "WHERE status = 3 AND order_date BETWEEN '" + fromDate + "' AND '" + toDate + "' "
                    + "GROUP BY order_day ORDER BY order_day ASC";
            statement = connection.prepareStatement(sql);

            resultSet = statement.executeQuery();
            List<Order> revenueInRange = new ArrayList<>();
            while (resultSet.next()) {
                Order revenues = new Order();
                revenues.setDate(resultSet.getDate("order_day"));
                revenues.setTotalMoney(resultSet.getDouble("total_revenue"));
                revenueInRange.add(revenues);
            }
            return revenueInRange;
        } catch (Exception e) {
            System.out.println(e.getMessage());
            return null;
        }
    }

    public Map<Date, Integer> getTotalOrdersSuccessInRange(String fromDate, String toDate) {
        Map<Date, Integer> result = new HashMap<>();
        try {
            String sql = "SELECT order_date, COUNT(*) AS total_successful_orders "
                    + "FROM orders "
                    + "WHERE status = 3 AND order_date BETWEEN '" + fromDate + "' AND '" + toDate + "' "
                    + "GROUP BY order_date ORDER BY order_date";
            statement = connection.prepareStatement(sql);

            resultSet = statement.executeQuery();
            while (resultSet.next()) {
                Date orderDate = resultSet.getDate("order_date");
                Integer totalSuccessfulOrders = resultSet.getInt("total_successful_orders");
                result.put(orderDate, totalSuccessfulOrders);
            }
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return result;
    }
    public static void main(String[] args) {
        // Tạo một đối tượng của lớp chứa hàm getTotalOrdersInRange
        OrderSaleDAO obj = new OrderSaleDAO();

       

        // Gọi hàm getTotalOrdersInRange
        Map<Date, Integer> result = obj.getTotalOrdersSuccessInRange("2024-02-16","2025-02-22");

        // In kết quả
        for (Map.Entry<Date, Integer> entry : result.entrySet()) {
            System.out.println("Ngày: " + entry.getKey() + ", Tổng số đơn hàng: " + entry.getValue());
        }
    }

}
