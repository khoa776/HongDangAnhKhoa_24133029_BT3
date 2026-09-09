package vn.iotstar.shoppingservicemvc.model;

import jakarta.validation.constraints.NotBlank;
import org.springframework.web.multipart.MultipartFile;

public class CategoryForm {

    private Integer categoryId;

    @NotBlank(message = "Tên danh mục không được để trống")
    private String categoryname;

    private int status = 1;

    private MultipartFile imageFile;

    // Getters and Setters
    public Integer getCategoryId() { return categoryId; }
    public void setCategoryId(Integer categoryId) { this.categoryId = categoryId; }

    public String getCategoryname() { return categoryname; }
    public void setCategoryname(String categoryname) { this.categoryname = categoryname; }

    public int getStatus() { return status; }
    public void setStatus(int status) { this.status = status; }

    public MultipartFile getImageFile() { return imageFile; }
    public void setImageFile(MultipartFile imageFile) { this.imageFile = imageFile; }
}