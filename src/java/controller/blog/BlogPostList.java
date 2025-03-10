/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controller.blog;

import dao.BlogPostDAO;
import dao.PostCategoryDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;
import java.io.File;
import java.util.ArrayList;
import java.sql.Date;
import java.util.Vector;
import model.BlogPost;
import model.PostCategory;
import model.User;

/**
 *
 * @author Asus
 */
    public class BlogPostList extends HttpServlet {
   
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
        try (PrintWriter out = response.getWriter()) {
            response.setContentType("text/html;charset=UTF-8");
            String pageIndex = request.getParameter("index");

            //Setup for first access productList
            if (pageIndex == null) {
                pageIndex = "1";
            }
            int index = Integer.parseInt(pageIndex);
            int postPerPage = 3;

            String keyword = request.getParameter("keyword");
            Vector<BlogPost> listPost;
            int blogCount;

            if (keyword != null && !keyword.isEmpty()) {
                BlogPostDAO blogdao = new BlogPostDAO();
                listPost = blogdao.searchBlogs(keyword);
                blogCount = listPost.size(); // Update count based on search results
            } else {
                //get total product for pagination
                BlogPostDAO blogdao = new BlogPostDAO();
                blogCount = blogdao.getPostListQuantity();
                //get Product for each Page
                listPost = blogdao.pagingPost(index, postPerPage);
            }

            int endPage = blogCount / postPerPage;
            if (blogCount % postPerPage != 0) {
                endPage++;
            }

            //khac
            BlogPostDAO blg = new BlogPostDAO();
            ArrayList<BlogPost> blpos = blg.BlogListHot();
            // category
            PostCategoryDAO postC = new PostCategoryDAO();
            ArrayList<PostCategory> listPC = postC.PostCategoryList();
            request.setAttribute("listPC", listPC);
            request.setAttribute("blpos", blpos);
            request.setAttribute("list", listPost);
            request.setAttribute("pageIndex", index);
            request.setAttribute("endPage", endPage);
            request.setAttribute("keyword", keyword);
            
            request.getRequestDispatcher("Blog.jsp").include(request, response);
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
        String postTitle = request.getParameter("postTitle");
        String postCategory = request.getParameter("postCategory");
        String postStatus = request.getParameter("postStatus");
        String postBrief = request.getParameter("postBrief");
        String postContent = request.getParameter("postContent");
        String postThumbnail = uploadFile(request);
        String featuredPost = request.getParameter("featuredPost");
        BlogPostDAO blogDAO = new BlogPostDAO();
        User user = (User) request.getSession().getAttribute("profileUser");
        try{
            BlogPost post = new BlogPost();
            post.setTitle(postTitle);
            post.setPostCategories_id(Integer.parseInt(postCategory));
            post.setStatus(Integer.parseInt(postStatus));
            post.setBrief_info(postBrief);
            post.setDetails(postContent);
            post.setThumbnail(postThumbnail);
            post.setFlag_feature(Boolean.parseBoolean(featuredPost));
            post.setUser_id(user.getId());
            post.setFull_name(user.getFull_name());
            long createdDate = System.currentTimeMillis();
            Date updatedDate = new Date(createdDate);
            post.setUpdatedDate(updatedDate);
            blogDAO.addPost(post);
            response.sendRedirect("blog-list");
        }
        catch(Exception e) {
            System.out.println(e.getMessage());
        }
        
    }

    /** 
     * Returns a short description of the servlet.
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }

    public String uploadFile(HttpServletRequest request) throws IOException, ServletException {
        String fileName = "";
        String uploadPath = getServletContext().getRealPath("") + File.separator + "images/blog";
        File uploadDir = new File(uploadPath);

        if (!uploadDir.exists()) {
            boolean created = uploadDir.mkdir();
        }

        for (Part part : request.getParts()) {
            fileName = getFileName(part);
            if (!fileName.isEmpty()) {
                part.write(uploadPath + File.separator + fileName);
                return fileName;
            }
        }
        return "";
    }

    private String getFileName(Part part) {
        String contentDisposition = part.getHeader("content-disposition");
        String[] tokens = contentDisposition.split(";");
        for (String token : tokens) {
            if (token.trim().startsWith("filename")) {
                return token.substring(token.indexOf("=") + 2, token.length() - 1);
            }
        }
        return "";
    }

}

