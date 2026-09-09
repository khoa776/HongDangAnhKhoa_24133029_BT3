<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Chỉnh sửa Danh mục</title>
    <style>
        .error-msg { color: red; font-size: 13px; margin-left: 10px; }
    </style>
</head>
<body>
    <h2>CẬP NHẬT DANH MỤC</h2>
    <form:form action="${pageContext.request.contextPath}/admin/categories/save" method="post" enctype="multipart/form-data" modelAttribute="categoryForm">
        <form:hidden path="categoryId" />
        
        <p>
            Tên danh mục: 
            <form:input path="categoryname" />
            <form:errors path="categoryname" cssClass="error-msg" />
        </p>
        <p>
            Ảnh hiện tại: 
            <c:if test="${not empty oldImages}">
                <img src="${pageContext.request.contextPath}/image/${oldImages}" width="80" height="60" style="object-fit:cover; vertical-align: middle;"/>
            </c:if>
        </p>
        <p>Đổi ảnh mới: <input type="file" name="imageFile" accept="image/*"></p>
        <p>Trạng thái: 
            <form:select path="status">
                <form:option value="1">Hoạt động</form:option>
                <form:option value="0">Khóa</form:option>
            </form:select>
        </p>
        <button type="submit">Cập nhật</button>
        <a href="${pageContext.request.contextPath}/admin/categories">Hủy</a>
    </form:form>
</body>
</html>