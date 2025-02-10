/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.customer;

import dao.CustomerDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.List;
import model.User;

/**
 *
 * @author admin
 */
public class CustomerListServlet extends HttpServlet {

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
            out.println("<title>Servlet CustomerListServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet CustomerListServlet at " + request.getContextPath() + "</h1>");
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

        CustomerDAO customerDAO = new CustomerDAO();

        String sortField = request.getParameter("sortField");
        String sortOrder = request.getParameter("sortOrder");

        if (sortField == null || sortField.isEmpty()) {
            sortField = "id";
        }
        if (sortOrder == null || sortOrder.isEmpty()) {
            sortOrder = "asc";
        }

        int page = 1;
        int recordsPerPage = 15;
        if (request.getParameter("page") != null) {
            page = Integer.parseInt(request.getParameter("page"));
        }

        int totalCustomers = customerDAO.getCustomerCount();
        int totalPages = (int) Math.ceil((double) totalCustomers / recordsPerPage);
        int offset = (page - 1) * recordsPerPage;

        List<User> customers = customerDAO.getCustomersByPage(offset, recordsPerPage, sortField, sortOrder);

        request.setAttribute("customers", customers);
        request.setAttribute("currentPage", page);
        request.setAttribute("totalPages", totalPages);
        request.setAttribute("sortField", sortField);
        request.setAttribute("sortOrder", sortOrder);

        request.getRequestDispatcher("CustomerList.jsp").forward(request, response);
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
        String keyword = request.getParameter("searchKeyword");
        String statusParam = request.getParameter("statusFilter");
        String page = request.getParameter("currentPage");
        String totalPages = request.getParameter("totalPages");

        String err = "";
        CustomerDAO dao = new CustomerDAO();

        List<User> customers = dao.getAllCustomers();

        if (keyword != null && !keyword.trim().isEmpty()) {
            List<User> searchResults = dao.searchCustomers(keyword);
            if (!searchResults.isEmpty()) {
                customers = searchResults;
            } else {
                err = "No results found for: " + keyword;
            }
        }

        if (statusParam != null && !statusParam.isEmpty()) {
            try {
                int status = Integer.parseInt(statusParam);
                List<User> filteredResults = dao.filterCustomersByStatus(status);
                if (!filteredResults.isEmpty()) {
                    customers = filteredResults;
                } else {
                    err = "No customers found for selected status.";
                }
            } catch (NumberFormatException e) {
                err = "Invalid status value.";
            }
        }
        
        
        
        request.setAttribute("currentPage", page);
        request.setAttribute("totalPages", totalPages);
        request.setAttribute("err", err);
        request.setAttribute("customers", customers);
        request.setAttribute("searchKeyword", keyword);
        request.setAttribute("statusFilter", statusParam);
        request.getRequestDispatcher("/CustomerList.jsp").forward(request, response);
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
