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
import java.util.HashMap;
import java.util.Map;
import model.CartItem;
import model.Order;
import model.OrderDetail;
import model.User;

/**
 *
 * @author Asus
 */
@WebServlet(name = "VNPayReturnServlet", urlPatterns = {"/VNPayReturnServlet"})
public class VNPayReturnServlet extends HttpServlet {

    private static final String VIEW_PATH = "/cart-done.jsp";
    private final OrderDAO orderDAO = new OrderDAO();
    private final CartDAO cartDAO = new CartDAO();

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession();
        String vnp_ResponseCode = request.getParameter("vnp_ResponseCode");

        if ("00".equals(vnp_ResponseCode)) {  // Thanh toán thành công
            User user = (User) session.getAttribute("user");
            if (user == null) {
                response.sendRedirect(request.getContextPath() + "/ProductList");
                return;
            }
            int userId = user.getId();

            // Lấy thông tin checkout từ session
            String address = (String) session.getAttribute("checkoutAddress");
            String phone = (String) session.getAttribute("checkoutPhone");
            String email = (String) session.getAttribute("checkoutEmail");
            String note = (String) session.getAttribute("checkoutNote");
            double total = Double.parseDouble(session.getAttribute("checkoutTotal").toString());
            ArrayList<CartItem> selectedCart = (ArrayList<CartItem>) session.getAttribute("checkoutCart");

            if (selectedCart == null || selectedCart.isEmpty()) {
                response.sendRedirect(request.getContextPath() + "/customer/cart");
                return;
            }

            // Tạo đơn hàng
            Order order = new Order();
            order.setAddress(address);
            order.setDate(new java.sql.Date(new java.util.Date().getTime()));
            order.setPhone(phone);
            order.setEmail(email);
            order.setNote(note);
            order.setuId(userId);
            order.setTotalMoney(total);
            order.setSaleId(0);
            order.setStatus(1);
            order.setSettingId(1);

            Order addedOrder = orderDAO.addOrder(order);

            // Lưu chi tiết đơn hàng và cập nhật kho hàng
            for (CartItem item : selectedCart) {
                OrderDetail orderDetail = new OrderDetail();
                orderDetail.setOrderId(addedOrder.getId());
                orderDetail.setProductId(item.getProductId());
                orderDetail.setQuantity(item.getQuantity());
                orderDetail.setPrice(item.getPrice());
                orderDAO.addOrderDetail(orderDetail);
                cartDAO.stock(item);
            }

            // Xóa giỏ hàng sau khi thanh toán thành công
            for (CartItem item : selectedCart) {
                cartDAO.deleteCartItem(userId, item.getProductId());
            }

            // Gửi email xác nhận
            String productDetails = "";
            for (CartItem item : selectedCart) {
                productDetails += "<tr><td align=\"left\" width=\"75%\" style=\"padding: 6px 12px; font-size: 16px;\">"
                        + item.getName() + "</td>"
                        + "<td align=\"left\" width=\"25%\" style=\"padding: 6px 12px; font-size: 16px;\">"
                        + item.getQuantity() + "</td></tr>";
            }


            //Email
            String subject = "Verify Your Email - Your Website.";
            String content = "<!DOCTYPE html>\n"
                    + "<html>\n"
                    + "<head>\n"
                    + "\n"
                    + "  <meta charset=\"utf-8\">\n"
                    + "  <meta http-equiv=\"x-ua-compatible\" content=\"ie=edge\">\n"
                    + "  <title>Email Receipt</title>\n"
                    + "  <meta name=\"viewport\" content=\"width=device-width, initial-scale=1\">\n"
                    + "  <style type=\"text/css\">\n"
                    + "  /**\n"
                    + "   * Google webfonts. Recommended to include the .woff version for cross-client compatibility.\n"
                    + "   */\n"
                    + "  @media screen {\n"
                    + "    @font-face {\n"
                    + "      font-family: 'Source Sans Pro';\n"
                    + "      font-style: normal;\n"
                    + "      font-weight: 400;\n"
                    + "      src: local('Source Sans Pro Regular'), local('SourceSansPro-Regular'), url(https://fonts.gstatic.com/s/sourcesanspro/v10/ODelI1aHBYDBqgeIAH2zlBM0YzuT7MdOe03otPbuUS0.woff) format('woff');\n"
                    + "    }\n"
                    + "\n"
                    + "    @font-face {\n"
                    + "      font-family: 'Source Sans Pro';\n"
                    + "      font-style: normal;\n"
                    + "      font-weight: 700;\n"
                    + "      src: local('Source Sans Pro Bold'), local('SourceSansPro-Bold'), url(https://fonts.gstatic.com/s/sourcesanspro/v10/toadOcfmlt9b38dHJxOBGFkQc6VGVFSmCnC_l7QZG60.woff) format('woff');\n"
                    + "    }\n"
                    + "  }\n"
                    + "\n"
                    + "  /**\n"
                    + "   * Avoid browser level font resizing.\n"
                    + "   * 1. Windows Mobile\n"
                    + "   * 2. iOS / OSX\n"
                    + "   */\n"
                    + "  body,\n"
                    + "  table,\n"
                    + "  td,\n"
                    + "  a {\n"
                    + "    -ms-text-size-adjust: 100%; /* 1 */\n"
                    + "    -webkit-text-size-adjust: 100%; /* 2 */\n"
                    + "  }\n"
                    + "\n"
                    + "  /**\n"
                    + "   * Remove extra space added to tables and cells in Outlook.\n"
                    + "   */\n"
                    + "  table,\n"
                    + "  td {\n"
                    + "    mso-table-rspace: 0pt;\n"
                    + "    mso-table-lspace: 0pt;\n"
                    + "  }\n"
                    + "\n"
                    + "  /**\n"
                    + "   * Better fluid images in Internet Explorer.\n"
                    + "   */\n"
                    + "  img {\n"
                    + "    -ms-interpolation-mode: bicubic;\n"
                    + "  }\n"
                    + "\n"
                    + "  /**\n"
                    + "   * Remove blue links for iOS devices.\n"
                    + "   */\n"
                    + "  a[x-apple-data-detectors] {\n"
                    + "    font-family: inherit !important;\n"
                    + "    font-size: inherit !important;\n"
                    + "    font-weight: inherit !important;\n"
                    + "    line-height: inherit !important;\n"
                    + "    color: inherit !important;\n"
                    + "    text-decoration: none !important;\n"
                    + "  }\n"
                    + "\n"
                    + "  /**\n"
                    + "   * Fix centering issues in Android 4.4.\n"
                    + "   */\n"
                    + "  div[style*=\"margin: 16px 0;\"] {\n"
                    + "    margin: 0 !important;\n"
                    + "  }\n"
                    + "\n"
                    + "  body {\n"
                    + "    width: 100% !important;\n"
                    + "    height: 100% !important;\n"
                    + "    padding: 0 !important;\n"
                    + "    margin: 0 !important;\n"
                    + "  }\n"
                    + "\n"
                    + "  /**\n"
                    + "   * Collapse table borders to avoid space between cells.\n"
                    + "   */\n"
                    + "  table {\n"
                    + "    border-collapse: collapse !important;\n"
                    + "  }\n"
                    + "\n"
                    + "  a {\n"
                    + "    color: #1a82e2;\n"
                    + "  }\n"
                    + "\n"
                    + "  img {\n"
                    + "    height: auto;\n"
                    + "    line-height: 100%;\n"
                    + "    text-decoration: none;\n"
                    + "    border: 0;\n"
                    + "    outline: none;\n"
                    + "  }\n"
                    + "  </style>\n"
                    + "\n"
                    + "</head>\n"
                    + "<body style=\"background-color: #D2C7BA;\">\n"
                    + "\n"
                    + "  <!-- start preheader -->\n"
                    + "  <div class=\"preheader\" style=\"display: none; max-width: 0; max-height: 0; overflow: hidden; font-size: 1px; line-height: 1px; color: #fff; opacity: 0;\">\n"
                    + "    A preheader is the short summary text that follows the subject line when an email is viewed in the inbox.\n"
                    + "  </div>\n"
                    + "  <!-- end preheader -->\n"
                    + "\n"
                    + "  <!-- start body -->\n"
                    + "  <table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\">\n"
                    + "\n"
                    + "    <!-- start logo -->\n"
                    + "    <tr>\n"
                    + "      <td align=\"center\" bgcolor=\"#D2C7BA\">\n"
                    + "        \n"
                    + "        <table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\" style=\"max-width: 600px;\">\n"
                    + "          <tr>\n"
                    + "            <td align=\"center\" valign=\"top\" style=\"padding: 36px 24px;\">\n"
                    + "              <a href=\"http://localhost:8080/mobileshop/HomePage\" target=\"_blank\" style=\"display: inline-block;\">\n"
                    + "                <img src=\"logo.png\" alt=\"Logo\" border=\"0\" width=\"48\" style=\"display: block; width: 48px; max-width: 48px; min-width: 48px;\">\n"
                    + "              </a>\n"
                    + "            </td>\n"
                    + "          </tr>\n"
                    + "        </table>\n"
                    + "        <!--[if (gte mso 9)|(IE)]>\n"
                    + "        </td>\n"
                    + "        </tr>\n"
                    + "        </table>\n"
                    + "        <![endif]-->\n"
                    + "      </td>\n"
                    + "    </tr>\n"
                    + "    <!-- end logo -->\n"
                    + "\n"
                    + "    <!-- start hero -->\n"
                    + "    <tr>\n"
                    + "      <td align=\"center\" bgcolor=\"#D2C7BA\">\n"
                    + "        \n"
                    + "        <table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\" style=\"max-width: 600px;\">\n"
                    + "          <tr>\n"
                    + "            <td align=\"left\" bgcolor=\"#ffffff\" style=\"padding: 36px 24px 0; font-family: 'Source Sans Pro', Helvetica, Arial, sans-serif; border-top: 3px solid #d4dadf;\">\n"
                    + "              <h1 style=\"margin: 0; font-size: 32px; font-weight: 700; letter-spacing: -1px; line-height: 48px;\">Cảm ơn bạn đã mua hàng của chúng tôi!</h1>\n"
                    + "            </td>\n"
                    + "          </tr>\n"
                    + "        </table>\n"
                    + "        <!--[if (gte mso 9)|(IE)]>\n"
                    + "        </td>\n"
                    + "        </tr>\n"
                    + "        </table>\n"
                    + "        <![endif]-->\n"
                    + "      </td>\n"
                    + "    </tr>\n"
                    + "    <!-- end hero -->\n"
                    + "\n"
                    + "    <!-- start copy block -->\n"
                    + "    <tr>\n"
                    + "      <td align=\"center\" bgcolor=\"#D2C7BA\">\n"
                    + "        \n"
                    + "        <table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\" style=\"max-width: 600px;\">\n"
                    + "\n"
                    + "          <!-- start copy -->\n"
                    + "          <tr>\n"
                    + "            <td align=\"left\" bgcolor=\"#ffffff\" style=\"padding: 24px; font-family: 'Source Sans Pro', Helvetica, Arial, sans-serif; font-size: 16px; line-height: 24px;\">\n"
                    + "              <p style=\"margin: 0;\">Đây là chi tiết đơn hàng của bạn. Nếu bạn có thắc mắc liên hê chê tôi ở đây <a href=\"http://localhost:8080/mobileshop/Home\">contact us</a>.</p>\n"
                    + "            </td>\n"
                    + "          </tr>\n"
                    + "          <!-- end copy -->\n"
                    + "\n"
                    + "          <!-- start receipt table -->\n"
                    + "          <tr>\n"
                    + "            <td align=\"left\" bgcolor=\"#ffffff\" style=\"padding: 24px; font-family: 'Source Sans Pro', Helvetica, Arial, sans-serif; font-size: 16px; line-height: 24px;\">\n"
                    + "              <table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\">\n"
                    + "                <tr>\n"
                    + "                  <td align=\"left\" bgcolor=\"#009981\" width=\"75%\" style=\"padding: 12px;font-family: 'Source Sans Pro', Helvetica, Arial, sans-serif; font-size: 16px; line-height: 24px;\"><strong>Mã đơn hàng #</strong></td>\n"
                    + "                  <td align=\"left\" bgcolor=\"#009981\" width=\"25%\" style=\"padding: 12px;font-family: 'Source Sans Pro', Helvetica, Arial, sans-serif; font-size: 16px; line-height: 24px;\"><strong>" + addedOrder.getId() + "</strong></td>\n"
                    + "                </tr>\n"
                    + "                <tr>\n"
                    + "                  <td align=\"left\"  width=\"75%\" style=\"padding: 12px;font-family: 'Source Sans Pro', Helvetica, Arial, sans-serif; font-size: 16px; line-height: 24px;\"><strong>Tên sản phẩm</strong></td>\n"
                    + "                  <td align=\"left\"  width=\"25%\" style=\"padding: 12px;font-family: 'Source Sans Pro', Helvetica, Arial, sans-serif; font-size: 16px; line-height: 24px;\"><strong>Số lượng</strong></td>\n"
                    + "                </tr>\n"
                    + productDetails
                    + "                <tr>\n"
                    + "                  <td align=\"left\" width=\"75%\" style=\"padding: 6px 12px;font-family: 'Source Sans Pro', Helvetica, Arial, sans-serif; font-size: 16px; line-height: 24px;\">Sales Tax</td>\n"
                    + "                  <td align=\"left\" width=\"25%\" style=\"padding: 6px 12px;font-family: 'Source Sans Pro', Helvetica, Arial, sans-serif; font-size: 16px; line-height: 24px;\">$0.00</td>\n"
                    + "                </tr>\n"
                    + "                <tr>\n"
                    + "                  <td align=\"left\" width=\"75%\" style=\"padding: 12px; font-family: 'Source Sans Pro', Helvetica, Arial, sans-serif; font-size: 16px; line-height: 24px; border-top: 2px dashed #D2C7BA; border-bottom: 2px dashed #D2C7BA;\"><strong>Tổng giá</strong></td>\n"
                    + "                  <td align=\"left\" width=\"25%\" style=\"padding: 12px; font-family: 'Source Sans Pro', Helvetica, Arial, sans-serif; font-size: 16px; line-height: 24px; border-top: 2px dashed #D2C7BA; border-bottom: 2px dashed #D2C7BA;\"><strong>" + addedOrder.getTotalMoney() + "</strong></td>\n"
                    + "                </tr>\n"
                    + "              </table>\n"
                    + "            </td>\n"
                    + "          </tr>\n"
                    + "          <!-- end reeipt table -->\n"
                    + "\n"
                    + "        </table>\n"
                    + "        <!--[if (gte mso 9)|(IE)]>\n"
                    + "        </td>\n"
                    + "        </tr>\n"
                    + "        </table>\n"
                    + "        <![endif]-->\n"
                    + "      </td>\n"
                    + "    </tr>\n"
                    + "    <!-- end copy block -->\n"
                    + "\n"
                    + "    <!-- start receipt address block -->\n"
                    + "    <tr>\n"
                    + "      <td align=\"center\" bgcolor=\"#D2C7BA\" valign=\"top\" width=\"100%\">\n"
                    + "        \n"
                    + "        <table align=\"center\" bgcolor=\"#ffffff\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\" style=\"max-width: 600px;\">\n"
                    + "          <tr>\n"
                    + "            <td align=\"center\" valign=\"top\" style=\"font-size: 0; border-bottom: 3px solid #d4dadf\">\n"
                    + "              \n"
                    + "              <div style=\"display: inline-block; width: 100%; max-width: 50%; min-width: 240px; vertical-align: top;\">\n"
                    + "                <table align=\"left\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\" style=\"max-width: 300px;\">\n"
                    + "                  <tr>\n"
                    + "                    <td align=\"left\" valign=\"top\" style=\"padding-bottom: 36px; padding-left: 36px; font-family: 'Source Sans Pro', Helvetica, Arial, sans-serif; font-size: 16px; line-height: 24px;\">\n"
                    + "                      <p><strong>Địa chỉ nhận hàng <!-- Chỉnh dữ liêu ở đây --></strong></p>\n"
                    + "                      <p>" + addedOrder.getAddress() + "</p>\n"
                    + "                    </td>\n"
                    + "                  </tr>\n"
                    + "                </table>\n"
                    + "              </div>\n"
                    + "              \n"
                    + "              <div style=\"display: inline-block; width: 100%; max-width: 50%; min-width: 240px; vertical-align: top;\">\n"
                    + "                <table align=\"left\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\" style=\"max-width: 300px;\">\n"
                    + "                  <tr>\n"
                    + "                    <td align=\"left\" valign=\"top\" style=\"padding-bottom: 36px; padding-left: 36px; font-family: 'Source Sans Pro', Helvetica, Arial, sans-serif; font-size: 16px; line-height: 24px;\">\n"
                    + "                      <p><strong>Ngày đặt hàng <!-- Chỉnh dữ liêu ở đây --></strong></p>\n"
                    + "                      <p>" + addedOrder.getDate() + "</p>\n"
                    + "                    </td>\n"
                    + "                  </tr>\n"
                    + "                </table>\n"
                    + "              </div>\n"
                    + "              \n"
                    + "            </td>\n"
                    + "          </tr>\n"
                    + "        </table>\n"
                    + "        \n"
                    + "      </td>\n"
                    + "    </tr>\n"
                    + "    <!-- end receipt address block -->\n"
                    + "\n"
                    + "    <!-- start footer -->\n"
                    + "    <tr>\n"
                    + "      <td align=\"center\" bgcolor=\"#D2C7BA\" style=\"padding: 24px;\">\n"
                    + "        \n"
                    + "        <table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\" style=\"max-width: 600px;\">\n"
                    + "\n"
                    + "          <!-- start permission -->\n"
                    + "          <tr>\n"
                    + "            <td align=\"center\" bgcolor=\"#D2C7BA\" style=\"padding: 12px 24px; font-family: 'Source Sans Pro', Helvetica, Arial, sans-serif; font-size: 14px; line-height: 20px; color: #666;\">\n"
                    + "              <p style=\"margin: 0;\">You received this email because we received a request for [type_of_action] for your account. If you didn't request [type_of_action] you can safely delete this email.</p>\n"
                    + "            </td>\n"
                    + "          </tr>\n"
                    + "          <!-- end permission -->\n"
                    + "\n"
                    + "          <!-- start unsubscribe -->\n"
                    + "          <tr>\n"
                    + "            <td align=\"center\" bgcolor=\"#D2C7BA\" style=\"padding: 12px 24px; font-family: 'Source Sans Pro', Helvetica, Arial, sans-serif; font-size: 14px; line-height: 20px; color: #666;\">\n"
                    + "              <p style=\"margin: 0;\">To stop receiving these emails, you can <a href=\"https://sendgrid.com\" target=\"_blank\">unsubscribe</a> at any time.</p>\n"
                    + "              <p style=\"margin: 0;\">Paste 1234 S. Broadway St. City, State 12345</p>\n"
                    + "            </td>\n"
                    + "          </tr>\n"
                    + "          <!-- end unsubscribe -->\n"
                    + "\n"
                    + "        </table>\n"
                    + "        <!--[if (gte mso 9)|(IE)]>\n"
                    + "        </td>\n"
                    + "        </tr>\n"
                    + "        </table>\n"
                    + "        <![endif]-->\n"
                    + "      </td>\n"
                    + "    </tr>\n"
                    + "    <!-- end footer -->\n"
                    + "\n"
                    + "  </table>\n"
                    + "  <!-- end body -->\n"
                    + "\n"
                    + "</body>\n"
                    + "</html>";
        Email.sendEmail(email, subject, content);

        // Xóa thông tin tạm thời khỏi session
        session.removeAttribute("checkoutAddress");
        session.removeAttribute("checkoutPhone");
        session.removeAttribute("checkoutEmail");
        session.removeAttribute("checkoutNote");
        session.removeAttribute("checkoutTotal");
        session.removeAttribute("checkoutCart");
          request.setAttribute("orderId", addedOrder.getId());
            request.getRequestDispatcher(VIEW_PATH).forward(request, response);

    } else {
        // Thanh toán thất bại
        response.sendRedirect(request.getContextPath() + "/customer/cart/checkout-fail");
    }

    }

  
}
