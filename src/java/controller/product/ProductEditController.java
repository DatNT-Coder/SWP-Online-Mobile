/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.product;

import dao.BrandDAO;
import dao.ProductCategoryDAO;
import dao.ProductDAO;
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
import java.sql.Date;
import java.util.List;
import model.Brand;
import model.Product;
import model.ProductCategory;

@MultipartConfig(
        fileSizeThreshold = 1024 * 1024 * 10,
        maxFileSize = 1024 * 1024 * 50,
        maxRequestSize = 1024 * 1024 * 100
)

/**
 *
 * @author naokh
 */
@WebServlet(name = "ProductEditController", urlPatterns = {"/edit-product"})
public class ProductEditController extends HttpServlet {

   /**
    * Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
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
         out.println("<title>Servlet ProductEditController</title>");
         out.println("</head>");
         out.println("<body>");
         out.println("<h1>Servlet ProductEditController at " + request.getContextPath() + "</h1>");
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
      String id = request.getParameter("id");
      int idProduct = -1;
      try {
         idProduct = Integer.parseInt(id);
      } catch (Exception e) {
         response.sendRedirect("product-listAdmin");
      }
      ProductCategoryDAO prdCategory = new ProductCategoryDAO();
      BrandDAO brandDAO = new BrandDAO();
      ProductDAO prdDao = new ProductDAO();
      List<ProductCategory> listCategory = prdCategory.getAllCategories();
      List<Brand> brandList = brandDAO.getAllBrand();
      request.setAttribute("listCategory", listCategory);
      request.setAttribute("brandList", brandList);
      request.setAttribute("product", prdDao.getProductById(idProduct));
      request.getRequestDispatcher("ProductDetail.jsp").forward(request, response);
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
      String productImage = uploadFile(request);
      String productName = request.getParameter("productName");
      String id = request.getParameter("productID");
      String productCategory = request.getParameter("productCategory");
      String originPrice = request.getParameter("originalPrice");
      String salePrice = request.getParameter("salePrice");
      String costPrice = request.getParameter("costPrice");
      String stock = request.getParameter("stock");
      String productBrand = request.getParameter("brand");
      String description = request.getParameter("description");
      String status = request.getParameter("status");
      ProductDAO prdDAO = new ProductDAO();
      Product newProduct = new Product();
      int categoryId = -1;
      int brandId = -1;
      int statusInt = -1;
      int idInt = -1;

      try {
         categoryId = Integer.parseInt(productCategory);
         brandId = Integer.parseInt(productBrand);
         statusInt = Integer.parseInt(status);

         idInt = Integer.parseInt(id);
      } catch (Exception e) {
         request.setAttribute("error", e.getMessage() + categoryId + brandId + statusInt + id);
         request.getRequestDispatcher("ProductListMarketing.jsp").forward(request, response);
      }
      newProduct.setID(idInt);
      newProduct.setName(productName);
      newProduct.setProductCategory_ID(categoryId);
      newProduct.setBrandId(brandId);
      newProduct.setImage(productImage);
      newProduct.setOriginalPrice(Double.parseDouble(originPrice));
      newProduct.setSalePrice(Double.parseDouble(salePrice));
      newProduct.setCost_price(Double.parseDouble(costPrice));
      newProduct.setStock(Integer.parseInt(stock));
      newProduct.setDetails(description);
      newProduct.setStatus(statusInt);
      newProduct.setSettings_id(1);
      long millis = System.currentTimeMillis();

      // Chuyển đổi sang java.sql.Date
      Date sqlDate = new Date(millis);
      newProduct.setUpdatedDate(sqlDate);
      prdDAO.updateProduct(newProduct);
      response.sendRedirect("edit-product?id=" + idInt);
   }

   /**
    * Returns a short description of the servlet.
    *
    * @return a String containing servlet description
    */
   @Override
   public String getServletInfo() {
      return "Short description";
   }

   public String uploadFile(HttpServletRequest request) throws IOException, ServletException {
      String fileName = "";
      String uploadPath = getServletContext().getRealPath("") + File.separator + "images/shop";
      File uploadDir = new File(uploadPath);

      if (!uploadDir.exists()) {
         boolean created = uploadDir.mkdir();
      }

      for (Part part : request.getParts()) {
         fileName = getFileName(part);
         if (!fileName.isEmpty()) {
            part.write(uploadPath + File.separator + fileName);
            return fileName;
         }
      }
      return "";
   }

   private String getFileName(Part part) {
      String contentDisposition = part.getHeader("content-disposition");
      String[] tokens = contentDisposition.split(";");
      for (String token : tokens) {
         if (token.trim().startsWith("filename")) {
            return token.substring(token.indexOf("=") + 2, token.length() - 1);
         }
      }
      return "";
   }

}
