# BÀI TẬP WEB 3

---

# 1. Các Tính Năng Chính

**1.1. Xác thực người dùng:**
* **Đăng ký:** Đăng ký tài khoản & kích hoạt qua mã OTP gửi về Email.
* **Đăng nhập:** Đăng nhập vào hệ thống.
* **Quên mật khẩu:** Khôi phục & đặt lại mật khẩu bằng OTP qua Email.

**1.2. Quản trị viên (Admin):**
* **Quản lý Danh mục:** Thêm, Sửa, Xóa danh mục.
* **Quản lý Sản phẩm:** Thêm, Sửa, Xóa, Upload ảnh sản phẩm.

**1.3. Khách hàng:**
* **Trang chủ:** Xem 10 sản phẩm mới nhất.
* **Trang danh sách:** Xem tất cả sản phẩm (có phân trang 6 sản phẩm/trang).
* **Trang chi tiết:** Xem chi tiết thông tin, giá bán và mô tả sản phẩm.

---

# 2. Hướng Dẫn Chạy

* **Chuẩn bị CSDL:** Mở SQL Server Management Studio (SSMS) và chạy file `database.sql` có sẵn trong dự án để tạo CSDL và chèn dữ liệu mẫu (nếu chưa có).
* **Cấu hình:** Kiểm tra lại tài khoản SQL Server và Gmail trong file `application.properties`.
* **Khởi chạy:**
  * Mở Terminal và gõ: `.\mvnw spring-boot:run` (hoặc run java file `ShoppingservicemvcApplication.java`).
  * Truy cập trình duyệt: http://localhost:8080/home

---

# 3. Các Đường Dẫn Chính

* **Trang chủ:** http://localhost:8080/home
* **Danh sách sản phẩm (Phân trang):** http://localhost:8080/product
* **Chi tiết sản phẩm:** http://localhost:8080/product/detail/{id}
* **Đăng nhập:** http://localhost:8080/login
* **Đăng ký:** http://localhost:8080/register
* **Xác thực OTP:** http://localhost:8080/verify-otp
* **Quên mật khẩu:** http://localhost:8080/forgot-password
* **Admin - Quản lý Sản phẩm:** http://localhost:8080/admin/products
* **Admin - Thêm Sản phẩm:** http://localhost:8080/admin/products/add
* **Admin - Quản lý Danh mục:** http://localhost:8080/admin/categories
* **Admin - Thêm Danh mục:** http://localhost:8080/admin/categories/add