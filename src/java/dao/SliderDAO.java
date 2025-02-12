/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import model.Slider;
import context.DBContext;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author naokh
 */
public class SliderDAO extends DBContext {

          public List<Slider> getAllSliders() {
                    List<Slider> sliders = new ArrayList<>();
                    String query = "SELECT * FROM slider";
                    try {
                              connection = getConnection();
                              statement = connection.prepareStatement(query);
                              resultSet = statement.executeQuery();
                              while (resultSet.next()) {
                                        Slider slider = new Slider(
                                                resultSet.getInt("id"),
                                                resultSet.getString("title"),
                                                resultSet.getString("image"),
                                                resultSet.getString("backlink"),
                                                resultSet.getInt("status"),
                                                resultSet.getString("notes"),
                                                resultSet.getInt("marketing_id"),
                                                resultSet.getDate("updated_date")
                                        );
                                        System.out.println(slider); // Debug print
                                        sliders.add(slider);
                              }
                    } catch (SQLException e) {
                              System.err.println("Error in getAllSliders: " + e.getMessage());
                    } finally {
                              close();
                    }
                    return sliders;
          }

          private void close() {
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
                              System.err.println("Error closing resources: " + e.getMessage());
                    }
          }
}
