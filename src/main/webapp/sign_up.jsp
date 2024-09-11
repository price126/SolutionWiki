<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="solutionwiki.model.SignUpModelBean" %>
<%@ include file="config.jsp" %>
<%
if(request.getParameter("submit") != null) {
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		
		SignUpModelBean SignUp = new SignUpModelBean();
		SignUp.setUsername(username);
		SignUp.setPassword(password);
		
		SignUp.AddUser();
		
		response.sendRedirect("new_logout.jsp");
	}
%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Jua&display=swap" rel="stylesheet">
<link rel="stylesheet" href="./CSS/main_logout.css">
</head>
<body style="margin: 0;">
	<div class="heading" >
		<header>
			<span><a href="main_logout.jsp">
				<h1 style="font-family: sans-serif;">Solution Wiki</h1>
				<h3 style="font-family: sans-serif;">for all students</h3></a>
			</span> 
			
			<span> 
				<span id="rank"><a style="font-family: sans-serif;" href="<%= rankingURL %>" >Ranking</a></span>
				<span id="request"><a style="font-family: sans-serif;" href="<%= requestURL %>" >Request</a></span> 
			</span>
		</header>
	</div>
	<main style="background-color: #F3FAFC;">
	<form method="post">
	<div class="card">
        <input type="text" id="username" name="username" placeholder="Username" style="width: 300px; height: 40px; font-size: 16px;">
        <input type="password" id="password" name="password" placeholder="Password" style="width: 300px; height: 40px; font-size: 16px;"><br><br>
        <input type="submit" name="submit" value="회원가입">
    </div>

	</form>
	</main>
</body>
</html>