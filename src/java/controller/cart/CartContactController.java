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
import java.util.Arrays;
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
    if (session.getAttribute("user") == null) {
        response.sendRedirect(request.getContextPath() + "/ProductList");
        return;
    }
    User user = (User) session.getAttribute("user");
    int userId = user.getId();

    String address = cartDAO.getUserAddress(userId);
    String phone = cartDAO.getUserPhone(userId);
    String email = user.getEmail();

    ArrayList<CartItem> cart = cartDAO.getUserCart(userId);

    // Lấy danh sách productId từ checkbox đã chọn
    String[] selectedProductIds = request.getParameterValues("selectedProducts");
    if (selectedProductIds != null && cart != null) {
        ArrayList<CartItem> selectedCart = new ArrayList<>();
        for (CartItem item : cart) {
            String productId = String.valueOf(item.getProductId());
            if (Arrays.asList(selectedProductIds).contains(productId)) {
                selectedCart.add(item);
            }
        }
        cart = selectedCart; // Cập nhật giỏ hàng chỉ chứa sản phẩm được chọn
    }

    double total = 0;
    for (CartItem item : cart) {
        total += item.getPrice() * item.getQuantity();
    }

    String qrImageLink = this.getVietQRLink((int) (total * 24640), "Thanh toán hóa đơn có mã khách hàng " + user.getId());

    request.setAttribute("cart", cart);
    request.setAttribute("total", total);
    request.setAttribute("qr", qrImageLink);
    request.setAttribute("address", address);
    request.setAttribute("phone", phone);
    request.setAttribute("email", email);
    request.setAttribute("selectedProducts", selectedProductIds); // Gửi danh sách sản phẩm đã chọn xuống JSP
    request.getRequestDispatcher(VIEW_PATH).forward(request, response);
}


    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Không thay đổi doPost
    }

    private String getVietQRLink(Integer amount, String message) {
        return "https://api.vietqr.io/image/" + BANK_BIN + "-" + BANK_ACCOUNT_NUMBER + "-ysjeDhD.jpg?"
                + "accountName=" + BANK_ACCOUNT_NAME
                + "&amount=" + amount
                + "&addInfo=" + message;
    }
}
