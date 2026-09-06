package vn.iotstar.shoppingservicemvc.entity;

import jakarta.persistence.*;
import lombok.*;
import java.io.Serializable;

@Entity
@Table(name = "Product")
@Data
@NoArgsConstructor
@AllArgsConstructor
public class Product implements Serializable {
    private static final long serialVersionUID = 1L;

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int productId;

    @Column(nullable = false, length = 255)
    private String productName;

    private int quantity;
    private double unitPrice;

    @Column(length = 255)
    private String images;

    @Column(columnDefinition = "NVARCHAR(MAX)")
    private String description;

    private double discount;
    private int status;

    @ManyToOne
    @JoinColumn(name = "categoryId")
    private Category category;

    // Getter & Setter
    public int getProductId() { return productId; }
    public void setProductId(int productId) { this.productId = productId; }

    public String getProductName() { return productName; }
    public void setProductName(String productName) { this.productName = productName; }

    public int getQuantity() { return quantity; }
    public void setQuantity(int quantity) { this.quantity = quantity; }

    public double getUnitPrice() { return unitPrice; }
    public void setUnitPrice(double unitPrice) { this.unitPrice = unitPrice; }

    public String getImages() { return images; }
    public void setImages(String images) { this.images = images; }

    public String getDescription() { return description; }
    public void setDescription(String description) { this.description = description; }

    public double getDiscount() { return discount; }
    public void setDiscount(double discount) { this.discount = discount; }

    public int getStatus() { return status; }
    public void setStatus(int status) { this.status = status; }

    public Category getCategory() { return category; }
    public void setCategory(Category category) { this.category = category; }
}