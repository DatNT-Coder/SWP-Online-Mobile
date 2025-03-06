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
@WebServlet(name = "CartUpdateItemController", urlPatterns = {"/customer/cart/update"})
public class CartUpdateItemController extends HttpServlet {

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
        if (session.getAttribute("user") == null) {
            response.sendRedirect(request.getContextPath() + "/ProductList");
            return;
        }
        User user = (User) session.getAttribute("user");
        int userId = user.getId();

        int productId = Integer.parseInt(request.getParameter("productId"));
        int amount = Integer.parseInt(request.getParameter("amount"));

        CartItem item = cartDAO.getCartItem(userId, productId);
        int newQuantity = item.getQuantity() + amount;

        if (newQuantity == 0) {
            cartDAO.deleteCartItem(item);
            result.addProperty("status", "successed");
            result.addProperty("quantity", newQuantity);
            out.write(result.toString());
            return;
        }

        item.setQuantity(newQuantity);

        CartItem updatedItem = cartDAO.updateCartItem(item);
       
        if (updatedItem == null) {
            result.addProperty("status", "failed");
            out.write(result.toString());
            return;
        }

        double price = updatedItem.getPrice();
        double total = price * updatedItem.getQuantity();
        updatedItem.setPrice(price);
        updatedItem.setTotal(total);

        result.addProperty("status", "successed");
        result.addProperty("price", updatedItem.getPrice());
        result.addProperty("quantity", updatedItem.getQuantity());
        result.addProperty("total", updatedItem.getTotal());
        out.write(result.toString());

        out.flush();  // Đảm bảo dữ liệu được gửi đi đầy đủ
        out.close();
    }

}
