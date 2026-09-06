package vn.iotstar.shoppingservicemvc.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import vn.iotstar.shoppingservicemvc.entity.User;
import java.util.Optional;

@Repository
public interface UserRepository extends JpaRepository<User, Integer> {
    // Tìm người dùng theo username
    Optional<User> findByUsername(String username);
}