package vn.iotstar.shoppingservicemvc.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import vn.iotstar.shoppingservicemvc.entity.Category;
import vn.iotstar.shoppingservicemvc.service.CategoryService;

import java.io.File;
import java.io.IOException;
import java.nio.file.Paths;
import java.util.List;

@Controller
@RequestMapping("/admin/categories")
public class CategoryController {

    @Autowired
    private CategoryService categoryService;

    @Value("${upload.path:D:/uploads}")
    private String uploadPath;

    // 1. Hiển thị danh sách & Tìm kiếm
    @GetMapping
    public String listCategories(@RequestParam(value = "search", required = false) String search, Model model) {
        List<Category> list;
        if (search != null && !search.trim().isEmpty()) {
            list = categoryService.searchByName(search);
        } else {
            list = categoryService.findAll();
        }
        model.addAttribute("categories", list);
        model.addAttribute("search", search);
        return "admin/category-list";
    }

    // 2. Form thêm mới
    @GetMapping("/add")
    public String showAddForm(Model model) {
        model.addAttribute("category", new Category());
        return "admin/category-add";
    }

    // 3. Xử lý lưu (Thêm mới / Cập nhật + Upload file)
    @PostMapping("/save")
    public String saveCategory(@ModelAttribute("category") Category category,
                               @RequestParam(value = "imageFile", required = false) MultipartFile file) {
        try {
            // Xử lý upload file nếu người dùng có chọn file
            if (file != null && !file.isEmpty()) {
                File dir = new File(uploadPath);
                if (!dir.exists()) dir.mkdirs();

                String filename = System.currentTimeMillis() + "_" + Paths.get(file.getOriginalFilename()).getFileName().toString();
                file.transferTo(new File(dir, filename));
                category.setImages(filename);
            } else if (category.getCategoryId() > 0) {
                // Nếu là update và không chọn file mới, giữ nguyên file cũ
                Category oldCategory = categoryService.findById(category.getCategoryId());
                if (oldCategory != null) {
                    category.setImages(oldCategory.getImages());
                }
            }
        } catch (IOException e) {
            e.printStackTrace();
        }

        categoryService.save(category);
        return "redirect:/admin/categories";
    }

    // 4. Form sửa
    @GetMapping("/edit/{id}")
    public String showEditForm(@PathVariable("id") int id, Model model) {
        Category category = categoryService.findById(id);
        model.addAttribute("category", category);
        return "admin/category-edit";
    }

    // 5. Xóa
    @GetMapping("/delete/{id}")
    public String deleteCategory(@PathVariable("id") int id) {
        categoryService.deleteById(id);
        return "redirect:/admin/categories";
    }
}