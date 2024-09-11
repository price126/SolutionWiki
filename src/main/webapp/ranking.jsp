<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.AbstractMap" %>
<%@ page import="solutionwiki.model.UserDataBean" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
  <!-- Google Fonts -->
  <link rel="preconnect" href="https://fonts.googleapis.com">
  <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
  <link href="https://fonts.googleapis.com/css2?family=Jua&display=swap" rel="stylesheet">
  <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />

  <!-- jQuery 및 simplePagination.js 라이브러리 -->
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

  <!-- 사용자 정의 CSS -->
  <link rel="stylesheet" href="./CSS/common.css">
  <link rel="stylesheet" href="./CSS/ranking.css">
</head>
<body>
  <!--헤드 타이틀-->
  <jsp:include page="header.jsp" />
  
  <main>
    <div class="page_title">
      <span class="material-symbols-outlined">
        thumb_up
      </span>
      <span id="ranking_title">랭킹 게시판</span> <!--게시판 제목-->
    </div>
    <div class="ranking_board"> <!--순위표-->
      <div class="ranking_header">
        <div class="rank">랭킹</div>
        <div class="user">유저명</div>
        <div class="likes">받은 추천수</div>
      </div>
		<%
			ArrayList<AbstractMap.SimpleEntry<Integer, UserDataBean>> rankingData = (ArrayList<AbstractMap.SimpleEntry<Integer, UserDataBean>>) request.getAttribute("rankingData");
			if (rankingData != null) {
			    for (int i = 0; i < rankingData.size(); i++) {
			      AbstractMap.SimpleEntry<Integer, UserDataBean> entry = rankingData.get(i);
			      System.out.println("엔트리:"+entry);
			      int rank = entry.getKey();
			      System.out.println(" 랭크: "+rank);
			      UserDataBean user = entry.getValue();
			      System.out.println(" 유저: "+user);
		%>
		<div class="ranking_item">
		  <div class="rank"><%= rank %></div>
		  <div class="user"><%= user.getUsername() %></div>
		  <div class="likes"><%= user.getTotalLikes() %></div>
		</div>
		<% 
		    }
		} 
		%>
    </div>

  </main>

</body>
</html>
