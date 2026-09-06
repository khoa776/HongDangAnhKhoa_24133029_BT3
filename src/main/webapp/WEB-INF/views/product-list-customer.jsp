<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Danh sách sản phẩm</title>
    <style>
        .product-grid { display: flex; flex-wrap: wrap; gap: 20px; margin-top: 15px; }
        .product-card { border: 1px solid #ccc; padding: 10px; width: 200px; text-align: center; border-radius: 8px; }
        .product-card img { width: 100%; height: 150px; object-fit: cover; }
        .pagination { margin-top: 20px; }
        .pagination a { padding: 8px 12px; border: 1px solid #ccc; text-decoration: none; margin-right: 5px; }
        .pagination a.active { background-color: #007bff; color: white; }
    </style>
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
    <h2>TẤT CẢ SẢN PHẨM</h2>
    <a href="${pageContext.request.contextPath}/home">Quay lại trang chủ</a>

    <div class="product-grid">
        <c:forEach var="p" items="${productPage.content}">
            <div class="product-card">
                <img src="${pageContext.request.contextPath}/image/${p.images}"/>
                <h4>
                    <a href="${pageContext.request.contextPath}/product/detail/${p.productId}">${p.productName}</a>
                </h4>
                <p style="color:red; font-weight:bold;">${p.unitPrice} VNĐ</p>
            </div>
        </c:forEach>
    </div>

    <!-- Phân trang -->
    <div class="pagination">
        <c:forEach begin="0" end="${totalPages - 1}" var="i">
            <a href="${pageContext.request.contextPath}/product?page=${i}" class="${i == currentPage ? 'active' : ''}">${i + 1}</a>
        </c:forEach>
    </div>
</body>
</html>