<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="solutionwiki.model.GetChnumBean" %>
<%@ include file="config.jsp" %>

<!DOCTYPE html>
<html>
<head>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Jua&display=swap" rel="stylesheet">
<link rel="stylesheet" href="CSS/bookdetail.css">

<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
    <script src="https://code.jquery.com/jquery-3.6.0.js"
        integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous">
    </script>

</head>

<%
if (request.getParameter("log_out") != null) { // log_out 버튼 클릭하면 세션 무효화
	session.invalidate(); // new_logout.jsp로 이동
	response.sendRedirect("new_logout.jsp");
	return;
}

// main_login.jsp 페이지에서 세션에서 아이디를 가져옴
String username = (String) session.getAttribute("username");
%>

<body style="margin: 0;">
<div class="heading">
        <header>
            <span><a href="<%=mainURL%>">
                    <h1 style="font-family: sans-serif;">Solution Wiki</h1>
                    <h3 style="font-family: sans-serif;">for all students</h3>
                </a></span>
            <span>
                <span id="rank"><a style="font-family: sans-serif;" href="<%=rankingURL%>">Ranking</a></span>
                <span id="request"><a style="font-family: sans-serif;" href="<%=requestURL%>" >Request</a></span>
                <span id="log_in" ><a style="font-family: sans-serif;" href="<%= myPageURL %>">
                <%=(username != null) ? username : "Need Log in"%></a>
            </span> 
			
			<form method="post">
				<input type="submit" name="log_out" value="Log out" style="font-family: sans-serif;"> <!-- Log out 버튼 누르면 세션 없애고 로그아웃된 페이지로 이동 -->
			</form>
			
            </span>
        </header>
        
        </div>
    <main>
        <br><br>
     
<%
     GetChnumBean ch = new GetChnumBean();
     	String isbn_13 = request.getParameter("isbn");
     	ch.Set_book_id(isbn_13);
     	ch.Set_total_ch();
     	
     	int total_ch = ch.Get_total_ch();
     %>

    <div class="left_align" id="jua_font">
        <h2>서적 상세 정보</h2>
    </div><br>
    <div id="bookInfo"></div>

    <script src="js/bookdetail.js"></script>
    <hr>
    <div class="left_align" id="jua_font">
        <h2>서적 솔루션 정보</h2>
    </div><br>
    
    <div style="background-color: #F3FAFC;">
    	<div class="left_align" style="background-color: #F3FAFC;">
    	<%
    		for (int i=1; i<=total_ch; i++) {
    	%>
		<form action="FindProblem" method="get"> <!-- 해당 챕터와 ISBN 코드를 넘겨줌 -->
		<input type="hidden" name="bookId" value="<%= ch.Get_book_id() %>"> 
		<input type="hidden" name="chapterNum" value="<%= i %>">
		<input type="submit" value="챕터 <%= i %> 보기">
		</form>
		<br>
		<%	
    		}
    	%>
    	</div>
    </div>
    </main>
</body>
</html>