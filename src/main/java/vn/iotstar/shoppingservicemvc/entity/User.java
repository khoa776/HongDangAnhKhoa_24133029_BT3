package vn.iotstar.shoppingservicemvc.entity;

import jakarta.persistence.*;
import lombok.*;
import java.io.Serializable;
import java.sql.Date;

@Entity
@Table(name = "[User]")
@Data
@NoArgsConstructor
@AllArgsConstructor
public class User implements Serializable {
    private static final long serialVersionUID = 1L;

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;

    private String email;

    @Column(nullable = false, unique = true)
    private String username;

    private String fullname;

    @Column(nullable = false)
    private String password;

    private String avatar;
    private int roleid;
    private String phone;

    @Column(name = "createdDate")
    private Date createdDate;

    private int status; // 0: chưa kích hoạt, 1: đã kích hoạt
    private String otpCode; // Mã OTP xác thực
}