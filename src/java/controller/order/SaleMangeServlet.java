/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.order;

import constant.CommonConst;
import dao.OrderDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import model.Order;
import model.User;

/**
 *
 * @author vuduc
 */
public class SaleMangeServlet extends HttpServlet {

     public OrderDAO orderDAO = new OrderDAO();
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
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet SaleMangeServlet</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet SaleMangeServlet at " + request.getContextPath() + "</h1>");
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
        String searchType = request.getParameter("searchType");
      String searchValue = request.getParameter("searchValue");
      String sortBy = request.getParameter("sortBy");
      String fromDate = request.getParameter("fromDate");
      String toDate = request.getParameter("toDate");
      String saleIdStr = request.getParameter("saleId");
      String statusStr = request.getParameter("status");

      // Convert saleId and status to Integer if provided
      Integer saleId = (saleIdStr != null && !saleIdStr.isEmpty()) ? Integer.parseInt(saleIdStr) : null;
      Integer status = (statusStr != null && !statusStr.isEmpty()) ? Integer.parseInt(statusStr) : null;

      // Get logged-in user
      User loggedInUser = (User) request.getSession().getAttribute(CommonConst.SESSION_ACCOUNT);
      if (loggedInUser == null) {
         response.sendRedirect("login.jsp");
         return;
      }

      // Only show orders assigned to the logged-in sale user
      if (loggedInUser.getRole_id() == 2) {
         saleId = loggedInUser.getId();
      }

      // Fetch orders based on filters
      ArrayList<Order> orders = orderDAO.getFilteredOrders(searchType, searchValue, sortBy, fromDate, toDate, saleId, status);

      // Set attributes and forward to JSP
      request.setAttribute("orders", orders);
      request.getRequestDispatcher("/SaleManagerDashboard.jsp").forward(request, response);
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
        doGet(request, response);
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
