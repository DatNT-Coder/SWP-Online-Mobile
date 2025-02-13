/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.slider;

import dao.SliderDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import model.Slider;

/**
 *
 * @author naokh
 */
@WebServlet(name = "SliderList", urlPatterns = {"/Slider"})
public class SliderList extends HttpServlet {

          private SliderDAO sliderDAO = new SliderDAO();
          private static final int PAGE_SIZE = 1; // Number of sliders per page

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
                              out.println("<title>Servlet SliderList</title>");
                              out.println("</head>");
                              out.println("<body>");
                              out.println("<h1>Servlet SliderList at " + request.getContextPath() + "</h1>");
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

                    // Get page number from request, default to 1
                    int page = 1;
                    int sliderId = -1;

                    try {
                              if (request.getParameter("page") != null) {
                                        page = Integer.parseInt(request.getParameter("page"));
                              }
                              if (request.getParameter("sliderId") != null) {
                                        sliderId = Integer.parseInt(request.getParameter("sliderId"));
                              }
                    } catch (NumberFormatException e) {
                              page = 1;
                    }

                    SliderDAO sliderDAO = new SliderDAO();
                    int totalSliders = sliderDAO.getTotalSliders();
                    int totalPages = (int) Math.ceil((double) totalSliders / PAGE_SIZE);

                    // Determine which page contains the sliderId
                    if (sliderId != -1) {
                              page = sliderDAO.getSliderPage(sliderId, PAGE_SIZE);
                    }

                    List<Slider> sliders = sliderDAO.getSlidersByPage(page, PAGE_SIZE);

                    request.setAttribute("sliders", sliders);
                    request.setAttribute("currentPage", page);
                    request.setAttribute("totalPages", totalPages);
                    request.setAttribute("sliderId", sliderId);  // To highlight the slider

                    request.getRequestDispatcher("SliderList.jsp").forward(request, response);
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
