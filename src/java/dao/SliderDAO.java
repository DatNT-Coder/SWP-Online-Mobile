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
**/
public class SliderDAO extends DBContext {

    // Get sliders with pagination
    public List<Slider> getSlidersByPage(int page, int pageSize) {
        List<Slider> sliders = new ArrayList<>();
        String query = "SELECT * FROM slider LIMIT ? OFFSET ?";
        try {
            connection = getConnection();
            statement = connection.prepareStatement(query);
            statement.setInt(1, pageSize);
            statement.setInt(2, (page - 1) * pageSize);
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
                sliders.add(slider);
            }
        } catch (SQLException e) {
            System.err.println("Error in getSlidersByPage: " + e.getMessage());
        }
        return sliders;
    }

    // Get total count of sliders for pagination
    public int getTotalSliders() {
        String query = "SELECT COUNT(*) FROM slider";
        try {
            connection = getConnection();
            statement = connection.prepareStatement(query);
            resultSet = statement.executeQuery();
            if (resultSet.next()) {
                return resultSet.getInt(1);
            }
        } catch (SQLException e) {
            System.err.println("Error in getTotalSliders: " + e.getMessage());
        }
        return 0;
    }
}