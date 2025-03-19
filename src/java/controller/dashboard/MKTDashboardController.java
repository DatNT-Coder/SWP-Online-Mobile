package controller.dashboard;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import model.Product;

@WebServlet("/marketing/MarketingDashboard")
public class MKTDashboardController extends HttpServlet {

   protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      // Fetch statistics from DAOs
      int totalUsers = UserDAO.getTotalUsers();
      int totalPosts = BlogPostDAO.getTotalPosts();
      double totalRevenue = OrderDAO.getTotalRevenue();
      int totalNewCustomers = UserDAO.getNewCustomers(); // You might pass date range for this
      int totalProducts = ProductDAO.getTotalProducts();
      Product mostOrderedProduct = ProductDAO.getMostOrderedProduct();
      Product mostFeedbackProduct = ProductDAO.getMostFeedbackProduct();

      // Set attributes for JSP page
      request.setAttribute("totalUsers", totalUsers);
      request.setAttribute("totalPosts", totalPosts);
      request.setAttribute("totalRevenue", totalRevenue);
      request.setAttribute("totalNewCustomers", totalNewCustomers);
      request.setAttribute("totalProducts", totalProducts);
      request.setAttribute("mostOrderedProduct", mostOrderedProduct);
      request.setAttribute("mostFeedbackProduct", mostFeedbackProduct);

      // Forward to JSP dashboard page
      RequestDispatcher dispatcher = request.getRequestDispatcher("/dashboard.jsp");
      dispatcher.forward(request, response);
   }
}
