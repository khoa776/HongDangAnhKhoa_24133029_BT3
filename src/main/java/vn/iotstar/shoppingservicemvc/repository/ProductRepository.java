package vn.iotstar.shoppingservicemvc.repository;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import vn.iotstar.shoppingservicemvc.entity.Product;

import java.util.List;

@Repository
public interface ProductRepository extends JpaRepository<Product, Integer> {
    
    // Tìm kiếm theo tên sản phẩm có phân trang
    Page<Product> findByProductNameContaining(String name, Pageable pageable);

    // Lấy 10 sản phẩm mới nhất dựa trên ID giảm dần
    List<Product> findTop10ByOrderByProductIdDesc();
}