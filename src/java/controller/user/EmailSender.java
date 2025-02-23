/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package controller.user;


import java.util.Properties;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;


/**
 *
 * @author vuduc
 */
public class EmailSender {
        final static String emailSender = "swp391fptg3@gmail.com";
        final static String passwordSender = "phugenmwaebwnhwn";
    
    public static void sendEmail(String to, String subject, String body) {

        // Cấu hình thuộc tính của SMTP
        Properties props = new Properties(); // Tạo một đối tượng Properties để lưu các cài đặt cấu hình
        props.put("mail.smtp.auth", "true"); // Bật tính năng xác thực SMTP.
        props.put("mail.smtp.starttls.enable", "true"); //Bật mã hóa TLS để bảo mật email.
        props.put("mail.smtp.host", "smtp.gmail.com"); //Đặt máy chủ SMTP của Gmail.
        props.put("mail.smtp.port", "587"); //Sử dụng cổng SMTP 587 của Gmail.

      Session session = Session.getInstance(props, new javax.mail.Authenticator() {
            @Override
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(emailSender, passwordSender);
            }
        });
        try {
            // Create a MimeMessage object
            Message message = new MimeMessage(session);
            message.setFrom(new InternetAddress(emailSender));
            message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(to));
            message.setSubject(subject);
            message.setText(body);

            // Send the email
            Transport.send(message);

            System.out.println("Email sent successfully");

        } catch (MessagingException e) {
            throw new RuntimeException(e);
        }
    }

//    // Hàm main để thử gửi email
//    public static void main(String[] args) {
//    }
    
}
 