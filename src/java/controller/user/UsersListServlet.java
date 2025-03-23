/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.user;

import constant.CommonConst;
import dao.AccountDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Random;
import model.User;

/**
 *
 * @author vuduc
 */
public class UsersListServlet extends HttpServlet {

    AccountDAO get = new AccountDAO();

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet UsersListDashboard</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet UsersListDashboard at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession();

        String sortField = request.getParameter("sortField");
        String sortOrder = request.getParameter("sortOrder");
        if (sortField == null || sortField.isEmpty()) {
            sortField = "id";
        }
        if (sortOrder == null || sortOrder.isEmpty()) {
            sortOrder = "asc";
        }

        int currentPage = 1;
        int limit = 5;
        if (request.getParameter("page") != null) {
            currentPage = Integer.parseInt(request.getParameter("page"));
        }
        int offset = (currentPage - 1) * limit;

        // Lấy từ khóa tìm kiếm từ request
        String kw = request.getParameter("keyword");

        List<User> listUserBySearch = new ArrayList<>();
        List<User> listUserByPage = new ArrayList<>();
        List<User> listUserByFilter = new ArrayList<>();

        int totalUser = 0;
        int totalPage = 0;

        String filterType;
        String filterValue;
        String isFiltering = request.getParameter("isFiltering");

        if (kw != null && !kw.trim().isEmpty()) {
            listUserBySearch = get.searchUserInfoPerPage(kw, sortField, sortOrder, offset, limit);
            totalUser = get.searchAllUserInfo(kw).size();
            totalPage = (int) Math.ceil((double) totalUser / limit);
            if (listUserBySearch.isEmpty()) {
                request.setAttribute("er", "No results found for: " + kw);
            }
        } else if (isFiltering != null) {
            filterType = request.getParameter("filterType");
            filterValue = request.getParameter("filterValue");
            request.setAttribute("filterValue", filterValue);
            request.setAttribute("filterType", filterType);
            listUserByFilter = get.userFilter(filterType, filterValue, offset, limit, sortField, sortOrder);
            totalUser = get.userFilterAll(filterType, filterValue).size();
            totalPage = (int) Math.ceil((double) totalUser / limit);
        } else {
            listUserByPage = get.getUserByPage(offset, limit, sortField, sortOrder);
            totalUser = get.findAll().size();
            totalPage = (int) Math.ceil((double) totalUser / limit);
        }

        request.setAttribute("isFiltering", isFiltering);
        request.setAttribute("kw", kw);
        request.setAttribute("listUserBySearch", listUserBySearch);
        request.setAttribute("listUserByPage", listUserByPage);
        request.setAttribute("listUserByFilter", listUserByFilter);
        request.setAttribute("currentPage", currentPage);
        request.setAttribute("totalPage", totalPage);
        request.setAttribute("sortField", sortField);
        request.setAttribute("sortOrder", sortOrder);

        request.getRequestDispatcher("/userslist.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String action = request.getParameter("action") != null
                ? request.getParameter("action")
                : "";

        String url;

        switch (action) {
            case "add":
                url = addDoPost(request, response);
                break;
            default:
                url = "/admin/userlist";
        }

        response.sendRedirect(request.getContextPath() + url);
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

    private String addDoPost(HttpServletRequest request, HttpServletResponse response) {

        //chưa lấy thông tin từ jsp
        String url;

        String name = request.getParameter("full_name");
        String gender = request.getParameter("gender");
        String email = request.getParameter("email");
        String phone = request.getParameter("mobile");
        String pw = generatePW();

        Date registrationDate = new Date(System.currentTimeMillis());
        int status = 1;
        int updatedBy = 0;
        Date updatedDate = null;
        String image = null;
        int settingsId = 1;

        User au = new User(email, pw, name, phone, gender, registrationDate, status, updatedBy, updatedDate, image, settingsId);
        boolean isExistUserEmail = get.checkUserEmailExist(au);

        if (isExistUserEmail) {
            request.setAttribute("erEmailExist", "Email is exist.");
        } else {
            get.insertUserToDBbyAdmin(au);
            EmailSender.sendEmail(au.getEmail(), "Your password", "Take this password to log in: " + pw);
        }
        return url = "/admin/userlist";
    }

    private String generatePW() {
        Random random = new Random();
        return String.format("%03d", random.nextInt(1000000));
    }

}
