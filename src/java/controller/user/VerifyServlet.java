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
import java.util.Map;
import model.User;
import static org.apache.coyote.http11.Constants.a;

/**
 *
 * @author vuduc
 */
public class VerifyServlet extends HttpServlet {

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
            out.println("<title>Servlet VerifyServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet VerifyServlet at " + request.getContextPath() + "</h1>");
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
        processRequest(request, response);
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
        
        String emailFromVerify = request.getParameter("e");
        String codeFromVerify = request.getParameter("vCode");

        VerificationCode storedCode = AuthenticationServlet.getVerificationCodes().get(emailFromVerify);
        boolean isCodeValid = storedCode != null && !storedCode.isExpired() && storedCode.getCode().equals(codeFromVerify.trim());

        if (isCodeValid) {

            AuthenticationServlet.getVerificationCodes().remove(emailFromVerify);

            AccountDAO dao = new AccountDAO();
            User u = (User) request.getSession().getAttribute("registerUser"); //request.getSession().getAttribute("registerUser") trả về kiểu object nên cần cast về kiểu User
            
            dao.insertUserToDB(u);
            
            request.getSession().setAttribute(CommonConst.SESSION_ACCOUNT, u);
            request.getRequestDispatcher("HomePage").forward(request, response);

        } else {
            // Gửi thông báo lỗi về trang trước hoặc trang lỗi
            request.setAttribute("errorMessage", "Mã xác nhận không hợp lệ hoặc đã hết hạn.");
            request.getRequestDispatcher("verify.jsp").forward(request, response);
        }

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
