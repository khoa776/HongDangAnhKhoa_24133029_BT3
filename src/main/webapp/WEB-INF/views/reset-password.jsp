<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Đặt lại mật khẩu</title>
</head>
<body>
    <h2>ĐẶT LẠI MẬT KHẨU</h2>
    <p style="color:green;">${message}</p>
    <p style="color:red;">${error}</p>

    <form action="${pageContext.request.contextPath}/reset-password" method="post">
        <input type="hidden" name="username" value="${username}">
        <p>Mã OTP (6 chữ số): <input type="text" name="otp" required></p>
        <p>Mật khẩu mới: <input type="password" name="newPassword" required></p>
        <button type="submit">Xác nhận đổi mật khẩu</button>
    </form>
</body>
</html>