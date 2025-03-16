/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.product;

import com.google.gson.Gson;
import dao.BrandDAO;
import dao.FeedbackDAO;
import dao.ProductCategoryDAO;
import dao.ProductDAO;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import java.util.Vector;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.HashMap;
import java.util.Map;
import model.Brand;
import model.Product;
import model.ProductCategory;

/**
 *
 * @author tiend
 */
@jakarta.servlet.annotation.WebServlet(name = "ProductList", urlPatterns = {"/ProductList"})
public class ProductList extends jakarta.servlet.http.HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(jakarta.servlet.http.HttpServletRequest request, jakarta.servlet.http.HttpServletResponse response)
            throws jakarta.servlet.ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try ( PrintWriter out = response.getWriter()) {
            HttpSession session = request.getSession();
            /* TODO output your page here. You may use following sample code. */
            //remove session 
            session.removeAttribute("pickedCategory");
            session.removeAttribute("pickedBrand");
            ProductDAO daoProduct = new ProductDAO();
            ProductCategoryDAO daoProductCategory = new ProductCategoryDAO();
            BrandDAO daoBrand = new BrandDAO();
            FeedbackDAO feedbackDAO = new FeedbackDAO();
     
            //get latest product
            Vector<Product> latestProduct = daoProduct.top6LastestProduct();
            
            //get categories
            Vector<ProductCategory> listPCategories = daoProductCategory.getAllCategories();
            Vector<Product> listProduct = daoProduct.getAllProduct();
            
            // Tạo một Map để chứa avgRating cho từng sản phẩm dưới dạng chuỗi
            Map<Integer, String> productRatings = new HashMap<>();
            // Lặp qua từng sản phẩm và lấy avgRating từ FeedbackDAO
            for (Product product : listProduct) {
                double avgRating = feedbackDAO.getAverageRating(product.getID());

                // Nếu không có đánh giá (avgRating là NaN), đặt giá trị là "0"
                if (Double.isNaN(avgRating)) {
                    productRatings.put(product.getID(), "0");
                } else {
                    // Chuyển avgRating thành chuỗi và làm tròn đến 1 chữ số thập phân
                    productRatings.put(product.getID(), String.format("%.1f", avgRating));
                }
            }

           
            //Using JSON to pagination with client render
            Gson gson = new Gson();
            String listProductGson = gson.toJson(listProduct);
            String productRatingsJSON = gson.toJson(productRatings);
           
            //get all Brand
            Vector<Brand> listBrand = daoBrand.getAllBrand();
            request.setAttribute("listBrand", listBrand);
            
            //test pagination with JSON and Jquery here
            request.setAttribute("listProduct", listProductGson);
            
            //setup forward jsp file
            request.setAttribute("productRatingsJSON", productRatingsJSON);
            request.setAttribute("listPC", listPCategories);
            request.setAttribute("latestP", latestProduct);
            request.getRequestDispatcher("shop.jsp").forward(request, response);

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
    protected void doGet(jakarta.servlet.http.HttpServletRequest request, jakarta.servlet.http.HttpServletResponse response)
            throws jakarta.servlet.ServletException, IOException {
        processRequest(request, response);
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
    protected void doPost(jakarta.servlet.http.HttpServletRequest request, jakarta.servlet.http.HttpServletResponse response)
            throws jakarta.servlet.ServletException, IOException {
        processRequest(request, response);
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