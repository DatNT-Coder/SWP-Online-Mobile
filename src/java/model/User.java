/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.util.Date;

/**
 *
 * @author vuduc
 */
public class User {
    private int id;
    private String email;
    private String password;
    private String full_name;
    private String phone;
    private String gender;
    private Date registration_date;
    private int status;
    private int updatedBy;
    private Date updatedDate;
    private String image;
    private int settings_id;
    private int role_id;

    @Override
    public String toString() {
        return "User{" + "id=" + id + ", email=" + email + ", password=" + password + ", full_name=" + full_name + ", phone=" + phone + ", gender=" + gender + ", registration_date=" + registration_date + ", status=" + status + ", updatedBy=" + updatedBy + ", updatedDate=" + updatedDate + ", image=" + image + ", settings_id=" + settings_id + ", role_id=" + role_id + '}';
    }

    public User(String email, String password, String full_name, String phone, String gender, Date registration_date, int status, int updatedBy, Date updatedDate, String image, int settings_id) {
        this.email = email;
        this.password = password;
        this.full_name = full_name;
        this.phone = phone;
        this.gender = gender;
        this.registration_date = registration_date;
        this.status = status;
        this.updatedBy = updatedBy;
        this.updatedDate = updatedDate;
        this.image = image;
        this.settings_id = settings_id;
    }

    public User(int id, String email, String password, String full_name, String phone, String gender, Date registration_date, int status, int updatedBy, Date updatedDate, String image, int settings_id, int role_id) {
        this.id = id;
        this.email = email;
        this.password = password;
        this.full_name = full_name;
        this.phone = phone;
        this.gender = gender;
        this.registration_date = registration_date;
        this.status = status;
        this.updatedBy = updatedBy;
        this.updatedDate = updatedDate;
        this.image = image;
        this.settings_id = settings_id;
        this.role_id = role_id;
    }



    public User(int id, String email, String password, int role_id) {
        this.id = id;
        this.email = email;
        this.password = password;
        this.role_id = role_id;
    }

    public User(int id, String email, String password) {
        this.id = id;
        this.email = email;
        this.password = password;
    }

    public User(String email) {
        this.email = email;
    }

    public User(String email, String password) {
        this.email = email;
        this.password = password;
    }
    
    public User(int id, String email, String password, String full_name, String phone, String gender, Date registration_date, int status, int updatedBy, Date updatedDate, String image, int settings_id) {
        this.id = id;
        this.email = email;
        this.password = password;
        this.full_name = full_name;
        this.phone = phone;
        this.gender = gender;
        this.registration_date = registration_date;
        this.status = status;
        this.updatedBy = updatedBy;
        this.updatedDate = updatedDate;
        this.image = image;
        this.settings_id = settings_id;
    }

    public User() {
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getFull_name() {
        return full_name;
    }

    public void setFull_name(String full_name) {
        this.full_name = full_name;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    public Date getRegistration_date() {
        return registration_date;
    }

    public void setRegistration_date(Date registration_date) {
        this.registration_date = registration_date;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    public int getUpdatedBy() {
        return updatedBy;
    }

    public void setUpdatedBy(int updatedBy) {
        this.updatedBy = updatedBy;
    }

    public Date getUpdatedDate() {
        return updatedDate;
    }

    public void setUpdatedDate(Date updatedDate) {
        this.updatedDate = updatedDate;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public int getSettings_id() {
        return settings_id;
    }

    public void setSettings_id(int settings_id) {
        this.settings_id = settings_id;
    }
    
    
}
