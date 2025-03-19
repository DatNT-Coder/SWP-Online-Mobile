/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import context.DBContext;
import java.sql.*;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.Vector;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Product;

/**
 *
 * @author tiend
 */
public class ProductDAO extends DBContext {

   public int getProductQuantity() {
      int n = 0;
      String query = "SELECT COUNT(*) FROM `mydb`.`product`";
      try {
         this.connection = getConnection();
         PreparedStatement ps = connection.prepareStatement(query);
         ResultSet rs = ps.executeQuery();
         if (rs.next()) {
            n = rs.getInt(1);
         }
      } catch (SQLException e) {
         System.out.println(e);
      }
      return n;
   }

   public Vector<Product> getProductBySearch(String search) {
      Vector<Product> list = new Vector<>();
      String query = "SELECT p.*\n"
              + "FROM product p\n"
              + "JOIN productcategory pc ON p.ProductCategory_ID = pc.ID\n"
              + "JOIN brand b ON p.brandID = b.brandID\n"
              + "WHERE (p.name LIKE CONCAT('%', ?, '%') \n"
              + "OR p.details LIKE CONCAT('%', ?, '%') \n"
              + "OR b.brandName LIKE CONCAT('%', ?, '%'))\n"
              + "AND p.status != 0 AND pc.status != 0 AND b.status != 0;";
      try {
         this.connection = getConnection();
         PreparedStatement ps = connection.prepareStatement(query);
         ps.setString(1, search);
         ps.setString(2, search);
         ps.setString(3, search);
         ResultSet rs = ps.executeQuery();
         while (rs.next()) {
            list.add(new Product(rs.getInt("ID"), rs.getString("name"), rs.getDouble("originalPrice"), rs.getDouble("salePrice"), rs.getString("details"), rs.getString("image"),
                    rs.getInt("stock"), rs.getInt("ProductCategory_ID"), rs.getDate("updatedDate"), rs.getInt("status"), rs.getInt("brandID"), rs.getDouble("cost_price"), rs.getInt("settings_id")));
         }
      } catch (SQLException e) {
         System.out.println(e);
      }
      return list;
   }

   public Vector<Product> searchProduct(Integer categoryID, Integer brandID, Double minPrice, Double maxPrice) {
      Vector<Product> result = new Vector<>();
      String query = "SELECT p.* FROM product p "
              + "JOIN productcategory pc ON p.ProductCategory_ID = pc.ID "
              + "JOIN brand b ON p.brandID = b.brandID "
              + "WHERE p.status != 0 AND pc.status != 0 AND b.status != 0";
      if (categoryID != null) {
         query += " AND p.ProductCategory_ID = ?";
      }
      if (brandID != null) {
         query += " AND p.brandID = ?";
      }
      if (minPrice != null) {
         query += " AND p.salePrice >= ?";
      }
      if (maxPrice != null) {
         query += " AND p.salePrice <= ?";
      }
      try {
         this.connection = getConnection();
         PreparedStatement ps = connection.prepareStatement(query);
         int index = 1;
         if (categoryID != null) {
            ps.setInt(index++, categoryID);
         }
         if (brandID != null) {
            ps.setInt(index++, brandID);
         }
         if (minPrice != null) {
            ps.setDouble(index++, minPrice);
         }
         if (maxPrice != null) {
            ps.setDouble(index++, maxPrice);
         }
         ResultSet rs = ps.executeQuery();
         while (rs.next()) {
            result.add(new Product(rs.getInt("ID"), rs.getString("name"), rs.getDouble("originalPrice"), rs.getDouble("salePrice"), rs.getString("details"), rs.getString("image"),
                    rs.getInt("stock"), rs.getInt("ProductCategory_ID"), rs.getDate("updatedDate"), rs.getInt("status"), rs.getInt("brandID"), rs.getDouble("cost_price"), rs.getInt("settings_id")));
         }
         rs.close();
         ps.close();
      } catch (SQLException e) {
         System.out.println(e);
      }
      return result;
   }

   public Vector<Product> getAllProduct() {
      Vector<Product> list = new Vector<>();
      String query = "SELECT p.* FROM `mydb`.`product` p "
              + "JOIN `mydb`.`productcategory` pc ON p.ProductCategory_ID = pc.ID "
              + "JOIN `mydb`.`brand` b ON p.brandID = b.brandID "
              + "WHERE p.status != 0 AND pc.status != 0 AND b.status != 0";
      try {
         this.connection = getConnection();
         PreparedStatement ps = connection.prepareStatement(query);
         ResultSet rs = ps.executeQuery();
         while (rs.next()) {
            list.add(new Product(rs.getInt("ID"), rs.getString("name"), rs.getDouble("originalPrice"), rs.getDouble("salePrice"), rs.getString("details"), rs.getString("image"),
                    rs.getInt("stock"), rs.getInt("ProductCategory_ID"), rs.getDate("updatedDate"), rs.getInt("status"), rs.getInt("brandID"), rs.getDouble("cost_price"), rs.getInt("settings_id")));
         }
      } catch (SQLException e) {
         System.out.println(e);
      }
      return list;
   }

   public Vector<Product> pagingProduct(int index, int numberPerPage) {
      Vector<Product> list = new Vector<>();
      String query = "SELECT * FROM `mydb`.`product` LIMIT ? OFFSET ?";
      try {
         this.connection = getConnection();
         PreparedStatement ps = connection.prepareStatement(query);
         ps.setInt(1, numberPerPage);
         ps.setInt(2, (index - 1) * numberPerPage);
         ResultSet rs = ps.executeQuery();
         while (rs.next()) {
            list.add(new Product(rs.getInt("ID"), rs.getString("name"), rs.getDouble("originalPrice"), rs.getDouble("salePrice"), rs.getString("details"), rs.getString("image"),
                    rs.getInt("stock"), rs.getInt("ProductCategory_ID"), rs.getDate("updatedDate"), rs.getInt("status"), rs.getInt("brandID"), rs.getDouble("cost_price"), rs.getInt("settings_id")));
         }
      } catch (SQLException e) {
         System.out.println(e);
      }
      return list;
   }

   public Product lastestProduct() {
      String query = "SELECT * FROM `mydb`.`product` ORDER BY `updatedDate` DESC LIMIT 1";
      try {
         this.connection = getConnection();
         PreparedStatement ps = connection.prepareStatement(query);
         ResultSet rs = ps.executeQuery();
         if (rs.next()) {
            return new Product(rs.getInt("ID"), rs.getString("name"), rs.getDouble("originalPrice"), rs.getDouble("salePrice"), rs.getString("details"), rs.getString("image"),
                    rs.getInt("stock"), rs.getInt("ProductCategory_ID"), rs.getDate("updatedDate"), rs.getInt("status"), rs.getInt("brandID"), rs.getDouble("cost_price"), rs.getInt("settings_id"));
         }
      } catch (SQLException e) {
         System.out.println(e);
      }
      return null;
   }

   public Vector<Product> top6LastestProduct() {
      Vector<Product> list = new Vector<>();
      String query = "SELECT * FROM `mydb`.`product` where status != 0 ORDER BY `updatedDate` DESC LIMIT 5";
      try {
         this.connection = getConnection();
         PreparedStatement ps = connection.prepareStatement(query);
         ResultSet rs = ps.executeQuery();
         while (rs.next()) {
            list.add(new Product(rs.getInt("ID"), rs.getString("name"), rs.getDouble("originalPrice"), rs.getDouble("salePrice"), rs.getString("details"), rs.getString("image"),
                    rs.getInt("stock"), rs.getInt("ProductCategory_ID"), rs.getDate("updatedDate"), rs.getInt("status"), rs.getInt("brandID"), rs.getDouble("cost_price"), rs.getInt("settings_id")));
         }
      } catch (SQLException e) {
         System.out.println(e);
      }
      return list;
   }

   public Product getProductById(int id) {

      try {
         String sql = "select * from mydb.product where ID = ?";
         this.connection = getConnection();
         PreparedStatement statement = connection.prepareStatement(sql);
         statement.setInt(1, id);
         ResultSet rs = statement.executeQuery();
         if (rs.next()) {
            Product product = new Product(rs.getInt("ID"), rs.getString("name"), rs.getDouble("originalPrice"), rs.getDouble("salePrice"), rs.getString("details"), rs.getString("image"),
                    rs.getInt("stock"), rs.getInt("ProductCategory_ID"), rs.getDate("updatedDate"), rs.getInt("status"), rs.getInt("brandID"), rs.getDouble("cost_price"), rs.getInt("settings_id"));

            return product;
         }
      } catch (SQLException ex) {
         Logger.getLogger(ProductDAO.class.getName()).log(Level.SEVERE, null, ex);
      }
      return null;
   }

   public Map<String, Object> getProductByProductId(int pid) {
      Map<String, Object> productDetails = new LinkedHashMap<>();
      String query = "SELECT p.*, b.brandName, c.categoryName\n"
              + "FROM product p\n"
              + "INNER JOIN brand b ON p.brandID = b.brandID\n"
              + "INNER JOIN productcategory c ON p.ProductCategory_ID = c.ID\n"
              + "WHERE p.ID = ?\n"
              + "ORDER BY p.ID ASC;";

      try {
         this.connection = getConnection();
         PreparedStatement ps = connection.prepareStatement(query);
         ps.setInt(1, pid);
         ResultSet rs = ps.executeQuery();
         if (rs.next()) {
            Product product = new Product(rs.getInt("ID"), rs.getString("name"), rs.getDouble("originalPrice"), rs.getDouble("salePrice"), rs.getString("details"), rs.getString("image"),
                    rs.getInt("stock"), rs.getInt("ProductCategory_ID"), rs.getDate("updatedDate"), rs.getInt("status"), rs.getInt("brandID"), rs.getDouble("cost_price"), rs.getInt("settings_id"));
            productDetails.put("product", product);
            productDetails.put("brandName", rs.getString("brandName"));
            productDetails.put("categoryName", rs.getString("categoryName"));
         }
      } catch (SQLException ex) {
         ex.printStackTrace();
      }
      return productDetails;
   }

   //For product list marketing ==> cần select cả trường hợp status == 0
   public LinkedHashMap<Integer, Map<String, Object>> showProductWithOrder(String sortBy, String order) {
      LinkedHashMap<Integer, Map<String, Object>> productDetails = new LinkedHashMap<>();
      String query = "SELECT p.*, b.brandName, c.categoryName \n"
              + "FROM product p \n"
              + "INNER JOIN brand b ON p.brandID = b.brandID \n"
              + "INNER JOIN productcategory c ON p.ProductCategory_ID = c.ID\n"
              + "ORDER BY " + sortBy + " " + order + ";";
      try {
         this.connection = getConnection();
         PreparedStatement ps = connection.prepareStatement(query);
         ResultSet rs = ps.executeQuery();
         int id = 1;
         while (rs.next()) {
            Product product = new Product(rs.getInt("ID"), rs.getString("name"), rs.getDouble("originalPrice"), rs.getDouble("salePrice"), rs.getString("details"), rs.getString("image"),
                    rs.getInt("stock"), rs.getInt("ProductCategory_ID"), rs.getDate("updatedDate"), rs.getInt("status"), rs.getInt("brandID"), rs.getDouble("cost_price"), rs.getInt("settings_id"));
            Map<String, Object> details = new HashMap<>();
            details.put("product", product);
            details.put("brandName", rs.getString("brandName"));
            details.put("categoryName", rs.getString("categoryName"));
            productDetails.put(id, details);
            id++;
         }
      } catch (SQLException ex) {
         ex.printStackTrace();
      }
      return productDetails;

   }

   public LinkedHashMap<Integer, Map<String, Object>> showProductWithSearch(String pSearch) {
      LinkedHashMap<Integer, Map<String, Object>> productDetails = new LinkedHashMap<>();
      String query = "SELECT p.*, b.brandName, c.categoryName\n"
              + "FROM product p\n"
              + "INNER JOIN brand b ON p.brandID = b.brandID\n"
              + "INNER JOIN productcategory c ON p.ProductCategory_ID = c.ID\n"
              + "AND (p.name LIKE CONCAT('%', ?, '%') OR p.details LIKE CONCAT('%', ?, '%') OR b.brandName LIKE CONCAT('%', ?, '%') OR c.categoryName LIKE CONCAT('%', ?, '%'))\n"
              + "ORDER BY p.ID ASC;";

      try {
         this.connection = getConnection();
         PreparedStatement ps = connection.prepareStatement(query);
         ps.setString(1, pSearch);
         ps.setString(2, pSearch);
         ps.setString(3, pSearch);
         ps.setString(4, pSearch);
         ResultSet rs = ps.executeQuery();
         int id = 1;
         while (rs.next()) {
            Product product = new Product(rs.getInt("ID"), rs.getString("name"), rs.getDouble("originalPrice"), rs.getDouble("salePrice"), rs.getString("details"), rs.getString("image"),
                    rs.getInt("stock"), rs.getInt("ProductCategory_ID"), rs.getDate("updatedDate"), rs.getInt("status"), rs.getInt("brandID"), rs.getDouble("cost_price"), rs.getInt("settings_id"));
            Map<String, Object> details = new HashMap<>();
            details.put("product", product);
            details.put("brandName", rs.getString("brandName"));
            details.put("categoryName", rs.getString("categoryName"));
            productDetails.put(id, details);
            id++;
         }
      } catch (SQLException ex) {
         ex.printStackTrace();
      }
      return productDetails;
   }

   public LinkedHashMap<Integer, Map<String, Object>> getProductByStatus(int status) {
      LinkedHashMap<Integer, Map<String, Object>> productDetails = new LinkedHashMap<>();
      String query = "SELECT p.*, b.brandName, c.categoryName\n"
              + "FROM product p\n"
              + "INNER JOIN brand b ON p.brandID = b.brandID\n"
              + "INNER JOIN productcategory c ON p.ProductCategory_ID = c.ID\n"
              + "WHERE p.status = ?\n"
              + "ORDER BY p.ID ASC;";

      try {
         this.connection = getConnection();
         PreparedStatement ps = connection.prepareStatement(query);
         ps.setInt(1, status);
         ResultSet rs = ps.executeQuery();
         int id = 1;
         while (rs.next()) {
            Product product = new Product(rs.getInt("ID"), rs.getString("name"), rs.getDouble("originalPrice"), rs.getDouble("salePrice"), rs.getString("details"), rs.getString("image"),
                    rs.getInt("stock"), rs.getInt("ProductCategory_ID"), rs.getDate("updatedDate"), rs.getInt("status"), rs.getInt("brandID"), rs.getDouble("cost_price"), rs.getInt("settings_id"));
            Map<String, Object> details = new HashMap<>();
            details.put("product", product);
            details.put("brandName", rs.getString("brandName"));
            details.put("categoryName", rs.getString("categoryName"));
            productDetails.put(id, details);
            id++;
         }
      } catch (SQLException ex) {
         ex.printStackTrace();
      }
      return productDetails;
   }

   public LinkedHashMap<Integer, Map<String, Object>> getProductByBrandId(int bid) {
      LinkedHashMap<Integer, Map<String, Object>> productDetails = new LinkedHashMap<>();
      String query = "SELECT p.*, b.brandName, c.categoryName\n"
              + "FROM product p\n"
              + "INNER JOIN brand b ON p.brandID = b.brandID\n"
              + "INNER JOIN productcategory c ON p.ProductCategory_ID = c.ID\n"
              + "WHERE b.brandID = ?\n"
              + "ORDER BY p.ID ASC;";

      try {
         this.connection = getConnection();
         PreparedStatement ps = connection.prepareStatement(query);
         ps.setInt(1, bid);
         ResultSet rs = ps.executeQuery();
         int id = 1;
         while (rs.next()) {
            Product product = new Product(rs.getInt("ID"), rs.getString("name"), rs.getDouble("originalPrice"), rs.getDouble("salePrice"), rs.getString("details"), rs.getString("image"),
                    rs.getInt("stock"), rs.getInt("ProductCategory_ID"), rs.getDate("updatedDate"), rs.getInt("status"), rs.getInt("brandID"), rs.getDouble("cost_price"), rs.getInt("settings_id"));
            Map<String, Object> details = new HashMap<>();
            details.put("product", product);
            details.put("brandName", rs.getString("brandName"));
            details.put("categoryName", rs.getString("categoryName"));
            productDetails.put(id, details);
            id++;
         }
      } catch (SQLException ex) {
         ex.printStackTrace();
      }
      return productDetails;
   }

   public LinkedHashMap<Integer, Map<String, Object>> getProductByCategoryId(int cid) {
      LinkedHashMap<Integer, Map<String, Object>> productDetails = new LinkedHashMap<>();
      String query = "SELECT p.*, b.brandName, c.categoryName\n"
              + "FROM product p\n"
              + "INNER JOIN brand b ON p.brandID = b.brandID\n"
              + "INNER JOIN productcategory c ON p.ProductCategory_ID = c.ID\n"
              + "WHERE c.ID = ?\n"
              + "ORDER BY p.ID ASC;";

      try {
         this.connection = getConnection();
         PreparedStatement ps = connection.prepareStatement(query);
         ps.setInt(1, cid);
         ResultSet rs = ps.executeQuery();
         int id = 1;
         while (rs.next()) {
            Product product = new Product(rs.getInt("ID"), rs.getString("name"), rs.getDouble("originalPrice"), rs.getDouble("salePrice"), rs.getString("details"), rs.getString("image"),
                    rs.getInt("stock"), rs.getInt("ProductCategory_ID"), rs.getDate("updatedDate"), rs.getInt("status"), rs.getInt("brandID"), rs.getDouble("cost_price"), rs.getInt("settings_id"));
            Map<String, Object> details = new HashMap<>();
            details.put("product", product);
            details.put("brandName", rs.getString("brandName"));
            details.put("categoryName", rs.getString("categoryName"));
            productDetails.put(id, details);
            id++;
         }
      } catch (SQLException ex) {
         ex.printStackTrace();
      }
      return productDetails;
   }

   public int updateProductStatus(int pid, int status) {
      String query = "UPDATE mydb.product SET status = ? WHERE ID = ?";
      int n = 0;
      try {
         this.connection = getConnection();
         PreparedStatement ps = connection.prepareStatement(query);
         ps.setInt(1, status);
         ps.setInt(2, pid);
         n = ps.executeUpdate();
      } catch (SQLException ex) {
         ex.printStackTrace();
      }
      return n;
   }

   public int updateProduct(Product product) {
      String query = "UPDATE product SET name = ?, originalPrice = ?, salePrice = ?, details = ?, image = ?, stock = ?, ProductCategory_ID = ?, updatedDate = ?, status = ?, brandID = ?, cost_price = ?, settings_id = ? WHERE ID = ?";
      int n = 0;
      try {
         this.connection = getConnection();
         PreparedStatement ps = connection.prepareStatement(query);
         ps.setString(1, product.getName());
         ps.setDouble(2, product.getOriginalPrice());
         ps.setDouble(3, product.getSalePrice());
         ps.setString(4, product.getDetails());
         ps.setString(5, product.getImage());
         ps.setInt(6, product.getStock());
         ps.setInt(7, product.getProductCategory_ID());
         ps.setDate(8, product.getUpdatedDate());
         ps.setInt(9, product.getStatus());
         ps.setInt(10, product.getBrandId());
         ps.setDouble(11, product.getCost_price());
         ps.setInt(12, product.getSettings_id());
         ps.setInt(13, product.getID());

         n = ps.executeUpdate();

      } catch (SQLException ex) {
         ex.printStackTrace();
      }
      return n;
   }

   public int addProduct(Product product) {
      String query = "INSERT INTO product (name, originalPrice, salePrice, details, image, stock, ProductCategory_ID, updatedDate, status, brandID, cost_price, settings_id) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
      int productId = 0;
      try {
         this.connection = getConnection();
         PreparedStatement ps = connection.prepareStatement(query, Statement.RETURN_GENERATED_KEYS);
         ps.setString(1, product.getName());
         ps.setDouble(2, product.getOriginalPrice());
         ps.setDouble(3, product.getSalePrice());
         ps.setString(4, product.getDetails());
         ps.setString(5, product.getImage());
         ps.setInt(6, product.getStock());
         ps.setInt(7, product.getProductCategory_ID());
         ps.setDate(8, product.getUpdatedDate());
         ps.setInt(9, product.getStatus());
         ps.setInt(10, product.getBrandId());
         ps.setDouble(11, product.getCost_price());
         ps.setInt(12, product.getSettings_id());

         ps.executeUpdate();
         try (ResultSet generatedKeys = ps.getGeneratedKeys()) {
            if (generatedKeys.next()) {
               productId = generatedKeys.getInt(1);
            } else {
               throw new SQLException("Tạo sản phẩm mới thất bại, không có ID nào được tạo.");
            }
         }
      } catch (SQLException ex) {
         ex.printStackTrace();
      }
      return productId;
   }

   // Phương thức đếm tổng số sản phẩm có trạng thái là 1 hoặc 2 trong bảng product
   public int countProduct() {
      int total = 0;
      try {
         String sql = "SELECT COUNT(*) AS count_product FROM product WHERE status IN (1, 2)";
         this.connection = getConnection();
         PreparedStatement statement = connection.prepareStatement(sql);
         ResultSet rs = statement.executeQuery();
         if (rs.next()) {
            total = rs.getInt("count_product");
         }
      } catch (SQLException ex) {
         Logger.getLogger(ProductDAO.class.getName()).log(Level.SEVERE, null, ex);
      }
      return total;
   }

   public Vector<Product> searchProduct(String keyword, String categoryID, String brandID,
           String minPrice, String maxPrice, String pageSize,
           String pageIndex, String status) {
      Vector<Product> result = new Vector<>();

      // Gán giá trị mặc định nếu tham số đầu vào là null hoặc rỗng
      keyword = (keyword != null && !keyword.trim().isEmpty()) ? keyword.trim() : null;
      categoryID = (categoryID != null && !categoryID.trim().isEmpty()) ? categoryID.trim() : null;
      brandID = (brandID != null && !brandID.trim().isEmpty()) ? brandID.trim() : null;
      minPrice = (minPrice != null && !minPrice.trim().isEmpty()) ? minPrice.trim() : null;
      maxPrice = (maxPrice != null && !maxPrice.trim().isEmpty()) ? maxPrice.trim() : null;
      pageSize = (pageSize != null && !pageSize.trim().isEmpty()) ? pageSize.trim() : "100000000000000"; // Mặc định 10 sản phẩm/trang
      pageIndex = (pageIndex != null && !pageIndex.trim().isEmpty()) ? pageIndex.trim() : "1"; // Mặc định trang đầu tiên
      boolean isFilterByStatus = status != null && !status.trim().isEmpty();

      String query = "SELECT p.* FROM product p "
              + "JOIN productcategory pc ON p.ProductCategory_ID = pc.ID "
              + "JOIN brand b ON p.brandID = b.brandID "
              + "WHERE (1=1) "
              + (isFilterByStatus ? "AND p.status = ? " : "") // Nếu status có giá trị hợp lệ thì thêm điều kiện
              + "AND (pc.status != 0) AND (b.status != 0) "
              + "AND ((? IS NOT NULL AND p.name LIKE ?) OR ? IS NULL) "
              + "AND (p.ProductCategory_ID = ? OR ? IS NULL) "
              + "AND (p.brandID = ? OR ? IS NULL) "
              + "AND (p.salePrice >= ? OR ? IS NULL) "
              + "AND (p.salePrice <= ? OR ? IS NULL) "
              + "ORDER BY p.ID ASC LIMIT ? OFFSET ?";

      try {
         this.connection = getConnection();
         PreparedStatement ps = connection.prepareStatement(query);

         int index = 1;

         // Xử lý status (nếu có lọc theo status thì truyền vào)
         if (isFilterByStatus) {
            int statusValue = parseInteger(status, 1);
            ps.setInt(index++, statusValue);
         }

         // Xử lý keyword
         boolean hasKeyword = keyword != null;
         ps.setObject(index++, hasKeyword ? keyword : null);
         ps.setString(index++, hasKeyword ? "%" + keyword + "%" : null);
         ps.setObject(index++, keyword);

         // Xử lý categoryID
         Integer categoryValue = parseInteger(categoryID, null);
         ps.setObject(index++, categoryValue);
         ps.setObject(index++, categoryID);

         // Xử lý brandID
         Integer brandValue = parseInteger(brandID, null);
         ps.setObject(index++, brandValue);
         ps.setObject(index++, brandID);

         // Xử lý minPrice
         Double minPriceValue = parseDouble(minPrice, null);
         ps.setObject(index++, minPriceValue);
         ps.setObject(index++, minPrice);

         // Xử lý maxPrice
         Double maxPriceValue = parseDouble(maxPrice, null);
         ps.setObject(index++, maxPriceValue);
         ps.setObject(index++, maxPrice);

         // Xử lý phân trang
         int pageSizeValue = parseInteger(pageSize, 2000000000);
         int pageIndexValue = parseInteger(pageIndex, 1);
         ps.setInt(index++, pageSizeValue);
         ps.setInt(index++, (pageIndexValue - 1) * pageSizeValue);

         ResultSet rs = ps.executeQuery();
         while (rs.next()) {
            result.add(new Product(
                    rs.getInt("ID"),
                    rs.getString("name"),
                    rs.getDouble("originalPrice"),
                    rs.getDouble("salePrice"),
                    rs.getString("details"),
                    rs.getString("image"),
                    rs.getInt("stock"),
                    rs.getInt("ProductCategory_ID"),
                    rs.getDate("updatedDate"),
                    rs.getInt("status"),
                    rs.getInt("brandID"),
                    rs.getDouble("cost_price"),
                    rs.getInt("settings_id")
            ));
         }

         rs.close();
         ps.close();

      } catch (SQLException e) {
         e.printStackTrace();
      }

      return result;
   }

// Hàm kiểm tra và chuyển đổi String sang Integer, nếu lỗi hoặc null thì trả về giá trị mặc định
   private Integer parseInteger(String str, Integer defaultValue) {
      if (str == null || str.trim().isEmpty()) {
         return defaultValue;
      }
      try {
         return Integer.parseInt(str);
      } catch (NumberFormatException e) {
         return defaultValue;
      }
   }

// Hàm kiểm tra và chuyển đổi String sang Double, nếu lỗi hoặc null thì trả về giá trị mặc định
   private Double parseDouble(String str, Double defaultValue) {
      if (str == null || str.trim().isEmpty()) {
         return defaultValue;
      }
      try {
         return Double.parseDouble(str);
      } catch (NumberFormatException e) {
         return defaultValue;
      }
   }
   // Hàm thay đổi trạng thái của sản phẩm

   public int changeProductStatus(int id, int status) {
      int n = 0;
      String query = "UPDATE product SET status = ? WHERE ID = ?";
      try {
         this.connection = getConnection();
         PreparedStatement ps = connection.prepareStatement(query);
         ps.setInt(1, status);
         ps.setInt(2, id);
         n = ps.executeUpdate();
      } catch (SQLException e) {
         System.out.println(e);
      }
      return n;
   }
   
   public int getTotalProducts() {
        int totalProducts = 0;
        String query = "SELECT COUNT(*) AS total_products FROM Product";
        Connection connection = null;
        PreparedStatement ps = null;
        ResultSet rs = null;

        try {
            connection = new DBContext().getConnection();
            ps = connection.prepareStatement(query);
            rs = ps.executeQuery();
            if (rs.next()) {
                totalProducts = rs.getInt("total_products");
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                if (rs != null) rs.close();
                if (ps != null) ps.close();
                if (connection != null) connection.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        return totalProducts;
    }

   public static void main(String[] args) {
      // Khởi tạo ProductDAO
      ProductDAO ProductDAO = new ProductDAO();

      // Gọi phương thức showProductWithOrder với tham số là "name"
      LinkedHashMap<Integer, Map<String, Object>> products = ProductDAO.showProductWithOrder("ID", "DESC");

      // In ra thông tin sản phẩm
      for (Map.Entry<Integer, Map<String, Object>> entry : products.entrySet()) {

         Map<String, Object> details = entry.getValue();

         Product product = (Product) details.get("product");
         System.out.println("Product ID: " + product.getID());
         System.out.println("Product Name: " + product.getName());
         System.out.println("Brand Name: " + details.get("brandName"));
         System.out.println("Category Name: " + details.get("categoryName"));
         System.out.println("-------------------------");
      }
//        Product p = daoProduct.getProductById(28);
//        System.out.println(p);
   }

}
