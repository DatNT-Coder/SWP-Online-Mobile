/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.slider;

import com.google.gson.Gson;
import dao.BrandDAO;
import dao.ProductCategoryDAO;
import dao.SliderDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.LinkedHashMap;
import java.util.Map;

/**
 *
 * @author ADMIN
 */
@WebServlet(name = "listSliderMarketing", urlPatterns = {"/marketing/listSliderMarketing"})
public class listSliderMarketing extends HttpServlet {

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
            /* TODO output your page here. You may use following sample code. */
            SliderDAO daoProduct = new SliderDAO();
            ProductCategoryDAO ProductCategoryDAO = new ProductCategoryDAO();
            BrandDAO brandDAO = new BrandDAO();
            String message = request.getParameter("msg");
            if (message == null) {
                message = "loadpage";
            }
            if (message.equals("loadpage")) {
                LinkedHashMap<Integer, Map<String, Object>> listProduct = daoProduct.showSliderWithOrder("id","ASC");

                //Using JSON to pagination with client render
                Gson gson = new Gson();
                String listProductGson = gson.toJson(listProduct);
                //test pagination with JSON and Jquery here
                request.setAttribute("listProduct", listProductGson);
                request.getRequestDispatcher("/MarketingSliderlist.jsp").forward(request, response);
            }
            if (message.equals("sortSlider")) {
                String sortBy = request.getParameter("sortBy");
                  String order = request.getParameter("order");
                LinkedHashMap<Integer, Map<String, Object>> listProduct = daoProduct.showSliderWithOrder(sortBy,order);
                //Hôm nay là ngày mùng một đầu năm, những dòng dưới đấy là dòng code để mang lại sự 
                //may mắn cho cả người viết và người đọc nó. Khai code để cả năm code không bug, học đâu hiểu đấy
                //Chúc mừng năm mới!<3 2024 sẽ là bàn đạp cho 2k3 tiến về phía trước.
                //Using JSON to pagination with client render
                Gson gson = new Gson();
                String listProductGson = gson.toJson(listProduct);
                //test pagination with JSON and Jquery here
                request.setAttribute("listProduct", listProductGson);
                request.setAttribute("message", "Sắp xếp slider theo \"" + sortBy + "\"");
                request.getRequestDispatcher("/MarketingSliderlist.jsp").forward(request, response);
            }
            if (message.equals("searchSlider")) {
                String pSearch = request.getParameter("pSearch");
                LinkedHashMap<Integer, Map<String, Object>> listProduct = daoProduct.showSliderWithSearch(pSearch);
                Gson gson = new Gson();
                String listProductGson = gson.toJson(listProduct);
                //test pagination with JSON and Jquery here
                request.setAttribute("message", "Tìm thấy <span style=\"color:red;\">" + listProduct.size() + "</span> slider trùng khớp với \"<span style=\"color:red;\">" + pSearch + "</span>\"");
                request.setAttribute("listProduct", listProductGson);
                request.getRequestDispatcher("/MarketingSliderlist.jsp").forward(request, response);
            }
          
            if (message.equals("sliderFilter")) {
                String value = request.getParameter("value");
                String selected = request.getParameter("selected");
                String listProductGSon = "";
               
                if (selected.equals("status")) {
                    int status = Integer.parseInt(value);
                    LinkedHashMap<Integer, Map<String, Object>> listProduct = daoProduct.getSliderByStatus(status);
                    listProductGSon = new Gson().toJson(listProduct);
                }
                request.setAttribute("listProduct", listProductGSon);
                request.getRequestDispatcher("/MarketingSliderlist.jsp").forward(request, response);
            }
            if (message.equals("toggleStatus")) {
                int status = Integer.parseInt(request.getParameter("status"));
                int productID = Integer.parseInt(request.getParameter("pid"));
                int isSuccess = 0;
                String msg = "";
                if (status == 0) {
                    isSuccess = daoProduct.updateSliderStatus(productID, 1);
                } else if (status != 0) {
                    isSuccess = daoProduct.updateSliderStatus(productID, 0);
                }

                //Gọi lại load page
                LinkedHashMap<Integer, Map<String, Object>> listProduct = daoProduct.showSliderWithOrder("ID","ASC");

                //Using JSON to pagination with client render
                Gson gson = new Gson();
                String listProductGson = gson.toJson(listProduct);
                //test pagination with JSON and Jquery here
                request.setAttribute("listProduct", listProductGson);
                request.setAttribute("message", msg);
                request.getRequestDispatcher("/MarketingSliderlist.jsp").forward(request, response);
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
