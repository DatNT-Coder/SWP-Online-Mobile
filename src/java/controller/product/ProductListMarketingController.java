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
import java.util.List;
import java.util.Locale;
import model.Brand;
import model.Product;
import model.ProductCategory;

/**
 *
 * @author KieuVietPhuoc
 */
@WebServlet(name = "ProductListMarketingController", urlPatterns = {"/product-listAdmin"})
@MultipartConfig(
        fileSizeThreshold = 1024 * 1024 * 10,
        maxFileSize = 1024 * 1024 * 50,
        maxRequestSize = 1024 * 1024 * 100
)
public class ProductListMarketingController extends HttpServlet {

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
      String search = request.getParameter("search");
      String category = request.getParameter("category");
      String brand = request.getParameter("brand");
      String status = request.getParameter("status");
      String page = request.getParameter("page");

      if (search == null) {
         search = "";
      }
      if (page == null || page == "") {
         page = "1";
      }
      ProductDAO prdList = new ProductDAO();
      ProductCategoryDAO prdCategory = new ProductCategoryDAO();
      BrandDAO brandDAO = new BrandDAO();
      List<Product> list = prdList.searchProduct(search, category, brand, null, null, "10", page, status);
      List<Product> listA = prdList.searchProduct(search, category, brand, null, null, "999999999999999999999", "1", status);
      List<ProductCategory> listCategory = prdCategory.getAllCategories();
      int totalSearch = listA.size();
      int totalPage = totalSearch / 10;
      if (totalSearch % 10 != 0) {
         totalPage += 1;
      }

      List<Brand> brandList = brandDAO.getAllBrand();
      request.setAttribute("totalPage", totalPage);
      request.setAttribute("search", search);
      request.setAttribute("list", list);
      request.setAttribute("listCategory", listCategory);
      request.setAttribute("brandList", brandList);
      request.setAttribute("category", category);
      request.setAttribute("status", status);
      request.setAttribute("page", page);
      request.setAttribute("pagination_url", "product-listAdmin?");
      request.getSession().setAttribute("backlink", "product-listAdmin");
      request.getRequestDispatcher("ProductListMarketing.jsp").forward(request, response);

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
      String productCategory = request.getParameter("categoryId");
      String originPrice = request.getParameter("originPrice");
      String salePrice = request.getParameter("salePrice");
      String costPrice = request.getParameter("costPrice");
      String stock = request.getParameter("stock");
      String productBrand = request.getParameter("productBrand");
      String description = request.getParameter("description");
      String status = request.getParameter("status");
      ProductDAO prdDAO = new ProductDAO();
      Product newProduct = new Product();
      int categoryId = -1;
      int brandId = -1;
      int statusInt = -1;
      try {
         categoryId = Integer.parseInt(productCategory);
         brandId = Integer.parseInt(productBrand);
         statusInt = Integer.parseInt(status);

      } catch (Exception e) {
         request.setAttribute("error", e.getMessage() + categoryId + brandId + statusInt);
         request.getRequestDispatcher("ProductListMarketing.jsp").forward(request, response);
      }
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
      prdDAO.addProduct(newProduct);
      ProductDAO prdList = new ProductDAO();
      ProductCategoryDAO prdCategory = new ProductCategoryDAO();
      BrandDAO brandDAO = new BrandDAO();
      List<Product> listA = prdList.searchProduct("", "", "", null, null, "999999999999999999999", "1", status);
      List<ProductCategory> listCategory = prdCategory.getAllCategories();
      int totalSearch = listA.size();
      int totalPage = totalSearch / 10;
      if (totalSearch % 10 != 0) {
         totalPage += 1;
      }

      List<Brand> brandList = brandDAO.getAllBrand();
      List<Product> list = prdList.searchProduct("", "", "", null, null, "10", "1", "");
      request.setAttribute("totalPage", totalPage);
      request.setAttribute("search", "");
      request.setAttribute("list", list);
      request.setAttribute("listCategory", listCategory);
      request.setAttribute("brandList", brandList);
      request.setAttribute("category", "");
      request.setAttribute("status", status);
      request.setAttribute("page", 1);
      request.setAttribute("pagination_url", "product-listAdmin?");
      request.setAttribute("success", "Add Success");
      request.getRequestDispatcher("ProductListMarketing.jsp").forward(request, response);
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
