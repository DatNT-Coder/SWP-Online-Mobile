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
@WebServlet(name = "CartContactController", urlPatterns = {"/customer/cart/contact"})
public class CartContactController extends HttpServlet {

    private static final String BANK_BIN = "970407";

    private static final String BANK_ACCOUNT_NUMBER = "19037709917015";

    private static final String BANK_ACCOUNT_NAME = "";

    private static final String VIEW_PATH = "/cart-contact.jsp";

    private final CartDAO cartDAO = new CartDAO();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        PrintWriter out = response.getWriter();
        response.setContentType("application/json");
        JsonObject result = new JsonObject();
        if (session.getAttribute("user") == null) {
            response.sendRedirect(request.getContextPath() + "/ProductList");
            return;
        }
        User user = (User) session.getAttribute("user");
        int userId = user.getId();

        String address = cartDAO.getUserAddress(userId);
        String phone = cartDAO.getUserPhone(userId);  // Lấy số điện thoại
        String email = user.getEmail();  // Lấy email

        ArrayList<CartItem> cart = cartDAO.getUserCart(userId);

        double total = 0;
        if (cart == null) {
            result.addProperty("status", "failed");
        } else {
            result.addProperty("status", "successed");

            out.write(result.toString());

            for (CartItem item : cart) {
                total += item.getPrice() * 1.0d * item.getQuantity();
            }
        }
        String qrImageLink = this.getVietQRLink((int) (total * 24640), "Thanh toán hóa đơn có mã khách hàng " + user.getId());

        request.setAttribute("cart", cart);
        request.setAttribute("total", total);
        request.setAttribute("qr", qrImageLink);
        request.setAttribute("address", address);
        request.setAttribute("phone", phone);  // Gửi phone
        request.setAttribute("email", email);  // Gửi email
        request.getRequestDispatcher(VIEW_PATH).forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }

    private String getVietQRLink(Integer amount, String message) {
        StringBuilder qrLink = new StringBuilder("https://api.vietqr.io/image/");
        qrLink.append(BANK_BIN).append("-");
        qrLink.append(BANK_ACCOUNT_NUMBER).append("-");
        qrLink.append("ysjeDhD").append(".jpg?");
        qrLink.append("accountName=").append(BANK_ACCOUNT_NAME).append("&");
        qrLink.append("amount=").append(amount.toString()).append("&");
        qrLink.append("addInfo=").append(message);
        return qrLink.toString();
    }

}
