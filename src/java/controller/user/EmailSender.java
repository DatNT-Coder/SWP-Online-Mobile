/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package controller.user;

import javax.mail.internet.*;
import java.util.Properties;
import javax.mail.*;
/**
 *
 * @author vuduc
 */

public class EmailSender {
    private static final String SMTP_HOST = "smtp.gmail.com";
    private static final String SMTP_PORT = "587";
    private static final String EMAIL_SENDER = "";  // Thay bằng email của bạn
    private static final String EMAIL_PASSWORD = "";  // Thay bằng App Password của Gmail

    public static void sendVerificationEmail(String recipientEmail, String verificationCode) {
        // Cấu hình các thuộc tính cho SMTP
        Properties props = new Properties();
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.starttls.enable", "true");
        props.put("mail.smtp.host", SMTP_HOST);
        props.put("mail.smtp.port", SMTP_PORT);

        // Tạo session với xác thực
        Session session = Session.getInstance(props, new Authenticator() {
            @Override
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(EMAIL_SENDER, EMAIL_PASSWORD);
            }
        });

        try {
            // Tạo email
            Message message = new MimeMessage(session);
            message.setFrom(new InternetAddress(EMAIL_SENDER));
            message.setRecipient(Message.RecipientType.TO, new InternetAddress(recipientEmail));
            message.setSubject("Mã Xác Nhận Đăng Ký");
            message.setText("Mã xác nhận của bạn là: " + verificationCode + "\nMã này sẽ hết hạn sau 5 phút.");

            // Gửi email
            Transport.send(message);
            System.out.println("Email đã được gửi thành công đến: " + recipientEmail);
        } catch (MessagingException e) {
            e.printStackTrace();
        }
    }
}

// mới làm đến đây chưa test gửi đc hay k.
