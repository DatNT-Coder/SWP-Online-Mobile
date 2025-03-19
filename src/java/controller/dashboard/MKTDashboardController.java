package controller.dashboard;

import context.DBContext;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@WebServlet("/marketing/MarketingDashboard")
public class MKTDashboardController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        DBContext dbContext = new DBContext();
        try (Connection connection = dbContext.getConnection()) {
            // Fetch statistics
            int totalPosts = getTotalCount(connection, "BlogPost");
            int totalProducts = getTotalCount(connection, "Product");
            int totalCustomers = getTotalCount(connection, "User");
            int totalFeedbacks = getTotalCount(connection, "GeneralFeedback");

            // Fetch customer trend data
            String startDate = request.getParameter("startDate");
            String endDate = request.getParameter("endDate");
            if (startDate == null || endDate == null) {
                // Default to last 7 days
                startDate = "2023-10-01"; // Replace with dynamic date calculation
                endDate = "2023-10-07"; // Replace with dynamic date calculation
            }
            List<Map<String, Object>> customerTrend = getCustomerTrend(connection, startDate, endDate);

            // Set attributes for JSP
            request.setAttribute("totalPosts", totalPosts);
            request.setAttribute("totalProducts", totalProducts);
            request.setAttribute("totalCustomers", totalCustomers);
            request.setAttribute("totalFeedbacks", totalFeedbacks);
            request.setAttribute("customerTrend", customerTrend);

            // Forward to JSP
            request.getRequestDispatcher("/MarketingDashboard.jsp").forward(request, response);
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    private int getTotalCount(Connection connection, String tableName) throws SQLException {
        String query = "SELECT COUNT(*) AS total FROM " + tableName;
        try (PreparedStatement statement = connection.prepareStatement(query);
             ResultSet resultSet = statement.executeQuery()) {
            if (resultSet.next()) {
                return resultSet.getInt("total");
            }
        }
        return 0;
    }

    private List<Map<String, Object>> getCustomerTrend(Connection connection, String startDate, String endDate) throws SQLException {
        List<Map<String, Object>> trend = new ArrayList<>();
        String query = "SELECT DATE(created_at) AS date, COUNT(*) AS new_customers FROM customers WHERE created_at BETWEEN ? AND ? GROUP BY DATE(created_at) ORDER BY DATE(created_at)";
        try (PreparedStatement statement = connection.prepareStatement(query)) {
            statement.setString(1, startDate);
            statement.setString(2, endDate);
            try (ResultSet resultSet = statement.executeQuery()) {
                while (resultSet.next()) {
                    Map<String, Object> data = new HashMap<>();
                    data.put("date", resultSet.getString("date"));
                    data.put("new_customers", resultSet.getInt("new_customers"));
                    trend.add(data);
                }
            }
        }
        return trend;
    }
}