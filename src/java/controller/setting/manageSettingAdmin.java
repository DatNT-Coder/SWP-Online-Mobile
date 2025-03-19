/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.setting;

import dao.BrandDAO;
import dao.ProductCategoryDAO;
import dao.SettingDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.Vector;
import model.Brand;
import model.ProductCategory;
import model.Setting;

/**
 *
 * @author tiend
 */
@WebServlet(name="manageSettingAdmin", urlPatterns={"/admin/manageSettingAdmin"})
public class manageSettingAdmin extends HttpServlet {
   
    /** 
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            String message = request.getParameter("msg");
            SettingDAO settingDAO = new SettingDAO();
            BrandDAO brandDAO = new BrandDAO();
            ProductCategoryDAO pCategoryDAO = new ProductCategoryDAO();
            if (message.equals("loadAddSetting")) {
                Vector<Setting> listType = settingDAO.getAllType();
                request.setAttribute("listType", listType);
                request.getRequestDispatcher("/Admin_addSetting.jsp").forward(request, response);
            }
            if (message.equals("addSetting")) {
                int settingId = 0;
                int isInserted = 0 ;
                String name = request.getParameter("sName");
                String description = request.getParameter("description");
                String type = request.getParameter("type");
                int order = Integer.parseInt(request.getParameter("order"));
                int isActive = Integer.parseInt(request.getParameter("status"));
                
                
                if(type.equals("Brand")){
                    isInserted = brandDAO.insertBrand(new Brand(name, 1));
                    settingId = settingDAO.insertSetting(new Setting(name,""+isInserted , type, order, description, isActive, 1));
                }else if(type.equals("Product Category")){
                    isInserted = pCategoryDAO.insertProductCategory(new ProductCategory(name, 1));
                    settingId = settingDAO.insertSetting(new Setting(name,""+isInserted, type, order, description, isActive, 1));
                }
                
                if (settingId > 0 && isInserted > 0) {
                    request.setAttribute("message", "<span style=\"color:green;\">Cập nhật cài đặt thành công!</span>");
                    Setting settingDetail = settingDAO.getSettingByID(settingId);
                    request.setAttribute("settingDetails", settingDetail);
                    request.getRequestDispatcher("/Admin_viewSetting.jsp").forward(request, response);
                } else {
                    request.setAttribute("message", "<span style=\"color:red;\">cập nhật cài đặt không thành công!!!</span>");
                    request.getRequestDispatcher("/Admin_viewSetting.jsp").forward(request, response);
                }

            }
            if (message.equals("loadEditSetting")) {
                int settingId = Integer.parseInt(request.getParameter("sid"));
                Setting setting = settingDAO.getSettingByID(settingId);
                Vector<Setting> listType = settingDAO.getAllType();
                request.setAttribute("listType", listType);
                request.setAttribute("setting", setting);
                request.getRequestDispatcher("/Admin_editSetting.jsp").forward(request, response);
            }
            if (message.equals("editSetting")) {
                int sid = Integer.parseInt(request.getParameter("sid"));
                String name = request.getParameter("sName");
                String description = request.getParameter("description");
                String type = request.getParameter("type");
                String value = request.getParameter("value");
                int order = Integer.parseInt(request.getParameter("order"));
                int isActive = Integer.parseInt(request.getParameter("status"));
                int isUpdated = settingDAO.updateSetting(new Setting(sid, name, value, type, order, description, isActive, 1));
                

                
                if (isUpdated > 0) {
                    request.setAttribute("message", "<span style=\"color:green;\">Cập nhật cài đặt thành công!</span>");
                    Setting settingDetail = settingDAO.getSettingByID(sid);
                    request.setAttribute("settingDetails", settingDetail);
                    request.getRequestDispatcher("/Admin_viewSetting.jsp").forward(request, response);
                } else {
                    request.setAttribute("message", "<span style=\"color:red;\">cập nhật cài đặt không thành công!!!</span>");
                    request.getRequestDispatcher("/Admin_viewSetting.jsp").forward(request, response);
                }
            }
        }
    } 

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /** 
     * Handles the HTTP <code>GET</code> method.
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
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
