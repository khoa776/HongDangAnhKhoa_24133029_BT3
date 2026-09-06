<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Đăng ký tài khoản</title>
</head>
<body>
    <h2>ĐĂNG KÝ TÀI KHOẢN</h2>
    <p style="color:red;">${error}</p>

    <form action="${pageContext.request.contextPath}/register" method="post">
        <p>Tên đăng nhập: <input type="text" name="username" required></p>
        <p>Mật khẩu: <input type="password" name="password" required></p>
        <p>Họ và tên: <input type="text" name="fullname" required></p>
        <p>Email nhận OTP: <input type="email" name="email" required></p>
        <button type="submit">Đăng ký & Nhận OTP</button>
    </form>
    <p><a href="${pageContext.request.contextPath}/login">Đã có tài khoản? Đăng nhập</a></p>
</body>
</html>