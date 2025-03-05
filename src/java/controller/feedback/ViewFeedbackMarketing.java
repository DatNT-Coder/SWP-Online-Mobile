/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.feedback;

import com.google.gson.Gson;
import dao.BlogPostDAO;
import dao.FeedbackDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.LinkedHashMap;
import java.util.Map;

/**
 *
 * @author tiend
 */
@WebServlet(name = "viewFeedbackMarketing", urlPatterns = {"/marketing/viewFeedbackMarketing"})
public class ViewFeedbackMarketing extends HttpServlet {

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
            String message = request.getParameter("msg");
            int feedID = Integer.parseInt(request.getParameter("pid"));
            if (message.equals("loadpage")) {

                /* TODO output your page here. You may use following sample code. */
                FeedbackDAO daoFeed = new FeedbackDAO();
                Map<String, Object> feedDetail = daoFeed.getFeedbackByID(feedID);
                request.setAttribute("feedDetails", feedDetail);
                request.getRequestDispatcher("/Marketing_viewFeedback.jsp").forward(request, response);
            }
            if (message.equals("toggleStatus")) {
                int status = Integer.parseInt(request.getParameter("status"));

                String msg = "";

                FeedbackDAO daoFeed = new FeedbackDAO();
                int isSuccess = 0;
                if (status == 0) {
                    isSuccess = daoFeed.updateImageStatus(feedID, 1);
                } else if (status != 0) { // Không cần kiểm tra status != 0, vì đã kiểm tra ở if (status == 0) rồi
                    isSuccess = daoFeed.updateImageStatus(feedID, 0);
                }
                if (isSuccess > 0) {
                    msg = "<span style=\"color:green;\">Cập nhật trạng thái ảnh thành công cho ID " + feedID + "</span>";
                } else {
                    msg = "<span style=\"color:red;\">Đã có lỗi xảy ra, không thể cập nhật trạng thái ảnh cho ID " + feedID + "</span>";
                }
              
                Map<String, Object> feedDetail = daoFeed.getFeedbackByID(feedID);
                request.setAttribute("feedDetails", feedDetail);
                request.setAttribute("message", msg);
                request.getRequestDispatcher("/Marketing_viewFeedback.jsp").forward(request, response);
            }

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
