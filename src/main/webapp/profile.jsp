<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="config.jsp" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>Solution Wiki</title>

  <!-- Google Fonts -->
  <link rel="preconnect" href="https://fonts.googleapis.com">
  <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
  <link href="https://fonts.googleapis.com/css2?family=Jua&display=swap" rel="stylesheet">
  <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />

  <!-- jQuery 및 simplePagination.js 라이브러리 -->
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/simplePagination.js/1.6/jquery.simplePagination.js"></script>

  <!-- simplePagination.js 스타일시트 -->
  <link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/simplePagination.js/1.6/simplePagination.css">

  <!-- 사용자 정의 CSS -->
  <link rel="stylesheet" href="./CSS/common.css">
  <link rel="stylesheet" href="./CSS/profile.css">
</head>
<body>
  <jsp:include page="header.jsp" />

  <main>
    <div class="page_title">
      <span id="my_page">마이페이지</span>
    </div>

    <div class="user_profile">
      <span class="material-symbols-outlined">
        account_circle
      </span>
  	<span class="username">${sessionScope.username}</span>
    </div>

    <div class="my_recommendation">
      <span class="material-symbols-outlined recommendation_icon">
        thumb_up
      </span>
      <span class="recommendation_title">받은 추천 수 : ${user.totalLikes}</span>
    </div>

    <button class="account_deletion">
      <span class="material-symbols-outlined account_deletion_icon">
        delete
      </span>
      <span class="deletion_text">회원 탈퇴</span>
    </button>
  </main>

	<!--js 연결-->
		<script>
	    $(".account_deletion").click(function() {
	        var result = window.confirm("정말 탈퇴하시겠습니까?");
	        if (result) {
	            window.alert("그동안 이용해주셔서 감사합니다.");
	            window.location.href = '<%= mainURL %>'; // mainURL로 이동
	        }
	    });

	</script>
		

</body>
</html>
