/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.post;

import dao.BlogPostDAO;
import dao.PostCategoryDAO;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Vector;
import model.BlogPost;
import model.PostCategory;

@WebServlet(name = "PostList", urlPatterns = {"/PostList"})
public class PostList extends HttpServlet {

   private BlogPostDAO blogPostDAO;

   @Override
   public void init() {
      blogPostDAO = new BlogPostDAO();
   }

   @Override
   protected void doGet(HttpServletRequest request, HttpServletResponse response)
           throws ServletException, IOException {
      List<BlogPost> posts = blogPostDAO.getAllPosts();
      PostCategoryDAO categoryDAO = new PostCategoryDAO();
      Vector<PostCategory> categories = categoryDAO.getAllCategories(); // Fetch categories

      // Debugging output
      System.out.println("Categories Retrieved: " + (categories == null ? "null" : categories.size()));
      if (categories != null) {
         for (PostCategory category : categories) {
            System.out.println("Category ID: " + category.getId() + ", Name: " + category.getName());
         }
      }

      if (posts == null) {
         posts = new ArrayList<>();
      }

      request.setAttribute("categories", categories);
      request.setAttribute("posts", posts);
      RequestDispatcher dispatcher = request.getRequestDispatcher("Marketing_PostList.jsp");
      dispatcher.forward(request, response);
   }

   @Override
   protected void doPost(HttpServletRequest request, HttpServletResponse response)
           throws ServletException, IOException {
      String action = request.getParameter("action");

      System.out.println("Received POST request with action: " + action);

      if ("add".equals(action)) {
         try {
            // Parse the form data
            String title = request.getParameter("title");
            String briefInfo = request.getParameter("brief_info");
            String details = request.getParameter("details");

            System.out.println("Title: " + title);
            System.out.println("Brief Info: " + briefInfo);

            // Handle file upload for thumbnail
            Part thumbnailPart = request.getPart("thumbnail");
            String thumbnail = null;

            if (thumbnailPart != null && thumbnailPart.getSize() > 0) {
               String fileName = getFileName(thumbnailPart);
               thumbnail = "uploads/" + fileName;  // Change this to your upload folder
               thumbnailPart.write(thumbnail);
               System.out.println("Uploaded Thumbnail: " + thumbnail);
            } else {
               thumbnail = request.getParameter("thumbnailUrl");
               System.out.println("Thumbnail from URL: " + thumbnail);
            }

            // Handle date parsing
            String updatedDateStr = request.getParameter("updatedDate");
            Date updatedDate = null;

            if (updatedDateStr != null && !updatedDateStr.isEmpty()) {
               SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
               updatedDate = dateFormat.parse(updatedDateStr);
            }

            // Parse other form fields
            int postCategoriesId = Integer.parseInt(request.getParameter("PostCategories_id"));
            int userId = Integer.parseInt(request.getParameter("User_id"));
            boolean flagFeature = request.getParameter("Flag_feature") != null;
            int status = Integer.parseInt(request.getParameter("status"));
            String blogsPostsCol = request.getParameter("Blogs_postcol");
            String fullName = request.getParameter("Full_name");

            // Debugging output
            System.out.println("PostCategories_id: " + postCategoriesId);
            System.out.println("User_id: " + userId);
            System.out.println("Flag_feature: " + flagFeature);
            System.out.println("Status: " + status);

            // Create new BlogPost object
            BlogPost newPost = new BlogPost(0, title, briefInfo, thumbnail, details, (java.sql.Date) updatedDate,
                    postCategoriesId, userId, flagFeature, status, blogsPostsCol, fullName);

            // Add the new post to the database
            blogPostDAO.addPost(newPost);
            System.out.println("Post added successfully!");

            response.sendRedirect("PostList");
         } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("error.jsp");
         }
      }
   }

   private String getFileName(Part part) {
      for (String cd : part.getHeader("Content-Disposition").split(";")) {
         if (cd.trim().startsWith("filename")) {
            String fileName = cd.substring(cd.indexOf("=") + 2, cd.length() - 1);
            return fileName;
         }
      }
      return null;
   }

   @Override
   public String getServletInfo() {
      return "Servlet for managing blog posts";
   }
}
