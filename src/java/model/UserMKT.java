/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.sql.Date;

/**
 *
 * @author naokh
 */
public class UserMKT {

   private int ID;
   private String email;
   private String password;
   private String full_name;
   private String phone;
   private String gender;
   private Date registration_date;
   private int status;
   private int updateBy;
   private Date updateDate;
   private String image;
   private int settings_id;

   public UserMKT() {
   }

   public UserMKT(int ID, String email, String password, String full_name, String phone, String gender, Date registration_date, int status, int updateBy, Date updateDate, String image, int settings_id) {
      this.ID = ID;
      this.email = email;
      this.password = password;
      this.full_name = full_name;
      this.phone = phone;
      this.gender = gender;
      this.registration_date = registration_date;
      this.status = status;
      this.updateBy = updateBy;
      this.updateDate = updateDate;
      this.image = image;
      this.settings_id = settings_id;
   }

   public int getID() {
      return ID;
   }

   public void setID(int ID) {
      this.ID = ID;
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

   public int getUpdateBy() {
      return updateBy;
   }

   public void setUpdateBy(int updateBy) {
      this.updateBy = updateBy;
   }

   public Date getUpdateDate() {
      return updateDate;
   }

   public void setUpdateDate(Date updateDate) {
      this.updateDate = updateDate;
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

   @Override
   public String toString() {
      return "UserMKT{" + "ID=" + ID + ", email=" + email + ", password=" + password + ", full_name=" + full_name + ", phone=" + phone + ", gender=" + gender + ", registration_date=" + registration_date + ", status=" + status + ", updateBy=" + updateBy + ", updateDate=" + updateDate + ", image=" + image + ", settings_id=" + settings_id + '}';
   }

}
