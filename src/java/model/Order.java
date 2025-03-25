/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.sql.Date;

/**
 *
 * @author Asus
 */
public class Order {

   private int Id;
   private int uId;
   private String userName;
   private Date date;
   private double totalMoney;
   private int status;
   private double discount;
   private String address;
   private String phone;
   private String email;
   private String note;
   private String gender;
   private int saleId;
   private String saleName;
   private int settingId;

   public Order(int Id, int uId, String userName, Date date, double totalMoney, int status, double discount, String address, String phone, String email, String note, String gender, int saleId, String saleName, int settingId) {
      this.Id = Id;
      this.uId = uId;
      this.userName = userName;
      this.date = date;
      this.totalMoney = totalMoney;
      this.status = status;
      this.discount = discount;
      this.address = address;
      this.phone = phone;
      this.email = email;
      this.note = note;
      this.gender = gender;
      this.saleId = saleId;
      this.saleName = saleName;
      this.settingId = settingId;
   }

   public Order() {
   }

   public Order(int Id, int uId, Date date, double totalMoney, int status, double discount, String address, String phone, String email, String note, String gender, int saleId, int settingId) {
      this.Id = Id;
      this.uId = uId;
      this.date = date;
      this.totalMoney = totalMoney;
      this.status = status;
      this.discount = discount;
      this.address = address;
      this.phone = phone;
      this.email = email;
      this.note = note;
      this.gender = gender;
      this.saleId = saleId;
      this.settingId = settingId;

   }

   public int getId() {
      return Id;
   }

   public void setId(int Id) {
      this.Id = Id;
   }

   public int getuId() {
      return uId;
   }

   public void setuId(int uId) {
      this.uId = uId;
   }

   public Date getDate() {
      return date;
   }

   public void setDate(Date date) {
      this.date = date;
   }

   public double getTotalMoney() {
      return totalMoney;
   }

   public void setTotalMoney(double totalMoney) {
      this.totalMoney = totalMoney;
   }

   public int getStatus() {
      return status;
   }

   public void setStatus(int status) {
      this.status = status;
   }

   public double getDiscount() {
      return discount;
   }

   public void setDiscount(double discount) {
      this.discount = discount;
   }

   public String getAddress() {
      return address;
   }

   public void setAddress(String address) {
      this.address = address;
   }

   public String getPhone() {
      return phone;
   }

   public void setPhone(String phone) {
      this.phone = phone;
   }

   public String getEmail() {
      return email;
   }

   public void setEmail(String email) {
      this.email = email;
   }

   public String getNote() {
      return note;
   }

   public void setNote(String note) {
      this.note = note;
   }

   public String getGender() {
      return gender;
   }

   public void setGender(String gender) {
      this.gender = gender;
   }

   public int getSaleId() {
      return saleId;
   }

   public void setSaleId(int saleId) {
      this.saleId = saleId;
   }

   public int getSettingId() {
      return settingId;
   }

   public void setSettingId(int settingId) {
      this.settingId = settingId;
   }

   public String getSaleName() { // Getter for saleName
      return saleName;
   }

   public void setSaleName(String saleName) { // Setter for saleName
      this.saleName = saleName;
   }

   public String getUserName() { // Getter for userName
      return userName;
   }

   public void setUserName(String userName) { // Setter for userName
      this.userName = userName;
   }

}
