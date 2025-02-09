/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import context.DBContext;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import model.User;

/**
 *
 * @author vuduc
 */
public class AccountDAO extends DBContext {

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

          public static void main(String[] args) {
                    AccountDAO d = new AccountDAO();
                    User a = new User("john.doe@example.com", "pass123");
                    System.out.println(d.findEmailPasswordUser(a));
          }

}
