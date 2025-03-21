/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.order;

import dao.OrderDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.LinkedHashMap;
import java.util.Map;
import model.Order;

/**
 *
 * @author naokh
 */
@WebServlet(name = "orderDetail", urlPatterns = {"/sale/viewOrderSale"})
public class orderDetail extends HttpServlet {

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
         out.println("<title>Servlet orderDetail</title>");
         out.println("</head>");
         out.println("<body>");
         out.println("<h1>Servlet orderDetail at " + request.getContextPath() + "</h1>");
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
      String oid = request.getParameter("oid");

      // Validate the parameter
      if (oid == null || oid.trim().isEmpty()) {
         response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Missing or invalid order ID");
         return;
      }

      try {
         int ID = Integer.parseInt(oid);
         OrderDAO dao = new OrderDAO();

         Map<String, Object> details = dao.getInformationUser(ID);
         LinkedHashMap<Integer, Map<String, Object>> orderDetail = dao.getOrderDetails(oid);
         Order order = (Order) details.get("order");
         String customerName = (String) details.get("customerName");
         String saleName = (String) details.get("saleName");

         request.setAttribute("order", order);
         request.setAttribute("customerName", customerName);
         request.setAttribute("saleName", saleName);
         request.setAttribute("orderDetail", orderDetail);

         request.getRequestDispatcher("/Sale_orderDetail.jsp").forward(request, response);
      } catch (NumberFormatException e) {
         response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid order ID format");
      }
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
      processRequest(request, response);
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
