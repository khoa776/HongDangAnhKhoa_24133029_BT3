<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Trang chủ - Shopping Service</title>
    <style>
        .product-grid { display: flex; flex-wrap: wrap; gap: 20px; }
        .product-card { border: 1px solid #ccc; padding: 10px; width: 200px; text-align: center; border-radius: 8px; }
        .product-card img { width: 100%; height: 150px; object-fit: cover; }
    </style>
</head>
<body>
    <h2>TRANG CHỦ - 10 SẢN PHẨM MỚI NHẤT</h2>
    <p><a href="${pageContext.request.contextPath}/product">Xem tất cả sản phẩm (Có phân trang)</a></p>

    <div class="product-grid">
        <c:forEach var="p" items="${top10Products}">
            <div class="product-card">
                <img src="${pageContext.request.contextPath}/image/${p.images}" alt="${p.productName}"/>
                <h4>
                    <a href="${pageContext.request.contextPath}/product/detail/${p.productId}">${p.productName}</a>
                </h4>
                <p style="color:red; font-weight:bold;">${p.unitPrice} VNĐ</p>
            </div>
        </c:forEach>
    </div>
</body>
</html>