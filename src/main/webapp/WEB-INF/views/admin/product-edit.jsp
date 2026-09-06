<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Chỉnh sửa sản phẩm</title>
</head>
<body>
    <h2>CẬP NHẬT SẢN PHẨM</h2>
    <form action="${pageContext.request.contextPath}/admin/products/edit" method="post" enctype="multipart/form-data">
        <!-- Khóa chính ID sản phẩm -->
        <input type="hidden" name="productId" value="${product.productId}" />

        <p>Tên sản phẩm: <input type="text" name="productName" value="${product.productName}" required></p>
        <p>Số lượng: <input type="number" name="quantity" value="${product.quantity}" required></p>
        <p>Đơn giá: <input type="number" step="0.1" name="unitPrice" value="${product.unitPrice}" required></p>
        <p>Giảm giá (%): <input type="number" step="0.1" name="discount" value="${product.discount}"></p>
        
        <p>Danh mục: 
            <select name="categoryId" required>
                <c:forEach var="c" items="${categories}">
                    <option value="${c.categoryId}" ${c.categoryId == product.category.categoryId ? 'selected' : ''}>
                        ${c.categoryname}
                    </option>
                </c:forEach>
            </select>
        </p>
        
        <p>Hình ảnh hiện tại: <br>
            <c:if test="${not empty product.images}">
                <img src="${pageContext.request.contextPath}/image/${product.images}" width="100" height="100" style="object-fit:cover;"/>
            </c:if>
        </p>
        <p>Đổi ảnh mới: <input type="file" name="fileImage" accept="image/*"></p>
        <p>Mô tả: <br><textarea name="description" rows="4" cols="50">${product.description}</textarea></p>
        
        <button type="submit">Cập nhật</button>
        <a href="${pageContext.request.contextPath}/admin/products">Hủy</a>
    </form>
</body>
</html>