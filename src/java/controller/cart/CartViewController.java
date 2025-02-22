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
import java.util.ArrayList;
import model.CartItem;
import model.User;

/**
 *
 * @author Asus
 */
@WebServlet(name = "CartViewController", urlPatterns = {"/customer/cart"})
public class CartViewController extends HttpServlet {

    private static final String VIEW_PATH = "/cart.jsp";

    private final CartDAO cartDAO = new CartDAO();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        PrintWriter out = response.getWriter();
        response.setContentType("application/json");
        JsonObject result = new JsonObject();
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");
        if (user != null) {
//            response.sendRedirect(request.getContextPath() + "/listProduct");
//            return;

            int userId = user.getId();

            ArrayList<CartItem> cart = cartDAO.getUserCart(userId);
            if (cart == null) {
                result.addProperty("status", "failed");
            }
            result.addProperty("status", "successed");

            out.write(result.toString());
            request.setAttribute("cart", cart);
            request.getRequestDispatcher(VIEW_PATH).forward(request, response);

        } else {
            request.setAttribute("need", "Bạn cần phải đăng nhập!");
      
            request.getRequestDispatcher("/login.jsp").forward(request, response);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }
}