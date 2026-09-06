<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Đăng nhập hệ thống</title>
    <style>
        body { font-family: Arial, sans-serif; display: flex; justify-content: center; margin-top: 50px; }
        .login-box { border: 1px solid #ccc; padding: 20px; border-radius: 8px; width: 320px; }
        .alert { color: red; margin-bottom: 10px; }
        .form-group { margin-bottom: 15px; }
        .form-group label { display: block; margin-bottom: 5px; }
        .form-group input[type="text"], .form-group input[type="password"] { width: 100%; padding: 8px; box-sizing: border-box; }
        .btn { width: 100%; padding: 10px; background-color: #28a745; color: white; border: none; cursor: pointer; border-radius: 4px; }
        .links { text-align: center; margin-top: 15px; font-size: 14px; }
        .links a { color: #007bff; text-decoration: none; }
        .links a:hover { text-decoration: underline; }
    </style>
</head>
<body>
    <div class="login-box">
        <h2>Đăng Nhập</h2>
        <c:if test="${not empty alert}">
            <div class="alert">${alert}</div>
        </c:if>

        <form action="${pageContext.request.contextPath}/login" method="post">
            <div class="form-group">
                <label>Tài khoản:</label>
                <input type="text" name="username" value="${savedUsername}" placeholder="Nhập tài khoản" required>
            </div>
            <div class="form-group">
                <label>Mật khẩu:</label>
                <input type="password" name="password" placeholder="Nhập mật khẩu" required>
            </div>
            <div class="form-group">
                <input type="checkbox" name="remember" id="remember">
                <label for="remember" style="display:inline;">Ghi nhớ tôi (Cookie)</label>
            </div>
            <button type="submit" class="btn">Đăng nhập</button>
            
            <div class="links">
                <p><a href="${pageContext.request.contextPath}/home">← Quay lại Trang chủ</a></p>
                <p>
                    <a href="${pageContext.request.contextPath}/register">Đăng ký tài khoản mới</a> | 
                    <a href="${pageContext.request.contextPath}/forgot-password">Quên mật khẩu?</a>
                </p>
            </div>
        </form>
    </div>
</body>
</html>