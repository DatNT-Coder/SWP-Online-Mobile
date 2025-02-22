/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.customer;

import controller.user.EmailSender;
import dao.AccountDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;
import java.io.File;
import java.io.InputStream;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.Date;
import java.util.List;
import model.User;
import utils.Helper;

/**
 *
 * @author
 */
@WebServlet(name = "CreateCustomerController", urlPatterns = {"/create-customer"})
@MultipartConfig(
        fileSizeThreshold = 1024 * 1024, // 1 MB
        maxFileSize = 1024 * 1024 * 5, // 5 MB
        maxRequestSize = 1024 * 1024 * 10 // 10 MB
)
public class CreateCustomerController extends HttpServlet {

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
         response.setContentType("text/html;charset=UTF-8");
         request.getRequestDispatcher("CreateCustomer.jsp").forward(request, response);
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
        response.setContentType("text/html;charset=UTF-8");
        try {
            String fullname = request.getParameter("fullName");
//            String username = request.getParameter("username");
            String password = Helper.randomString(8);
            String email = request.getParameter("email");
            String mobile = request.getParameter("phone");
            String gender = request.getParameter("gender");
            String address = request.getParameter("address");
            int role = 1;
            int status = 1;
            int settingsId = 1;
            int updateBy = 0;
            Date registrationDate = new Date(System.currentTimeMillis());
            
            
            // Xử lý file image upload
            Part filePart = request.getPart("image");
            String imageFilePath = null;
            String imageFile = null;
            if (filePart != null && filePart.getSize() > 0) {
                String fileName = Helper.extractFileName(filePart);
                String applicationPath = getServletContext().getRealPath("");
                String uploadFilePath = applicationPath + File.separator + Helper.UPLOAD_IMAGES_DIR;

                // Tạo thư mục nếu chưa tồn tại
                File uploadDir = new File(uploadFilePath);
                if (!uploadDir.exists()) {
                    uploadDir.mkdir();
                }

                // Lưu file hình ảnh
                imageFilePath = uploadFilePath + File.separator + fileName;
                try (InputStream fileContent = filePart.getInputStream()) {
                    // Nếu file chưa tồn tại thì lưu ảnh
                    Path destinationPath = Paths.get(imageFilePath);
                    if (!Files.exists(destinationPath)) {
                        Files.copy(fileContent, new File(imageFilePath).toPath());
                    }
                }
                //get link image
                imageFile = Helper.UPLOAD_IMAGES_DIR + File.separator + fileName;
            }
            
            
            AccountDAO accountDAO = new AccountDAO();
            boolean isEmailExists = accountDAO.checkUserEmailExistString(email);
            if (!isEmailExists) {
                User user = new User(email, password, fullname, mobile, gender, registrationDate, status, updateBy, null, imageFile, settingsId);
                accountDAO.insertUserToDB(user, address);
                //send password to mail
//                EmailSender.sendEmail(email, "Password!", "Your email and password is: " + email + " and " + password);

                request.setAttribute("success", "Add success");
            } else {
                request.setAttribute("error", "Email existed");
            }
            response.sendRedirect("customerList");
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
