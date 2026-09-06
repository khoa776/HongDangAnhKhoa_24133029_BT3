package vn.iotstar.shoppingservicemvc.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;

@Service
public class EmailService {

    @Autowired(required = false)
    private JavaMailSender mailSender;

    public void sendOtpEmail(String toEmail, String otpCode) {
        if (mailSender == null) {
            System.out.println("[MÔ PHỎNG MAIL] Mã OTP cho " + toEmail + " là: " + otpCode);
            return;
        }
        try {
            SimpleMailMessage message = new SimpleMailMessage();
            message.setTo(toEmail);
            message.setSubject("Mã xác thực OTP đăng ký tài khoản");
            message.setText("Mã OTP của bạn là: " + otpCode + "\n\nVui lòng nhập mã này để kích hoạt tài khoản.");
            mailSender.send(message);
        } catch (Exception e) {
            System.err.println("Gửi mail thất bại, mã OTP ghi nhận: " + otpCode);
            e.printStackTrace();
        }
    }
}