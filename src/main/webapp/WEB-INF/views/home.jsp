<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Trang chủ - Shopping Service</title>
    <style>
        .container { padding: 20px; }
        .product-grid { display: flex; flex-wrap: wrap; gap: 20px; margin-top: 15px; }
        .product-card { border: 1px solid #ccc; padding: 10px; width: 200px; text-align: center; border-radius: 8px; }
        .product-card img { width: 100%; height: 150px; object-fit: cover; }
    </style>
</head>
<body>

    <!-- Nội dung chính (Header đã do SiteMesh quản lý) -->
    <div class="container">
        <h2>TRANG CHỦ - 10 SẢN PHẨM MỚI NHẤT</h2>
        <p><a href="${pageContext.request.contextPath}/product">Xem tất cả sản phẩm</a></p>

        <div class="product-grid">
            <c:forEach var="p" items="${top10Products}">
                <div class="product-card">
                    <c:choose>
                        <c:when test="${not empty p.images && p.images.startsWith('http')}">
                            <img src="${p.images}" alt="${p.productName}"/>
                        </c:when>
                        <c:when test="${not empty p.images}">
                            <img src="${pageContext.request.contextPath}/image/${p.images}" alt="${p.productName}"/>
                        </c:when>
                        <c:otherwise>
                            <img src="https://via.placeholder.com/200x150?text=No+Image" alt="No Image"/>
                        </c:otherwise>
                    </c:choose>
                    
                    <h4>
                        <a href="${pageContext.request.contextPath}/product/detail/${p.productId}" style="text-decoration: none; color: #007bff;">${p.productName}</a>
                    </h4>
                    <p style="color:red; font-weight:bold;">
                        <fmt:formatNumber value="${p.unitPrice}" pattern="#,###"/> VNĐ
                    </p>
                </div>
            </c:forEach>
        </div>
    </div>

</body>
</html>