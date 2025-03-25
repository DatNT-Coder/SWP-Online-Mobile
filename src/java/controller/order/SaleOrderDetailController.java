/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.order;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import model.Order;
import dao.OrderDAO;
import java.io.PrintWriter;

/**
 *
 * @author naokh
 */
@WebServlet(name = "SaleOrderDetailController", urlPatterns = {"/sale/SaleOrderDetailController"})
public class SaleOrderDetailController extends HttpServlet {

   public OrderDAO orderDAO = new OrderDAO();

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
         out.println("<title>Servlet SaleOrderDetailController</title>");
         out.println("</head>");
         out.println("<body>");
         out.println("<h1>Servlet SaleOrderDetailController at " + request.getContextPath() + "</h1>");
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
      try {
         int orderId = Integer.parseInt(request.getParameter("orderId"));
         Order order = orderDAO.getOrderById(orderId);

         if (order != null) {
            request.setAttribute("order", order);
            request.getRequestDispatcher("/SaleOrderDetail.jsp").forward(request, response);
         } else {
            response.sendRedirect("ListOrderSale?error=Order not found");
         }
      } catch (NumberFormatException e) {
         response.sendRedirect("ListOrderSale?error=Invalid order ID");
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
      try {
         int orderId = Integer.parseInt(request.getParameter("orderId"));
         int newStatus = Integer.parseInt(request.getParameter("status"));
         String note = request.getParameter("note");

         boolean updated = orderDAO.updateOrderStatusAndNote(orderId, newStatus, note);

         if (updated) {
            response.sendRedirect("SaleOrderDetailController?orderId=" + orderId + "&success=Order updated");
         } else {
            response.sendRedirect("SaleOrderDetailController?orderId=" + orderId + "&error=Update failed");
         }
      } catch (NumberFormatException e) {
         response.sendRedirect("ListOrderSale?error=Invalid parameters");
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

}
