package controller.user;

import constant.CommonConst;
import dao.AccountDAO;
import dao.UserDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;
import java.util.Random;
import model.User;

/**
 *
 * @author vuduc
 */
public class AuthenticationServlet extends HttpServlet {

    private static Map<String, VerificationCode> verificationCodes = new HashMap<>();

    public static Map<String, VerificationCode> getVerificationCodes() {
        return verificationCodes;
    }

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet AuthenticationServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet AuthenticationServlet at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String action = request.getParameter("action") != null
                ? request.getParameter("action")
                : "";

        String url;

        switch (action) {
            case "regis":
                url = "regis.jsp";
                break;
            case "change":
                url = "changepw.jsp";
                break;
            case "login":
                url = "login.jsp";
                break;
            case "logout":
                url = logOutDoGet(request, response);
                break;
            default:
                url = "HomePage";
        }

        request.getRequestDispatcher(url).forward(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String url;
        String action = request.getParameter("action") != null ? request.getParameter("action") : "";
        switch (action) {
            case "reset":
                url = resDoPost(request, response);
                break;
            case "login":
                url = logDoPost(request, response);
                break;
            case "regis":
                url = regDoPost(request, response);
                break;
            case "change":
                url = changeDoPost(request, response);
                break;
            case "resend":
                url = resendDoPost(request, response);
                break;
            default:
                url = "HomePage";
        }
        request.getRequestDispatcher(url).forward(request, response);
    }

    private String logDoPost(HttpServletRequest request, HttpServletResponse response) {
        AccountDAO d = new AccountDAO();
        String url = null;

        String email = request.getParameter("email");
        String password = request.getParameter("password");
        UserDAO accdal = new UserDAO();
        User a = accdal.checkUser(email, password);
        String fullName = accdal.getUserFullName(email, password);

        if (email.isEmpty() || password.isEmpty()) {
            request.setAttribute("emp", "Fill email, password !");
            url = "login.jsp";

        } else {
            User u = new User(email, password);
            User foundUserAccount = d.findEmailPasswordUser(u);
            User a = accdal.checkUser(email, password); // Đảm bảo biến a được khởi tạo
        int userRole = 0; // Giá trị mặc định
        if (a != null) {
            userRole = accdal.getUserRole(a.getId()); // Chỉ gọi getId() khi a không null
        }
            if (foundUserAccount != null) {
                if (foundUserAccount.getRole_id() == 1) {
                    request.getSession().setAttribute(CommonConst.SESSION_ACCOUNT, foundUserAccount); //luu len session để hiện logout trong home.jsp
                    request.getSession().setAttribute("user", foundUserAccount);
                    request.getSession().setAttribute("role", userRole);
                    request.getSession().setAttribute("profileUser", d.getDataUser(email, password));
                    request.getSession().setAttribute("full_name", fullName); 
                    url = "HomePage";
                    //false => quay tro lai trang login ( set them thong bao loi )
                } else if (foundUserAccount.getRole_id() == 5 || foundUserAccount.getRole_id() == 4) {
                    request.getSession().setAttribute(CommonConst.SESSION_ACCOUNT, foundUserAccount); //luu len session để hiện logout trong home.jsp
                    request.getSession().setAttribute("user", foundUserAccount);
                    request.getSession().setAttribute("role", userRole);
                    request.getSession().setAttribute("profileUser", d.getDataUser(email, password));
                    request.getSession().setAttribute("full_name", fullName);
                    url = "marketing/listFeedbackMarketing";
                }
            } else {
                request.setAttribute("error", "Email or Password is incorrect !");
                url = "login.jsp";
            }
        }
        return url;

    }

    private String logOutDoGet(HttpServletRequest request, HttpServletResponse response) {
        request.getSession().removeAttribute(CommonConst.SESSION_ACCOUNT);
        request.getSession().removeAttribute("user");
        return "HomePage";
    }

    private String regDoPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        AccountDAO dao = new AccountDAO();
        String url = null;

        String emailUser = request.getParameter("email");
        String password = request.getParameter("password");
        String username = request.getParameter("full_name");
        String phone = request.getParameter("phone");
        String gender = request.getParameter("gender");
        Date registrationDate = new Date(System.currentTimeMillis());
        int status = 1;
        int updatedBy = 0;
        Date updatedDate = null;
        String image = null;
        int settingsId = 1;

        //ktra null hoặc chuỗi rỗng "  "
        boolean hasError = false;
        if (password == null || password.trim().isEmpty()) {
            request.setAttribute("erPass", "Password cannot be empty.");
            hasError = true;
        } else if (password.contains(" ")) {  // Kiểm tra xem có khoảng trắng trong kí tự không
            request.setAttribute("erPass", "Password cannot contain spaces.");
            hasError = true;
        }

        if (username == null || username.trim().isEmpty()) {
            request.setAttribute("erName", "Name cannot be empty.");
            hasError = true;
        } else if (username.startsWith(" ") || username.endsWith(" ")) {
            request.setAttribute("erName", "Name cannot start or end with a space.");
            hasError = true;
        }

        if (emailUser == null || emailUser.trim().isEmpty()) {
            request.setAttribute("erEmail", "Email cannot be empty.");
            hasError = true;
        }
        if (hasError) {
            return url = "regis.jsp";
        }

        User ru = new User(emailUser, password, username, phone, gender, registrationDate, status, updatedBy, updatedDate, image, settingsId);

        boolean isExistUserEmail = dao.checkUserEmailExist(ru);

        if (isExistUserEmail) {
            request.setAttribute("erEmailExist", "Email is exist.");
            return url = "regis.jsp";
        } else {
            request.getSession().setAttribute(CommonConst.SESSION_REGISTER_USER_EMAIL, ru.getEmail());
            request.getSession().setAttribute(CommonConst.SESSION_REGISTER_USER, ru);
        }

        String codeToUser = generateVerificationCode();
        LocalDateTime expiryTime = LocalDateTime.now().plusMinutes(2); // Mã hết hạn sau 2 phút

        VerificationCode codeExpire = new VerificationCode(codeToUser, expiryTime);
        verificationCodes.put(emailUser, codeExpire);

        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("HH:mm:ss dd-MM-yyyy"); // Định dạng thời gian
        String formattedExpiryTime = codeExpire.getExpiryTime().format(formatter); // Format thời gian hết hạn

        //gui email o day
        EmailSender.sendEmail(ru.getEmail(), "Code verify", "Take this code to verify: " + codeExpire.getCode() + " This code will expire after: " + formattedExpiryTime);

        url = "verify.jsp";
        return url;

    }

    private String generateVerificationCode() {
        Random random = new Random();
        return String.format("%06d", random.nextInt(1000000));
    }

    private String resendDoPost(HttpServletRequest request, HttpServletResponse response) {
        String url;

        User u = (User) request.getSession().getAttribute("registerUser");

        // xóa key cũ đi để tránh tốn dung lượng k xóa đi cũng k sao nhưng sẽ có thể lag máy
        verificationCodes.remove(u.getEmail());

        String codeToUser = generateVerificationCode();
        LocalDateTime expiryTime = LocalDateTime.now().plusMinutes(2); // Mã hết hạn sau 2 phút

        VerificationCode codeExpire = new VerificationCode(codeToUser, expiryTime);
        verificationCodes.put(u.getEmail(), codeExpire);

        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("HH:mm:ss dd-MM-yyyy"); // Định dạng thời gian
        String formattedExpiryTime = codeExpire.getExpiryTime().format(formatter); // Format thời gian hết hạn

        //gui email o day
        EmailSender.sendEmail(u.getEmail(), "Code verify", "Take this code to verify: " + codeExpire.getCode() + " This code will expire after: " + formattedExpiryTime);

        url = "verify.jsp";
        return url;
    }

    private String changeDoPost(HttpServletRequest request, HttpServletResponse response) {
        String url = null;

        String email = request.getParameter("email");
        String oldPassword = request.getParameter("oldPassword");
        String newPassword = request.getParameter("newPassword");
        String newPasswordAgain = request.getParameter("newPasswordAgain");

        // Kiểm tra sự tồn tại của email trong cơ sở dữ liệu
        AccountDAO accountDAO = new AccountDAO();
        boolean isEmailExist = accountDAO.checkUserEmailExistString(email);
        if (!isEmailExist) {
            request.setAttribute("errorMessage", "Email không tồn tại trong hệ thống.");
            url = "changepw.jsp"; // Quay lại trang đổi mật khẩu với thông báo lỗi
            return url;
        }

        // Kiểm tra mật khẩu cũ có đúng không (giả sử bạn có một phương thức xác minh mật khẩu cũ)
        boolean isOldPasswordValid = accountDAO.checkOldPassword(email, oldPassword);
        if (!isOldPasswordValid) {
            request.setAttribute("errorMessage", "Mật khẩu cũ không đúng.");
            url = "changepw.jsp"; // Quay lại trang đổi mật khẩu với thông báo lỗi
            return url;
        }

        // Kiểm tra xem mật khẩu mới và mật khẩu xác nhận có khớp không
        if (newPassword == null || !newPassword.equals(newPasswordAgain) || newPassword.isEmpty() || newPasswordAgain.isEmpty()) {
            request.setAttribute("errorMessage", "Mật khẩu mới và xác nhận mật khẩu không hợp lệ.");
            url = "changepw.jsp"; // Chuyển hướng về trang đổi mật khẩu với thông báo lỗi
            return url;
        }

        // Cập nhật mật khẩu mới vào cơ sở dữ liệu
        boolean isUpdated = accountDAO.updatePassword(email, newPassword);
        if (isUpdated) {
            url = "HomePage";
        } else {
            // Nếu có lỗi trong việc cập nhật mật khẩu, hiển thị thông báo lỗi
            request.setAttribute("errorMessage", "Đã xảy ra lỗi trong quá trình cập nhật mật khẩu.");
            url = "changepw.jsp";
        }
        return url;
    }

    private String resDoPost(HttpServletRequest request, HttpServletResponse response) {
        AccountDAO d = new AccountDAO();

        String url;
        String emailReset = request.getParameter("email");
        User u = new User(emailReset);

        boolean isExistUserEmail = d.checkUserEmailExist(u);
        if (!isExistUserEmail) {
            request.setAttribute("erEmailNotExist", "Email is not exist.");
            return url = "login.jsp";
        } else {
            request.getSession().setAttribute(CommonConst.SESSION_RESET_USER_EMAIL, u.getEmail());
        }

        String codeToUser = generateVerificationCode();
        LocalDateTime expiryTime = LocalDateTime.now().plusMinutes(2); // Mã hết hạn sau 2 phút

        VerificationCode codeExpire = new VerificationCode(codeToUser, expiryTime);
        verificationCodes.put(emailReset, codeExpire); //biến hashmap lưu giá trị 

        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("HH:mm:ss dd-MM-yyyy"); // Định dạng thời gian
        String formattedExpiryTime = codeExpire.getExpiryTime().format(formatter); // Format thời gian hết hạn

        //gui email o day
        EmailSender.sendEmail(u.getEmail(), "Code verify", "Take this code to verify: " + codeExpire.getCode() + " This code will expire after: " + formattedExpiryTime);

        url = "reset.jsp";
        return url;

    }

}