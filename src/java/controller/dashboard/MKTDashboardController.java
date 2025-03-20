/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.dashboard;

import dao.BlogPostDAO;
import dao.ProductDAO;
import dao.FeedbackDAO;
import dao.UserDAO;
import dao.UserProfileDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.sql.Date;
import java.util.List;
import model.User;

/**
 *
 * @author ADMIN
 */
@WebServlet(name = "MKTDashboardController", urlPatterns = {"/marketing/MKTDashboardController"})
public class MKTDashboardController extends HttpServlet {

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
            out.println("<title>Servlet MKTDashboardController</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet MKTDashboardController at " + request.getContextPath() + "</h1>");
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
        response.setContentType("text/html;charset=UTF-8");
        UserProfileDAO userDAO = new UserProfileDAO();
        HttpSession session = request.getSession();
//        session.setAttribute("user", userDAO.getUserById("30"));
//       User userProfile = (User) session.getAttribute("user");
        User userProfile = (User) session.getAttribute("user");
        String toDate_raw = request.getParameter("toDate");
        String fromDate_raw = request.getParameter("fromDate");
        Date toDate;
        Date fromDate;
        if (toDate_raw == null || fromDate_raw == null) {
            toDate = new Date(System.currentTimeMillis());
            fromDate = new Date(toDate.getTime() - 7 * 24 * 60 * 60 * 1000);
        } else {
            toDate = Date.valueOf(toDate_raw);
            fromDate = Date.valueOf(fromDate_raw);
        }
        request.setAttribute("fromDate", fromDate.toString());
        request.setAttribute("toDate", toDate.toString());

        BlogPostDAO bDAO = new BlogPostDAO();
        ProductDAO pDAO = new ProductDAO();
        UserDAO uDAO = new UserDAO();
        List<User> newLyCustomers = uDAO.searchUsersByRegistrationDate(fromDate, toDate);
        FeedbackDAO gDAO = new FeedbackDAO();
        int totalP = bDAO.getTotalPosts();
        int totalPd = pDAO.countProduct();
        int totalU = uDAO.countUsers();
        int gDAOfeed = gDAO.countProductFeedback();

        request.setAttribute("newLyCustomers", newLyCustomers);
        request.setAttribute("totalP", totalP);
        request.setAttribute("totalPd", totalPd);
        request.setAttribute("totalU", totalU);
        request.setAttribute("gDAOfeed", gDAOfeed);
        request.setAttribute("userProfile", userProfile);
        request.getRequestDispatcher("/mktDashboard.jsp").forward(request, response);

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
