<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%> <%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <title><sitemesh:write property="title"/></title>
    <style>
      body {
        font-family: Arial, sans-serif;
        margin: 0;
        padding: 0;
      }
      .admin-header {
        background-color: #212529;
        padding: 12px 20px;
        color: white;
        display: flex;
        justify-content: space-between;
        align-items: center;
      }
      .admin-header a {
        color: #ffc107;
        text-decoration: none;
        margin-right: 15px;
        font-weight: bold;
      }
      .admin-container {
        padding: 20px;
      }
      .admin-footer {
        background-color: #f8f9fa;
        text-align: center;
        padding: 12px;
        margin-top: 30px;
        border-top: 1px solid #dee2e6;
        color: #6c757d;
        font-size: 13px;
      }
    </style>
    <sitemesh:write property="head" />
  </head>
  <body>
    <!-- Header giao diện Admin -->
    <div class="admin-header">
      <div>
        <span style="font-size: 18px; margin-right: 20px; color: white"
          ><b>ADMIN DASHBOARD</b></span
        >
        <a href="${pageContext.request.contextPath}/admin/products"
          >[Quản lý Sản phẩm]</a
        >
        <a href="${pageContext.request.contextPath}/admin/categories"
          >[Quản lý Danh mục]</a
        >
      </div>
      <div>
        <a href="${pageContext.request.contextPath}/home" style="color: white"
          >Trở về Trang chủ</a
        >
        |
        <a href="${pageContext.request.contextPath}/logout" style="color: white"
          >Đăng xuất</a
        >
      </div>
    </div>

    <!-- Nội dung các trang trong thư mục admin (product-list.jsp, category-list.jsp,...) sẽ hiển thị ở đây -->
    <div class="admin-container">
      <sitemesh:write property="body" />
    </div>

    <!-- Footer Admin -->
    <div class="admin-footer">
      © 2026 Shopping Service - Trang Quản Trị Hệ Thống
    </div>
  </body>
</html>
