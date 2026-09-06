package vn.iotstar.shoppingservicemvc.config;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

@Configuration
public class WebConfig implements WebMvcConfigurer {

    @Value("${upload.path:D:/uploads}")
    private String uploadPath;

    @Override
    public void addResourceHandlers(ResourceHandlerRegistry registry) {
        // Ánh ánh URL /image/** tới thư mục thực tế D:/uploads/ trên ổ đĩa
        registry.addResourceHandler("/image/**")
                .addResourceLocations("file:" + uploadPath + "/");
    }
}