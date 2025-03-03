/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.blog;

import com.google.gson.Gson;
import dao.BlogPostDAO;
import dao.PostCategoryDAO;
import dao.UserDAOMKT;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.LinkedHashMap;
import java.util.Map;
import java.util.Vector;
import model.PostCategory;
import model.UserMKT;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author alexf
 */
@WebServlet(name = "listPostMarketing", urlPatterns = {"/marketing/listPostMarketing"})
public class listPostMarketing extends HttpServlet {

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
            BlogPostDAO daoPost = new BlogPostDAO();
            PostCategoryDAO daoPostCategory = new PostCategoryDAO();
            UserDAOMKT daoUser = new UserDAOMKT();
            String message = request.getParameter("msg");
            if (message == null) {
                message = "loadpage";
            }
            if (message.equals("loadpage")) {
                LinkedHashMap<Integer, Map<String, Object>> listPost = daoPost.showPostWithOrder("id", "ASC");

                //Using JSON to pagination with client render
                Gson gson = new Gson();
                String listPostGSon = gson.toJson(listPost);
                //test pagination with JSON and Jquery here
                request.setAttribute("listPost", listPostGSon);
                request.getRequestDispatcher("/Marketing_PostList.jsp").forward(request, response);
            }
            if (message.equals("sortPost")) {
                String sortBy = request.getParameter("sortBy");
                String order = request.getParameter("order");
                LinkedHashMap<Integer, Map<String, Object>> listPost = daoPost.showPostWithOrder(sortBy, order);
                //Hôm nay là ngày mùng một đầu năm, những dòng dưới đấy là dòng code để mang lại sự 
                //may mắn cho cả người viết và người đọc nó. Khai code để cả năm code không bug, học đâu hiểu đấy
                //Chúc mừng năm mới!<3 2024 sẽ là bàn đạp cho 2k3 tiến về phía trước.
                //Using JSON to pagination with client render
                Gson gson = new Gson();
                String listPostGSon = gson.toJson(listPost);
                //test pagination with JSON and Jquery here
                request.setAttribute("listPost", listPostGSon);
                request.setAttribute("message", "Sắp xếp slider theo \"" + sortBy + "\"");
                request.getRequestDispatcher("/Marketing_PostList.jsp").forward(request, response);
            }
            if (message.equals("searchPost")) {
                String pSearch = request.getParameter("pSearch");
                LinkedHashMap<Integer, Map<String, Object>> listPost = daoPost.showPostWithSearch(pSearch);
                Gson gson = new Gson();
                String listPostGSon = gson.toJson(listPost);
                //test pagination with JSON and Jquery here
                request.setAttribute("message", "Tìm thấy <span style=\"color:red;\">" + listPost.size() + "</span> bài đăng trùng khớp với \"<span style=\"color:red;\">" + pSearch + "</span>\"");
                request.setAttribute("listPost", listPostGSon);
                request.getRequestDispatcher("/Marketing_PostList.jsp").forward(request, response);
            }
            if (message.equals("selectFilter")) {
                String selected = request.getParameter("selected");
                String gson = "";

                if (selected.equals("name")) {
                    Vector<PostCategory> listPC = daoPostCategory.getAllCategories();
                    gson = new Gson().toJson(listPC);
                }
                if (selected.equals("full_name")) {
                    Vector<UserMKT> listBrand = daoUser.getAllUser();
                    gson = new Gson().toJson(listBrand);
                }
                // Gửi phản hồi về client
                response.setContentType("application/json");
                response.setCharacterEncoding("UTF-8");
                response.getWriter().write(gson);
            }
            if (message.equals("postFilter")) {
                String value = request.getParameter("value");
                String selected = request.getParameter("selected");
                String listPostGSon = "";
                if (selected.equals("name")) {
                    int cid = Integer.parseInt(value);
                    LinkedHashMap<Integer, Map<String, Object>> listPost = daoPost.getPostByCategoryId(cid);
                    listPostGSon = new Gson().toJson(listPost);
                }
                if (selected.equals("full_name")) {
                    int bId = Integer.parseInt(value);
                    LinkedHashMap<Integer, Map<String, Object>> listPost = daoPost.getPostByUserId(bId);
                    listPostGSon = new Gson().toJson(listPost);
                }
                if (selected.equals("status")) {
                    int status = Integer.parseInt(value);
                    LinkedHashMap<Integer, Map<String, Object>> listPost = daoPost.getPostByStatus(status);
                    listPostGSon = new Gson().toJson(listPost);
                }
                request.setAttribute("listPost", listPostGSon);
                request.getRequestDispatcher("/Marketing_PostList.jsp").forward(request, response);
            }
            if (message.equals("toggleStatus")) {
                int status = Integer.parseInt(request.getParameter("status"));
                int productID = Integer.parseInt(request.getParameter("pid"));
                int isSuccess = 0;
                String msg = "";
                if (status == 0) {
                    isSuccess = daoPost.updatePostStatus(productID, 1);
                } else if (status != 0) {
                    isSuccess = daoPost.updatePostStatus(productID, 0);
                }
                if (isSuccess > 0) {
                    msg = "<span style=\"color:green;\">Cập nhật trạng thái bài đăng thành công cho \"" + daoPost.getPostbyID(productID).getTitle() + "\"</span>";
                } else {
                    msg = "<span style=\"color:red;\">Đã có lỗi xảy ra, không thể cập nhật</span>";
                }

                //Gọi lại load page
                LinkedHashMap<Integer, Map<String, Object>> listPost = daoPost.showPostWithOrder("id", "ASC");

                //Using JSON to pagination with client render
                Gson gson = new Gson();
                String listPostGSon = gson.toJson(listPost);
                //test pagination with JSON and Jquery here
                request.setAttribute("listPost", listPostGSon);
                request.setAttribute("message", msg);
                request.getRequestDispatcher("/Marketing_PostList.jsp").forward(request, response);
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
