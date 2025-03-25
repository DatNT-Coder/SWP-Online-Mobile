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

public class UsersListServlet extends HttpServlet {

    AccountDAO get = new AccountDAO();

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
        int limit = 8;
        if (request.getParameter("page") != null) {
            currentPage = Integer.parseInt(request.getParameter("page"));
        }
        int offset = (currentPage - 1) * limit;

        // Lấy keyword từ request và luôn lưu vào session
        String kw = request.getParameter("keyword");
        session.setAttribute("kw", kw); // Luôn cập nhật kw vào session, kể cả khi null

        String isFiltering = request.getParameter("isFiltering");
        String filterType = request.getParameter("filterType");
        String filterValue = request.getParameter("filterValue");

        List<User> listUserBySearch = new ArrayList<>();
        List<User> listUserByPage = new ArrayList<>();
        List<User> listUserByFilter = new ArrayList<>();

        int totalUser = 0;
        int totalPage = 0;

        if (kw != null && !kw.trim().isEmpty()) {
            listUserBySearch = get.searchUserInfoPerPage(kw, sortField, sortOrder, offset, limit);
            totalUser = get.searchAllUserInfo(kw).size();
            totalPage = (int) Math.ceil((double) totalUser / limit);
            if (listUserBySearch.isEmpty()) {
                request.setAttribute("er", "No results found for: " + kw);
            } 
        } else if (isFiltering != null && "true".equals(isFiltering)) {
            listUserByFilter = get.userFilter(filterType, filterValue, offset, limit, sortField, sortOrder);
            totalUser = get.userFilterAll(filterType, filterValue).size();
            totalPage = (int) Math.ceil((double) totalUser / limit);
            session.setAttribute("filterValue", filterValue);
            session.setAttribute("filterType", filterType);
        } else {
            listUserByPage = get.getUserByPage(offset, limit, sortField, sortOrder);
            totalUser = get.findAll().size();
            totalPage = (int) Math.ceil((double) totalUser / limit);
        }

        // Lưu tất cả các thuộc tính vào session
        session.setAttribute("isFiltering", isFiltering);
        session.setAttribute("listUserBySearch", listUserBySearch);
        session.setAttribute("listUserByPage", listUserByPage);
        session.setAttribute("listUserByFilter", listUserByFilter);
        session.setAttribute("currentPage", currentPage);
        session.setAttribute("totalPage", totalPage);
        session.setAttribute("sortField", sortField);
        session.setAttribute("sortOrder", sortOrder);

        request.getRequestDispatcher("/userslist.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession();
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

    private String addDoPost(HttpServletRequest request, HttpServletResponse response) {
        HttpSession session = request.getSession();

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
            session.setAttribute("erEmailExist", "Email is exist.");
        } else {
            get.insertUserToDBbyAdmin(au);
            EmailSender.sendEmail(au.getEmail(), "Your password", "Take this password to log in: " + pw);
        }
        return "/admin/userlist";
    }

    private String generatePW() {
        Random random = new Random();
        return String.format("%03d", random.nextInt(1000000));
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }
}
