/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.user;

import dao.ProductCategoryDAO;
import dao.ProductCategoryDAO;
import dao.UserProfileDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;
import java.io.IOException;
import java.util.Vector;
import model.ProductCategory;
import model.User;

/**
 *
 * @author Admin
 */
@WebServlet(name = "UserProfileController", urlPatterns = {"/user-profile"})
@MultipartConfig(
        fileSizeThreshold = 1024 * 1024 * 1, // 1 MB
        maxFileSize = 1024 * 1024 * 10, // 10 MB
        maxRequestSize = 1024 * 1024 * 100 // 100 MB
)
public class UserProfileController extends HttpServlet {

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

   }

   // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
   /**
    * Handles the HTTP <code>GET</code> method.
    *
    * @param request servlet reques t
    * @param response servlet response
    * @throws ServletException if a servlet-specific error occurs
    * @throws IOException if an I/O error occurs
    */
   @Override
   protected void doGet(HttpServletRequest request, HttpServletResponse response)
           throws ServletException, IOException {
      HttpSession session = request.getSession();
      User userProfile = (User) session.getAttribute("user");
      ProductCategoryDAO pcg = new ProductCategoryDAO();
      Vector<ProductCategory> listC = pcg.getAllCategories();
      request.setAttribute("listC", listC);
      if (userProfile == null) {
         request.getRequestDispatcher("signIn.jsp").forward(request, response);

      } else {
         request.setAttribute("userProfile", userProfile);
         request.getRequestDispatcher("userProfile.jsp").forward(request, response);

      }
   }

   @Override
   protected void doPost(HttpServletRequest request, HttpServletResponse response)
           throws ServletException, IOException {
      HttpSession session = request.getSession();
      User userProfile = (User) session.getAttribute("user");
      UserProfileDAO userProfileDAO = new UserProfileDAO();
      int id = userProfile.getId();
      String fullname = request.getParameter("full_name");
      String gender = request.getParameter("gender");
      String phone = request.getParameter("phone");
      Part filePart = request.getPart("imageProfile");
      String fileName = filePart.getSubmittedFileName();
      if (filePart.getSubmittedFileName().isEmpty() || filePart.getSubmittedFileName() == null) {
         userProfileDAO.editUserInfo(id, " ", fullname, gender, phone);
      } else {
         //thay URL theo máy của cá nhân
         filePart.write("D:\\group6_shopmobile\\web\\assets\\img\\ProfilePicture\\" + fileName);
         userProfileDAO.editUserInfo(id, fileName, fullname, gender, phone);
      }
      try {
         // Thời gian chờ (được đặt bằng mili giây)
         Thread.sleep(1500);
      } catch (InterruptedException ex) {
         ex.printStackTrace();
      }

      userProfile = userProfileDAO.getUserById(id);
      session.setAttribute("user", userProfile);
      response.sendRedirect("user-profile");

   }

   @Override
   public String getServletInfo() {
      return "Short description";
   }// </editor-fold>

}
