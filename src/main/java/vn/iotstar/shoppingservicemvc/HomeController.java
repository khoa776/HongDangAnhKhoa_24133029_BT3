package vn.iotstar.shoppingservicemvc;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class HomeController {

    @GetMapping("/")
    public String index(Model model) {
        model.addAttribute("message", "Chúc mừng! Môi trường Spring Boot + JSP đã cài đặt thành công!");
        return "index";
    }
}