<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Quản lý Danh mục</title>
    <style>
        body { font-family: Arial, sans-serif; margin: 20px; }
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
    <h2>DANH SÁCH DANH MỤC</h2>
    <a href="${pageContext.request.contextPath}/admin/categories/add" class="btn btn-add">+ Thêm danh mục mới</a>

    <form action="${pageContext.request.contextPath}/admin/categories" method="get">
        <input type="text" name="search" value="${search}" placeholder="Nhập tên danh mục...">
        <button type="submit">Tìm kiếm</button>
    </form>

    <table>
        <thead>
            <tr>
                <th>ID</th>
                <th>Tên danh mục</th>
                <th>Hình ảnh</th>
                <th>Trạng thái</th>
                <th>Thao tác</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach var="item" items="${categories}">
                <tr>
                    <td>${item.categoryId}</td>
                    <td>${item.categoryname}</td>
                    <td>
                        <c:choose>
                            <c:when test="${not empty item.images && item.images.startsWith('http')}">
                                <img src="${item.images}" height="80" width="100" style="object-fit: cover;" />
                            </c:when>
                            <c:when test="${not empty item.images}">
                                <img src="${pageContext.request.contextPath}/image/${item.images}" height="80" width="100" style="object-fit: cover;" />
                            </c:when>
                            <c:otherwise>
                                <span>Không có ảnh</span>
                            </c:otherwise>
                        </c:choose>
                    </td>
                    <td>${item.status == 1 ? 'Hoạt động' : 'Khóa'}</td>
                    <td>
                        <a href="${pageContext.request.contextPath}/admin/categories/edit/${item.categoryId}" class="btn btn-edit">Sửa</a>
                        <a href="${pageContext.request.contextPath}/admin/categories/delete/${item.categoryId}" class="btn btn-delete" onclick="return confirm('Bạn có chắc muốn xóa?')">Xóa</a>
                    </td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
</body>
</html>