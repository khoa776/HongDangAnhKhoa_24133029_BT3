<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
    <title>Thông tin cá nhân</title>
    <style>
        .container { width: 500px; margin: 30px auto; padding: 20px; border: 1px solid #ccc; border-radius: 8px; }
        .form-group { margin-bottom: 15px; }
        .form-group label { display: block; margin-bottom: 5px; font-weight: bold; }
        .form-group input[type="text"] { width: 100%; padding: 8px; box-sizing: border-box; }
        .btn { background-color: #28a745; color: white; padding: 10px 15px; border: none; border-radius: 4px; cursor: pointer; }
        .alert-success { color: green; margin-bottom: 10px; }
        .alert-danger { color: red; margin-bottom: 10px; }
    </style>
</head>
<body>

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
            <a href="${pageContext.request.contextPath}/home" style="margin-left: 10px; text-decoration: none; color: #333;">Hủy</a>
        </form>
    </div>

</body>
</html>