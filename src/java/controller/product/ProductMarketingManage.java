/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.product;

import dao.BrandDAO;
import dao.ProductCategoryDAO;
import dao.ProductDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Vector;
import model.Brand;
import model.ProductCategory;
import java.io.*;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;
import java.sql.Date;
import java.time.LocalDate;
import java.util.Map;
import model.Product;

/**
 *
 * @author alexf
 */
@WebServlet(name = "manageProductMarketing", urlPatterns = {"/marketing/manageProductMarketing"})
@MultipartConfig
public class ProductMarketingManage extends HttpServlet {

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
        try ( PrintWriter out = response.getWriter()) {
            HttpSession session = request.getSession();
            BrandDAO brandDAO = new BrandDAO();
            ProductCategoryDAO daoPC = new ProductCategoryDAO();
            ProductDAO daoProduct = new ProductDAO();
            String message = request.getParameter("msg");
            if (message.equals("loadAddProduct")) {
                Vector<Brand> listBrand = brandDAO.getAllBrand();
                Vector<ProductCategory> listPCategory = daoPC.getAllCategories();
                request.setAttribute("listBrand", listBrand);
                request.setAttribute("listPC", listPCategory);
                request.getRequestDispatcher("/Marketing_addProduct.jsp").forward(request, response);
            }
            if (message.equals("addProduct")) {
                String name = request.getParameter("pName");
                String details = request.getParameter("details");
                int category = Integer.parseInt(request.getParameter("category"));
                int brand = Integer.parseInt(request.getParameter("brand"));
                Double originalPrice = Double.parseDouble(request.getParameter("originalPrice"));
                Double salePrice = Double.parseDouble(request.getParameter("salePrice"));
                int stock = Integer.parseInt(request.getParameter("stock"));
                //Xử lý phần lấy ảnh
                Part filePart = request.getPart("productImage");// Lấy phần tệp từ yêu cầu
                String fileName = Paths.get(filePart.getSubmittedFileName()).getFileName().toString(); // Lấy tên tệp
                InputStream fileContent = filePart.getInputStream();// Lấy nội dung tệp
                try {
                    // Lưu tệp vào máy chủ
                    File uploads = new File("D:\\group6_shopmobile\\web\\assets\\img\\productImage");
                    File file = new File(uploads, fileName);
                    Files.copy(fileContent, file.toPath(), StandardCopyOption.REPLACE_EXISTING);
                } catch (IOException e) {
                    e.printStackTrace();
                }
                try {
                    // Thời gian chờ (được đặt bằng mili giây)
                    Thread.sleep(1500);
                } catch (InterruptedException ex) {
                    ex.printStackTrace();
                }
                //Lấy ngày cập nhật.
                Date updatedDate = Date.valueOf(LocalDate.now());
                //Bắt đầu lưu vào database
                //Tạm thời auto ẩn sản phẩm đi
                int productID = daoProduct.addProduct(new Product(name, originalPrice, salePrice, details, fileName, stock, category, updatedDate, 0, brand, 0.0, 1));
                if (productID > 0) {
                    request.setAttribute("message", "<span style=\"color:green;\">Tạo sản phẩm thành công, hãy hiển thị sản phẩm với khách hàng</span>");
                    Map<String, Object> productDetail = daoProduct.getProductByProductId(productID);
                    request.setAttribute("productDetails", productDetail);
                    request.getRequestDispatcher("/Marketing_viewProduct.jsp").forward(request, response);
                } else {
                    request.setAttribute("message", "<span style=\"color:red;\">Tạo sản phẩm không thành công!!!</span>");
                    request.getRequestDispatcher("/Marketing_viewProduct.jsp").forward(request, response);
                }

            }
            if (message.equals("loadEditProduct")) {
                int productId = Integer.parseInt(request.getParameter("pid"));
                Product product = daoProduct.getProductById(productId);
                Vector<Brand> listBrand = brandDAO.getAllBrand();
                Vector<ProductCategory> listPCategory = daoPC.getAllCategories();
                request.setAttribute("listBrand", listBrand);
                request.setAttribute("listPC", listPCategory);
                request.setAttribute("product", product);
                request.getRequestDispatcher("/Marketing_editProduct.jsp").forward(request, response);
            }
            if (message.equals("editProduct")) {
                int pid = Integer.parseInt(request.getParameter("pid"));
                //Xử lý nếu người dùng không cập nhật ảnh
                String oldImage = request.getParameter("oldImage");
                String name = request.getParameter("pName");
                String details = request.getParameter("details");
                int category = Integer.parseInt(request.getParameter("category"));
                int brand = Integer.parseInt(request.getParameter("brand"));
                Double originalPrice = Double.parseDouble(request.getParameter("originalPrice"));
                Double salePrice = Double.parseDouble(request.getParameter("salePrice"));
                int stock = Integer.parseInt(request.getParameter("stock"));
                //Xử lý phần lấy ảnh
                //Khác với thêm sản phẩm thì người dùng có thể đổi ảnh hoặc không.
                Part filePart = request.getPart("productImage"); // Lấy phần tệp từ yêu cầu
                String fileName = Paths.get(filePart.getSubmittedFileName()).getFileName().toString(); // Lấy tên tệp
                //Lấy ngày cập nhật.
                Date updatedDate = Date.valueOf(LocalDate.now());
                int isUpdated = 0;
                if (fileName == null || fileName.isEmpty()) {
                    // Người dùng không tải lên tệp
                    //Sửa sản phẩm
                    isUpdated = daoProduct.updateProduct(new Product(pid, name, originalPrice, salePrice, details, oldImage, stock, category, updatedDate, 0, brand, 0.0, 1));
                } else {
                    // Người dùng đã tải lên tệp
                    InputStream fileContent = filePart.getInputStream(); // Lấy nội dung tệp
                    try {
                        // Lưu tệp vào máy chủ
                        File uploads = new File("D:\\group6_shopmobile\\web\\assets\\img\\productImage");
                        File file = new File(uploads, fileName);
                        Files.copy(fileContent, file.toPath(), StandardCopyOption.REPLACE_EXISTING);
                    } catch (IOException e) {
                        e.printStackTrace();
                    }
                    try {
                        // Thời gian chờ (được đặt bằng mili giây)
                        Thread.sleep(1500);
                    } catch (InterruptedException ex) {
                        ex.printStackTrace();
                    }
                    //Sửa sản phẩm
                    isUpdated = daoProduct.updateProduct(new Product(pid, name, originalPrice, salePrice, details, fileName, stock, category, updatedDate, 0, brand, 0.0, 1));
                }

                
                if (isUpdated > 0) {
                    request.setAttribute("message", "<span style=\"color:green;\">Cập nhật sản phẩm thành công!</span>");
                    Map<String, Object> productDetail = daoProduct.getProductByProductId(pid);
                    request.setAttribute("productDetails", productDetail);
                    request.getRequestDispatcher("/Marketing_viewProduct.jsp").forward(request, response);
                } else {
                    request.setAttribute("message", "<span style=\"color:red;\">Cập nhật sản phẩm không thành công!!!</span>");
                    request.getRequestDispatcher("/Marketing_viewProduct.jsp").forward(request, response);
                }
            }
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
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
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
