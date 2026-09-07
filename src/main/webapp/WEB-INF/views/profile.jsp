<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Thông tin cá nhân</title>
    <style>
        body { font-family: Arial, sans-serif; margin: 0; padding: 0; }
        .container { width: 500px; margin: 30px auto; padding: 20px; border: 1px solid #ccc; border-radius: 8px; }
        .form-group { margin-bottom: 15px; }
        .form-group label { display: block; margin-bottom: 5px; font-weight: bold; }
        .form-group input[type="text"] { width: 100%; padding: 8px; box-sizing: border-box; }
        .btn { background-color: #28a745; color: white; padding: 10px 15px; border: none; border-radius: 4px; cursor: pointer; }
        .avatar-preview { width: 120px; height: 120px; border-radius: 50%; object-fit: cover; margin-bottom: 10px; }
        .alert-success { color: green; margin-bottom: 10px; }
        .alert-danger { color: red; margin-bottom: 10px; }
    </style>
</head>
<body>

    <!-- Header navigation -->
    <div style="background-color: #333; padding: 12px 20px; color: white;">
        <a href="${pageContext.request.contextPath}/home" style="color: white; margin-right: 15px; text-decoration: none; font-weight: bold;">Trang chủ</a>
        <span style="float: right;">
            <span>Xin chào, <strong>${sessionScope.account.fullname}</strong>!</span> | 
            <a href="${pageContext.request.contextPath}/logout" style="color: #ffc107; text-decoration: none;">Đăng xuất</a>
        </span>
    </div>

    <div class="container">
        <h2>CẬP NHẬT THÔNG TIN CÁ NHÂN</h2>

        <c:if test="${not empty message}">
            <div class="alert-success">${message}</div>
        </c:if>
        <c:if test="${not empty error}">
            <div class="alert-danger">${error}</div>
        </c:if>

        <form action="${pageContext.request.contextPath}/profile/update" method="post" enctype="multipart/form-data">
            <div class="form-group" style="text-align: center;">
                <c:choose>
                    <c:when test="${not empty user.avatar}">
                        <img src="${pageContext.request.contextPath}/image/${user.avatar}" 
                            style="width: 120px; height: 120px; object-fit: cover;" alt="Avatar"/>
                    </c:when>
                    <c:otherwise>
                        <div style="width: 120px; height: 120px; background-color: #e9ecef; margin: 0 auto; display: flex; align-items: center; justify-content: center; color: #6c757d; font-size: 13px;">
                            Chưa có ảnh
                        </div>
                    </c:otherwise>
                </c:choose>
                <br/>
                <input type="file" name="avatarFile" accept="image/*" style="margin-top: 10px;"/>
    </div>

            <div class="form-group">
                <label>Tên đăng nhập (Username):</label>
                <input type="text" value="${user.username}" disabled style="background-color: #e9ecef;"/>
            </div>

            <div class="form-group">
                <label>Email:</label>
                <input type="text" value="${user.email}" disabled style="background-color: #e9ecef;"/>
            </div>

            <div class="form-group">
                <label>Họ và tên (Fullname):</label>
                <input type="text" name="fullname" value="${user.fullname}" required/>
            </div>

            <div class="form-group">
                <label>Số điện thoại (Phone):</label>
                <input type="text" name="phone" value="${user.phone}"/>
            </div>

            <button type="submit" class="btn">Lưu thông tin</button>
            <a href="${pageContext.request.contextPath}/home" style="margin-left: 10px; text-decoration: none;">Hủy</a>
        </form>
    </div>

</body>
</html>