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
import java.util.ArrayList;
import java.util.Vector;
import model.BlogPost;
import model.PostCategory;

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
