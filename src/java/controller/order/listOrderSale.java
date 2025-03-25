/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.order;

import com.sun.jdi.connect.spi.Connection;
import constant.CommonConst;
import context.DBContext;
import dao.OrderDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import model.Order;
import model.User;

/**
 *
 * @author naokh
 */
@WebServlet(name = "listOrderSale", urlPatterns = {"/listOrderSale"})
public class listOrderSale extends HttpServlet {

    public OrderDAO orderDAO = new OrderDAO();
    private static final int RECORDS_PER_PAGE = 3;

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
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
            out.println("<title>Servlet NewServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet NewServlet at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Get pagination parameter
        int page = request.getParameter("page") != null ? Integer.parseInt(request.getParameter("page")) : 1;

        // Get search parameters
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

        // Calculate offset for pagination
        int offset = (page - 1) * RECORDS_PER_PAGE;

        // Fetch orders based on filters with pagination
        ArrayList<Order> orders = orderDAO.getFilteredOrdersWithPagination(
                searchType, searchValue, sortBy, fromDate, toDate, 
                saleId, status, offset, RECORDS_PER_PAGE);

        // Get total count of orders (for pagination)
        int totalOrders = orderDAO.getTotalFilteredOrdersCount(
                searchType, searchValue, fromDate, toDate, saleId, status);

        // Calculate total pages
        int totalPages = (int) Math.ceil((double) totalOrders / RECORDS_PER_PAGE);

        // Set attributes and forward to JSP
        request.setAttribute("currentSort", sortBy);
        request.setAttribute("orders", orders);
        request.setAttribute("totalOrders", totalOrders);
        request.setAttribute("currentPage", page);
        request.setAttribute("totalPages", totalPages);
        request.getRequestDispatcher("Sale_orderList.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }
}