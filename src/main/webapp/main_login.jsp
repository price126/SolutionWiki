<%@ page language="java" contentType="text/html; charset=UTF-8" 
    pageEncoding="UTF-8"%>
<%@ include file="config.jsp" %>
<%@ page import="java.sql.*" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Jua&display=swap" rel="stylesheet">
 <link rel="stylesheet" href="./CSS/main_login.css">
</head>

<%
if (request.getParameter("log_out") != null) { 
	session.invalidate(); // new_logout.jsp로 이동
	response.sendRedirect("new_logout.jsp");
	return;
}
// 위 if 구문을 통해 세션 만료시켜 로그아웃 상태로 함.

String username = (String) session.getAttribute("username");
// 세션에 저장되어 있는 username 정보를 가져옴
%>

<%
int maxlike = -1;
String maxuser = "";
try {
	Class.forName("com.mysql.cj.jdbc.Driver");
	Connection conn = DriverManager.getConnection(
	"jdbc:mysql://solutionwiki.cekfnmbxmcnt.ap-northeast-2.rds.amazonaws.com/SolutionWiki", "docType",
	"SolutionWiki");

	String cntquery = "SELECT total_likes FROM Users ORDER BY total_likes DESC LIMIT 1";
	Statement cntStmt = conn.createStatement();
	ResultSet cntRs = cntStmt.executeQuery(cntquery);

	if (cntRs.next()) {
		maxlike = cntRs.getInt("total_likes");
	}

	String userquery = "SELECT username FROM Users ORDER BY total_likes DESC LIMIT 1";
	Statement userStmt = conn.createStatement();
	ResultSet userRs = userStmt.executeQuery(userquery);

	if (userRs.next()) {
		maxuser = userRs.getString("username");
	}
	cntRs.close();
	cntStmt.close();
	userRs.close();
	userStmt.close();
	conn.close();
} catch (ClassNotFoundException | SQLException e) {
	e.printStackTrace();
}
%>

<body style="margin: 0;" >
	<div class="heading">
		<header>
			<span><a href="main_login.jsp">
					<h1 style="font-family: sans-serif;">Solution Wiki</h1> <!-- Solution Wiki 클릭하면 main_login.jsp로 이동 -->
					<h3 style="font-family: sans-serif;">for all students</h3>
			</a></span> 
			<span> 
			<span id="rank" ><a style="font-family: sans-serif;" href="<%= rankingURL %>" >Ranking</a></span>
			<span id="request" ><a style="font-family: sans-serif;" href="<%= requestURL %>" >Request</a></span>
			<span id="log_in"  ><a style="font-family: sans-serif;" href="<%= myPageURL %>">
				<%= (username != null) ? username : "Need Log in" %></a>
			</span>
			
			<form method="post">
				<input type="submit" name="log_out" value="Log out" style="font-family: sans-serif;"> <!-- Log out 버튼 누르면 세션 없애고 로그아웃된 페이지로 이동 -->
			</form>
			
			</span>
		</header>
	
		<div id="search_form_container">
			<form id="search_form" method="get" action="search.jsp">
					<input type="submit" style="width: 350px; height: 45px; font-size: 20px;" value="서적 검색 페이지로 이동">
			</form>
		</div>
	</div>
	
	<main>
	<br>
    <div class="left_align" style="font-size: 18px;">
    <h3>
        아래 서적들은 문제들의 솔루션이 아직 모두 등록되지 않았습니다.<br>
        솔루션을 등록해보시는 것은 어떤가요?
    </h3>
    </div>
    
    <div class="wrap">
        <div class="card_l" >
        	<div>
            	<a style="font-size: 20px; font-weight: bold;">선형대수학</a><br>
            	<img src="./IMAGE/Liner.jpg" style="width: 130px; height: 150px;">
            	<div>
            	출판사: 궁미디어<br>
            	저자: 강병련, 오세권
            	</div>
            	</div>
        	</div>
        <div class="card_r">
            <div>
            	<a style="font-size: 20px; font-weight: bold;">대학물리학</a><br>
            	<img src="./IMAGE/Phy.jpg" style="width: 130px; height: 150px;">
            	<div>
            	출판사: 청문각<br>
            	저자: Harris Benson
            	</div>
            </div>
        </div>
    </div>
    
    <br>
    
    <div class="wrap">
        <div class="card_l" >
        	<div>
            	<a style="font-size: 20px; font-weight: bold;">미적분학</a><br>
            	<img src="./IMAGE/Cal.jpg" style="width: 130px; height: 150px;">
            	<div>
            	출판사: 북스힐<br>
            	저자: 수학교재편찬위원회
            	</div>
            	</div>
        	</div>
        <div class="card_r">
            <div>
            	<a style="font-size: 20px; font-weight: bold;">공학경제(2판)</a><br>
            	<img src="./IMAGE/Eco.jpg" style="width: 130px; height: 150px;">
            	<div>
            	출판사: 교우사<br>
            	저자: 조성구 외
            	</div>
            </div>
        </div>
    </div>
    
    <br><hr>
    
    <div style="font-size: 18px; background-color: #F3FAFC;">
    	<div class="left_align">
    	<h3>
    		영광의 현재 랭킹 1위 이용자를 확인하세요!!</h3>
    	<h2>
    	<img src="./IMAGE/gold_medal.png" alt="Profile Image" style="width: 32px; height: 32px;">
    		현재 1위: <%= (maxuser != null) ? maxuser : "No user with maximum likes" %>
			(추천수: <%= maxlike %>)
    	</h2>
    	</div>
    </div>
    
	</main>
</body>
</html>