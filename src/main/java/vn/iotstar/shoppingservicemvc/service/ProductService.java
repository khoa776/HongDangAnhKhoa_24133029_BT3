package vn.iotstar.shoppingservicemvc.service;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import vn.iotstar.shoppingservicemvc.entity.Product;

import java.util.List;

public interface ProductService {
    List<Product> findAll();
    Product findById(int id);
    Product save(Product product);
    void deleteById(int id);
    List<Product> findTop10Newest();
    Page<Product> findAll(Pageable pageable);
    Page<Product> findByName(String name, Pageable pageable);
}