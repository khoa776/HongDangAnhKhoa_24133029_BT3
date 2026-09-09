package vn.iotstar.shoppingservicemvc.controller;

import jakarta.servlet.http.HttpSession;
import jakarta.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import vn.iotstar.shoppingservicemvc.entity.User;
import vn.iotstar.shoppingservicemvc.model.UserProfileForm;
import vn.iotstar.shoppingservicemvc.service.UserService;

import java.io.File;
import java.io.IOException;
import java.util.UUID;

@Controller
@RequestMapping("/profile")
public class ProfileController {

    @Autowired
    private UserService userService;

    @Value("${upload.path:D:/uploads}")
    private String uploadPath;

    @GetMapping
    public String showProfile(HttpSession session, Model model) {
        User sessionUser = (User) session.getAttribute("account");
        if (sessionUser == null) {
            return "redirect:/login";
        }
        
        User currentUser = userService.findByUsername(sessionUser.getUsername());
        
        // Khởi tạo DTO chứa dữ liệu cho form
        UserProfileForm form = new UserProfileForm();
        form.setUsername(currentUser.getUsername());
        form.setEmail(currentUser.getEmail());
        form.setFullname(currentUser.getFullname());
        form.setPhone(currentUser.getPhone());

        model.addAttribute("profileForm", form);
        model.addAttribute("user", currentUser);
        return "profile";
    }

    @PostMapping("/update")
    public String updateProfile(
            @Valid @ModelAttribute("profileForm") UserProfileForm profileForm,
            BindingResult bindingResult,
            HttpSession session,
            Model model) {

        User sessionUser = (User) session.getAttribute("account");
        if (sessionUser == null) {
            return "redirect:/login";
        }

        User currentUser = userService.findByUsername(sessionUser.getUsername());

        // Kiểm tra nếu có lỗi validation từ DTO
        if (bindingResult.hasErrors()) {
            model.addAttribute("user", currentUser);
            return "profile";
        }

        // Cập nhật thông tin text
        currentUser.setFullname(profileForm.getFullname());
        currentUser.setPhone(profileForm.getPhone());

        // Xử lý Upload file bằng Multipart (giữ nguyên logic gốc)
        MultipartFile avatarFile = profileForm.getAvatarFile();
        if (avatarFile != null && !avatarFile.isEmpty()) {
            try {
                File dir = new File(uploadPath);
                if (!dir.exists()) {
                    dir.mkdirs();
                }

                String fileName = UUID.randomUUID().toString() + "_" + avatarFile.getOriginalFilename();
                File serverFile = new File(dir.getAbsolutePath() + File.separator + fileName);
                avatarFile.transferTo(serverFile);

                currentUser.setAvatar(fileName);
            } catch (IOException e) {
                e.printStackTrace();
                model.addAttribute("error", "Lỗi khi lưu file ảnh!");
            }
        }

        // Lưu vào CSDL & Cập nhật Session
        User updatedUser = userService.save(currentUser);
        session.setAttribute("account", updatedUser);

        model.addAttribute("message", "Cập nhật thông tin thành công!");
        model.addAttribute("user", updatedUser);

        return "profile";
    }
}