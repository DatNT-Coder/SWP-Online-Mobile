/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.user;

import model.User;
import dao.AccountDAO;
import constant.CommonConst;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet("/Account")
public class UserProfile extends HttpServlet {

          @Override
          protected void doPost(HttpServletRequest request, HttpServletResponse response)
                  throws ServletException, IOException {
                    HttpSession session = request.getSession();
                    User user = (User) session.getAttribute(CommonConst.SESSION_ACCOUNT);

                    if (user == null) {
                              response.sendRedirect("login.jsp");
                              return;
                    }

                    String email = request.getParameter("email");
                    String fullName = request.getParameter("full_name");
                    String phone = request.getParameter("phone");
                    String gender = request.getParameter("gender");
                    String password = request.getParameter("password");

                    user.setEmail(email);
                    user.setFull_name(fullName);
                    user.setPhone(phone);
                    user.setGender(gender);
                    user.setPassword(password);

                    AccountDAO accountDAO = new AccountDAO();
                    boolean success = accountDAO.updateUser(user); // Now follows the correct connection pattern

                    if (success) {
                              session.setAttribute(CommonConst.SESSION_ACCOUNT, user);
                              request.setAttribute("message", "Account updated successfully!");
                    } else {
                              request.setAttribute("message", "Failed to update account.");
                    }

                    request.getRequestDispatcher("account.jsp").forward(request, response);
          }
}
