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

    
    public LinkedHashMap<Integer, Map<String, Object>> showPostWithOrder(String sortBy,String order) {
        LinkedHashMap<Integer, Map<String, Object>> postDetails = new LinkedHashMap<>();
        String query = "SELECT b.*, u.full_name, p.name\n"
                + "FROM blogs_posts b\n"
                + "INNER JOIN postcategories p ON p.id = b.PostCategories_id\n"
                + "INNER JOIN user u ON b.User_id = u.id\n"
                 + "ORDER BY " + sortBy + " "+order+";";
        try {
            PreparedStatement ps = connection.prepareStatement(query);
            ResultSet rs = ps.executeQuery();
            int id = 1;
            while (rs.next()) {
                BlogPost blog = new BlogPost(rs.getInt("id"), // id
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
                        rs.getString(12)
                );
                Map<String, Object> details = new HashMap<>();
                details.put("post", blog);
                details.put("full_name", rs.getString("full_name"));
                details.put("name", rs.getString("name"));
                postDetails.put(id, details);
                id++;
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return postDetails;

    }

    public LinkedHashMap<Integer, Map<String, Object>> showPostWithSearch(String pSearch) {
        LinkedHashMap<Integer, Map<String, Object>> postDetails = new LinkedHashMap<>();
        String query = "SELECT b.*, u.full_name, p.name\n"
                + "FROM blogs_posts b\n"
                + "INNER JOIN postcategories p ON p.id = b.PostCategories_id\n"
                + "INNER JOIN user u ON b.User_id = u.id\n"
                + "AND (b.title LIKE CONCAT('%', ?, '%') \n"
                + "       OR b.details LIKE CONCAT('%',?, '%') \n"
                + "       OR u.full_name LIKE CONCAT('%', ? '%') \n"
                + "       OR p.name LIKE CONCAT('%', ?, '%'))\n"
                + "ORDER BY b.ID ASC;";

        try {
            PreparedStatement ps = connection.prepareStatement(query);
            ps.setString(1, pSearch);
            ps.setString(2, pSearch);
            ps.setString(3, pSearch);
            ps.setString(4, pSearch);
            ResultSet rs = ps.executeQuery();
            int id = 1;
            while (rs.next()) {
                BlogPost blog = new BlogPost(rs.getInt("id"), // id
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
                        rs.getString(12)
                );
                Map<String, Object> details = new HashMap<>();
                details.put("post", blog);
                details.put("full_name", rs.getString("full_name"));
                details.put("name", rs.getString("name"));
                postDetails.put(id, details);
                id++;
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return postDetails;
    }

    public LinkedHashMap<Integer, Map<String, Object>> getPostByStatus(int status) {
        LinkedHashMap<Integer, Map<String, Object>> postDetails = new LinkedHashMap<>();
        String query = "SELECT b.*, u.full_name, p.name\n"
                + "FROM blogs_posts b\n"
                + "INNER JOIN postcategories p ON p.id = b.PostCategories_id\n"
                + "INNER JOIN user u ON b.User_id = u.id\n"
                + "WHERE b.status = ?\n"
                + "ORDER BY b.ID ASC;";

        try {
            PreparedStatement ps = connection.prepareStatement(query);
            ps.setInt(1, status);
            ResultSet rs = ps.executeQuery();
            int id = 1;
            while (rs.next()) {
                BlogPost blog = new BlogPost(rs.getInt("id"), // id
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
                        rs.getString(12)
                );
                Map<String, Object> details = new HashMap<>();
                details.put("post", blog);
                details.put("full_name", rs.getString("full_name"));
                details.put("name", rs.getString("name"));
                postDetails.put(id, details);
                id++;
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return postDetails;
    }

    public LinkedHashMap<Integer, Map<String, Object>> getPostByUserId(int bid) {
        LinkedHashMap<Integer, Map<String, Object>> postDetails = new LinkedHashMap<>();
        String query = "SELECT b.*, u.full_name, p.name\n"
                + "FROM blogs_posts b\n"
                + "INNER JOIN postcategories p ON p.id = b.PostCategories_id\n"
                + "INNER JOIN user u ON b.User_id = u.id\n"
                + "WHERE u.id = ?\n"
                + "ORDER BY b.ID ASC;";

        try {
            PreparedStatement ps = connection.prepareStatement(query);
            ps.setInt(1, bid);
            ResultSet rs = ps.executeQuery();
            int id = 1;
            while (rs.next()) {
                BlogPost blog = new BlogPost(rs.getInt("id"), // id
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
                        rs.getString(12)
                );
                Map<String, Object> details = new HashMap<>();
                details.put("post", blog);
                details.put("full_name", rs.getString("full_name"));
                details.put("name", rs.getString("name"));
                postDetails.put(id, details);
                id++;
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return postDetails;
    }

    public LinkedHashMap<Integer, Map<String, Object>> getPostByCategoryId(int cid) {
        LinkedHashMap<Integer, Map<String, Object>> postDetails = new LinkedHashMap<>();
        String query = "SELECT b.*, u.full_name, p.name\n"
                + "FROM blogs_posts b\n"
                + "INNER JOIN postcategories p ON p.id = b.PostCategories_id\n"
                + "INNER JOIN user u ON b.User_id = u.id\n"
                + "WHERE p.id = ?\n"
                + "ORDER BY b.ID ASC;";

        try {
            PreparedStatement ps = connection.prepareStatement(query);
            ps.setInt(1, cid);
            ResultSet rs = ps.executeQuery();
            int id = 1;
            while (rs.next()) {
                BlogPost blog = new BlogPost(rs.getInt("id"), // id
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
                        rs.getString(12)
                );
                Map<String, Object> details = new HashMap<>();
                details.put("post", blog);
                details.put("full_name", rs.getString("full_name"));
                details.put("name", rs.getString("name"));
                postDetails.put(id, details);
                id++;
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return postDetails;
    }

    public int addPost(BlogPost post) {
        String query = "INSERT INTO `mydb`.`blogs_posts` \n"
                + "(`title`, `brief_info`, `thumbnail`, `details`, `updatedDate`, `PostCategories_id`, `User_id`, `flag_feature`, `status`, `blogs_postscol`) \n"
                + "VALUES \n"
                + "(?, ?, ?, ?, ?, ?, ?, ?, ?, ?);";
        int productId = 0;
        try {
            PreparedStatement ps = connection.prepareStatement(query, Statement.RETURN_GENERATED_KEYS);
            ps.setString(1, post.getTitle());
            ps.setString(2, post.getBrief_info());
            ps.setString(3, post.getThumbnail());
            ps.setString(4, post.getDetails());
            ps.setDate(5, post.getUpdatedDate());
            ps.setInt(6, post.getPostCategories_id());
            ps.setInt(7, post.getUser_id());
            ps.setBoolean(8, post.isFlag_feature());
            ps.setInt(9, post.getStatus());
            ps.setString(10, post.getBlogs_postscol());

            ps.executeUpdate();
            try ( ResultSet generatedKeys = ps.getGeneratedKeys()) {
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

    public Map<String, Object> getPostbyPostID(int postId) {
        Map<String, Object> postDetails = new LinkedHashMap<>();
        String query = "SELECT p.*, pc.name, u.full_name\n"
                + "FROM blogs_posts p\n"
                + "INNER JOIN postcategories pc ON p.PostCategories_id = pc.id\n"
                + "INNER JOIN user u ON p.User_id = u.id\n"
                + "WHERE p.id = ?\n"
                + "ORDER BY p.id ASC;";

        try {
            PreparedStatement ps = connection.prepareStatement(query);
            ps.setInt(1, postId);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                BlogPost blog = new BlogPost(
                        rs.getInt("id"), // id
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
                        rs.getString(12)
                );

                postDetails.put("post", blog);
                postDetails.put("full_name", rs.getString("full_name"));
                postDetails.put("name", rs.getString("name"));
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return postDetails;
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

    public int updatePost(BlogPost post) {
        String query = "UPDATE `mydb`.`blogs_posts`\n"
                + "SET \n"
                + "    `title` = ?,\n"
                + "    `brief_info` = ?,\n"
                + "    `thumbnail` = ?,\n"
                + "    `details` = ?,\n"
                + "    `updatedDate` = ?,\n"
                + "    `PostCategories_id` = ?,\n"
                + "    `User_id` = ?,\n"
                + "    `flag_feature` = ?,\n"
                + "    `status` = ?,\n"
                + "    `blogs_postscol` = ?\n"
                + "WHERE\n"
                + "    `id` = ?;";
        int n = 0;
        try ( PreparedStatement ps = connection.prepareStatement(query)) {
            ps.setString(1, post.getTitle());
            ps.setString(2, post.getBrief_info());
            ps.setString(3, post.getThumbnail());
            ps.setString(4, post.getDetails());
            ps.setDate(5, post.getUpdatedDate());
            ps.setInt(6, post.getPostCategories_id());
            ps.setInt(7, post.getUser_id());
            ps.setBoolean(8, post.isFlag_feature());
            ps.setInt(9, post.getStatus());
            ps.setString(10, post.getBlogs_postscol());
            ps.setInt(11, post.getId());

            n = ps.executeUpdate();

        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return n;
    }

    public int updatePostStatus(int pid, int status) {
        String query = "UPDATE mydb.blogs_posts SET status = ? WHERE id = ?";
        int n = 0;
        try {
            PreparedStatement ps = connection.prepareStatement(query);
            ps.setInt(1, status);
            ps.setInt(2, pid);
            n = ps.executeUpdate();
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return n;
    }

    public int getTotalPosts() {
        int total = 0;
        try {
            String sql = "SELECT COUNT(*) AS total_posts FROM blogs_posts";
            PreparedStatement statement = connection.prepareStatement(sql);
            ResultSet rs = statement.executeQuery();
            if (rs.next()) {
                total = rs.getInt("total_posts");
            }
        } catch (SQLException ex) {
            Logger.getLogger(BlogPostDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return total;
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
