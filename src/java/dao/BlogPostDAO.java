/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import context.DBContext;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.Map;
import java.util.Vector;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.BlogPost;
import java.sql.Connection;
/**
 *
 * @author Asus
 */
public class BlogPostDAO  extends DBContext{
    private final Connection connection; // Kết nối cơ sở dữ liệu

    public BlogPostDAO() {
        DBContext dbContext = new DBContext();
        this.connection = dbContext.getConnection(); // Lấy kết nối từ DBContext
    }

    public ArrayList<BlogPost> BlogListHot() {
        ArrayList<BlogPost> list = new ArrayList<>();

        try {
            String sql = "SELECT * FROM mydb.blogs_posts ORDER BY updatedDate DESC LIMIT 4";
            PreparedStatement statement = connection.prepareStatement(sql);

            ResultSet rs = statement.executeQuery();

            while (rs.next()) {
                list.add(new BlogPost(
                        rs.getInt(1), // id
                        rs.getString(2), // title
                        rs.getString(3), // brief_info
                        rs.getString(4), // thumbnail
                        rs.getString(5), // details
                        rs.getDate(6), // updatedDate
                        rs.getInt(7), // PostCategories_id
                        rs.getInt(8), // User_id
                        rs.getBoolean(9), // flag_feature
                        rs.getInt(10), // status
                        rs.getString(11),
                        rs.getString(12)
                ));
            }

        } catch (SQLException ex) {
            Logger.getLogger(BlogPostDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }

    public BlogPost BlogLastPost() {
        String query = "SELECT * FROM mydb.blogs_posts ORDER BY updatedDate DESC LIMIT 1";
        try {
            PreparedStatement ps = connection.prepareStatement(query);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                return new BlogPost(
                        rs.getInt(1), // id
                        rs.getString(2), // title
                        rs.getString(3), // brief_info
                        rs.getString(4), // thumbnail
                        rs.getString(5), // details
                        rs.getDate(6), // updatedDate
                        rs.getInt(7), // PostCategories_id
                        rs.getInt(8), // User_id
                        rs.getBoolean(9), // flag_feature
                        rs.getInt(10), // status
                        rs.getString(11),
                        rs.getString(12)
                );
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    public ArrayList<BlogPost> BlogList() {
        ArrayList<BlogPost> list = new ArrayList<>();

        try {
            String sql = "SELECT bp.*, u.full_name \n"
                    + "FROM `mydb`.`blogs_posts` AS bp \n"
                    + "LEFT JOIN `mydb`.`user` AS u ON bp.User_id = u.id \n"
                    + "WHERE bp.status != 0 \n"
                    + "ORDER BY bp.updatedDate ASC \n"
                    + "LIMIT 3;";
            PreparedStatement statement = connection.prepareStatement(sql);

            ResultSet rs = statement.executeQuery();

            while (rs.next()) {
                list.add(new BlogPost(
                        rs.getInt(1), // id
                        rs.getString(2), // title
                        rs.getString(3), // brief_info
                        rs.getString(4), // thumbnail
                        rs.getString(5), // details
                        rs.getDate(6), // updatedDate
                        rs.getInt(7), // PostCategories_id
                        rs.getInt(8), // User_id
                        rs.getBoolean(9), // flag_feature
                        rs.getInt(10), // status
                        rs.getString(11), // full_name
                        rs.getString(12)
                ));
            }

        } catch (SQLException ex) {
            Logger.getLogger(BlogPostDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }

    public ArrayList<BlogPost> BlogList2() {
        ArrayList<BlogPost> list = new ArrayList<>();

        try {
            String sql = "SELECT bp.*, u.full_name, COUNT(*) AS total_count\n"
                    + "FROM `mydb`.`blogs_posts` AS bp\n"
                    + "LEFT JOIN `mydb`.`user` AS u ON bp.User_id = u.id\n"
                    + "WHERE bp.status != 0\n"
                    + "GROUP BY bp.id, bp.title, bp.brief_info, bp.thumbnail, bp.details, bp.updatedDate, \n"
                    + "         bp.PostCategories_id, bp.User_id, bp.flag_feature, bp.status, u.full_name\n"
                    + "ORDER BY bp.updatedDate DESC\n"
                    + "LIMIT 3;";
            PreparedStatement statement = connection.prepareStatement(sql);

            ResultSet rs = statement.executeQuery();

            while (rs.next()) {
                list.add(new BlogPost(
                        rs.getInt(1), // id
                        rs.getString(2), // title
                        rs.getString(3), // brief_info
                        rs.getString(4), // thumbnail
                        rs.getString(5), // details
                        rs.getDate(6), // updatedDate
                        rs.getInt(7), // PostCategories_id
                        rs.getInt(8), // User_id
                        rs.getBoolean(9), // flag_feature
                        rs.getInt(10), // status
                        rs.getString(11), // full_name
                        rs.getString(12)
                ));
            }

        } catch (SQLException ex) {
            Logger.getLogger(BlogPostDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }

    public int getPostListQuantity() {
        int n = 0;
        String query = "SELECT COUNT(*) AS total_posts\n"
                + "FROM mydb.blogs_posts bp\n"
                + "WHERE bp.status != 0;";
        try {
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

    public Vector<BlogPost> pagingPost(int index, int numberPerPage) {
        Vector<BlogPost> list = new Vector<>();
        String query = "SELECT bp.*, u.full_name,pc.name\n"
                + "FROM mydb.blogs_posts AS bp\n"
                + "INNER JOIN postcategories pc ON bp.PostCategories_id = pc.id\n"
                + "LEFT JOIN mydb.user AS u ON bp.User_id = u.id\n"
                + "WHERE bp.status != 0\n"
                + "LIMIT ? OFFSET ?;";
        try {
            PreparedStatement ps = connection.prepareStatement(query);
            ps.setInt(1, numberPerPage);
            ps.setInt(2, (index - 1) * numberPerPage);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new BlogPost(
                        rs.getInt(1), // id
                        rs.getString(2), // title
                        rs.getString(3), // brief_info
                        rs.getString(4), // thumbnail
                        rs.getString(5), // details
                        rs.getDate(6), // updatedDate
                        rs.getInt(7), // PostCategories_id
                        rs.getInt(8), // User_id
                        rs.getBoolean(9), // flag_feature
                        rs.getInt(10), // status
                        rs.getString(11), // full_name
                        rs.getString(12),
                        rs.getString(13)
                )
                );

            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public Vector<BlogPost> searchBlogs(String keyword) {
        Vector<BlogPost> list = new Vector<>();

        try {
            String sql = "SELECT bp.*,u.full_name,pc.name, u.* \n"
                    + "FROM mydb.blogs_posts AS bp\n"
                    + "JOIN mydb.user AS u ON bp.User_id = u.id\n"
                    + "INNER JOIN postcategories pc ON bp.PostCategories_id = pc.id\n"
                    + "WHERE bp.title LIKE ? OR bp.details LIKE ? OR pc.name LIKE?;";
            PreparedStatement statement = connection.prepareStatement(sql);
            String searchTerm = "%" + keyword + "%";
            statement.setString(1, searchTerm);
            statement.setString(2, searchTerm);
            statement.setString(3, searchTerm);
            ResultSet rs = statement.executeQuery();

            while (rs.next()) {
                list.add(new BlogPost(
                        rs.getInt(1), // id
                        rs.getString(2), // title
                        rs.getString(3), // brief_info
                        rs.getString(4), // thumbnail
                        rs.getString(5), // details
                        rs.getDate(6), // updatedDate
                        rs.getInt(7), // PostCategories_id
                        rs.getInt(8), // User_id
                        rs.getBoolean(9), // flag_feature
                        rs.getInt(10),
                        rs.getString(11), // full_name
                        rs.getString(12),
                        rs.getString(13)
                ));
            }
        } catch (SQLException ex) {
            Logger.getLogger(BlogPostDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;

    }

    public BlogPost getPostbyID(int id) {
        try {
            String query = "SELECT p.*, pc.name, u.full_name\n"
                    + "FROM blogs_posts p\n"
                    + "INNER JOIN postcategories pc ON p.PostCategories_id = pc.id\n"
                    + "INNER JOIN user u ON p.User_id = u.id\n"
                    + "WHERE p.id = ?\n"
                    + "ORDER BY p.id ASC;";
            PreparedStatement statement = connection.prepareStatement(query);
            statement.setInt(1, id);
            ResultSet rs = statement.executeQuery();
            if (rs.next()) {
                BlogPost post = new BlogPost(rs.getInt("id"), // id
                        rs.getString(2), // title
                        rs.getString(3), // brief_info
                        rs.getString(4), // thumbnail
                        rs.getString(5), // details
                        rs.getDate(6), // updatedDate
                        rs.getInt(7), // PostCategories_id
                        rs.getInt(8), // User_id
                        rs.getBoolean(9), // flag_feature
                        rs.getInt(10),
                        rs.getString(11), // full_name
                        rs.getString(12));

                return post;
            }
        } catch (SQLException ex) {
            Logger.getLogger(BlogPostDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public BlogPost getPostbyID2(int id) {
        try {
            String query = "SELECT p.*, u.full_name,pc.name\n"
                    + "FROM blogs_posts p\n"
                    + "INNER JOIN postcategories pc ON p.PostCategories_id = pc.id\n"
                    + "INNER JOIN user u ON p.User_id = u.id\n"
                    + "WHERE p.id = ?\n"
                    + "ORDER BY p.id ASC;";
            PreparedStatement statement = connection.prepareStatement(query);
            statement.setInt(1, id);
            ResultSet rs = statement.executeQuery();
            if (rs.next()) {
                BlogPost post = new BlogPost(rs.getInt("id"), // id
                        rs.getString(2), // title
                        rs.getString(3), // brief_info
                        rs.getString(4), // thumbnail
                        rs.getString(5), // details
                        rs.getDate(6), // updatedDate
                        rs.getInt(7), // PostCategories_id
                        rs.getInt(8), // User_id
                        rs.getBoolean(9), // flag_feature
                        rs.getInt(10),
                        rs.getString(11), // full_name
                        rs.getString(12),
                        rs.getString(13));

                return post;
            }
        } catch (SQLException ex) {
            Logger.getLogger(BlogPostDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

   


    public static void main(String[] args) {
        // Khởi tạo DAOProduct
        BlogPostDAO daoProduct = new BlogPostDAO();

//        // Gọi phương thức showProductWithOrder với tham số là "name"
//        LinkedHashMap<Integer, Map<String, Object>> products = daoProduct.getProductByBrandId(1);
//
//        // In ra thông tin sản phẩm
//        for (Map.Entry<Integer, Map<String, Object>> entry : products.entrySet()) {
//
//            Map<String, Object> details = entry.getValue();
//
//            Product product = (Product) details.get("product");
//            System.out.println("Product ID: " + product.getID());
//            System.out.println("Product Name: " + product.getName());
//            System.out.println("Brand Name: " + details.get("brandName"));
//            System.out.println("Category Name: " + details.get("categoryName"));
//            System.out.println("-------------------------");
//        }
        BlogPost p = daoProduct.getPostbyID(2);
        System.out.println(p);
    }
}
