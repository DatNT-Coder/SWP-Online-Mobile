/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controller.cart;

import com.google.gson.JsonObject;
import dao.CartDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.CartItem;
import model.User;

/**
 *
 * @author Asus
 */
@WebServlet(name = "CartAddItemController", urlPatterns = {"/customer/cart/add"})
public class CartAddItemController extends HttpServlet {

    private final CartDAO cartDAO = new CartDAO();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        PrintWriter out = response.getWriter();
        response.setContentType("application/json");
        JsonObject result = new JsonObject();

        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");
        if (user != null) {
        int userId = user.getId();


        int productId = Integer.parseInt(request.getParameter("productId"));

        CartItem item = new CartItem();
        item.setUserId(userId);
        item.setProductId(productId);
        item.setQuantity(1);
        item.setStatus(1);

        CartItem addedItem = cartDAO.addCartItem(item);

        if (addedItem == null) {
            result.addProperty("status", "failed");
        }
        result.addProperty("status", "successed");

        out.write(result.toString());
            
        }else{
             request.setAttribute("need", "Bạn cần phải đăng nhập!");
      
            request.getRequestDispatcher("/Login.jsp").forward(request, response);
        }
//        response.sendRedirect(request.getContextPath() + "/listProduct");
    }

}