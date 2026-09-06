package vn.iotstar.shoppingservicemvc.service;

import vn.iotstar.shoppingservicemvc.entity.User;

public interface UserService {
    User login(String username, String password);
    User findByUsername(String username);
    User findByEmail(String email);
    User save(User user);
}