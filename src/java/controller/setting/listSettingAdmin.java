/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.setting;

import com.google.gson.Gson;
import dao.BrandDAO;
import dao.ProductCategoryDAO;
import dao.PostCategoryDAO;
import dao.SettingDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.LinkedHashMap;
import java.util.Map;
import java.util.Vector;
import model.ProductCategory;
import model.Setting;

/**
 *
 * @author tiend
 */
@WebServlet(name = "listSettingAdmin", urlPatterns = {"/admin/listSettingAdmin"})
public class listSettingAdmin extends HttpServlet {

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
            SettingDAO settingDAO = new SettingDAO();
            BrandDAO brandDAO = new BrandDAO();
            PostCategoryDAO postCateDao = new PostCategoryDAO();
            ProductCategoryDAO productCateDAO = new ProductCategoryDAO();
            String message = request.getParameter("msg");
            if (message == null) {
                message = "loadpage";
            }
            if (message.equals("loadpage")) {
                Vector<Setting> listSetting = settingDAO.getAllSettingWithSort("id");

                //Using JSON to pagination with client render
                Gson gson = new Gson();
                String listSettingGson = gson.toJson(listSetting);
                //test pagination with JSON and Jquery here
                request.setAttribute("listSetting", listSettingGson);
                request.getRequestDispatcher("/Admin_settingList.jsp").forward(request, response);
            }
            if (message.equals("sortSetting")) {
                String sortBy = request.getParameter("sortBy");
                Vector<Setting> listSetting = settingDAO.getAllSettingWithSort(sortBy);

                Gson gson = new Gson();
                String listProductGson = gson.toJson(listSetting);
                //test pagination with JSON and Jquery here
                request.setAttribute("listSetting", listProductGson);
                request.setAttribute("message", "Sắp xếp cài đặt theo \"" + sortBy + "\"");
                request.getRequestDispatcher("/Admin_settingList.jsp").forward(request, response);
            }
            if (message.equals("searchSetting")) {
                String pSearch = request.getParameter("pSearch");
                Vector<Setting> listSetting = settingDAO.getSettingWithSearch(pSearch);
                Gson gson = new Gson();
                String listProductGson = gson.toJson(listSetting);
                //test pagination with JSON and Jquery here
                request.setAttribute("message", "Tìm thấy <span style=\"color:red;\">" + listSetting.size() + "</span> cài đặt trùng khớp với \"<span style=\"color:red;\">" + pSearch + "</span>\"");
                request.setAttribute("listSetting", listProductGson);
                request.getRequestDispatcher("/Admin_settingList.jsp").forward(request, response);
            }
            if (message.equals("selectFilter")) {
                String selected = request.getParameter("selected");
                String gson = "";
                if (selected.equals("type")) {
                    Vector<Setting> listType = settingDAO.getAllType();
                    gson = new Gson().toJson(listType);
                }
                // Gửi phản hồi về client
                response.setContentType("application/json");
                response.setCharacterEncoding("UTF-8");
                response.getWriter().write(gson);
            }
            if (message.equals("settingFilter")) {
                String value = request.getParameter("value");
                String selected = request.getParameter("selected");
                String listProductGSon = "";
                if (selected.equals("type")) {
                    String type = value;
                    Vector<Setting> listSetting = settingDAO.getSettingByType(type);
                    listProductGSon = new Gson().toJson(listSetting);
                }
                if (selected.equals("status")) {
                    int status = Integer.parseInt(value);
                    Vector<Setting> listSetting = settingDAO.getSettingByStatus(status);
                    listProductGSon = new Gson().toJson(listSetting);
                }
                request.setAttribute("listSetting", listProductGSon);
                request.getRequestDispatcher("/Admin_settingList.jsp").forward(request, response);
            }
            if (message.equals("toggleStatus")) {
                int status = Integer.parseInt(request.getParameter("status"));
                int settingID = Integer.parseInt(request.getParameter("sid"));
                Setting settingById = settingDAO.getSettingByID(settingID);
                int isSuccessSetting = 0;
                int isSuccessTable = 0;
                String msg = "";
                if (settingById.getType().contains("Status")) {
                    if (status == 0) {
                        isSuccessSetting = settingDAO.updateSettingStatus(settingID, 1);
                    } else if (status != 0) {
                        isSuccessSetting = settingDAO.updateSettingStatus(settingID, 0);
                    }
                } else if(settingById.getType().contains("Brand")) {
                    if (status == 0) {
                        isSuccessSetting = settingDAO.updateSettingStatus(settingID, 1);
                        isSuccessTable = brandDAO.updateBrandStatusById(Integer.parseInt(settingById.getValue()), 1);
                    } else if (status != 0) {
                        isSuccessSetting = settingDAO.updateSettingStatus(settingID, 0);
                        isSuccessTable = brandDAO.updateBrandStatusById(Integer.parseInt(settingById.getValue()), 0);
                    }
                } else if(settingById.getType().contains("Post Category")) {
                    if (status == 0) {
                        isSuccessSetting = settingDAO.updateSettingStatus(settingID, 1);
                        isSuccessTable = postCateDao.updatePostCategoryStatusByID(Integer.parseInt(settingById.getValue()), 1);
                    } else if (status != 0) {
                        isSuccessSetting = settingDAO.updateSettingStatus(settingID, 0);
                        isSuccessTable = postCateDao.updatePostCategoryStatusByID(Integer.parseInt(settingById.getValue()), 0);
                    }
                } else if(settingById.getType().contains("Product Category")) {
                    if (status == 0) {
                        isSuccessSetting = settingDAO.updateSettingStatus(settingID, 1);
                        isSuccessTable = productCateDAO.updateCategoryStatusById(Integer.parseInt(settingById.getValue()), 1);
                    } else if (status != 0) {
                        isSuccessSetting = settingDAO.updateSettingStatus(settingID, 0);
                        isSuccessTable = productCateDAO.updateCategoryStatusById(Integer.parseInt(settingById.getValue()), 0);
                    }
                } 

                if (isSuccessSetting > 0 && isSuccessTable > 0) {
                    msg = "<span style=\"color:green;\">Cập nhật trạng thái cài đặt thành công cho \"" + settingById.getName() + "\"</span>";
                } else {
                    msg = "<span style=\"color:red;\">Đã có lỗi xảy ra, không thể cập nhật cài đặt.</span>";
                }

                //Gọi lại load page
                Vector<Setting> listSetting = settingDAO.getAllSettingWithSort("id");

                //Using JSON to pagination with client render
                Gson gson = new Gson();
                String listProductGson = gson.toJson(listSetting);
                //test pagination with JSON and Jquery here
                request.setAttribute("listSetting", listProductGson);
                request.setAttribute("message", msg);
                request.getRequestDispatcher("/Admin_settingList.jsp").forward(request, response);
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
