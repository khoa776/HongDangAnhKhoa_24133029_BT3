package vn.iotstar.shoppingservicemvc.service;

import vn.iotstar.shoppingservicemvc.entity.Category;
import java.util.List;

public interface CategoryService {
    List<Category> findAll();
    Category findById(int id);
    Category save(Category category);
    void deleteById(int id);
    List<Category> searchByName(String name);
}