package vn.iotstar.shoppingservicemvc.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import vn.iotstar.shoppingservicemvc.entity.Category;

import java.util.List;

@Repository
public interface CategoryRepository extends JpaRepository<Category, Integer> {
    // Tìm kiếm danh mục theo tên (chứa từ khóa)
    List<Category> findByCategorynameContaining(String name);
}