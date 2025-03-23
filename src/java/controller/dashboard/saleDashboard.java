/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.dashboard;

import com.google.gson.Gson;
import dao.OrderSaleDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.sql.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import model.Order;
import model.User;

/**
 *
 * @author Asus
 */
@WebServlet(name = "saleDashboard", urlPatterns = {"/sale/saleDashboard"})
public class saleDashboard extends HttpServlet {

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
        HttpSession session = request.getSession();
        User userProfile = (User) session.getAttribute("user");

        String totalOrder = request.getParameter("totalOrder");
        String orderDone = request.getParameter("orderDone");
        OrderSaleDAO dao = new OrderSaleDAO();
        Map<Date, Integer> sumOrderChart = dao.getTotalOrdersLast7Days();
        Map<Date, Integer> succOrderChart = dao.getTotalSuccessfulOrdersLast7Days();
        List<Order> revenue7Days = dao.getRevenue7Days();
        Gson gson = new Gson();
        String sumOrderJson = gson.toJson(sumOrderChart);
        String succOrderJson = gson.toJson(succOrderChart);
        String revenueLast7Days = gson.toJson(revenue7Days);
        HashMap<String, Integer> list = dao.getTopSelling();

        int sumOrder = dao.getTotalOrders(totalOrder);
        int succOrder = dao.getTotalOrdersSuccess(orderDone);
        session.setAttribute("user", userProfile);
        request.setAttribute("sumOrderChart", sumOrderJson);
        request.setAttribute("succOrderChart", succOrderJson);
        request.setAttribute("sumOrder", sumOrder);
        request.setAttribute("succOrder", succOrder);
        request.setAttribute("revenue7Days", revenueLast7Days);
        request.setAttribute("list", list);
        request.getRequestDispatcher("/saleDashboard.jsp").forward(request, response);
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
        //The range of time to view data
        OrderSaleDAO dao = new OrderSaleDAO();
        String toDate_raw = request.getParameter("toDate");
        String fromDate_raw = request.getParameter("fromDate");
        Map<Date, Integer> sumOrderChart;
        Map<Date, Integer> succOrderChart;
        List<Order> revenueInRange;
        if (toDate_raw == null || fromDate_raw == null || toDate_raw.equals("") || fromDate_raw.equals("")) {
            sumOrderChart = dao.getTotalSuccessfulOrdersLast7Days();
            succOrderChart = dao.getTotalSuccessfulOrdersLast7Days();
            revenueInRange = dao.getRevenue7Days();
        } else {
            sumOrderChart = dao.getTotalOrdersInRange(fromDate_raw, toDate_raw);
            succOrderChart = dao.getTotalOrdersSuccessInRange(fromDate_raw, toDate_raw);
            revenueInRange = dao.getRevenueInRange(fromDate_raw, toDate_raw);
        }
        request.setAttribute("fromDate", fromDate_raw);
        request.setAttribute("toDate", toDate_raw);
        int sumOrder = dao.getTotalOrders("");
        int succOrder = dao.getTotalOrdersSuccess("");
        // Querry mySQL with fromDate and toDate
        HashMap<String, Integer> list = dao.getTopSelling();
        Gson gson = new Gson();
        String sumOrderJson = gson.toJson(sumOrderChart);
        String succOrderJson = gson.toJson(succOrderChart);
        String revenueInRangeJson = gson.toJson(revenueInRange);
        request.setAttribute("sumOrder", sumOrder);
        request.setAttribute("succOrder", succOrder);
        request.setAttribute("sumOrderChart", sumOrderJson);
        request.setAttribute("succOrderChart", succOrderJson);
        request.setAttribute("revenue7Days", revenueInRangeJson);
        request.setAttribute("list", list);
        request.getRequestDispatcher("/saleDashboard.jsp").forward(request, response);


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
