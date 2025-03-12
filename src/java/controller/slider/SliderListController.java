/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.slider;

import dao.SliderDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.List;
import model.Slider;

/**
 *
 * @author naokh
 */
@WebServlet(name = "sliderlist", urlPatterns = {"/slider-list"})
public class SliderListController extends HttpServlet {

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
         out.println("<title>Servlet sliderlist</title>");
         out.println("</head>");
         out.println("<body>");
         out.println("<h1>Servlet sliderlist at " + request.getContextPath() + "</h1>");
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
      final int PAGE_SIZE = 5;  // Set number of items per page
      int page = 1;

      // Get current page number from request
      String pageStr = request.getParameter("page");
      if (pageStr != null) {
         try {
            page = Integer.parseInt(pageStr);
         } catch (NumberFormatException e) {
            response.sendRedirect("error");
            return;
         }
      }

      SliderDAO sliderDAO = new SliderDAO();
      int totalSliders = sliderDAO.getTotalSlider(); // Get total number of sliders
      int totalPage = (int) Math.ceil((double) totalSliders / PAGE_SIZE); // Calculate total pages

      List<Slider> listSliders = new SliderDAO().getAllSliders();
      List<Slider> listSlidersByPagging = new SliderDAO().getListSlidersByPagging(page, PAGE_SIZE);

      request.setAttribute("page", page);
      request.setAttribute("totalPage", totalPage);
      request.getSession().setAttribute("search_url", "search_slider");
      request.getSession().setAttribute("delete_url", "delete_slider");
      request.getSession().setAttribute("listSliders", listSliders);
      request.getSession().setAttribute("listSlidersByPagging", listSlidersByPagging);
      request.setAttribute("pagination_url", "slider-list?");
      request.getSession().setAttribute("backlink", "slider-list");

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
      final int PAGE_SIZE = 5;
      int page = 1;
      String pageStr = request.getParameter("page");
      if (pageStr != null) {
         page = Integer.parseInt(pageStr);
      }
      int totalSearch = new SliderDAO().getTotalSlider();
      int totalPage = totalSearch / PAGE_SIZE;
      if (totalSearch % PAGE_SIZE != 0) {
         totalPage += 1;
      }

      List<Slider> listSliders = new SliderDAO().getAllSliders();
      List<Slider> listSlidersByPagging = new SliderDAO().getListSlidersByPagging(page, PAGE_SIZE);

      request.setAttribute("page", page);
      request.setAttribute("totalPage", totalPage);
      request.getSession().setAttribute("search_url", "search_slider");
      request.getSession().setAttribute("listSliders", listSliders);
      request.getSession().setAttribute("listSlidersByPagging", listSlidersByPagging);
      request.setAttribute("pagination_url", "slider-list?");
      request.getSession().setAttribute("backlink", "slider-list");

      request.getRequestDispatcher("SliderListMarketing.jsp").forward(request, response);
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
