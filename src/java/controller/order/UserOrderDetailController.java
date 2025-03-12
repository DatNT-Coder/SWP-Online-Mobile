/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controller.order;

import dao.CartDAO;
import dao.OrderDAO;
import dao.UserDAO;
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
import model.User;

/**
 *
 * @author Asus
 */
@WebServlet(name="UserOrderDetailController", urlPatterns={"/customer/orders/detail"})
public class UserOrderDetailController extends HttpServlet {
   
    private static final String VIEW_PATH = "/user-order-detail.jsp";

    private static final String BANK_BIN = "970407";

    private static final String BANK_ACCOUNT_NUMBER = "19037709917015";

    private static final String BANK_ACCOUNT_NAME = "";

    private final CartDAO cartDAO = new CartDAO();

    private final OrderDAO orderDAO = new OrderDAO();

    private final UserDAO userDAO = new UserDAO();

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

        int id = Integer.parseInt(request.getParameter("id"));

        Order order = orderDAO.getOrderById(id);
        ArrayList<CartItem> cart = orderDAO.getOrderDetailsAsCart(id);

        String qrImageLink = this.getVietQRLink((int) (order.getTotalMoney() * 100000), "Payment of user id " + user.getId());

        request.setAttribute("cart", cart);
        request.setAttribute("total", order.getTotalMoney());
        request.setAttribute("qr", qrImageLink);
        request.setAttribute("address", order.getAddress());
        request.setAttribute("phone", order.getPhone());
        request.setAttribute("email", order.getEmail());
        request.setAttribute("note", order.getNote());
        request.setAttribute("status", order.getStatus());
        request.setAttribute("orderId", id);
        
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
