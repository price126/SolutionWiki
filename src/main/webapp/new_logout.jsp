<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="solutionwiki.model.MatchingBean" %>
<%@ include file="config.jsp" %>

<% 
if (request.getParameter("Log_In") != null) {
	MatchingBean MatchBean = new MatchingBean();
	String tmp_Id = request.getParameter("id");
	String tmp_pw = request.getParameter("password");
	
	MatchBean.setTmp_Id(tmp_Id);
	MatchBean.setTmp_pw(tmp_pw);
	
	if(MatchBean.Matching()) {
			session = request.getSession(true);
        	session.setAttribute("username", tmp_Id);
        	response.sendRedirect("main_login.jsp");
		} else {
            out.println("<script>alert('로그인 실패');</script>");
        }
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

<body style="margin:0; background-color: #F3FAFC; ">
	<div class="heading" style="background-color: white;">
		<header>
			<span><a href="new_logout.jsp">
					<h1 style="font-family: sans-serif;">Solution Wiki</h1>
					<h3 style="font-family: sans-serif;">for all students</h3>
			</a></span> 
			<span> 
			<span id="rank" style="font-family: sans-serif;">Ranking</span>
			<span id="request" style="font-family: sans-serif;">Request</span>
			<span id="log_in"> <input type="button" name="log_in" value="Log in" style="font-family: sans-serif;"></span> <!--  --> 
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
	
	<main style="display: flex; flex-direction: column; align-items: center; justify-content: center; background-color: #F3FAFC; ">
    <br>
	<div style="text-align:center; font-size: 20px;">
	
	</div>
	
	<br><br><br>

    <div class="card" style="width: 850px; margin-top: 70%;">
    <h2> 다양한 서적의 솔루션을 확인하고 추가해 보세요</h2>
    <img src="./IMAGE/problem.jpg" style="width: 750px; height: 400px;">
    </div>
    
    <div class="card" style="width: 850px;">
    <h2>솔루션을 추가해 추천 랭킹 상위권에 이름을 올려보세요</h2>
    <img src="./IMAGE/ranking.jpg" style="width: 500px; height: 400px;">	
    </div>
    
    <div class="card" style="width: 850px;">
    <h2>불편 사항은 요청 게시판을 통해 건의해주세요</h2>
    <img src="./IMAGE/request.jpg" style="width: 500px; height: 400px;">
    </div>
	
	<br>
	
	<div class="modal">
		<div class="modal_body">
		
			<form method="post">
				<h2>Sing in</h2>
				<br>
				<div style="text-align:center;">
                    <input type="text" name="id" size="30" style="height:30px; font-size: 16px;" placeholder="ID"><br><br>
                    <input type="password" name="password" size="30" style="height:30px; font-size: 16px;" placeholder="PassWord"><br>
                </div>
           		<br>
                <input type="submit" value="Log In" name="Log_In" style="width: 100px; height: 40px; font-size: 16px;"> <!-- 로그인 -->
                
                <a href="sign_up.jsp">
             		<input type="button" value="회원가입" style="width: 100px; height: 40px; font-size: 16px;"> <!-- 회원가입 페이지로 이동 -->
                </a>
                <br><hr>
				
				<button class="modal_close btn_close" name="close">
					<div style="border: 1px solid #000; display: inline-block; width: 150px;">
						<h3>close</h3>
					</div>
				</button>
			</form>
			
		</div>
	</div>
	
	<script src="js/main_logout_modal.js"></script>
	</main>
</body>
</html>