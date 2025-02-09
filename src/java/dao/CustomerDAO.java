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
import java.util.List;
import model.User;

/**
 *
 * @author admin
 */
public class CustomerDAO extends DBContext {

          public List<User> getAllCustomers() {
                    List<User> customers = new ArrayList<>();
                    String query = "SELECT id, full_name, gender, email, phone, status FROM mydb.user;";

                    try {
                              this.connection = getConnection();
                              PreparedStatement ps = connection.prepareStatement(query);
                              ResultSet rs = ps.executeQuery();

                              while (rs.next()) {
                                        User customer = new User();
                                        customer.setId(rs.getInt("id"));
                                        customer.setFull_name(rs.getString("full_name"));
                                        customer.setGender(rs.getString("gender"));
                                        customer.setEmail(rs.getString("email"));
                                        customer.setPhone(rs.getString("phone"));
                                        customer.setStatus(rs.getInt("status"));
                                        customers.add(customer);
                              }
                    } catch (SQLException e) {
                              System.out.println("Error fetching customers: " + e.getMessage());
                    } finally {
                              try {
                                        if (connection != null) {
                                                  connection.close();
                                        }
                              } catch (SQLException e) {
                                        System.out.println("Error closing connection: " + e.getMessage());
                              }
                    }
                    return customers;

          }

          public List<User> searchCustomers(String keyword) {
                    List<User> customers = new ArrayList<>();
                    String query = "SELECT id, full_name, gender, email, phone, status FROM mydb.user\n"
                            + "WHERE full_name LIKE ? OR email LIKE ? OR phone LIKE ?";

                    try {
                              this.connection = getConnection();
                              PreparedStatement ps = connection.prepareStatement(query);
                              String searchKeyword = "%" + keyword + "%";
                              ps.setString(1, searchKeyword);
                              ps.setString(2, searchKeyword);
                              ps.setString(3, searchKeyword);
                              ResultSet rs = ps.executeQuery();

                              while (rs.next()) {
                                        User customer = new User();
                                        customer.setId(rs.getInt("id"));
                                        customer.setFull_name(rs.getString("full_name"));
                                        customer.setGender(rs.getString("gender"));
                                        customer.setEmail(rs.getString("email"));
                                        customer.setPhone(rs.getString("phone"));
                                        customer.setStatus(rs.getInt("status"));
                                        customers.add(customer);
                              }
                    } catch (SQLException e) {
                              System.out.println("Error searching customers: " + e.getMessage());
                    } finally {
                              try {
                                        if (connection != null) {
                                                  connection.close();
                                        }
                              } catch (SQLException e) {
                                        System.out.println("Error closing connection: " + e.getMessage());
                              }
                    }
                    return customers;
          }

          public List<User> filterCustomersByStatus(int status) {
                    List<User> customers = new ArrayList<>();
                    String query = "SELECT id, full_name, gender, email, phone, status FROM mydb.user WHERE status = ?";

                    try {
                              this.connection = getConnection();
                              PreparedStatement ps = connection.prepareStatement(query);
                              ps.setInt(1, status);
                              ResultSet rs = ps.executeQuery();

                              while (rs.next()) {
                                        User customer = new User();
                                        customer.setId(rs.getInt("id"));
                                        customer.setFull_name(rs.getString("full_name"));
                                        customer.setGender(rs.getString("gender"));
                                        customer.setEmail(rs.getString("email"));
                                        customer.setPhone(rs.getString("phone"));
                                        customer.setStatus(rs.getInt("status"));
                                        customers.add(customer);
                              }
                    } catch (SQLException e) {
                              System.out.println("Error filtering customers: " + e.getMessage());
                    } finally {
                              try {
                                        if (connection != null) {
                                                  connection.close();
                                        }
                              } catch (SQLException e) {
                                        System.out.println("Error closing connection: " + e.getMessage());
                              }
                    }
                    return customers;
          }

          public void addCustomer(User customer) {
                    String query = "INSERT INTO mydb.user (full_name, gender, email, phone, status) VALUES (?, ?, ?, ?, ?)";

                    try {
                              this.connection = getConnection();
                              PreparedStatement ps = connection.prepareStatement(query);
                              ps.setString(1, customer.getFull_name());
                              ps.setString(2, customer.getGender());
                              ps.setString(3, customer.getEmail());
                              ps.setString(4, customer.getPhone());
                              ps.setInt(5, customer.getStatus());

                              ps.executeUpdate();
                    } catch (SQLException e) {
                              System.out.println("Error adding customer: " + e.getMessage());
                    } finally {
                              try {
                                        if (connection != null) {
                                                  connection.close();
                                        }
                              } catch (SQLException e) {
                                        System.out.println("Error closing connection: " + e.getMessage());
                              }
                    }
          }

}
