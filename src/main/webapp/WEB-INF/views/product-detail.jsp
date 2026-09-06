<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Chi tiết sản phẩm</title>
</head>
<body>
    <div style="background-color: #333; padding: 10px; color: white; margin-bottom: 20px;">
        <a href="${pageContext.request.contextPath}/home" style="color: white; margin-right: 15px; text-decoration: none;">Trang chủ</a>
        <a href="${pageContext.request.contextPath}/product" style="color: white; margin-right: 15px; text-decoration: none;">Tất cả sản phẩm</a>
        <a href="${pageContext.request.contextPath}/admin/products" style="color: yellow; margin-right: 15px; text-decoration: none;">[Admin] Quản lý Sản phẩm</a>
        <a href="${pageContext.request.contextPath}/admin/categories" style="color: yellow; margin-right: 15px; text-decoration: none;">[Admin] Quản lý Danh mục</a>
    
        <span style="float: right;">
            <a href="${pageContext.request.contextPath}/login" style="color: white; margin-right: 10px; text-decoration: none;">Đăng nhập</a>
            <a href="${pageContext.request.contextPath}/register" style="color: white; text-decoration: none;">Đăng ký</a>
        </span>
    </div>
    
    <h2>CHI TIẾT SẢN PHẨM</h2>
    <div style="display: flex; gap: 30px;">
        <div>
            <img src="${pageContext.request.contextPath}/image/${product.images}" width="300" height="300" style="object-fit:cover; border:1px solid #ccc;"/>
        </div>
        <div>
            <h3>${product.productName}</h3>
            <p><strong>Danh mục:</strong> ${product.category.categoryname}</p>
            <p><strong>Giá bán:</strong> <span style="color:red; font-size:20px;">${product.unitPrice} VNĐ</span></p>
            <p><strong>Số lượng còn:</strong> ${product.quantity}</p>
            <p><strong>Mô tả:</strong> ${product.description}</p>
            <a href="${pageContext.request.contextPath}/product">Quay lại danh sách</a>
        </div>
    </div>
</body>
</html>