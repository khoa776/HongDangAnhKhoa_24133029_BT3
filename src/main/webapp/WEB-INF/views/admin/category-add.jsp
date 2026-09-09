<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%> <%@ taglib prefix="c"
uri="http://java.sun.com/jsp/jstl/core" %> <%@ taglib prefix="form"
uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <title>Thêm Danh mục</title>
    <style>
      .error-msg {
        color: red;
        font-size: 13px;
        margin-left: 10px;
      }
    </style>
  </head>
  <body>
    <h2>THÊM MỚI DANH MỤC</h2>
    <form:form
      action="${pageContext.request.contextPath}/admin/categories/save"
      method="post"
      enctype="multipart/form-data"
      modelAttribute="categoryForm"
    >
      <p>
        Tên danh mục:
        <form:input path="categoryname" />
        <form:errors path="categoryname" cssClass="error-msg" />
      </p>
      <p>Chọn ảnh: <input type="file" name="imageFile" accept="image/*" /></p>
      <p>
        Trạng thái:
        <form:select path="status">
          <form:option value="1">Hoạt động</form:option>
          <form:option value="0">Khóa</form:option>
        </form:select>
      </p>
      <button type="submit">Lưu</button>
      <a href="${pageContext.request.contextPath}/admin/categories">Hủy</a>
    </form:form>
  </body>
</html>
