/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author tiend
 */
public class GeneralFeedback {
    private int id;
    private String full_name;
    private String gender;
    private String email;
    private String phone;
    private int rating;
    private String image;
    private String comment;
    private int user_id;
    private int status;
    private String image_status;

    public GeneralFeedback() {
    }

   

    public GeneralFeedback(int id, String full_name, String gender, String email, String phone, int rating, String image, String comment, int user_id, int status, String image_status) {
        this.id = id;
        this.full_name = full_name;
        this.gender = gender;
        this.email = email;
        this.phone = phone;
        this.rating = rating;
        this.image = image;
        this.comment = comment;
        this.user_id = user_id;
        this.status = status;
        this.image_status = image_status;
    }
    
    public GeneralFeedback(String full_name, String gender, String email, String phone, int rating, String image, String comment, int user_id, int status, String image_status) {
        this.full_name = full_name;
        this.gender = gender;
        this.email = email;
        this.phone = phone;
        this.rating = rating;
        this.image = image;
        this.comment = comment;
        this.user_id = user_id;
        this.status = status;
        this.image_status = image_status;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getFull_name() {
        return full_name;
    }

    public void setFull_name(String full_name) {
        this.full_name = full_name;
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public int getRating() {
        return rating;
    }

    public void setRating(int rating) {
        this.rating = rating;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public String getComment() {
        return comment;
    }

    public void setComment(String comment) {
        this.comment = comment;
    }

    public int getUser_id() {
        return user_id;
    }

    public void setUser_id(int user_id) {
        this.user_id = user_id;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    public String getImage_status() {
        return image_status;
    }

    public void setImage_status(String image_status) {
        this.image_status = image_status;
    }

    @Override
    public String toString() {
        return "GeneralFeedback{" + "id=" + id + ", full_name=" + full_name + ", gender=" + gender + ", email=" + email + ", phone=" + phone + ", rating=" + rating + ", image=" + image + ", comment=" + comment + ", user_id=" + user_id + ", status=" + status + ", image_status=" + image_status + '}';
    }

   
   
    
}

