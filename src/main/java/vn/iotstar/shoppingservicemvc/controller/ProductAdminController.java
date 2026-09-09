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
import vn.iotstar.shoppingservicemvc.entity.Product;
import vn.iotstar.shoppingservicemvc.model.ProductForm;
import vn.iotstar.shoppingservicemvc.service.CategoryService;
import vn.iotstar.shoppingservicemvc.service.ProductService;

import java.io.File;
import java.io.IOException;
import java.util.List;

@Controller
@RequestMapping("/admin/products")
public class ProductAdminController {

    @Autowired
    private ProductService productService;

    @Autowired
    private CategoryService categoryService;

    @Value("${upload.path:D:/uploads}")
    private String uploadPath;

    // Danh sách sản phẩm
    @GetMapping("")
    public String listProducts(Model model) {
        List<Product> products = productService.findAll();
        model.addAttribute("products", products);
        return "admin/product-list";
    }

    // Form thêm sản phẩm
    @GetMapping("/add")
    public String showAddForm(Model model) {
        model.addAttribute("productForm", new ProductForm());
        model.addAttribute("categories", categoryService.findAll());
        return "admin/product-add";
    }

    // Xử lý thêm sản phẩm
    @PostMapping("/add")
    public String saveProduct(@Valid @ModelAttribute("productForm") ProductForm productForm,
                              BindingResult bindingResult,
                              Model model) {
        
        if (bindingResult.hasErrors()) {
            model.addAttribute("categories", categoryService.findAll());
            return "admin/product-add";
        }

        Product product = new Product();
        product.setProductName(productForm.getProductName());
        product.setQuantity(productForm.getQuantity());
        product.setUnitPrice(productForm.getUnitPrice());
        product.setDiscount(productForm.getDiscount());
        product.setDescription(productForm.getDescription());

        Category category = categoryService.findById(productForm.getCategoryId());
        product.setCategory(category);

        MultipartFile fileImage = productForm.getFileImage();
        if (fileImage != null && !fileImage.isEmpty()) {
            try {
                String fileName = System.currentTimeMillis() + "_" + fileImage.getOriginalFilename();
                File saveFile = new File(uploadPath, fileName);
                if (!saveFile.getParentFile().exists()) saveFile.getParentFile().mkdirs();
                fileImage.transferTo(saveFile);
                product.setImages(fileName);
            } catch (IOException e) {
                e.printStackTrace();
            }
        }

        productService.save(product);
        return "redirect:/admin/products";
    }

    // Form sửa sản phẩm
    @GetMapping("/edit/{id}")
    public String showEditForm(@PathVariable("id") int id, Model model) {
        Product product = productService.findById(id);
        if (product != null) {
            ProductForm form = new ProductForm();
            form.setProductId(product.getProductId());
            form.setProductName(product.getProductName());
            form.setQuantity(product.getQuantity());
            form.setUnitPrice(product.getUnitPrice());
            form.setDiscount(product.getDiscount());
            form.setDescription(product.getDescription());
            if (product.getCategory() != null) {
                form.setCategoryId(product.getCategory().getCategoryId());
            }

            model.addAttribute("productForm", form);
            model.addAttribute("product", product);
            model.addAttribute("categories", categoryService.findAll());
            return "admin/product-edit";
        }
        return "redirect:/admin/products";
    }

    // Xử lý sửa sản phẩm
    @PostMapping("/edit")
    public String updateProduct(@Valid @ModelAttribute("productForm") ProductForm productForm,
                                BindingResult bindingResult,
                                Model model) {

        if (bindingResult.hasErrors()) {
            Product product = productService.findById(productForm.getProductId());
            model.addAttribute("product", product);
            model.addAttribute("categories", categoryService.findAll());
            return "admin/product-edit";
        }

        Product product = productService.findById(productForm.getProductId());
        if (product == null) {
            return "redirect:/admin/products";
        }

        product.setProductName(productForm.getProductName());
        product.setQuantity(productForm.getQuantity());
        product.setUnitPrice(productForm.getUnitPrice());
        product.setDiscount(productForm.getDiscount());
        product.setDescription(productForm.getDescription());

        Category category = categoryService.findById(productForm.getCategoryId());
        product.setCategory(category);

        MultipartFile fileImage = productForm.getFileImage();
        if (fileImage != null && !fileImage.isEmpty()) {
            try {
                String fileName = System.currentTimeMillis() + "_" + fileImage.getOriginalFilename();
                File saveFile = new File(uploadPath, fileName);
                if (!saveFile.getParentFile().exists()) saveFile.getParentFile().mkdirs();
                fileImage.transferTo(saveFile);
                product.setImages(fileName);
            } catch (IOException e) {
                e.printStackTrace();
            }
        }

        productService.save(product);
        return "redirect:/admin/products";
    }

    // Xóa sản phẩm
    @GetMapping("/delete/{id}")
    public String deleteProduct(@PathVariable("id") int id) {
        productService.deleteById(id);
        return "redirect:/admin/products";
    }
}