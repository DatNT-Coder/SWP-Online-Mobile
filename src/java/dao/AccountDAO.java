/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import com.mysql.cj.xdevapi.Statement;
import context.DBContext;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import model.User;
import model.UserAddress;

/**
 *
 * @author vuduc
 */
public class AccountDAO extends DBContext {

public User getDataUser(String email, String password) {
    User user = null;
    connection = getConnection();
    String sql = "SELECT u.*, ur.role_id FROM User u "
               + "JOIN user_role ur ON u.id = ur.user_id "
               + "WHERE u.email = ? AND u.password = ?";
    try (PreparedStatement statement = connection.prepareStatement(sql)) {
        statement.setString(1, email);
        statement.setString(2, password);
        try (ResultSet resultSet = statement.executeQuery()) {
            if (resultSet.next()) {
                
                int idUser = resultSet.getInt("id");
                String emailFound = resultSet.getString("email").trim();
                String passwordFound = resultSet.getString("password").trim();
                String fullNameFound = resultSet.getString("full_name"); 
                String phoneNumberFound = resultSet.getString("phone");
                String genderFound = resultSet.getString("gender");
                Date registrationDateFound = resultSet.getDate("registration_date");
                int statusFound = resultSet.getInt("status");
                int updatedByFound = resultSet.getInt("updatedBy");
                Date updatedDateFound = resultSet.getDate("updatedDate");
                String imageFound = resultSet.getString("image");
                int settingsIdFound = resultSet.getInt("settings_id");
                int roleIdFound = resultSet.getInt("role_id");
                
                user = new User(idUser, emailFound, passwordFound, fullNameFound, phoneNumberFound, genderFound, registrationDateFound, statusFound, updatedByFound, updatedDateFound, imageFound, settingsIdFound, roleIdFound);
            }
        }
    } catch (SQLException e) {
        System.out.println("Error fetching user data: " + e.getMessage());
    }
    return user;
}

    
    public User findEmailPasswordUser(User u) {
        List<User> listFound = new ArrayList<>();
        connection = getConnection();
        // Chuẩn bị câu lệnh SQL
        String sql = "SELECT u.*, ur.role_id\n"
                + "FROM User u\n"
                + "JOIN user_role ur ON u.id = ur.user_id\n"
                + "WHERE u.email = ? AND u.password = ?;";
        try {
            // Tạo đối tượng PreparedStatement
            statement = connection.prepareStatement(sql);
            // Lấy giá trị username và password từ đối tượng u để gán vào các vị trí ?
            statement.setObject(1, u.getEmail());
            statement.setObject(2, u.getPassword());

            // Thực thi câu lệnh
            resultSet = statement.executeQuery();
            if (resultSet.next()) {
                int idUser = resultSet.getInt("id");
                String emailFound = resultSet.getString("email").trim();
                String passwordFound = resultSet.getString("password").trim();
                int roleIdFound = resultSet.getInt("role_id");
                System.out.println("role_id from database: " + roleIdFound);
                User userFound = new User(idUser, emailFound, passwordFound, roleIdFound);
                listFound.add(userFound);

            }
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        return listFound.isEmpty() ? null : listFound.get(0);
    }

    public boolean checkUserEmailExist(User u) {
        boolean check = false;
        // Kết nối với cơ sở dữ liệu
        connection = getConnection();
        // Chuẩn bị câu lệnh SQL
        String sql = "SELECT * FROM `user` WHERE `email` = ?";
        try {
            // Tạo đối tượng PreparedStatement
            statement = connection.prepareStatement(sql);
            // Đặt giá trị cho tham số
            statement.setString(1, u.getEmail());
            // Thực thi câu lệnh
            resultSet = statement.executeQuery();
            // Nếu có dòng dữ liệu nào trả về, username đã tồn tại
            check = resultSet.next();
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        } finally {
            // Đóng các tài nguyên sau khi sử dụng
            try {
                if (resultSet != null) {
                    resultSet.close();
                }
                if (statement != null) {
                    statement.close();
                }
                if (connection != null) {
                    connection.close();
                }
            } catch (SQLException e) {
                System.out.println(e.getMessage());
            }
        }
        return check;
    }

    public boolean checkUserEmailExistString(String u) {
        boolean check = false;
        // Kết nối với cơ sở dữ liệu
        connection = getConnection();
        // Chuẩn bị câu lệnh SQL
        String sql = "SELECT * FROM `user` WHERE `email` = ?";
        try {
            // Tạo đối tượng PreparedStatement
            statement = connection.prepareStatement(sql);
            // Đặt giá trị cho tham số
            statement.setString(1, u);
            // Thực thi câu lệnh
            resultSet = statement.executeQuery();
            // Nếu có dòng dữ liệu nào trả về, username đã tồn tại
            check = resultSet.next();
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        } finally {
            // Đóng các tài nguyên sau khi sử dụng
            try {
                if (resultSet != null) {
                    resultSet.close();
                }
                if (statement != null) {
                    statement.close();
                }
                if (connection != null) {
                    connection.close();
                }
            } catch (SQLException e) {
                System.out.println(e.getMessage());
            }
        }
        return check;
    }


    public void insertUserToDB(User user) {
        try {
            // Kết nối với cơ sở dữ liệu
            connection = getConnection();

            // Tạo câu lệnh SQL để chèn user
            String sql = "INSERT INTO `user` "
                    + "(email, password, full_name, phone, gender, registration_date, status, updatedBy, updatedDate, image, settings_id) "
                    + "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";

            // Chuẩn bị câu lệnh SQL
            statement = connection.prepareStatement(sql, statement.RETURN_GENERATED_KEYS);

            // Gán giá trị vào câu lệnh SQL
            statement.setString(1, user.getEmail());
            statement.setString(2, user.getPassword());
            statement.setString(3, user.getFull_name());
            statement.setString(4, user.getPhone());
            statement.setString(5, user.getGender());
            statement.setDate(6, new java.sql.Date(user.getRegistration_date().getTime()));
            statement.setInt(7, user.getStatus());
            statement.setInt(8, user.getUpdatedBy());

            // Xử lý giá trị NULL cho updated_date và image
            if (user.getUpdatedDate() != null) {
                statement.setDate(9, new java.sql.Date(user.getUpdatedDate().getTime()));
            } else {
                statement.setNull(9, java.sql.Types.DATE);
            }

            if (user.getImage() != null) {
                statement.setString(10, user.getImage());
            } else {
                statement.setNull(10, java.sql.Types.VARCHAR);
            }

            statement.setInt(11, user.getSettings_id());

            // Thực thi câu lệnh SQL
            statement.executeUpdate();
            resultSet = statement.getGeneratedKeys();

            // Kiểm tra nếu có ID được sinh tự động
            if (resultSet.next()) {
                int userId = resultSet.getInt(1);
                System.out.println("User inserted with ID: " + userId);

                // Sau khi chèn user, thêm user_id vào bảng user_role
                insertToUserRole(userId, 1); // Gán mặc định role_id = 1
            }

        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            // Đóng tài nguyên
            try {
                if (resultSet != null) {
                    resultSet.close();
                }
                if (statement != null) {
                    statement.close();
                }
                if (connection != null) {
                    connection.close();
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }
    
    public void insertUserToDB(User user, String address) {
        try {
            // Kết nối với cơ sở dữ liệu
            connection = getConnection();

            // Tạo câu lệnh SQL để chèn user
            String sql = "INSERT INTO `user` "
                    + "(email, password, full_name, phone, gender, registration_date, status, updatedBy, updatedDate, image, settings_id) "
                    + "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";

            // Chuẩn bị câu lệnh SQL
            statement = connection.prepareStatement(sql, statement.RETURN_GENERATED_KEYS);

            // Gán giá trị vào câu lệnh SQL
            statement.setString(1, user.getEmail());
            statement.setString(2, user.getPassword());
            statement.setString(3, user.getFull_name());
            statement.setString(4, user.getPhone());
            statement.setString(5, user.getGender());
            statement.setDate(6, new java.sql.Date(user.getRegistration_date().getTime()));
            statement.setInt(7, user.getStatus());
            statement.setInt(8, user.getUpdatedBy());

            // Xử lý giá trị NULL cho updated_date và image
            if (user.getUpdatedDate() != null) {
                statement.setDate(9, new java.sql.Date(user.getUpdatedDate().getTime()));
            } else {
                statement.setNull(9, java.sql.Types.DATE);
            }

            if (user.getImage() != null) {
                statement.setString(10, user.getImage());
            } else {
                statement.setNull(10, java.sql.Types.VARCHAR);
            }

            statement.setInt(11, user.getSettings_id());

            // Thực thi câu lệnh SQL
            statement.executeUpdate();
            resultSet = statement.getGeneratedKeys();

            // Kiểm tra nếu có ID được sinh tự động
            if (resultSet.next()) {
                int userId = resultSet.getInt(1);
                System.out.println("User inserted with ID: " + userId);

                // Sau khi chèn user, thêm user_id vào bảng user_role
                insertToUserRole(userId, 1); // Gán mặc định role_id = 1
                insertToUserAddress(userId, address);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            // Đóng tài nguyên
            try {
                if (resultSet != null) {
                    resultSet.close();
                }
                if (statement != null) {
                    statement.close();
                }
                if (connection != null) {
                    connection.close();
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }

// Phương thức thêm user vào bảng user_role
    private void insertToUserRole(int idFromUser, int roleId) {
        try {
            connection = getConnection();
            String sql = "INSERT INTO user_role (user_id, role_id) VALUES (?, ?)";
            statement = connection.prepareStatement(sql);
            statement.setInt(1, idFromUser);
            statement.setInt(2, roleId);

            statement.executeUpdate();
            System.out.println("Id của User " + idFromUser + " được thêm vào user_role với role ID " + roleId);

        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                if (statement != null) {
                    statement.close();
                }
                if (connection != null) {
                    connection.close();
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }
    
    private void insertToUserAddress(int idFromUser, String address) {
        try {
            connection = getConnection();
            String sql = "INSERT INTO useraddress (user_id, user_address) VALUES (?, ?)";
            statement = connection.prepareStatement(sql);
            statement.setInt(1, idFromUser);
            statement.setString(2, address);

            statement.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                if (statement != null) {
                    statement.close();
                }
                if (connection != null) {
                    connection.close();
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }


    public boolean checkOldPassword(String email, String oldPassword) {
        boolean isValid = false;

        // Kết nối với cơ sở dữ liệu
        connection = getConnection();

        // Câu lệnh SQL để kiểm tra email và mật khẩu
        String sql = "SELECT * FROM `user` WHERE `email` = ? AND `password` = ?";

        try {
            // Tạo PreparedStatement
            statement = connection.prepareStatement(sql);
            // Đặt giá trị cho tham số
            statement.setString(1, email);
            statement.setString(2, oldPassword);
            // Thực thi câu lệnh SQL
            resultSet = statement.executeQuery();
            // Nếu có dữ liệu trả về, nghĩa là mật khẩu cũ đúng
            isValid = resultSet.next();
        } catch (SQLException e) {
            System.out.println("Lỗi kiểm tra mật khẩu cũ: " + e.getMessage());
        } finally {
            // Đóng các tài nguyên
            try {
                if (resultSet != null) {
                    resultSet.close();
                }
                if (statement != null) {
                    statement.close();
                }
                if (connection != null) {
                    connection.close();
                }
            } catch (SQLException e) {
                System.out.println("Lỗi đóng tài nguyên: " + e.getMessage());
            }
        }
        return isValid;
    }

    
public boolean updatePassword(String email, String newPassword) {
    boolean isUpdated = false;

    // Câu lệnh SQL cập nhật mật khẩu
    String sql = "UPDATE `user` SET `password` = ? WHERE `email` = ?";
    
    try {
        // Kết nối với cơ sở dữ liệu
        connection = getConnection();
        statement = connection.prepareStatement(sql);
        
        // Đặt giá trị cho tham số
        statement.setString(1, newPassword);
        statement.setString(2, email);
        
        // Thực thi câu lệnh SQL
        int rowsAffected = statement.executeUpdate();
        
        // Nếu có ít nhất một dòng được cập nhật, tức là cập nhật thành công
        isUpdated = rowsAffected > 0;
    } catch (SQLException e) {
        System.out.println("Lỗi cập nhật mật khẩu: " + e.getMessage());
    } finally {
        // Đóng tài nguyên để tránh rò rỉ
        try {
            if (statement != null) statement.close();
            if (connection != null) connection.close();
        } catch (SQLException e) {
            System.out.println("Lỗi đóng tài nguyên: " + e.getMessage());
        }
    }
    return isUpdated;
}

    
    
        public static void main(String[] args) {
        AccountDAO d = new AccountDAO();

//        User a = new User("gggg@gmail.com", "a12345");
//        User isExist = d.findEmailPasswordUser(a);
//        System.out.println(isExist);
//        
//         User b = new User("gggg@gmail.com");
//         System.out.println(d.checkUserEmailExist(b));
//         
//        String emailUser = "gggg@gmail.com";
//        String password = "a12345";
//        String username = "Pham Thanh Vinh";
//        String phone = "1234567890";
//        String gender = "Male";
//        Date registrationDate = new Date(System.currentTimeMillis());
//        int status = 1;
//        int updatedBy = 0;
//        Date updatedDate = null;
//        String image = null;
//        int settingsId = 1;
//        User ru = new User(emailUser, password, username, phone, gender, registrationDate, status, updatedBy, updatedDate, image, settingsId);
//        d.insertUserToDB(ru);

//        System.out.println(d.checkUserEmailExistString("john.doe@example.com"));
        
//        System.out.println(d.checkOldPassword("john.doe@example.com", "pass123"));
        
//        System.out.println(d.updatePassword("john.doe@example.com", "alo123"));
            

//        System.out.println(d.getDataUser("alex.jones@example.com", "123"));
    
    }

    public User getUserById(String id) {
        User user = null;
        connection = getConnection();
        // Chuẩn bị câu lệnh SQL
        String sql = "SELECT *\n"
                + "FROM User u, useraddress ud\n"
                + "WHERE u.id = ud.user_id and u.id = ?";
        try {
            // Tạo đối tượng PreparedStatement
            statement = connection.prepareStatement(sql);
            // Lấy giá trị username và password từ đối tượng u để gán vào các vị trí ?
            statement.setInt(1, Integer.parseInt(id));

            // Thực thi câu lệnh
                user = new User(resultSet.getInt(1), 
                        resultSet.getString(2), 
                        resultSet.getString(3), 
                        resultSet.getString(4), 
                        resultSet.getString(5), 
                        resultSet.getString(6), 
                        resultSet.getDate(7), 
                        resultSet.getInt(8), 
                        resultSet.getInt(9), 
                        resultSet.getDate(10), resultSet.getString(11), resultSet.getInt(12));
                
                UserAddress ud = new UserAddress(resultSet.getString(13), resultSet.getInt(1));
               
                user.setUserAddress(ud);
            }
        catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        return user;
    
    }

    public void updateUserToDB(User user) {
        try {
            // Kết nối với cơ sở dữ liệu
            connection = getConnection();
            // Tạo câu lệnh SQL để chèn user
            String sql = "update `user` "
                    + "set full_name = ?, phone = ?, gender = ?, status = ?, updatedBy = ?, updatedDate =?, image=? "
                    + "where id = ?";

            // Gán giá trị vào câu lệnh SQL
            statement = connection.prepareStatement(sql);
            statement.setString(1, user.getFull_name());
            statement.setString(2, user.getPhone());
            statement.setString(3, user.getGender());
            statement.setInt(4, user.getStatus());
            statement.setInt(5, user.getUpdatedBy());
            statement.setDate(6, new java.sql.Date(user.getUpdatedDate().getTime()));
            statement.setString(7, user.getImage());
            statement.setInt(8, user.getId());

         
            // Thực thi câu lệnh SQL
            statement.executeUpdate();
            updateUserAddressToDB(user.getUserAddress());
            

        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            // Đóng tài nguyên
            try {
                if (resultSet != null) {
                    resultSet.close();
                }
                if (statement != null) {
                    statement.close();
                }
                if (connection != null) {
                    connection.close();
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }
        public void updateUserAddressToDB(UserAddress ua) {
        try {
            // Kết nối với cơ sở dữ liệu
            connection = getConnection();

            // Tạo câu lệnh SQL để chèn user
            String sql = "update `useraddress` "
                    + "set user_address = ? "
                    + "where user_id = ?";

            // Gán giá trị vào câu lệnh SQL
            statement = connection.prepareStatement(sql);
            statement.setString(1, ua.getUserAddress());
           
            statement.setInt(2, ua.getUserId());

         
            // Thực thi câu lệnh SQL
            statement.executeUpdate();

            

        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            // Đóng tài nguyên
            try {
                if (resultSet != null) {
                    resultSet.close();
                }
                if (statement != null) {
                    statement.close();
                }
                if (connection != null) {
                    connection.close();
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }
    
}
