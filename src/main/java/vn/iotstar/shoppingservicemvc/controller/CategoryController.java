package vn.iotstar.shoppingservicemvc.controller;

import jakarta.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import vn.iotstar.shoppingservicemvc.entity.Category;
import vn.iotstar.shoppingservicemvc.model.CategoryForm;
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
        model.addAttribute("categoryForm", new CategoryForm());
        return "admin/category-add";
    }

    // 3. Xử lý lưu (Thêm mới / Cập nhật + Validation + Upload file)
    @PostMapping("/save")
    public String saveCategory(@Valid @ModelAttribute("categoryForm") CategoryForm categoryForm,
                               BindingResult bindingResult,
                               Model model) {

        // Kiểm tra lỗi Validation (ví dụ: Tên danh mục bị bỏ trống)
        if (bindingResult.hasErrors()) {
            if (categoryForm.getCategoryId() != null && categoryForm.getCategoryId() > 0) {
                Category oldCategory = categoryService.findById(categoryForm.getCategoryId());
                model.addAttribute("oldImages", oldCategory != null ? oldCategory.getImages() : null);
                return "admin/category-edit";
            }
            return "admin/category-add";
        }

        Category category;
        if (categoryForm.getCategoryId() != null && categoryForm.getCategoryId() > 0) {
            category = categoryService.findById(categoryForm.getCategoryId());
            if (category == null) category = new Category();
        } else {
            category = new Category();
        }

        category.setCategoryname(categoryForm.getCategoryname());
        category.setStatus(categoryForm.getStatus());

        // Xử lý upload ảnh
        MultipartFile file = categoryForm.getImageFile();
        try {
            if (file != null && !file.isEmpty()) {
                File dir = new File(uploadPath);
                if (!dir.exists()) dir.mkdirs();

                String filename = System.currentTimeMillis() + "_" + Paths.get(file.getOriginalFilename()).getFileName().toString();
                file.transferTo(new File(dir, filename));
                category.setImages(filename);
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
        if (category == null) {
            return "redirect:/admin/categories";
        }

        CategoryForm form = new CategoryForm();
        form.setCategoryId(category.getCategoryId());
        form.setCategoryname(category.getCategoryname());
        form.setStatus(category.getStatus());

        model.addAttribute("categoryForm", form);
        model.addAttribute("oldImages", category.getImages());
        return "admin/category-edit";
    }

    // 5. Xóa
    @GetMapping("/delete/{id}")
    public String deleteCategory(@PathVariable("id") int id) {
        categoryService.deleteById(id);
        return "redirect:/admin/categories";
    }
}