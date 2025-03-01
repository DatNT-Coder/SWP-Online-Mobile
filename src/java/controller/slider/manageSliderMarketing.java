/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.slider;

import dao.BrandDAO;
import dao.DAOProduct;
import dao.DAOProductCategory;
import dao.SliderDAO;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.http.HttpSession;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.Vector;
import model.Brand;
import model.ProductCategory;
import java.io.*;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;
import java.sql.Date;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.Map;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.Part;
import model.Product;
import model.Slider;

/**
 *
 * @author alexf
 */
@WebServlet(name = "manageSliderMarketing", urlPatterns = {"/marketing/manageSliderMarketing"})
@MultipartConfig
public class manageSliderMarketing extends HttpServlet {

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

            SliderDAO daoProduct = new SliderDAO();
            String message = request.getParameter("msg");
            if (message.equals("loadAddSlider")) {

                request.getRequestDispatcher("/Marketing_addSlider.jsp").forward(request, response);
            }
            if (message.equals("addSlider")) {
                String title = request.getParameter("pName");
                String notes = request.getParameter("details");
                String backlink = request.getParameter("backlink");

                //Xử lý phần lấy ảnh
                Part filePart = request.getPart("productImage");// Lấy phần tệp từ yêu cầu
                String fileName = Paths.get(filePart.getSubmittedFileName()).getFileName().toString(); // Lấy tên tệp
                InputStream fileContent = filePart.getInputStream();// Lấy nội dung tệp
                try {
                    // Lưu tệp vào máy chủ
                    File uploads = new File("D:\\group6_shopmobile\\web\\assets\\img\\slider");
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
                int productID = daoProduct.addSlider(new Slider(title, fileName,backlink, 0, notes, 1, updatedDate));
                if (productID > 0) {
                    request.setAttribute("message", "<span style=\"color:green;\">Tạo slider thành công, hãy hiển thị slider với khách hàng</span>");
                    Map<String, Object> productDetail = daoProduct.getSliderBySliderID(productID);
                    request.setAttribute("productDetails", productDetail);
                    request.getRequestDispatcher("/Marketing_viewSlider.jsp").forward(request, response);
                } else {
                    request.setAttribute("message", "<span style=\"color:red;\">Tạo slider không thành công!!!</span>");
                    request.getRequestDispatcher("/Marketing_viewSlider.jsp").forward(request, response);
                }

            }
            if (message.equals("loadEditSlider")) {
                int productId = Integer.parseInt(request.getParameter("pid"));
                Slider product = daoProduct.getSliderById(productId);

                request.setAttribute("product", product);
                request.getRequestDispatcher("/Marketing_editSlider.jsp").forward(request, response);
            }
            if (message.equals("editSlider")) {
                int pid = Integer.parseInt(request.getParameter("pid"));
                //Xử lý nếu người dùng không cập nhật ảnh
                String oldImage = request.getParameter("oldImage");
                String title = request.getParameter("pName");
                String notes = request.getParameter("details");
                String backlink = request.getParameter("backlink");
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
                    isUpdated = daoProduct.updateSlider(new Slider(pid,title,oldImage, backlink,0, notes, 1, updatedDate));
                } else {
                    // Người dùng đã tải lên tệp
                    InputStream fileContent = filePart.getInputStream(); // Lấy nội dung tệp
                    try {
                        // Lưu tệp vào máy chủ
                        File uploads = new File("D:\\group6_shopmobile\\web\\assets\\img\\slider");
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
                    isUpdated = daoProduct.updateSlider(new Slider(pid,title,fileName, backlink,0, notes, 1, updatedDate));
                }

                if (isUpdated > 0) {
                    request.setAttribute("message", "<span style=\"color:green;\">Cập nhật slider thành công!</span>");
                    Map<String, Object> productDetail = daoProduct.getSliderBySliderID(pid);
                    request.setAttribute("productDetails", productDetail);
                    request.getRequestDispatcher("/Marketing_viewSlider.jsp").forward(request, response);
                } else {
                    request.setAttribute("message", "<span style=\"color:red;\">cập nhật slider không thành công!!!</span>");
                    request.getRequestDispatcher("/Marketing_viewSlider.jsp").forward(request, response);
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
