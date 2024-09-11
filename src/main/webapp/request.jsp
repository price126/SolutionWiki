<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList" %>
<%@ include file="config.jsp" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
  <!-- Google Fonts -->
  <link rel="preconnect" href="https://fonts.googleapis.com">
  <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
  <link href="https://fonts.googleapis.com/css2?family=Jua&display=swap" rel="stylesheet">
  <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />

  <!-- jQuery 및 simplePagination.js 라이브러리 -->
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

  <!-- 사용자 정의 CSS -->
  <link rel="stylesheet" href="./CSS/common.css">
  <link rel="stylesheet" href="./CSS/request.css">
</head>

<body>
  <!--헤드 타이틀-->
  <jsp:include page="header.jsp" />

  <!--메인-->
  <main>

    <div class="page_title">
      <span class="material-symbols-outlined">
        chat
      </span>
      <span id="request_title">요청 게시판</span> <!--게시판 제목-->
    </div>

    <div class="request_board">
      <!--요청버튼-->

      <a id="new_request_button" href="<%=createRequestURL%>"><button id="new_request">요청 작성</button></a>
      <!-- 요청글(항목)들 추가 -->
  	<% 
	ArrayList<solutionwiki.model.RequestDataBean> requestData = (ArrayList<solutionwiki.model.RequestDataBean>) request.getAttribute("requestData");
	if (requestData != null) { 
	    for (int i = 0; i < requestData.size(); i++) {
	      solutionwiki.model.RequestDataBean data = requestData.get(i);
	%>
	  <a href="<%= requestURL +"/"+ data.getId() %>" class="request_link">
	    <div class="request_item book">
	      <h2 class="category"><%= data.getCategory() %></h2>
	      <p class="request_item_title"><%= data.getTitle() %></p>
	    </div>
	  </a>
	<% 
	    }
	}
	%>
</div>

<!--js 연결-->
<script>
$(document).ready(function() {
  
  $('.request_item').hover(
    function() {
      $(this).data('original-color', $(this).css('background'));
      $(this).css('background', '#aaa');
    }, function() {
      $(this).css('background', $(this).data('original-color'));
    }
  );
  
  var isSubmitted = '<%= session.getAttribute("isSubmitted") %>';
  if (isSubmitted==="true") {
      alert("작성이 완료되었습니다.");
      <% session.removeAttribute("isSubmitted"); %>
  }
});
</script>
  
</body>
</html>
