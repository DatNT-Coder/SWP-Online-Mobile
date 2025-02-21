/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.feedback;

import dao.BrandDAO;
import dao.FeedbackDAO;
import dao.ProductCategoryDAO;
import dao.ProductDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Vector;
import model.Brand;
import model.GeneralFeedback;
import model.ProductCategory;
import model.User;

/**
 *
 * @author tiend
 */
@WebServlet(name = "feedbackGeneral", urlPatterns = {"/feedback"})
public class FeedbackGeneral extends HttpServlet {

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
        int rating = Integer.parseInt(request.getParameter("rating"));
        String comment = request.getParameter("comment");
        BrandDAO daoBrand = new BrandDAO();
        ProductDAO daoP = new ProductDAO();
        FeedbackDAO dao = new FeedbackDAO();
        ProductCategoryDAO daoProductCategory = new ProductCategoryDAO();
        Vector<ProductCategory> listPCategories = daoProductCategory.getAllCategories();
        int generalFeedbackId = dao.addGeneralFeedback(new GeneralFeedback(rating, comment, comment, comment, comment, rating, comment, comment, rating, rating, comment));

        //get all Brand
        Vector<Brand> listBrand = daoBrand.getAllBrand();
        request.setAttribute("listPC", listPCategories);
        request.setAttribute("listBrand", listBrand);
        request.getRequestDispatcher("/feedbackGeneral.jsp").forward(request, response);
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

        // Load data
        BrandDAO daoBrand = new BrandDAO();
        ProductCategoryDAO daoProductCategory = new ProductCategoryDAO();
        Vector<ProductCategory> listPCategories = daoProductCategory.getAllCategories();

        // Get all Brand
        Vector<Brand> listBrand = daoBrand.getAllBrand();
        request.setAttribute("listPC", listPCategories);
        request.setAttribute("listBrand", listBrand);

        // Forward to JSP
        request.getRequestDispatcher("/feedbackGeneral.jsp").forward(request, response);
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
        HttpSession session = request.getSession();
        User userProfile = (User) session.getAttribute("user");
        // Insert data
        String fullname = request.getParameter("full_name");
        String email = request.getParameter("email");
        String phone = request.getParameter("phone");
        String gender = request.getParameter("gender");
        int rating = Integer.parseInt(request.getParameter("rating"));
        String comment = request.getParameter("comment");
        FeedbackDAO dao = new FeedbackDAO();
        int generalFeedbackId = dao.addGeneralFeedback(new GeneralFeedback(fullname, gender, email, phone, rating, null, comment, userProfile.getId(), 1, null));
//        // Store feedback in request
//        request.setAttribute("feedback", feedback);
        try {
            // Thời gian chờ (được đặt bằng mili giây)
            Thread.sleep(1500);
        } catch (InterruptedException ex) {
            ex.printStackTrace();
        }
        //Email
        String subject = "Verify Your Email - Your Website.";
        String content = "<!DOCTYPE html>\n"
                + "<html lang=\"en\">\n"
                + "\n"
                + "    <head>\n"
                + "        <meta charset=\"UTF-8\">\n"
                + "        <meta http-equiv=\"X-UA-Compatible\" content=\"IE=edge\">\n"
                + "        <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">\n"
                + "        <title>Bootstrap 5 Thank You Example</title>\n"
                + "        <link href=\"https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css\" rel=\"stylesheet\">\n"
                + "    </head>\n"
                + "\n"
                + "    <body>\n"
                + "        <div class=\"vh-100 d-flex justify-content-center align-items-center\">\n"
                + "            <div>\n"
                + "                <div class=\"mb-4 text-center\">\n"
                + "                    <svg xmlns=\"http://www.w3.org/2000/svg\" class=\"text-success\" width=\"75\" height=\"75\"\n"
                + "                        fill=\"currentColor\" class=\"bi bi-check-circle-fill\" viewBox=\"0 0 16 16\">\n"
                + "                        <path\n"
                + "                            d=\"M16 8A8 8 0 1 1 0 8a8 8 0 0 1 16 0zm-3.97-3.03a.75.75 0 0 0-1.08.022L7.477 9.417 5.384 7.323a.75.75 0 0 0-1.06 1.06L6.97 11.03a.75.75 0 0 0 1.079-.02l3.992-4.99a.75.75 0 0 0-.01-1.05z\" />\n"
                + "                    </svg>\n"
                + "                </div>\n"
                + "                <div class=\"text-center\">\n"
                + "                    <h1>Cảm ơn bạn đã phản hồi !</h1>\n"
                + "                    <p>Chúng tôi đã ghi nhận phản hồi của bạn và sẽ cải thiện sản phẩm trong thời gian sớm nhất </p>\n"
                + "                </div>\n"
                + "            </div>\n"
                + "    </body>\n"
                + "\n"
                + "</html>";

//        Email.sendEmail(email, subject, content);
        // Redirect or forward user after successful insert
        response.sendRedirect("Home");
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
