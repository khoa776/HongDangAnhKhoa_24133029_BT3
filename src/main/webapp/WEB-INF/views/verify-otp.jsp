<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Xác thực OTP</title>
</head>
<body>
    <h2>XÁC THỰC MÃ OTP</h2>
    <p style="color:green;">${message}</p>
    <p style="color:red;">${error}</p>

    <form action="${pageContext.request.contextPath}/verify-otp" method="post">
        <input type="hidden" name="username" value="${username}">
        <p>Nhập mã OTP (6 chữ số): <input type="text" name="otp" required></p>
        <button type="submit">Kích hoạt tài khoản</button>
    </form>
</body>
</html>