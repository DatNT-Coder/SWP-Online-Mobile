/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package controller.product;

import dao.BrandDAO;
import dao.FeedbackDAO;
import dao.ProductCategoryDAO;
import dao.ProductDAO;
import dao.ProductDetailDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;
import java.io.IOException;
import java.util.List;
import java.util.Vector;
import model.Brand;
import model.Product;
import model.ProductCategory;
import model.ProductDetail;
import model.ProductFeedback;
import model.User;

/**
 *
 * @author tiend
 */
@WebServlet(name = "ProductDetails", urlPatterns = {"/ProductDetails"})
@MultipartConfig(
        fileSizeThreshold = 1024 * 1024 * 1, // 1 MB
        maxFileSize = 1024 * 1024 * 10, // 10 MB
        maxRequestSize = 1024 * 1024 * 100 // 100 MB
)
public class ProductDetailController extends HttpServlet {

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
        HttpSession session = request.getSession();
        String id = request.getParameter("pid");
        String cateID_r = request.getParameter("cid");
        String brandID_r = request.getParameter("bid");

        int cateID = 0;
        int brandID = 0;
        if (cateID_r != null && brandID_r != null) {
            cateID = Integer.parseInt(cateID_r);
            brandID = Integer.parseInt(brandID_r);
        }
        ProductDetailDAO dao = new ProductDetailDAO();
        ProductDAO daoP = new ProductDAO();
        FeedbackDAO daoFeedback = new FeedbackDAO();
        List<ProductFeedback> listFeedback = daoFeedback.findFeedbackbyProductID(Integer.parseInt(id));
        List<Product> latestProduct = dao.latestProduct();
        ProductDetail productDetail = dao.getProductById(id);
        Product pById = daoP.getProductById(Integer.parseInt(id));
        ProductCategoryDAO daoProductCategory = new ProductCategoryDAO();
        ProductCategoryDAO pcg = new ProductCategoryDAO();
        BrandDAO daoBrand = new BrandDAO();
        Vector<ProductCategory> listC = pcg.getAllCategories();
        Vector<ProductCategory> listPCategories = daoProductCategory.getAllCategories();

        request.setAttribute("listC", listC);
        request.setAttribute("productDetail", productDetail);
        request.setAttribute("latestP", latestProduct);
        request.setAttribute("listPC", listPCategories);
        request.setAttribute("listFeedback", listFeedback);
        session.setAttribute("pickedCategory", pById.getProductCategory_ID());
        session.setAttribute("pickedBrand", pById.getBrandId());
        //get all Brand
        Vector<Brand> listBrand = daoBrand.getAllBrand();
        request.setAttribute("listBrand", listBrand);
        request.getRequestDispatcher("product-details.jsp").forward(request, response);
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
        HttpSession session = request.getSession();
        User userProfile = (User) session.getAttribute("user");
        int role = (Integer) session.getAttribute("role");
        if (role == 1) {
            FeedbackDAO dao = new FeedbackDAO();
            ProductDAO daoP = new ProductDAO();
            // Retrieve feedback data from the form
            String fullName = request.getParameter("full_name");
            String email = request.getParameter("email");
            String phone = request.getParameter("phone");
            String gender = request.getParameter("gender");
            int rating = Integer.parseInt(request.getParameter("rating"));
            String comment = request.getParameter("comment");
            Part filePart = request.getPart("feedbackImage");
            String fileName = filePart.getSubmittedFileName();
            // Retrieve product ID from the session
            int productId = Integer.parseInt(request.getParameter("pickedProduct"));
            // Retrieve user ID from the session (assuming you have stored it during login)
            int userId = userProfile.getId();
            // Create a ProductFeedback object with the collected data
            ProductFeedback feedback = new ProductFeedback();

            if (filePart.getSubmittedFileName().isEmpty() || filePart.getSubmittedFileName() == null) {
                feedback.setFull_name(fullName);
                feedback.setEmail(email);
                feedback.setPhone(phone);
                feedback.setGender(gender);
                feedback.setRating(rating);
                feedback.setComment(comment);
                feedback.setImage("");
                feedback.setProduct_Id(productId);
                feedback.setUser_Id(userId);
                feedback.setStatus(1);
                dao.addFeedback(feedback);
            } else {

                filePart.write("D:\\group6_shopmobile\\web\\assets\\img\\feedbackImage\\" + fileName);
                feedback.setFull_name(fullName);
                feedback.setEmail(email);
                feedback.setPhone(phone);
                feedback.setGender(gender);
                feedback.setRating(rating);
                feedback.setComment(comment);
                feedback.setImage(fileName);
                feedback.setProduct_Id(productId);
                feedback.setUser_Id(userId);
                feedback.setStatus(1);
                dao.addFeedback(feedback);
            }
            try {
                // Thời gian chờ (được đặt bằng mili giây)
                Thread.sleep(1500);
            } catch (InterruptedException ex) {
                ex.printStackTrace();
            }
            Product b = daoP.getProductById(productId);
            // You may want to redirect the user to a confirmation page
            response.sendRedirect("productDetail?bid=" + b.getBrandId() + "&cid=" + b.getProductCategory_ID() + "&pid=" + productId);
        } 
        else {
            response.sendRedirect("/mobileshop/404.jsp"); 
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

