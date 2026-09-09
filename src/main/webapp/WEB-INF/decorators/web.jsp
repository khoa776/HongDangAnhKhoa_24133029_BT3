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
      .main-content {
        min-height: 400px;
        padding: 20px;
      }
    </style>
    <sitemesh:write property="head" />
  </head>
  <body>
    <div><%@ include file="/common/web/header.jsp" %></div>

    <div class="main-content">
      <sitemesh:write property="body" />
    </div>

    <div><%@ include file="/common/web/footer.jsp" %></div>
  </body>
</html>
