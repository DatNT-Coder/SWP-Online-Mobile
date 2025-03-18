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
import java.util.Vector;
import model.Setting;
/**
 *
 * @author tiend
 */
public class SettingDAO extends DBContext {

    public Vector<Setting> getAllSettingWithSort(String sortBy) {
        Vector<Setting> list = new Vector<>();
        String query = "select * from mydb.settings order by " + sortBy;
        try {
            this.connection = getConnection();
            PreparedStatement ps = connection.prepareStatement(query);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Setting(rs.getInt("id"), rs.getString("name"), rs.getString("value"), rs.getString("type"), rs.getInt("order"), rs.getString("description"), rs.getInt("isActive"), rs.getInt("canDeactive")));
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public Vector<Setting> getSettingWithSearch(String search) {
        Vector<Setting> list = new Vector<>();
        String query = "SELECT * FROM mydb.settings WHERE value LIKE '%" + search + "%' OR name LIKE '%" + search + "%';";
        try {
            this.connection = getConnection();
            PreparedStatement ps = connection.prepareStatement(query);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Setting(rs.getInt("id"), rs.getString("name"), rs.getString("value"), rs.getString("type"), rs.getInt("order"), rs.getString("description"), rs.getInt("isActive"), rs.getInt("canDeactive")));
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public Vector<Setting> getSettingByType(String type) {
        Vector<Setting> list = new Vector<>();
        String query = "SELECT * FROM mydb.settings WHERE type LIKE '" + type + "'";
        try {
            this.connection = getConnection();
            PreparedStatement ps = connection.prepareStatement(query);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Setting(rs.getInt("id"), rs.getString("name"), rs.getString("value"), rs.getString("type"), rs.getInt("order"), rs.getString("description"), rs.getInt("isActive"), rs.getInt("canDeactive")));
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public Vector<Setting> getSettingByStatus(int status) {
        Vector<Setting> list = new Vector<>();
        String query = "SELECT * FROM mydb.settings WHERE isActive = " + status;
        try {
            this.connection = getConnection();
            PreparedStatement ps = connection.prepareStatement(query);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Setting(rs.getInt("id"), rs.getString("name"), rs.getString("value"), rs.getString("type"), rs.getInt("order"), rs.getString("description"), rs.getInt("isActive"), rs.getInt("canDeactive")));
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public Vector<Setting> getAllType() {
        Vector<Setting> list = new Vector<>();
        String query = "SELECT DISTINCT type FROM mydb.settings;";
        try {
            this.connection = getConnection();
            PreparedStatement ps = connection.prepareStatement(query);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Setting s = new Setting();
                s.setType(rs.getString("type"));
                list.add(s);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public Setting getSettingByID(int id) {
        Vector<Setting> list = new Vector<>();
        String query = "SELECT * FROM mydb.settings WHERE id = ?";
        try {
            this.connection = getConnection();
            PreparedStatement ps = connection.prepareStatement(query);
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                return new Setting(rs.getInt("id"), rs.getString("name"), rs.getString("value"), rs.getString("type"), rs.getInt("order"), rs.getString("description"), rs.getInt("isActive"), rs.getInt("canDeactive"));
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    public int updateSettingStatus(int sid, int status) {
        String query = "UPDATE mydb.settings SET isActive = ? WHERE id = ?";
        int n = 0;
        try {
            this.connection = getConnection();
            PreparedStatement ps = connection.prepareStatement(query);
            ps.setInt(1, status);
            ps.setInt(2, sid);
            n = ps.executeUpdate();
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return n;
    }

    public int updateSetting(Setting setting) {
        String query = "UPDATE settings SET name = ?, value = ?, type = ?, `order` = ?, description = ?, isActive = ?, canDeactive = ? WHERE id = ?";
        int n = 0;
        try {
            this.connection = getConnection();
            PreparedStatement ps = connection.prepareStatement(query);
            ps.setString(1, setting.getName());
            ps.setString(2, setting.getValue());
            ps.setString(3, setting.getType());
            ps.setInt(4, setting.getOrder());
            ps.setString(5, setting.getDescription());
            ps.setInt(6, setting.getIsActive());
            ps.setInt(7, setting.getCanDeactive());
            ps.setInt(8, setting.getId());

            n = ps.executeUpdate();

        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return n;
    }

    public int insertSetting(Setting setting) {
        String query = "INSERT INTO settings (name, value, type, `order`, description, isActive, canDeactive) VALUES (?, ?, ?, ?, ?, ?, ?)";
        int settingId = 0;
        try {
            this.connection = getConnection();
            PreparedStatement ps = connection.prepareStatement(query, Statement.RETURN_GENERATED_KEYS);
            ps.setString(1, setting.getName());
            ps.setString(2, setting.getValue());
            ps.setString(3, setting.getType());
            ps.setInt(4, setting.getOrder());
            ps.setString(5, setting.getDescription());
            ps.setInt(6, setting.getIsActive());
            ps.setInt(7, setting.getCanDeactive());

            ps.executeUpdate();
            try ( ResultSet generatedKeys = ps.getGeneratedKeys()) {
                if (generatedKeys.next()) {
                    settingId = generatedKeys.getInt(1);
                } else {
                    throw new SQLException("Tạo cài đặt mới thất bại, không có ID nào được tạo.");
                }
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return settingId;
    }

    public static void main(String[] args) {
        SettingDAO dao = new SettingDAO();
        Setting list = dao.getSettingByID(1);
        System.out.println(list);
    }
}

