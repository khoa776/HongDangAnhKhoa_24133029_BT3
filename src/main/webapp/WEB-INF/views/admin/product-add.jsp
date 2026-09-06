<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Thêm sản phẩm mới</title>
</head>
<body>
    <h2>THÊM SẢN PHẨM MỚI</h2>
    <form action="${pageContext.request.contextPath}/admin/products/add" method="post" enctype="multipart/form-data">
        <p>Tên sản phẩm: <input type="text" name="productName" required></p>
        <p>Số lượng: <input type="number" name="quantity" value="10" required></p>
        <p>Đơn giá: <input type="number" step="0.1" name="unitPrice" required></p>
        <p>Giảm giá (%): <input type="number" step="0.1" name="discount" value="0"></p>
        <p>Danh mục: 
            <select name="categoryId" required>
                <c:forEach var="c" items="${categories}">
                    <option value="${c.categoryId}">${c.categoryname}</option>
                </c:forEach>
            </select>
        </p>
        <p>Hình ảnh: <input type="file" name="fileImage" accept="image/*"></p>
        <p>Mô tả: <br><textarea name="description" rows="4" cols="50"></textarea></p>
        <button type="submit">Lưu sản phẩm</button>
    </form>
</body>
</html>