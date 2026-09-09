<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8" />
    <title>Thêm sản phẩm mới</title>
    <style>
        .error-msg { color: red; font-size: 13px; margin-left: 8px; }
    </style>
</head>
<body>
    <h2>THÊM SẢN PHẨM MỚI</h2>
    <form:form action="${pageContext.request.contextPath}/admin/products/add" method="post" enctype="multipart/form-data" modelAttribute="productForm">
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
                <form:option value="" label="-- Chọn danh mục --" />
                <c:forEach var="c" items="${categories}">
                    <form:option value="${c.categoryId}">${c.categoryname}</form:option>
                </c:forEach>
            </form:select>
            <form:errors path="categoryId" cssClass="error-msg" />
        </p>
        <p>Hình ảnh: <input type="file" name="fileImage" accept="image/*"></p>
        <p>Mô tả: <br><form:textarea path="description" rows="4" cols="50" /></p>
        
        <button type="submit">Lưu sản phẩm</button>
        <a href="${pageContext.request.contextPath}/admin/products" style="margin-left: 10px;">Hủy</a>
    </form:form>
</body>
</html>