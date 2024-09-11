<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="config.jsp" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Jua&display=swap" rel="stylesheet">
<link rel="stylesheet" href="./CSS/search.css">

<%
if (request.getParameter("log_out") != null) { // log_out 버튼 클릭하면 세션 무효화
	session.invalidate(); // new_logout.jsp로 이동
	response.sendRedirect("new_logout.jsp");
	return; // 추가된 부분
}

// main_login.jsp 페이지에서 세션에서 아이디를 가져옴
String username = (String) session.getAttribute("username");
%>

</head>
<body style="margin: 0;">
	<div class="heading">
		<header>
			<span><a href="main_login.jsp">
					<h1 style="font-family: sans-serif;">Solution Wiki</h1> <!-- Solution Wiki 클릭하면 main_login.jsp로 이동 -->
					<h3 style="font-family: sans-serif;">for all students</h3>
			</a></span> 
			<span>
				<span id="rank"><a style="font-family: sans-serif;" href="<%= rankingURL %>" >Ranking</a></span>
        		<span id="request"><a style="font-family: sans-serif;" href="<%= requestURL %>">Request</a></span> 
			<span id="log_in" ><a style="font-family: sans-serif;" href="<%= myPageURL %>">
				<%= (username != null) ? username : "Need Log in" %></a>
			</span> 						
			<form method="post">
				<input type="submit" name="log_out" value="Log out" style="font-family: sans-serif;"> <!-- Log out 버튼 누르면 세션 없애고 로그아웃된 페이지로 이동 -->
			</form>
			</span> 
			</span>
		</header>

		<div id="search_form_container">
			<form id="search_form" method="get">
				<div style="display: flex;">
					<input type="text" id="search_q" size="50" name="search_q"
						value="검색어를 입력하세요" class="search_input"
						onfocus="if(this.value=='검색어를 입력하세요'){this.value=''; this.style.opacity='1';}"
						onblur="if(this.value==''){this.value='검색어를 입력하세요'; this.style.opacity='0.5';}">
					<input type="submit" id="search_btn" value="검색" style="margin-left: 10px;">
				</div>
			</form>
		</div>
	</div>
	<main>
	<br>
	<br>

	<div id="search_message" class="left_align">
		<h2>서적 이름을 입력하세요</h2>
	</div>

	<div id="search_result_message" class="left_align"
		style="display: none;">
		<h2>검색 결과</h2>
	</div>
	<br>
	<div></div>

	<script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>

	<div id="searchResults" style="background-color: #F3FAFC;"></div>

	<script src="js/search.js"></script>
	</main>
</body>
</html>