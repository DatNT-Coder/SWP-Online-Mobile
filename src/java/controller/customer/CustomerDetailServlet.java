/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.customer;

import dao.AccountDAO;
import dao.CustomerDetailDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
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
import model.UserAddress;
import utils.Helper;

/**
 *
 * @author admin
 */
@MultipartConfig(
        fileSizeThreshold = 1024 * 1024, // 1 MB
        maxFileSize = 1024 * 1024 * 5, // 5 MB
        maxRequestSize = 1024 * 1024 * 10 // 10 MB
)
public class CustomerDetailServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    private CustomerDetailDAO customerDetailDAO = new CustomerDetailDAO();

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
            out.println("<title>Servlet CustomerDetailServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet CustomerDetailServlet at " + request.getContextPath() + "</h1>");
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
//// Lấy danh sách khách hàng từ database
//        List<User> customers = customerDetailDAO.getCustomerList();
//
//        // Gửi danh sách này sang JSP
//        request.setAttribute("customers", customers);
//        request.getRequestDispatcher("/CustomerDetail.jsp").forward(request, response);
        try {
            String id = request.getParameter("id");
            AccountDAO accountDAO = new AccountDAO();
            User u = accountDAO.getUserById(id);
            request.setAttribute("u", u);
            request.getRequestDispatcher("UpdateCustomer.jsp").forward(request, response);
        } catch (Exception e) {
            e.printStackTrace();
        }
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
//        String fullName = request.getParameter("fullName");
//        String gender = request.getParameter("gender");
//        String email = request.getParameter("email");
//        String phone = request.getParameter("mobile");
//        String address = request.getParameter("address");
//
//        int updatedBy = 1;
//        CustomerDetailDAO da = new CustomerDetailDAO();
//        if (request.getParameter("save") != null) {
//
//        }
//        // Lưu thông tin khách hàng
//        customerDetailDAO.saveCustomer(fullName, gender, email, phone, address, updatedBy);
//
//        request.getRequestDispatcher("CustomerDetail.jsp").forward(request, response);
        response.setContentType("text/html;charset=UTF-8");
        try {
            int id = Integer.parseInt(request.getParameter("id"));
            String fullname = request.getParameter("fullName");
            String mobile = request.getParameter("phone");
            String gender = request.getParameter("gender");
            String address = request.getParameter("address");
            String oldImage = request.getParameter("oldImage");
            int status = Integer.parseInt(request.getParameter("status"));
            int updateBy = 0;
            Date updateDate = new Date(System.currentTimeMillis());

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
            } else {
                imageFile = oldImage;
            }

            AccountDAO accountDAO = new AccountDAO();

            User user = new User(id, fullname, mobile, gender, status, updateBy, updateDate, imageFile, new UserAddress(address, id));
            accountDAO.updateUserToDB(user);

            request.setAttribute("success", "Update success");
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
