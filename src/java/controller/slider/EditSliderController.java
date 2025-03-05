/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.slider;

import dao.SliderDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;
import java.io.File;
import model.Slider;
import model.User;

/**
 *
 * @author naokh
 */
@WebServlet(name = "EditSliderController", urlPatterns = {"/edit-slider"})
@MultipartConfig(
        fileSizeThreshold = 1024 * 1024 * 10,
        maxFileSize = 1024 * 1024 * 50,
        maxRequestSize = 1024 * 1024 * 100
)
public class EditSliderController extends HttpServlet {

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
         out.println("<title>Servlet EditSliderController</title>");
         out.println("</head>");
         out.println("<body>");
         out.println("<h1>Servlet EditSliderController at " + request.getContextPath() + "</h1>");
         out.println("</body>");
         out.println("</html>");
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
      int sliderId = Integer.parseInt(request.getParameter("id"));
      Slider slider = new SliderDAO().getListSliderBySliderId(sliderId);
      request.setAttribute("slider", slider);
      request.getRequestDispatcher("EditSlider.jsp").forward(request, response);
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
      String url = "";
      try {
         int sliderId = Integer.parseInt(request.getParameter("sliderId"));
         String subId = request.getParameter("subId");
         String title = request.getParameter("title");
         String status = request.getParameter("status");
         String backlink = request.getParameter("backlink");
         String notes = request.getParameter("notes");
         String fileName = uploadFile(request);
         User user = (User) request.getSession().getAttribute("account");
         int check = 0;
         int marketing_id = -1;
         try {
            check = Integer.parseInt(status);
            marketing_id = user.getId();
         } catch (NumberFormatException e) {
            check = 0;
         }
         Slider slider = new SliderDAO().getListSliderBySliderId(sliderId);
         if (fileName.isEmpty()) {
            fileName = slider.getImage();
         }
         SliderDAO sliderDAO = new SliderDAO();
         sliderDAO.updateSlider(sliderId, title, check, fileName, notes, marketing_id, backlink);
         url = "edit-slider?id=" + sliderId;
      } catch (Exception e) {
         e.printStackTrace();
      } finally {
         response.sendRedirect(url);
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

   public String uploadFile(HttpServletRequest request) throws IOException, ServletException {
      String fileName = "";
      String uploadPath = getServletContext().getRealPath("") + File.separator + "images/slider";
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
