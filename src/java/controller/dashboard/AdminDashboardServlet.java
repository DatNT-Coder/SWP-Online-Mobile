/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.dashboard;

import com.google.gson.Gson;
import dao.FeedbackDAO;
import dao.OrderDAO;
import dao.ProductDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.HashMap;
import java.util.List;
import java.util.stream.Collectors;
import model.Product;

/**
 *
 * @author tiend
 */
public class AdminDashboardServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try ( PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet AdminDashboardServlet</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet AdminDashboardServlet at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        OrderDAO orderDAO = new OrderDAO();
        ProductDAO productDAO = new ProductDAO();
        FeedbackDAO feedbackDAO = new FeedbackDAO();
        
        int totalEarningsMonthly = orderDAO.getTotalEarningsMonthly();
        int totalEarningsAnnual = orderDAO.getTotalEarningsAnnual();
        int totalUser = orderDAO.getTotalUser();
        int totalUsersInLastWeek = orderDAO.getTotalUserInLastWeek();
        int totalProducts = orderDAO.getTotalProducts();
        HashMap<Integer, Integer> earningsByMonths = orderDAO.getEarningsByMonths();
        
         // Lấy danh sách sản phẩm và số sao trung bình
        List<Product> productList = productDAO.getAllProduct();
        HashMap<Integer, Double> productRatings = new HashMap<>();
        for (Product product : productList) {
            double avgRating = feedbackDAO.getAverageRating(product.getID());
            productRatings.put(product.getID(), avgRating);
        }
    
        String months = earningsByMonths.keySet().toString();
        String values = earningsByMonths.values().toString();
        request.setAttribute("totalAnual", totalEarningsAnnual);
        request.setAttribute("totalMonth", totalEarningsMonthly);
        request.setAttribute("totalUser", totalUser);
        request.setAttribute("totalProducts", totalProducts);
        request.setAttribute("totalLW", totalUsersInLastWeek);
        request.setAttribute("months", months);
        request.setAttribute("values", values);
        
         // Chuyển đổi dữ liệu thành JSON String
        Gson gson = new Gson();
        String productListJson = gson.toJson(productList);
        String productRatingsJson = gson.toJson(productRatings);
    
        // Đặt danh sách sản phẩm và đánh giá vào request
        request.setAttribute("productList", productListJson);
        request.setAttribute("productRatings", productRatingsJson);
        
        request.getRequestDispatcher("/AdminDashBoard.jsp").forward(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
