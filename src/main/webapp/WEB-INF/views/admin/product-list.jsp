<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Quản lý Sản phẩm</title>
    <style>
        body { font-family: Arial, sans-serif; margin: 0; }
        table { width: 100%; border-collapse: collapse; margin-top: 15px; }
        th, td { border: 1px solid #ddd; padding: 10px; text-align: left; }
        th { background-color: #007bff; color: white; }
        .btn { padding: 6px 12px; text-decoration: none; border-radius: 4px; color: white; display: inline-block; }
        .btn-add { background-color: #28a745; margin-bottom: 10px; }
        .btn-edit { background-color: #ffc107; color: black; }
        .btn-delete { background-color: #dc3545; }
    </style>
</head>
<body>

    <h2>DANH SÁCH SẢN PHẨM</h2>
    <a href="${pageContext.request.contextPath}/admin/products/add" class="btn btn-add">+ Thêm sản phẩm mới</a>

    <table>
        <thead>
            <tr>
                <th>ID</th>
                <th>Tên sản phẩm</th>
                <th>Hình ảnh</th>
                <th>Giá</th>
                <th>Số lượng</th>
                <th>Danh mục</th>
                <th>Thao tác</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach var="p" items="${products}">
                <tr>
                    <td>${p.productId}</td>
                    <td>${p.productName}</td>
                    <td>
                        <c:choose>
                            <c:when test="${not empty p.images && p.images.startsWith('http')}">
                                <img src="${p.images}" height="60" width="60" style="object-fit:cover;"/>
                            </c:when>
                            <c:when test="${not empty p.images}">
                                <img src="${pageContext.request.contextPath}/image/${p.images}" height="60" width="60" style="object-fit:cover;"/>
                            </c:when>
                            <c:otherwise>
                                <span>Chưa có ảnh</span>
                            </c:otherwise>
                        </c:choose>
                    </td>
                    <td><fmt:formatNumber value="${p.unitPrice}" pattern="#,###"/> VNĐ</td>
                    <td>${p.quantity}</td>
                    <td>${p.category.categoryname}</td>
                    <td>
                        <a href="${pageContext.request.contextPath}/admin/products/edit/${p.productId}" class="btn btn-edit">Sửa</a>
                        <a href="${pageContext.request.contextPath}/admin/products/delete/${p.productId}" class="btn btn-delete" onclick="return confirm('Xóa sản phẩm này?')">Xóa</a>
                    </td>
                </tr>
            </c:forEach>
        </tbody>
    </table>

</body>
</html>