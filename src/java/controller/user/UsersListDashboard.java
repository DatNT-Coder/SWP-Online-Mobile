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
import java.util.List;
import model.User;

/**
 *
 * @author vuduc
 */
public class UsersListDashboard extends HttpServlet {

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

//        HttpSession session = request.getSession();
//        List<User> data = get.findAll();
//
//        session.setAttribute(CommonConst.SESSION_LIST_USER, data);
        String sortField = request.getParameter("sortField");
        String sortOrder = request.getParameter("sortOrder");
        if (sortField == null || sortField.isEmpty()) {
            sortField = "id";
        }
        if (sortOrder == null || sortOrder.isEmpty()) {
            sortOrder = "asc";
        }

        int currentPage = 1;
        //limit (là câu lệnh trong db để lấy bản ghi trong giới hạn)
        int limit = 15;
        if (request.getParameter("page") != null) {
            currentPage = Integer.parseInt(request.getParameter("page"));
        }
        int totalUser = get.findAll().size();
        // Math.ceil làm tròn lên VD 4.3 -> 5
        // chia lấy phần nguyên (/) nếu 2 số đều là int thì sẽ chỉ lấy phần nguyên k lấy thập phân nếu là double thì thập phân sẽ lấy cả
        int totalPage = (int) Math.ceil((double) totalUser / limit);
        // offset (là câu lệnh trong db để bỏ qua bản ghi)
        int offset = (currentPage - 1) * limit;

        HttpSession session = request.getSession();
        List<User> listUserBySearch = (List<User>) session.getAttribute("listUser");
        
        
        if (listUserBySearch == null) { // Nếu không có dữ liệu từ tìm kiếm, lấy danh sách từ DB
            List<User> listUserByPage = get.getUserByPage(offset, limit, sortField, sortOrder);
            request.getSession().setAttribute(CommonConst.SESSION_LIST_USER, listUserByPage);
        } 

        request.setAttribute("currentPage", currentPage);
        request.setAttribute("totalPage", totalPage);
        request.setAttribute("sortField", sortField);
        request.setAttribute("sortOrder", sortOrder);

        request.getRequestDispatcher("/userslist.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String url;

        String action = request.getParameter("action") != null
                ? request.getParameter("action")
                : "";

        switch (action) {
            case "search":
                url = searchDoPost(request, response);
                break;
            default:
                url = "error";
        }

        if (url.equals("error")) {
            response.sendRedirect("udashboard");
        }
        response.sendRedirect("udashboard");
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

    private String searchDoPost(HttpServletRequest request, HttpServletResponse response) {
        String kw = request.getParameter("keyword");
        String url = "";
        List<User> u = get.findAll();
        // Kiểm tra xem biến kw có tồn tại không && kiểm tra sau khi loại bỏ khoảng trắng, chuỗi có còn nội dung hay không
        if (kw != null && !kw.trim().isEmpty()) {
            u = get.searchUserInfo(kw);
            if (!u.isEmpty()) {
                request.getSession().setAttribute(CommonConst.SESSION_LIST_USER, u);
                url = "udashboard";
            } else {
                request.getSession().setAttribute("er", "No results found for: " + kw);
                url = "/userslist.jsp";
            }
        }
        return url;
    }
}
