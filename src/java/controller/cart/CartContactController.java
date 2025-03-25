package controller.cart;

import com.google.gson.JsonObject;
import dao.CartDAO;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.CartItem;
import model.User;

@WebServlet(name = "CartContactController", urlPatterns = {"/customer/cart/contact"})
public class CartContactController extends HttpServlet {

    private static final String BANK_BIN = "970407";
    private static final String BANK_ACCOUNT_NUMBER = "19037709917015";
    private static final String BANK_ACCOUNT_NAME = "Test User";
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

        List<String> addressList = cartDAO.getUserAddresses(userId);
        String phone = cartDAO.getUserPhone(userId);
        String email = user.getEmail();
        
        ArrayList<CartItem> cart = cartDAO.getUserCart(userId);
        String selectedProductIdsParam = request.getParameter("selectedProducts");
        ArrayList<CartItem> selectedCart = new ArrayList<>();

        if (selectedProductIdsParam != null && !selectedProductIdsParam.isEmpty()) {
            List<String> selectedProductIds = Arrays.asList(selectedProductIdsParam.split(","));
            for (CartItem item : cart) {
                if (selectedProductIds.contains(String.valueOf(item.getProductId()))) {
                    selectedCart.add(item);
                }
            }
        }

        if (selectedCart.isEmpty()) {
            request.setAttribute("error", "Không có sản phẩm nào được chọn để thanh toán.");
            request.getRequestDispatcher(VIEW_PATH).forward(request, response);
            return;
        }

        double total = selectedCart.stream().mapToDouble(item -> item.getPrice() * item.getQuantity()).sum();
        if (total <= 0) {
            request.setAttribute("error", "Số tiền thanh toán không hợp lệ.");
            request.getRequestDispatcher(VIEW_PATH).forward(request, response);
            return;
        }
        
        String qrImageLink = getVietQRLink((int) (total * 24640), "Thanh toán hóa đơn cho khách hàng " + user.getId());
        
        session.setAttribute("selectedCart", selectedCart);
        request.setAttribute("cart", selectedCart);
        request.setAttribute("total", total);
        request.setAttribute("qr", qrImageLink);
        request.setAttribute("addressList", addressList);
        request.setAttribute("phone", phone);
        request.setAttribute("email", email);
        request.setAttribute("selectedProducts", selectedProductIdsParam);
        
        request.getRequestDispatcher(VIEW_PATH).forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Không thay đổi doPost
    }

    private String getVietQRLink(Integer amount, String message) {
        return "https://api.vietqr.io/image/" + BANK_BIN + "-" + BANK_ACCOUNT_NUMBER + "-default.jpg?"
                + "accountName=" + BANK_ACCOUNT_NAME
                + "&amount=" + amount
                + "&addInfo=" + message;
    }
}