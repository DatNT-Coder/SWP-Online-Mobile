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
import java.io.File;
import java.io.IOException;
import java.util.Vector;
import model.ProductCategory;
import model.User;

/**
 *
 * @author naokh
 */
@WebServlet(name = "UserProfileController", urlPatterns = {"/user-profile"})
@MultipartConfig(
        fileSizeThreshold = 1024 * 1024 * 10,
        maxFileSize = 1024 * 1024 * 50,
        maxRequestSize = 1024 * 1024 * 100
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
      User userProfile = (User) session.getAttribute("account");

      request.setAttribute("account", userProfile);
      if (userProfile == null) {
         request.getRequestDispatcher("signIn.jsp").forward(request, response);

      } else {
         request.setAttribute("userProfile", userProfile);
         request.getRequestDispatcher("UserProfile.jsp").forward(request, response);

      }
   }

   @Override
   protected void doPost(HttpServletRequest request, HttpServletResponse response)
           throws ServletException, IOException {
      HttpSession session = request.getSession();
      User userProfile = (User) session.getAttribute("profileUser");
      String fileName = uploadFile(request);
      String fullName = request.getParameter("fullName");
      String email = request.getParameter("email");
      String phone = request.getParameter("phone");
      String gender = request.getParameter("0gender");
      UserProfileDAO profile = new UserProfileDAO();
      profile.editUserInfo(userProfile.getId(), fileName, fullName, gender, phone);
      request.getSession().setAttribute("profileUser", profile.getUserById(userProfile.getId()));
      response.sendRedirect("HomePage");

   }

   @Override
   public String getServletInfo() {
      return "Short description";
   }

   public String uploadFile(HttpServletRequest request) throws IOException, ServletException {
      String fileName = "";
      String uploadPath = getServletContext().getRealPath("") + File.separator + "images/avatar";
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
