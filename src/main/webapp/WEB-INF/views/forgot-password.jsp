<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Quên mật khẩu</title>
</head>
<body>
    <h2>QUÊN MẬT KHẨU</h2>
    <p style="color:red;">${error}</p>

    <form action="${pageContext.request.contextPath}/forgot-password" method="post">
        <p>Nhập Tên đăng nhập hoặc Email: <input type="text" name="account" required></p>
        <button type="submit">Gửi mã OTP</button>
    </form>
    <p><a href="${pageContext.request.contextPath}/login">Quay lại Đăng nhập</a></p>
</body>
</html>