package vn.iotstar.shoppingservicemvc.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import vn.iotstar.shoppingservicemvc.entity.Product;
import vn.iotstar.shoppingservicemvc.service.ProductService;

import java.util.List;

@Controller
public class ProductCustomerController {

    @Autowired
    private ProductService productService;

    // Trang chủ: Hiển thị 10 sản phẩm mới nhất
    @GetMapping({"/", "/home"})
    public String home(Model model) {
        List<Product> top10Products = productService.findTop10Newest();
        model.addAttribute("top10Products", top10Products);
        return "home";
    }

    // Trang /product: Phân trang 6 sản phẩm / trang
    @GetMapping("/product")
    public String listProductsPage(@RequestParam(name = "page", defaultValue = "0") int page,
                                   @RequestParam(name = "search", required = false) String search,
                                   Model model) {
        int pageSize = 6;
        Pageable pageable = PageRequest.of(page, pageSize);
        Page<Product> productPage;

        if (search != null && !search.trim().isEmpty()) {
            productPage = productService.findByName(search.trim(), pageable);
            model.addAttribute("search", search);
        } else {
            productPage = productService.findAll(pageable);
        }

        model.addAttribute("productPage", productPage);
        model.addAttribute("currentPage", page);
        model.addAttribute("totalPages", productPage.getTotalPages());
        return "product-list-customer";
    }

    // Xem chi tiết 01 sản phẩm
    @GetMapping("/product/detail/{id}")
    public String productDetail(@PathVariable("id") int id, Model model) {
        Product product = productService.findById(id);
        if (product != null) {
            model.addAttribute("product", product);
            return "product-detail";
        }
        return "redirect:/product";
    }
}