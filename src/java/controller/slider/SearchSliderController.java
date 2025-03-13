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
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Slider;

/**
 *
 * @author naokh
 */
@WebServlet(name = "SearchSliderController", urlPatterns = {"/search-slider"})
public class SearchSliderController extends HttpServlet {

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
         out.println("<title>Servlet SearchSliderController</title>");
         out.println("</head>");
         out.println("<body>");
         out.println("<h1>Servlet SearchSliderController at " + request.getContextPath() + "</h1>");
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
      final int PAGE_SIZE = 3;
      int page = 1;
      String pageStr = request.getParameter("page");
      String keyword = request.getParameter("keyword");
      if (pageStr != null) {
         page = Integer.parseInt(pageStr);
      }

      String statusStr = request.getParameter("status");
      int status = 1; // Default status
      if (statusStr != null) {
         status = Integer.parseInt(statusStr);
      }

      int totalSliders = new SliderDAO().getTotalSlider(keyword, status);
      List<Slider> listSlidersByPagging = new SliderDAO().getListSliderByKeywordAndPagging(keyword, page, PAGE_SIZE, status);
      int totalPage = (totalSliders + PAGE_SIZE - 1) / PAGE_SIZE; // Round up for pagination

      request.getSession().setAttribute("listSlidersByPagging", listSlidersByPagging);
      request.setAttribute("page", page);
      request.setAttribute("totalPage", totalPage);
      request.setAttribute("pagination_url", "search-slider?");
      request.setAttribute("status", status);

      request.getRequestDispatcher("SliderListMarketing.jsp").forward(request, response);
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
      doGet(request, response);
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
