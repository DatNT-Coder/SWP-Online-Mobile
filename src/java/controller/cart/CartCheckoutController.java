/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controller.cart;

import dao.CartDAO;
import dao.OrderDAO;
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
import model.Order;
import model.OrderDetail;
import model.User;

/**
 *
 * @author Asus
 */

@WebServlet(name = "CartCheckoutController", urlPatterns = {"/customer/cart/checkout"})
public class CartCheckoutController extends HttpServlet {

    private static final String VIEW_PATH = "/cart-done.jsp";
    private final CartDAO cartDAO = new CartDAO();
    private final OrderDAO orderDAO = new OrderDAO();

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        if (session.getAttribute("user") == null) {
            response.sendRedirect(request.getContextPath() + "/ProductList");
            return;
        }
        User user = (User) session.getAttribute("user");
        int userId = user.getId();

        String address = request.getParameter("address");
        String phone = request.getParameter("phone");
        String email = request.getParameter("email");
        String note = request.getParameter("note");

        // Lấy danh sách sản phẩm đã chọn từ session
        ArrayList<CartItem> selectedCart = (ArrayList<CartItem>) session.getAttribute("selectedCart");
        if (selectedCart == null || selectedCart.isEmpty()) {
            response.sendRedirect(request.getContextPath() + "/customer/cart/contact");
            return;
        }

        int total = (int) selectedCart.stream().mapToDouble(item -> item.getPrice() * item.getQuantity()).sum();
        String orderInfo = "Thanh toán đơn hàng cho user ID: " + userId;
        String ipAddr = request.getRemoteAddr();

        // Lưu thông tin đơn hàng tạm thời vào session để xử lý sau khi thanh toán thành công
        session.setAttribute("checkoutAddress", address);
        session.setAttribute("checkoutPhone", phone);
        session.setAttribute("checkoutEmail", email);
        session.setAttribute("checkoutNote", note);
        session.setAttribute("checkoutTotal", total);
        session.setAttribute("checkoutCart", selectedCart);

        try {
            String paymentUrl = VNPayConfig.createPaymentUrl(total, orderInfo, ipAddr);
            response.sendRedirect(paymentUrl); // Chuyển đến trang thanh toán VNPay
        } catch (Exception e) {
            throw new ServletException("Lỗi khi tạo URL thanh toán VNPay", e);
        }
    }
}
