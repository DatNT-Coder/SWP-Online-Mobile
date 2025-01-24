package controller;

import dao.ProductDAO;
import model.Product;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "ProductServlet", urlPatterns = {"/product"})
public class ProductServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        // Lấy thông tin trang từ request, nếu không có thì mặc định là trang 1
        String pageParam = request.getParameter("page");
        int page = (pageParam != null) ? Integer.parseInt(pageParam) : 1;
        int pageSize = 5; // Số sản phẩm mỗi trang
        
        ProductDAO productDAO = new ProductDAO();
        
        // Lấy danh sách sản phẩm cho trang hiện tại
        List<Product> products = productDAO.getProductsPaginated(page, pageSize);
        
        // Lấy tổng số sản phẩm để tính số trang
        int totalProducts = productDAO.getTotalProductCount();
        int totalPages = (int) Math.ceil(totalProducts * 1.0 / pageSize);
        
        // Lưu dữ liệu vào request để truyền vào JSP
        request.setAttribute("products", products);
        request.setAttribute("totalPages", totalPages);
        request.setAttribute("currentPage", page);
        
        // Chuyển hướng tới JSP để hiển thị sản phẩm
        request.getRequestDispatcher("productList.jsp").forward(request, response);
    }
}
