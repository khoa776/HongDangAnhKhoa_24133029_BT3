<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Chỉnh sửa Danh mục</title>
</head>
<body>
    <h2>CẬP NHẬT DANH MỤC</h2>
    <form action="${pageContext.request.contextPath}/admin/categories/save" method="post">
        <input type="hidden" name="categoryId" value="${category.categoryId}">
        <p>Tên danh mục: <input type="text" name="categoryname" value="${category.categoryname}" required></p>
        <p>Hình ảnh: <input type="text" name="images" value="${category.images}"></p>
        <p>Trạng thái: 
            <select name="status">
                <option value="1" ${category.status == 1 ? 'selected' : ''}>Hoạt động</option>
                <option value="0" ${category.status == 0 ? 'selected' : ''}>Khóa</option>
            </select>
        </p>
        <button type="submit">Cập nhật</button>
        <a href="${pageContext.request.contextPath}/admin/categories">Hủy</a>
    </form>
</body>
</html>