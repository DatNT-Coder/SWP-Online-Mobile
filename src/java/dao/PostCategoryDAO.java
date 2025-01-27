/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import context.DBContext;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Vector;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.BlogPost;
import model.PostCategory;

/**
 *
 * @author Asus
 */
public class PostCategoryDAO extends DBContext {
  
    public ArrayList<PostCategory> PostCategoryList() {
        ArrayList<PostCategory> listPC = new ArrayList<>();

        try {
            String sql = "SELECT * FROM mydb.postcategories";
            PreparedStatement statement = conn.prepareStatement(sql);

            ResultSet rs = statement.executeQuery();

            while (rs.next()) {
                listPC.add(new PostCategory(
                        rs.getInt(1), // id
                        rs.getString(2),
                        rs.getInt(3)
                ));
            }

        } catch (SQLException ex) {
            Logger.getLogger(BlogPostDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return listPC;
    }
// Method to get posts by category ID with pagination

    public Vector<BlogPost> getPostsByCategoryId(int categoryId, int pageIndex, int postPerPage) {
        Vector<BlogPost> list = new Vector<>();

        try {
            // SQL query to select posts by category ID with pagination
            String sql = "SELECT bp.*, u.full_name, p.name\n"
                    + "FROM mydb.blogs_posts AS bp\n"
                    + "INNER JOIN postcategories p ON p.id = bp.PostCategories_id\n"
                    + "INNER JOIN user u ON bp.User_id = u.id\n"
                    + "WHERE bp.PostCategories_id = ?\n"
                    + "LIMIT ?\n"
                    + "OFFSET ?;";
            PreparedStatement statement = conn.prepareStatement(sql);
            statement.setInt(1, categoryId); // Set category ID
            statement.setInt(2, postPerPage); // Set number of posts per page
            statement.setInt(3, (pageIndex - 1) * postPerPage); // Calculate offset

            ResultSet rs = statement.executeQuery();

            // Loop through the result set and add posts to the list
            while (rs.next()) {
                BlogPost post = new BlogPost(
                        rs.getInt("id"),
                        rs.getString("title"),
                        rs.getString("brief_info"),
                        rs.getString("thumbnail"),
                        rs.getString("details"),
                        rs.getDate("updatedDate"),
                        rs.getInt("PostCategories_id"),
                        rs.getInt("User_id"),
                        rs.getBoolean("flag_feature"),
                        rs.getInt(10),
                        rs.getString(11),
                        rs.getString("full_name")// status
                        ,
                         rs.getString(13)
                );
                list.add(post);
            }
        } catch (SQLException ex) {
            Logger.getLogger(BlogPostDAO.class.getName()).log(Level.SEVERE, null, ex);
        }

        return list;
    }

    public int getPostCountByCategoryId(int categoryId) {
        int count = 0;

        try {
            String sql = "SELECT COUNT(*) AS totalPosts FROM mydb.blogs_posts WHERE PostCategories_id = ?";
            PreparedStatement statement = conn.prepareStatement(sql);
            statement.setInt(1, categoryId); // Thiết lập tham số trong câu truy vấn

            ResultSet rs = statement.executeQuery();

            if (rs.next()) {
                count = rs.getInt("totalPosts");
            }
        } catch (SQLException ex) {
            Logger.getLogger(BlogPostDAO.class.getName()).log(Level.SEVERE, null, ex);
        }

        return count;
    }

    public ArrayList<BlogPost> BlogListHot() {
        ArrayList<BlogPost> list = new ArrayList<>();

        try {
            String sql = "SELECT *\n"
                    + "FROM mydb.blogs_posts\n"
                    + "ORDER BY updatedDate DESC\n"
                    + "LIMIT 4 ";
            PreparedStatement statement = conn.prepareStatement(sql);

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
                        rs.getString(11),
                        rs.getString(12)// status
                ));
            }

        } catch (SQLException ex) {
            Logger.getLogger(BlogPostDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }

    public BlogPost BlogLastPost() {
        String query = "SELECT * FROM mydb.blogs_posts\n"
                + "ORDER BY updatedDate DESC  ";
        try {
            PreparedStatement ps = conn.prepareStatement(query);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                return new BlogPost(rs.getInt(1), // id
                        rs.getString(2), // title
                        rs.getString(3), // brief_info
                        rs.getString(4), // thumbnail
                        rs.getString(5), // details
                        rs.getDate(6), // updatedDate
                        rs.getInt(7), // PostCategories_id
                        rs.getInt(8), // User_id
                        rs.getBoolean(9), // flag_feature
                        rs.getInt(10),
                        rs.getString(11),
                        rs.getString(12)// status
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
            String sql = "SELECT *\n"
                    + "FROM mydb.blogs_posts\n"
                    + "ORDER BY updatedDate DESC\n"
                    + "LIMIT 4 ";
            PreparedStatement statement = conn.prepareStatement(sql);

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
                        rs.getString(11),
                        rs.getString(12)// status
                ));
            }

        } catch (SQLException ex) {
            Logger.getLogger(BlogPostDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }

    public int getPostListQuantity() {
        int n = 0;
        String query = "SELECT COUNT(*) AS total_posts FROM mydb.blogs_posts";
        try {
            PreparedStatement ps = conn.prepareStatement(query);
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
        String query = "SELECT bp.*, u.full_name\n"
                + "FROM mydb.blogs_posts AS bp\n"
                + "LEFT JOIN mydb.user AS u ON bp.User_id = u.id\n"
                + " LIMIT ? OFFSET ?;";
        try {
            PreparedStatement ps = conn.prepareStatement(query);
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
                        rs.getInt(10),
                        rs.getString(11),
                        rs.getString(12)// status
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
            String sql = "SELECT bp.*, u.* \n"
                    + "FROM mydb.blogs_posts AS bp\n"
                    + "JOIN mydb.user AS u ON bp.User_id = u.id\n"
                    + "WHERE bp.title LIKE ? OR bp.brief_info LIKE ?;";
            PreparedStatement statement = conn.prepareStatement(sql);
            String searchTerm = "%" + keyword + "%";
            statement.setString(1, searchTerm);
            statement.setString(2, searchTerm);

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
                        rs.getString(11),
                        rs.getString(12)// status
                ));
            }
        } catch (SQLException ex) {
            Logger.getLogger(BlogPostDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }

    public Vector<PostCategory> getAllCategories() {
        Vector<PostCategory> listC = new Vector<>();
        String query = "SELECT * FROM `mydb`.`postcategories`";
        try {
            PreparedStatement ps = conn.prepareStatement(query);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                listC.add(new PostCategory(rs.getInt("id"), rs.getString("name"), rs.getInt("status")));
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return listC;
    }

    //Update status cho post categories
    public int updatePostCategoryStatusByID(int pid, int status) {
        String query = "UPDATE mydb.postcategories SET status = ? WHERE id = ?";
        int n = 0;
        try {
            PreparedStatement ps = conn.prepareStatement(query);
            ps.setInt(1, status);
            ps.setInt(2, pid);
            n = ps.executeUpdate();
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return n;
    }

    public static void main(String[] args) {
        // Tạo một đối tượng BlogPostDAO để thực hiện truy vấn
        PostCategoryDAO dao = new PostCategoryDAO();

        // Gọi phương thức getAllCategories() để lấy tất cả các danh mục bài viết
        Vector<PostCategory> categories = dao.getAllCategories();

        // Hiển thị thông tin của tất cả các danh mục bài viết
        for (PostCategory category : categories) {
            System.out.println("Category ID: " + category.getId());
            System.out.println("Category Name: " + category.getName());
            System.out.println("Category Status: " + category.getStatus());
            System.out.println("---------------------------");
        }
    }
}
