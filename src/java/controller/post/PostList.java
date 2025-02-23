/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.post;

import dao.BlogPostDAO;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import model.BlogPost;

/**
 *
 * @author naokh
 */
@WebServlet(name = "PostList", urlPatterns = {"/PostList"})
public class PostList extends HttpServlet {

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
         /* TODO output your page here. You may use following sample code. */
         out.println("<!DOCTYPE html>");
         out.println("<html>");
         out.println("<head>");
         out.println("<title>Servlet PostList</title>");
         out.println("</head>");
         out.println("<body>");
         out.println("<h1>Servlet PostList at " + request.getContextPath() + "</h1>");
         out.println("</body>");
         out.println("</html>");
      }
   }
   private BlogPostDAO blogPostDAO;

   @Override
   public void init() {
      blogPostDAO = new BlogPostDAO();
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
      BlogPostDAO blogPostDAO = new BlogPostDAO();
      List<BlogPost> posts = blogPostDAO.getAllPosts();

      // Debugging output
      System.out.println("Servlet: posts count = " + (posts == null ? "null" : posts.size()));

      if (posts == null) {
         posts = new ArrayList<>(); // Prevents NullPointerException
      }

      request.setAttribute("posts", posts);
      System.out.println("Servlet: posts attribute set in request with size = " + posts.size());

      RequestDispatcher dispatcher = request.getRequestDispatcher("PostList.jsp");
      dispatcher.forward(request, response);
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
   protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      String action = request.getParameter("action");

      if ("add".equals(action)) {
         try {
            // Parsing required fields
            int Id = Integer.parseInt(request.getParameter("id")); // Ensure id is an integer
            String Title = request.getParameter("title");
            String briefInfo = request.getParameter("brief_info");
            String Thumbnail = request.getParameter("thumbnail");
            String Details = request.getParameter("details");

            // Fixing typo and parsing date
            String updatedDateStr = request.getParameter("updatedDate");
            Date updatedDate = null;
            if (updatedDateStr != null && !updatedDateStr.isEmpty()) {
               SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
               updatedDate = dateFormat.parse(updatedDateStr);
            }

            // Parsing integer fields
            int PostCategoriesId = Integer.parseInt(request.getParameter("PostCategories_id"));
            int UserId = Integer.parseInt(request.getParameter("User_id"));
            boolean flagFeature = Boolean.parseBoolean(request.getParameter("Flag_feature"));
            int Status = Integer.parseInt(request.getParameter("status"));
            String BlogsPostsCol = request.getParameter("Blogs_postcol");
            String FullName = request.getParameter("Full_name");

            // Creating new BlogPost object
            BlogPost newPost = new BlogPost(Id, Title, briefInfo, Thumbnail, Details, (java.sql.Date) updatedDate, PostCategoriesId, UserId, flagFeature, Status, BlogsPostsCol, FullName);

            // Add post to database
            blogPostDAO.addPost(newPost);
            response.sendRedirect("PostList");
         } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("error.jsp"); // Redirect to error page if exception occurs
         }
      } else if ("update".equals(action)) {
         try {
            int postId = Integer.parseInt(request.getParameter("post_id"));
            String title = request.getParameter("title");
            String briefInfo = request.getParameter("brief_info");
            String thumbnail = request.getParameter("thumbnail");
            String details = request.getParameter("details");

            blogPostDAO.updatePost(postId, title, briefInfo, thumbnail, details);
            response.sendRedirect("PostList");
         } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("error.jsp");
         }
      } else if ("hide".equals(action)) {
         try {
            int postId = Integer.parseInt(request.getParameter("post_id"));
            blogPostDAO.hidePost(postId);
            response.sendRedirect("PostList");
         } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("error.jsp");
         }
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
