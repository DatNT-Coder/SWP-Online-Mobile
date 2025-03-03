/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.blog;

import dao.BlogPostDAO;
import dao.PostCategoryDAO;
import dao.UserDAOMKT;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Vector;
import java.io.*;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;
import java.sql.Date;
import java.time.LocalDate;
import java.util.Map;
import model.BlogPost;
import model.PostCategory;
import model.User;

/**
 *
 * @author alexf
 */
@WebServlet(name = "managePostMarketing", urlPatterns = {"/marketing/managePostMarketing"})
@MultipartConfig
public class managePostMarketing extends HttpServlet {

   /**
    * Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
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
         HttpSession session = request.getSession();
         User userProfile = (User) session.getAttribute("user");
         int id = userProfile.getId();
         BlogPostDAO daoPost = new BlogPostDAO();
         PostCategoryDAO daoPostCategory = new PostCategoryDAO();
         UserDAOMKT daoUser = new UserDAOMKT();
         String message = request.getParameter("msg");
         if (message.equals("loadAddPost")) {
            Vector<PostCategory> listPC = daoPostCategory.getAllCategories();
            request.setAttribute("listPC", listPC);
            request.getRequestDispatcher("/Marketing_addPost.jsp").forward(request, response);
         }
         if (message.equals("addPost")) {
            String title = request.getParameter("title");
            String brief_info = request.getParameter("brief_info");
            int getPostCategories_id = Integer.parseInt(request.getParameter("category"));
            String details = request.getParameter("details");

            //Xử lý phần lấy ảnh
            Part filePart = request.getPart("productImage");// Lấy phần tệp từ yêu cầu
            String fileName = Paths.get(filePart.getSubmittedFileName()).getFileName().toString(); // Lấy tên tệp
            InputStream fileContent = filePart.getInputStream();// Lấy nội dung tệp
            try {
               // Lưu tệp vào máy chủ
               File uploads = new File("E:\\push\\group6_shopmobile\\web\\assets\\img\\blogImage");
               File file = new File(uploads, fileName);
               Files.copy(fileContent, file.toPath(), StandardCopyOption.REPLACE_EXISTING);
            } catch (IOException e) {
               e.printStackTrace();
            }
            try {
               // Thời gian chờ (được đặt bằng mili giây)
               Thread.sleep(1500);
            } catch (InterruptedException ex) {
               ex.printStackTrace();
            }
            //Lấy ngày cập nhật.
            Date updatedDate = Date.valueOf(LocalDate.now());
            //Bắt đầu lưu vào database
            //Tạm thời auto ẩn sản phẩm đi
         }
         if (message.equals("loadEditPost")) {
            int postId = Integer.parseInt(request.getParameter("pid"));
            BlogPost blog = daoPost.getPostbyID(postId);
            Vector<PostCategory> listC = daoPostCategory.getAllCategories();
            request.setAttribute("listPC", listC);

            request.setAttribute("post", blog);
            request.getRequestDispatcher("/Marketing_editPost.jsp").forward(request, response);
         }
         if (message.equals("editPost")) {
            int pid = Integer.parseInt(request.getParameter("pid"));
            //Xử lý nếu người dùng không cập nhật ảnh
            String oldImage = request.getParameter("oldImage");
            String title = request.getParameter("title");
            String brief_info = request.getParameter("brief_info");
            int getPostCategories_id = Integer.parseInt(request.getParameter("category"));
            String details = request.getParameter("details");

            //Xử lý phần lấy ảnh
            //Khác với thêm sản phẩm thì người dùng có thể đổi ảnh hoặc không.
            Part filePart = request.getPart("productImage"); // Lấy phần tệp từ yêu cầu
            String fileName = Paths.get(filePart.getSubmittedFileName()).getFileName().toString(); // Lấy tên tệp
            //Lấy ngày cập nhật.
            Date updatedDate = Date.valueOf(LocalDate.now());
            int isUpdated = 0;
            if (fileName == null || fileName.isEmpty()) {
               // Người dùng không tải lên tệp
               //Sửa sản phẩm
               isUpdated = daoPost.updatePost(new BlogPost(pid, title, brief_info, oldImage, details, updatedDate, getPostCategories_id, id, true, 0, " "));
            } else {
               // Người dùng đã tải lên tệp
               InputStream fileContent = filePart.getInputStream(); // Lấy nội dung tệp
               try {
                  // Lưu tệp vào máy chủ
                  File uploads = new File("D:\\group6_shopmobile\\web\\assets\\img\\blogImage");
                  File file = new File(uploads, fileName);
                  Files.copy(fileContent, file.toPath(), StandardCopyOption.REPLACE_EXISTING);
               } catch (IOException e) {
                  e.printStackTrace();
               }
               try {
                  // Thời gian chờ (được đặt bằng mili gây)i
                  Thread.sleep(1500);
               } catch (InterruptedException ex) {
                  ex.printStackTrace();
               }
               //Sửa sản phẩm
               isUpdated = daoPost.updatePost(new BlogPost(pid, title, brief_info, fileName, details, updatedDate, getPostCategories_id, id, true, 0, " "));
            }

            if (isUpdated > 0) {
               request.setAttribute("message", "<span style=\"color:green;\">Cập nhật bài đăng thành công!</span>");
               Map<String, Object> postDetail = daoPost.getPostbyPostID(pid);
               request.setAttribute("postDetails", postDetail);

               request.getRequestDispatcher("/Marketing_viewPost.jsp").forward(request, response);
            } else {
               request.setAttribute("message", "<span style=\"color:red;\">Cập nhật bài đăng không thành công!!!</span>");
               request.getRequestDispatcher("/Marketing_viewPost.jsp").forward(request, response);
            }
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
