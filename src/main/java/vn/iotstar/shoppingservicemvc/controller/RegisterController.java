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
public class RegisterController {

    @Autowired
    private UserService userService;

    @Autowired
    private EmailService emailService;

    // Trang Đăng ký
    @GetMapping("/register")
    public String showRegisterForm() {
        return "register";
    }

    // Xử lý Đăng ký
    @PostMapping("/register")
    public String handleRegister(@RequestParam("username") String username,
                                 @RequestParam("password") String password,
                                 @RequestParam("email") String email,
                                 @RequestParam("fullname") String fullname,
                                 Model model) {

        if (userService.findByUsername(username) != null) {
            model.addAttribute("error", "Tên đăng nhập đã tồn tại!");
            return "register";
        }

        // Tạo ngẫu nhiên mã OTP 6 chữ số
        String otp = String.format("%06d", new Random().nextInt(999999));

        User user = new User();
        user.setUsername(username);
        user.setPassword(password);
        user.setEmail(email);
        user.setFullname(fullname);
        user.setStatus(0); // Chưa kích hoạt
        user.setOtpCode(otp);

        userService.save(user);

        // Gửi OTP qua mail
        emailService.sendOtpEmail(email, otp);

        model.addAttribute("username", username);
        model.addAttribute("message", "Mã OTP đã được gửi đến email của bạn.");
        return "verify-otp";
    }

    // Trang Kích hoạt OTP
    @GetMapping("/verify-otp")
    public String showVerifyForm() {
        return "verify-otp";
    }

    // Xử lý Xác thực OTP
    @PostMapping("/verify-otp")
    public String handleVerifyOtp(@RequestParam("username") String username,
                                  @RequestParam("otp") String otp,
                                  Model model) {
        User user = userService.findByUsername(username);

        if (user != null && otp.equals(user.getOtpCode())) {
            user.setStatus(1); // Kích hoạt tài khoản
            user.setOtpCode(null);
            userService.save(user);
            model.addAttribute("message", "Kích hoạt tài khoản thành công! Vui lòng đăng nhập.");
            return "login";
        } else {
            model.addAttribute("username", username);
            model.addAttribute("error", "Mã OTP không chính xác!");
            return "verify-otp";
        }
    }
}