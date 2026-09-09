<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<div style="background-color: #333; padding: 12px 20px; color: white;">
    <a href="${pageContext.request.contextPath}/home" style="color: white; margin-right: 15px; text-decoration: none; font-weight: none;"><b>Trang chủ</b></a>
    <a href="${pageContext.request.contextPath}/product" style="color: white; margin-right: 15px; text-decoration: none;"><b>Tất cả sản phẩm</b></a>
    <a href="${pageContext.request.contextPath}/admin/products" style="color: #ffc107; margin-right: 15px; text-decoration: none;"><b>[Admin] Sản phẩm</b></a>
    <a href="${pageContext.request.contextPath}/admin/categories" style="color: #ffc107; margin-right: 15px; text-decoration: none;"><b>[Admin] Danh mục</b></a>
    
    <span style="float: right;">
        <c:choose>
            <c:when test="${not empty sessionScope.account}">
                <span>Xin chào, 
                    <a href="${pageContext.request.contextPath}/profile" style="color: #00ffff; text-decoration: none; font-weight: bold;">
                        ${sessionScope.account.fullname}
                    </a>!
                </span> | 
                <a href="${pageContext.request.contextPath}/logout" style="color: #ffc107; text-decoration: none; margin-left: 5px;">Đăng xuất</a>
            </c:when>
            <c:otherwise>
                <a href="${pageContext.request.contextPath}/login" style="color: white; margin-right: 15px; text-decoration: none;">Đăng nhập</a>
                <a href="${pageContext.request.contextPath}/register" style="color: white; text-decoration: none;">Đăng ký</a>
            </c:otherwise>
        </c:choose>
    </span>
</div>