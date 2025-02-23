/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */

/**
 *
 * @author tiend
 */
public class ProductFeedback {

    private int id;
    private String full_name;
    private String gender;
    private String email;
    private String phone;
    private int rating;
    private String image;
    private String comment;
    private int product_Id;
    private int user_Id;
    private int status;
    private int imageStatus;

    public ProductFeedback() {
    }

    public ProductFeedback(int id, String full_name, String gender, String email, String phone, int rating, String image, String comment, int product_Id, int user_Id, int status, int imageStatus) {
        this.id = id;
        this.full_name = full_name;
        this.gender = gender;
        this.email = email;
        this.phone = phone;
        this.rating = rating;
        this.image = image;
        this.comment = comment;
        this.product_Id = product_Id;
        this.user_Id = user_Id;
        this.status = status;
        this.imageStatus = imageStatus;
    }

    public ProductFeedback(int id, String full_name, int rating, int status, String comment) {
        this.id = id;
        this.full_name = full_name;
        this.rating = rating;
        this.comment = comment;
        this.status = status;
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

    public int getProduct_Id() {
        return product_Id;
    }

    public void setProduct_Id(int product_Id) {
        this.product_Id = product_Id;
    }

    public int getUser_Id() {
        return user_Id;
    }

    public void setUser_Id(int user_Id) {
        this.user_Id = user_Id;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    public int getImageStatus() {
        return imageStatus;
    }

    public void setImageStatus(int imageStatus) {
        this.imageStatus = imageStatus;
    }

    @Override
    public String toString() {
        return "ProductFeedback{" + "id=" + id + ", full_name=" + full_name + ", gender=" + gender + ", email=" + email + ", phone=" + phone + ", rating=" + rating + ", image=" + image + ", comment=" + comment + ", product_Id=" + product_Id + ", user_Id=" + user_Id + ", status=" + status + ", imageStatus=" + imageStatus + '}';
    }

}
