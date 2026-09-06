package vn.iotstar.shoppingservicemvc.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import vn.iotstar.shoppingservicemvc.entity.User;
import vn.iotstar.shoppingservicemvc.service.EmailService;
import vn.iotstar.shoppingservicemvc.service.UserService;

import java.util.Random;

@Controller
public class ForgotController {

    @Autowired
    private UserService userService;

    @Autowired
    private EmailService emailService;

    // 1. Form nhập Email/Username để yêu cầu OTP
    @GetMapping("/forgot-password")
    public String showForgotPasswordForm() {
        return "forgot-password";
    }

    // 2. Xử lý gửi OTP đặt lại mật khẩu
    @PostMapping("/forgot-password")
    public String handleForgotPassword(@RequestParam("account") String account, Model model) {
        User user = userService.findByUsername(account);
        if (user == null) {
            user = userService.findByEmail(account);
        }

        if (user == null) {
            model.addAttribute("error", "Không tìm thấy tài khoản với thông tin này!");
            return "forgot-password";
        }

        // Tạo mã OTP mới
        String otp = String.format("%06d", new Random().nextInt(999999));
        user.setOtpCode(otp);
        userService.save(user);

        // Gửi OTP qua email
        emailService.sendOtpEmail(user.getEmail(), otp);

        model.addAttribute("username", user.getUsername());
        model.addAttribute("message", "Mã OTP đặt lại mật khẩu đã được gửi đến email của bạn.");
        return "reset-password";
    }

    // 3. Form nhập OTP và Mật khẩu mới
    @GetMapping("/reset-password")
    public String showResetPasswordForm() {
        return "reset-password";
    }

    // 4. Xử lý Đặt lại mật khẩu
    @PostMapping("/reset-password")
    public String handleResetPassword(@RequestParam("username") String username,
                                      @RequestParam("otp") String otp,
                                      @RequestParam("newPassword") String newPassword,
                                      Model model) {
        User user = userService.findByUsername(username);

        if (user != null && otp.equals(user.getOtpCode())) {
            user.setPassword(newPassword);
            user.setOtpCode(null); // Xóa OTP sau khi dùng
            userService.save(user);
            model.addAttribute("message", "Đặt lại mật khẩu thành công! Vui lòng đăng nhập.");
            return "login";
        } else {
            model.addAttribute("username", username);
            model.addAttribute("error", "Mã OTP không chính xác!");
            return "reset-password";
        }
    }
}