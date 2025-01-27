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
import java.io.IOException;
import java.io.PrintWriter;
import model.User;

/**
 *
 * @author vuduc
 */
public class AuthenticationServlet extends HttpServlet {

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
            out.println("<title>Servlet AuthenticationServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet AuthenticationServlet at " + request.getContextPath() + "</h1>");
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

        String action = request.getParameter("action") != null
                ? request.getParameter("action")
                : "";

        String url;

        switch (action) {
            case "logout":
                url = logOutDoGet(request, response);
                break;
            default:
                url = "home.jsp";
        }

        request.getRequestDispatcher(url).forward(request, response);
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
        String url;
        String action = request.getParameter("action") != null ? request.getParameter("action") : "";
        switch (action) {
            case "login":
                url = logDoPost(request, response);
                break;
            case "regis":
                url = regDoPost(request, response);
                break;
            default:
                url = "home";
        }
        request.getRequestDispatcher(url).forward(request, response);
    }

    private String logDoPost(HttpServletRequest request, HttpServletResponse response) {
        AccountDAO d = new AccountDAO();
        String url = null;

        String email = request.getParameter("email");
        String password = request.getParameter("password");

        User u = new User(email, password);
        User foundUserAccount = d.findEmailPasswordUser(u);

        if (foundUserAccount != null) {
            request.getSession().setAttribute(CommonConst.SESSION_ACCOUNT, foundUserAccount);
            url = "home.jsp";
            //false => quay tro lai trang login ( set them thong bao loi )
        } else {
            request.setAttribute("error", "Email or Password is incorrect !");
            url = "login.jsp";
        }
        return url;
    }

    private String regDoPost(HttpServletRequest request, HttpServletResponse response) {
        
    }

    private String logOutDoGet(HttpServletRequest request, HttpServletResponse response) {
        request.getSession().removeAttribute(CommonConst.SESSION_ACCOUNT);
        return "home.jsp";
    }

}
