package vn.iotstar.shoppingservicemvc.controller;

import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import vn.iotstar.shoppingservicemvc.entity.User;
import vn.iotstar.shoppingservicemvc.service.UserService;

import java.io.File;
import java.io.IOException;
import java.util.UUID;

@Controller
@RequestMapping("/profile")
public class ProfileController {

    @Autowired
    private UserService userService;

    // Lấy đường dẫn lưu ảnh từ application.properties (hoặc mặc định D:/uploads)
    @Value("${upload.path:D:/uploads}")
    private String uploadPath;

    // Hiển thị trang Thông tin cá nhân
    @GetMapping
    public String showProfile(HttpSession session, Model model) {
        User sessionUser = (User) session.getAttribute("account");
        if (sessionUser == null) {
            return "redirect:/login";
        }
        
        // Lấy dữ liệu mới nhất từ CSDL
        User currentUser = userService.findByUsername(sessionUser.getUsername());
        model.addAttribute("user", currentUser);
        return "profile";
    }

    // Xử lý cập nhật Profile (fullname, phone, avatar)
    @PostMapping("/update")
    public String updateProfile(
            @RequestParam("fullname") String fullname,
            @RequestParam("phone") String phone,
            @RequestParam("avatarFile") MultipartFile avatarFile,
            HttpSession session,
            Model model) {

        User sessionUser = (User) session.getAttribute("account");
        if (sessionUser == null) {
            return "redirect:/login";
        }

        User user = userService.findByUsername(sessionUser.getUsername());
        user.setFullname(fullname);
        user.setPhone(phone);

        // Xử lý Upload file bằng Multipart
        if (!avatarFile.isEmpty()) {
            try {
                File dir = new File(uploadPath);
                if (!dir.exists()) {
                    dir.mkdirs();
                }

                // Đổi tên file tránh trùng lặp
                String fileName = UUID.randomUUID().toString() + "_" + avatarFile.getOriginalFilename();
                File serverFile = new File(dir.getAbsolutePath() + File.separator + fileName);
                avatarFile.transferTo(serverFile);

                user.setAvatar(fileName);
            } catch (IOException e) {
                e.printStackTrace();
                model.addAttribute("error", "Lỗi khi lưu file ảnh!");
            }
        }

        // Lưu thông tin đã cập nhật vào CSDL
        User updatedUser = userService.save(user);
        
        // Cập nhật lại thông tin mới vào Session
        session.setAttribute("account", updatedUser);
        model.addAttribute("message", "Cập nhật thông tin thành công!");
        model.addAttribute("user", updatedUser);

        return "profile";
    }
}