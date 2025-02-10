/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package controller.user;
import java.time.LocalDateTime;

public class VerificationCode {
    private String code;
    private LocalDateTime expiryTime;

    public VerificationCode(String code, LocalDateTime expiryTime) {
        this.code = code;
        this.expiryTime = expiryTime;
    }

    public String getCode() {
        return code;
    }

    public LocalDateTime getExpiryTime() {
        return expiryTime;
    }

    public boolean isExpired() {
        return LocalDateTime.now().isAfter(expiryTime);
    }
}