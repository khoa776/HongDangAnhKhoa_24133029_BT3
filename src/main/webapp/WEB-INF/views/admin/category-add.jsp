<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <title>Thêm Danh mục</title>
  </head>
  <body>
    <h2>THÊM MỚI DANH MỤC</h2>
    <form
      action="${pageContext.request.contextPath}/admin/categories/save"
      method="post"
    >
      <p>Tên danh mục: <input type="text" name="categoryname" required /></p>
      <p>
        Hình ảnh:
        <input type="text" name="images" placeholder="Tên file ảnh..." />
      </p>
      <p>
        Trạng thái:
        <select name="status">
          <option value="1">Hoạt động</option>
          <option value="0">Khóa</option>
        </select>
      </p>
      <button type="submit">Lưu</button>
      <a href="${pageContext.request.contextPath}/admin/categories">Hủy</a>
    </form>
  </body>
</html>
