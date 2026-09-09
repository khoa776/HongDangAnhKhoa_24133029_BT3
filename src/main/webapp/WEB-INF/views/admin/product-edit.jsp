<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Chỉnh sửa sản phẩm</title>
    <style>
        .error-msg { color: red; font-size: 13px; margin-left: 8px; }
    </style>
</head>
<body>
    <h2>CẬP NHẬT SẢN PHẨM</h2>
    <form:form action="${pageContext.request.contextPath}/admin/products/edit" method="post" enctype="multipart/form-data" modelAttribute="productForm">
        <!-- Khóa chính ID sản phẩm -->
        <form:hidden path="productId" />

        <p>
            Tên sản phẩm: <form:input path="productName" />
            <form:errors path="productName" cssClass="error-msg" />
        </p>
        <p>
            Số lượng: <form:input type="number" path="quantity" />
            <form:errors path="quantity" cssClass="error-msg" />
        </p>
        <p>
            Đơn giá: <form:input type="number" step="0.1" path="unitPrice" />
            <form:errors path="unitPrice" cssClass="error-msg" />
        </p>
        <p>Giảm giá (%): <form:input type="number" step="0.1" path="discount" /></p>
        
        <p>
            Danh mục: 
            <form:select path="categoryId">
                <c:forEach var="c" items="${categories}">
                    <form:option value="${c.categoryId}">${c.categoryname}</form:option>
                </c:forEach>
            </form:select>
            <form:errors path="categoryId" cssClass="error-msg" />
        </p>
        
        <p>Hình ảnh hiện tại: <br>
            <c:if test="${not empty product.images}">
                <img src="${pageContext.request.contextPath}/image/${product.images}" width="100" height="100" style="object-fit:cover; margin-top: 5px;"/>
            </c:if>
        </p>
        <p>Đổi ảnh mới: <input type="file" name="fileImage" accept="image/*"></p>
        <p>Mô tả: <br><form:textarea path="description" rows="4" cols="50" /></p>
        
        <button type="submit">Cập nhật</button>
        <a href="${pageContext.request.contextPath}/admin/products" style="margin-left: 10px;">Hủy</a>
    </form:form>
</body>
</html>