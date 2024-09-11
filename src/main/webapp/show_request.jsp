<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Solution Wiki</title>

  <!-- Google Fonts -->
  <link rel="preconnect" href="https://fonts.googleapis.com">
  <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
  <link href="https://fonts.googleapis.com/css2?family=Jua&display=swap" rel="stylesheet">
  <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />

  <!-- jQuery 및 simplePagination.js 라이브러리 -->
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/simplePagination.js/1.6/jquery.simplePagination.js"></script>
  <link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/simplePagination.js/1.6/simplePagination.css">

  <!-- Quill.js-->
  <link href="https://cdn.quilljs.com/1.3.6/quill.snow.css" rel="stylesheet">

  <!-- 사용자 정의 CSS -->
  <link rel="stylesheet"  href="${pageContext.request.contextPath}/CSS/common.css">
  <link rel="stylesheet"  href="${pageContext.request.contextPath}/CSS/show_request.css">

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
	    <span id="request_detail_title">요청 게시글</span>
	  </div>
	
	  <div class="request_board">
	    <div class="category_form">  
	      <select id="category" disabled>
	        <option value="<%= request.getAttribute("category") %>"><%= request.getAttribute("category") %></option>
	      </select>
	      <span class="request_title_label">제목 :</span>
	      <input type="text" class="request_title_input" name="request_title" value="<%= request.getAttribute("title") %>" disabled>
	    </div> 
	  </div>
	
	  <div id="text_editor">
	    <div id="editor_area">
	      <%= request.getAttribute("content") %>
	    </div>
	  </div>
	</main>
</body>
</html>
