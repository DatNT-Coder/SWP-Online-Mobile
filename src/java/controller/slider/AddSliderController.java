/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.slider;

import dao.SliderDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
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
@WebServlet(name = "AddSliderController", urlPatterns = {"/add-slider"})
@MultipartConfig(
        fileSizeThreshold = 1024 * 1024 * 10,
        maxFileSize = 1024 * 1024 * 50,
        maxRequestSize = 1024 * 1024 * 100
)
public class AddSliderController extends HttpServlet {

   private static final long SerialVersionUID = 1L;
   private static final String UPLOAD_DIR = "img";

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
         out.println("<title>Servlet AddSliderController</title>");
         out.println("</head>");
         out.println("<body>");
         out.println("<h1>Servlet AddSliderController at " + request.getContextPath() + "</h1>");
         out.println("</body>");
         out.println("</html>");
      }
   }

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
      request.getRequestDispatcher("MKT_NewSlider.jsp").forward(request, response);
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
         String subId = request.getParameter("subId");
         String title = request.getParameter("title");
         String status = request.getParameter("status");
         String backlink = request.getParameter("backlink");
         String notes = request.getParameter("notes");
         String fileName = uploadFile(request);
         User user = (User) request.getSession().getAttribute("account");
         int check = 0;
         int marketing_id = 0;
         try {
            marketing_id = user.getId();
            check = Integer.parseInt(status);

         } catch (NumberFormatException e) {
            check = 0;
         }
         SliderDAO sliderDAO = new SliderDAO();
         sliderDAO.insertSlider(title, check, fileName, notes, marketing_id, backlink);
         List<Slider> listSliders = new SliderDAO().getAllSliders();

         request.getSession().setAttribute("backlink", "slider-list");
         request.getSession().setAttribute("listSliders", listSliders);

         url = "slider-list";
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
   }

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
