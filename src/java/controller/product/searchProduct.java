/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.product;

import com.google.gson.Gson;
import dao.BrandDAO;
import dao.ProductCategoryDAO;
import dao.ProductDAO;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Vector;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Brand;
import model.Product;
import model.ProductCategory;

/**
 *
 * @author tiend
 */
@jakarta.servlet.annotation.WebServlet(name = "searchProduct", urlPatterns = {"/searchProduct"})
public class searchProduct extends jakarta.servlet.http.HttpServlet {

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
            /* TODO output your page here. You may use following sample code. */
            HttpSession session = request.getSession();
            ProductDAO daoProduct = new ProductDAO();
            ProductCategoryDAO daoProductCategory = new ProductCategoryDAO();
            BrandDAO daoBrand = new BrandDAO();
            Gson gson = new Gson();
            String action = request.getParameter("action");
            if (action != null && action.equals("searchByWord")) {
                //remove session 
                session.removeAttribute("pickedCategory");
                session.removeAttribute("pickedBrand");
                String search = request.getParameter("searchBox");
                Vector<Product> listProductBySearch = daoProduct.getProductBySearch(search);
                String listProductBySearchGson = gson.toJson(listProductBySearch);
                request.setAttribute("listProduct", listProductBySearchGson);
                request.setAttribute("searchResult", "Đã tìm thấy <span style='color:red;' >" + listProductBySearch.size() + "</span> sản phẩm phù hợp.");
                //get categories
                Vector<ProductCategory> listPCategories = daoProductCategory.getAllCategories();
                request.setAttribute("listPC", listPCategories);
                Vector<Brand> listBrand = daoBrand.getAllBrand();
                request.setAttribute("listBrand", listBrand);
                //get latest product
                Vector<Product> latestProduct = daoProduct.top6LastestProduct();
                request.setAttribute("latestP", latestProduct);
                
                request.getRequestDispatcher("shop.jsp").forward(request, response);
            }
            if (action != null && action.equals("pickCategory")) {
                //remove session
                session.removeAttribute("pickedBrand");
                int cid = Integer.parseInt(request.getParameter("cid"));
                Vector<Product> listProductBySearch = daoProduct.searchProduct(cid, null, null, null);
                String listProductBySearchGson = gson.toJson(listProductBySearch);
                request.setAttribute("listProduct", listProductBySearchGson);
                //get categories
                Vector<ProductCategory> listPCategories = daoProductCategory.getAllCategories();
                request.setAttribute("listPC", listPCategories);
                //Get brand by category
                Vector<Brand> listBrand = daoBrand.getBrandByCategoryID(cid);
                request.setAttribute("listBrand", listBrand);
                session.setAttribute("pickedCategory", cid);
                request.setAttribute("searchResult", "Đã tìm thấy <span style='color:red;' >" + listProductBySearch.size() + "</span> sản phẩm phù hợp.");
                
                //get latest product
                Vector<Product> latestProduct = daoProduct.top6LastestProduct();
                request.setAttribute("latestP", latestProduct);
                                
                request.getRequestDispatcher("shop.jsp").forward(request, response);
            }
            if (action != null && action.equals("pickBrand")) {
                Integer cid = (Integer) session.getAttribute("pickedCategory");
                int brandId = Integer.parseInt(request.getParameter("brandId"));
                Vector<Product> listProductBySearch;
                if (cid == null) {
                    // Nếu không có cid nào được chọn, hiển thị tất cả sản phẩm thỏa mãn brand
                    listProductBySearch = daoProduct.searchProduct(null, brandId, null, null);
                } else {
                    // Nếu có cid được chọn, hiển thị sản phẩm thỏa mãn cả category và brand
                    listProductBySearch = daoProduct.searchProduct(cid, brandId, null, null);
                }
                String listProductBySearchGson = gson.toJson(listProductBySearch);
                request.setAttribute("listProduct", listProductBySearchGson);
                //get categories
                Vector<ProductCategory> listPCategories = daoProductCategory.getAllCategories();
                request.setAttribute("listPC", listPCategories);
                //Get brand by category
                if (cid == null) {
                    Vector<Brand> listBrand = daoBrand.getAllBrand();
                    request.setAttribute("listBrand", listBrand);
                } else {
                    // Nếu có cid được chọn, hiển thị sản phẩm thỏa mãn cả category và brand
                    Vector<Brand> listBrand = daoBrand.getBrandByCategoryID(cid);
                    request.setAttribute("listBrand", listBrand);
                }

                session.setAttribute("pickedCategory", cid);
                session.setAttribute("pickedBrand", brandId);
                request.setAttribute("searchResult", "Đã tìm thấy <span style='color:red;' >" + listProductBySearch.size() + "</span> sản phẩm phù hợp.");
                
                //get latest product
                Vector<Product> latestProduct = daoProduct.top6LastestProduct();
                request.setAttribute("latestP", latestProduct);
                
                request.getRequestDispatcher("shop.jsp").forward(request, response);
            }
            if (action != null && action.equals("searchByPrice")) {
                //remove session
                session.removeAttribute("pickedCategory");
                session.removeAttribute("pickedBrand");
                
                String fromPrice_rq = request.getParameter("fromPrice");
                String toPrice_rq = request.getParameter("toPrice");
                Double fromPrice = (fromPrice_rq == null || fromPrice_rq.equals("")) ? null : Double.parseDouble(fromPrice_rq);
                Double toPrice = (toPrice_rq == null || toPrice_rq.equals("")) ? null : Double.parseDouble(toPrice_rq);
                if (fromPrice != null && toPrice != null) {
                    //Case that fromPrice > toPrice
                    if (fromPrice > toPrice) {
                        Double swapPrice = fromPrice;
                        fromPrice = toPrice;
                        toPrice = swapPrice;
                    }
                }
                Vector<Product> listProductBySearch = daoProduct.searchProduct(null, null, fromPrice, toPrice);
                String listProductBySearchGson = gson.toJson(listProductBySearch);
                request.setAttribute("listProduct", listProductBySearchGson);
                //get categories
                Vector<ProductCategory> listPCategories = daoProductCategory.getAllCategories();
                request.setAttribute("listPC", listPCategories);
                //Get brand by category
                Vector<Brand> listBrand = daoBrand.getAllBrand();
                request.setAttribute("listBrand", listBrand);

                session.setAttribute("fromP", fromPrice);
                session.setAttribute("toP", toPrice);
                request.setAttribute("searchResult", "Đã tìm thấy <span style='color:red;' >" + listProductBySearch.size() + "</span> sản phẩm phù hợp.");
                
                //get latest product
                Vector<Product> latestProduct = daoProduct.top6LastestProduct();
                request.setAttribute("latestP", latestProduct);
                
                request.getRequestDispatcher("shop.jsp").forward(request, response);
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

