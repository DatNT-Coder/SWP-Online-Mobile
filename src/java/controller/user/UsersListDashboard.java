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
        HttpSession session = request.getSession();
        List<User> listUser = get.findAll();

        session.setAttribute(CommonConst.SESSION_LIST_USER, listUser);

        int page = 1;
        int dataPerPage = 15;
        if (request.getParameter("page") != null) {
            page = Integer.parseInt(request.getParameter("page"));
        }

        int totalUser = get.findAll().size();
        int totalPage = (int) Math.ceil((double) totalUser / dataPerPage);
        int offset = (page - 1) * dataPerPage;

// đang làm.
//        List<User> listUserByPage = get.getUserByPage(offset, dataPerPage, sortField, sortOrder);
//
//        request.setAttribute("listUserByPage", listUserByPage);
//        request.setAttribute("currentPage", page);
//        request.setAttribute("totalPages", totalPages);
//        request.setAttribute("sortField", sortField);
//        request.setAttribute("sortOrder", sortOrder);
        
        request.getRequestDispatcher("userslist.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
