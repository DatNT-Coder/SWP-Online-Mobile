/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.order;

import com.google.gson.Gson;
import com.sun.jdi.connect.spi.Connection;
import context.DBContext;
import dao.OrderDAO;
import dao.UserDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.Map;
import java.util.Vector;
import model.Order;
import model.User;

/**
 *
 * @author naokh
 */
@WebServlet(name = "listOrderSale", urlPatterns = {"/sale/listOrderSale"})
public class listOrderSale extends HttpServlet {

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
         out.println("<title>Servlet NewServlet</title>");
         out.println("</head>");
         out.println("<body>");
         out.println("<h1>Servlet NewServlet at " + request.getContextPath() + "</h1>");
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
   protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      List<Order> orders = new ArrayList<>();
      // Database connection and fetch logic
      try (Connection conn = new DBContext().getConnection()) {
         String sql = "SELECT * FROM orders"; // Replace with your table name
         PreparedStatement stmt = conn.prepareStatement(sql);
         ResultSet rs = stmt.executeQuery();

         while (rs.next()) {
            Order order = new Order(
                    rs.getInt("Id"),
                    rs.getInt("uId"),
                    rs.getDate("date"),
                    rs.getDouble("totalMoney"),
                    rs.getInt("status"),
                    rs.getDouble("discount"),
                    rs.getString("address"),
                    rs.getString("phone"),
                    rs.getString("email"),
                    rs.getString("note"),
                    rs.getString("gender"),
                    rs.getInt("saleId"),
                    rs.getInt("settingId")
            );
            orders.add(order);
         }
      } catch (Exception e) {
         e.printStackTrace();
      }

      // Set the orders list as a request attribute
      request.setAttribute("orders", orders);

      // Forward the request to the JSP page
      request.getRequestDispatcher("Sale_orderList.jsp").forward(request, response);
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
