/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author admin
 */
public class UserAddress {
     private String userAddress;
    private int userId;

    public UserAddress(String userAddress) {
        this.userAddress = userAddress;
    }

    // Constructor
    public UserAddress(String userAddress, int userId) {
        this.userAddress = userAddress;
        this.userId = userId;
    }

    // Getter và Setter
    public String getUserAddress() {
        return userAddress;
    }

    public void setUserAddress(String userAddress) {
        this.userAddress = userAddress;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    // Phương thức toString() để hiển thị thông tin
    @Override
    public String toString() {
        return "UserAddress{" +
                "userAddress='" + userAddress + '\'' +
                ", userId=" + userId +
                '}';
    }
}
