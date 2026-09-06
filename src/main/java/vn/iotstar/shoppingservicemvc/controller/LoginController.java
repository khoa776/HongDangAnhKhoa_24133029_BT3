package vn.iotstar.shoppingservicemvc.controller;

import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import vn.iotstar.shoppingservicemvc.entity.User;
import vn.iotstar.shoppingservicemvc.service.UserService;

@Controller
public class LoginController {

    @Autowired
    private UserService userService;

    // Hiển thị trang Login
    @GetMapping("/login")
    public String showLoginForm(HttpServletRequest request, Model model) {
        // Kiểm tra Cookie "username" tự động điền nếu có
        Cookie[] cookies = request.getCookies();
        if (cookies != null) {
            for (Cookie cookie : cookies) {
                if ("rememberUsername".equals(cookie.getName())) {
                    model.addAttribute("savedUsername", cookie.getValue());
                    break;
                }
            }
        }
        return "login";
    }

    // Xử lý submit Form Login
    @PostMapping("/login")
    public String handleLogin(
            @RequestParam("username") String username,
            @RequestParam("password") String password,
            @RequestParam(value = "remember", required = false) String remember,
            HttpSession session,
            HttpServletResponse response,
            Model model) {

        // Kiểm tra rỗng
        if (username.isEmpty() || password.isEmpty()) {
            model.addAttribute("alert", "Tài khoản hoặc mật khẩu không được rỗng!");
            return "login";
        }

        // Kiểm tra đăng nhập
        User user = userService.login(username, password);
        if (user != null) {
            // 1. Lưu thông tin vào Session
            session.setAttribute("account", user);

            // 2. Xử lý Ghi nhớ tài khoản bằng Cookie
            if ("on".equals(remember)) {
                Cookie cookie = new Cookie("rememberUsername", username);
                cookie.setMaxAge(30 * 60); // Lưu trong 30 phút
                response.addCookie(cookie);
            } else {
                // Xóa Cookie nếu bỏ tích Nhớ tôi
                Cookie cookie = new Cookie("rememberUsername", "");
                cookie.setMaxAge(0);
                response.addCookie(cookie);
            }

            return "redirect:/home";
        } else {
            model.addAttribute("alert", "Tài khoản hoặc mật khẩu không đúng!");
            return "login";
        }
    }

    @GetMapping("/welcome")
    public String welcomePage(HttpSession session) {
        User user = (User) session.getAttribute("account");
        if (user == null) {
            return "redirect:/login";
        }
        return "redirect:/home";
    }

    // Đăng xuất
    @GetMapping("/logout")
    public String logout(HttpSession session) {
        session.invalidate(); // Hủy session
        return "redirect:/login";
    }
}