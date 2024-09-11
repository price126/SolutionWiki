<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>도서 상세 정보</title>
</head>
<body>
    <h1>도서 상세 정보</h1>
    <h2>제목: <%= request.getAttribute("title") %></h2>
    <h3>저자: <%= request.getAttribute("author") %></h3>
    <h3>출판사: <%= request.getAttribute("publisher") %></h3>
    <img src="<%= request.getAttribute("thumbnail") %>">
</body>
</html>