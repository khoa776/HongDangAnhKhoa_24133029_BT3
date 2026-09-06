<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Trang Quản Trị</title>
</head>
<body>
    <h2 style="color: green;">Xin chào, ${user.fullname} (${user.username})!</h2>
    <p>Bạn đã đăng nhập thành công thông qua <b>Session</b>.</p>
    <a href="${pageContext.request.contextPath}/logout">Đăng xuất</a>
</body>
</html>