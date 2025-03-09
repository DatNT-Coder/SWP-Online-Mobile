/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.feedback;

import com.google.gson.Gson;
import dao.BrandDAO;
import dao.FeedbackDAO;
import dao.ProductCategoryDAO;
import dao.SliderDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.LinkedHashMap;
import java.util.Map;
import model.ProductFeedback;

/**
 *
 * @author tiend
 */
@WebServlet(name="listFeedbackMarketing", urlPatterns={"/marketing/listFeedbackMarketing"})
public class listFeedbackMarketing extends HttpServlet {
   
    /** 
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
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
            ProductFeedback daoFeedback = new ProductFeedback();
            FeedbackDAO dao = new FeedbackDAO();
            ProductCategoryDAO daoProductCategory = new ProductCategoryDAO();
            BrandDAO brandDAO = new BrandDAO();
            String message = request.getParameter("msg");
            if (message == null) {
                message = "loadpage";
            }
            if (message.equals("loadpage")) {
                LinkedHashMap<Integer, Map<String, Object>> listFeedback = dao.showFeedbackList("id","ASC");

                //Using JSON to pagination with client render
                Gson gson = new Gson();
                String listFeedbackGson = gson.toJson(listFeedback);
                //test pagination with JSON and Jquery here
                request.setAttribute("listFeedback", listFeedbackGson);
                request.getRequestDispatcher("/Marketing_FeedbackList.jsp").forward(request, response);
            }
            if (message.equals("sortFeedback")) {
                String sortBy = request.getParameter("sortBy");
                String order = request.getParameter("order");
                LinkedHashMap<Integer, Map<String, Object>> listFeedback = dao.showFeedbackList(sortBy,order);
                //Hôm nay là ngày mùng một đầu năm, những dòng dưới đấy là dòng code để mang lại sự 
                //may mắn cho cả người viết và người đọc nó. Khai code để cả năm code không bug, học đâu hiểu đấy
                //Chúc mừng năm mới!<3 2024 sẽ là bàn đạp cho 2k3 tiến về phía trước.
                //Using JSON to pagination with client render
                Gson gson = new Gson();
                String listFeedbackGson = gson.toJson(listFeedback);
                //test pagination with JSON and Jquery here
                request.setAttribute("listFeedback", listFeedbackGson);

                request.getRequestDispatcher("/Marketing_FeedbackList.jsp").forward(request, response);
            }
            if (message.equals("searchFeedback")) {
                String fSearch = request.getParameter("fSearch");
                LinkedHashMap<Integer, Map<String, Object>> listFeedback = dao.showFeedbackWithSearch(fSearch);
                Gson gson = new Gson();
                String listFeedbackGson = gson.toJson(listFeedback);
                //test pagination with JSON and Jquery here
                request.setAttribute("message", "Tìm thấy <span style=\"color:red;\">" + listFeedback.size() + "</span> feedback trùng khớp với \"<span style=\"color:red;\">" + fSearch + "</span>\"");
                request.setAttribute("listFeedback", listFeedbackGson);
                request.getRequestDispatcher("/Marketing_FeedbackList.jsp").forward(request, response);
            }
          
            if (message.equals("feedbackFilter")) {
                String value = request.getParameter("value");
                String selected = request.getParameter("selected");
                String listFeedbackGSon = "";
                if (selected.equals("status")) {
                    int status = Integer.parseInt(value);
                    LinkedHashMap<Integer, Map<String, Object>> listFeedback = dao.getFeedbackByStatus(status);
                    listFeedbackGSon = new Gson().toJson(listFeedback);
                }
                request.setAttribute("listFeedback", listFeedbackGSon);
                request.getRequestDispatcher("/Marketing_FeedbackList.jsp").forward(request, response);
            }
            if (message.equals("toggleStatus")) {
                int status = Integer.parseInt(request.getParameter("status"));
                int feedbackID = Integer.parseInt(request.getParameter("fid"));
                int isSuccess = 0;
                String msg = "";
                if (status == 0) {
                    isSuccess = dao.updateFeedbackStatus(feedbackID, 1);
                } else if (status != 0) {
                    isSuccess = dao.updateFeedbackStatus(feedbackID, 0);
                }
                if (isSuccess > 0) {
                    msg = "<span style=\"color:green;\">Cập nhật trạng thái feedback thành công \"" + dao.getFeedbackById(feedbackID).getFull_name()+ "\"</span>";
                } else {
                    msg = "<span style=\"color:red;\">Đã có lỗi xảy ra, không thể cập nhật</span>";
                }

                //Gọi lại load page
                LinkedHashMap<Integer, Map<String, Object>> listProduct = dao.showFeedbackList("id","ASC");

                //Using JSON to pagination with client render
                Gson gson = new Gson();
                String listProductGson = gson.toJson(listProduct);
                //test pagination with JSON and Jquery here
                request.setAttribute("listFeedback", listProductGson);
                request.setAttribute("message", msg);
                request.getRequestDispatcher("/Marketing_FeedbackList.jsp").forward(request, response);
            }
        }
    } 

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /** 
     * Handles the HTTP <code>GET</code> method.
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
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
