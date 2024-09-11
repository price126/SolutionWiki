<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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

  <!-- Quill.js 스타일시트 -->
  <link href="https://cdn.quilljs.com/1.3.6/quill.snow.css" rel="stylesheet">

  <!-- simplePagination.js 스타일시트 -->
  <link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/simplePagination.js/1.6/simplePagination.css">

  <!-- 사용자 정의 CSS 파일  -->
  <link rel="stylesheet" href="./CSS/common.css">
  <link rel="stylesheet" href="./CSS/create_request.css">
</head>

<body>
  <jsp:include page="header.jsp" />

  <main>
    <div id="page_title">
      <span class="material-symbols-outlined">
        chat
      </span>
      <span id="new_request_title">요청 등록</span>
    </div>

    <form id="request_form" method="post" action="./createRequest">
      <div class="request_board">
        <div class="category_form">
          <select id="category" name="category">
            <option value="도서요청">도서 요청</option>
            <option value="사이트수정">사이트 수정</option>
            <option value="기타">기타</option>
          </select>
          <span class="request_title_label">제목 :</span>
          <input type="text" class="request_title_input" name="request_title">
        </div>
        <button type="button" class="material-symbols-outlined" id="save">save</button>
      </div>

	<input type="hidden" id="content" name="content">

      <div id="text_editor">
        <div id="editor_area"></div>
      </div>
    </form>
  </main>

  <script src="https://cdn.quilljs.com/1.3.6/quill.js"></script>
  <script>
  var quill = new Quill('#editor_area', {
	  theme: 'snow',
	  modules: {
	    toolbar: {
	      container: [
	        [{ 'header': [1, 2, 3, false] }],
	        ['bold', 'italic', 'underline'], 
	        [{ 'list': 'ordered'}, { 'list': 'bullet' }],
	        ['clean'],
	        ['image']
	      ],
	      handlers: {
	        image: function() {
	          var range = this.quill.getSelection();
	          var input = document.createElement('input');
	          input.setAttribute('type', 'file');
	          input.setAttribute('accept', 'image/*');
	          input.click();

	          input.onchange = function() {
	            var file = input.files[0];
	            var reader = new FileReader();

	            reader.onload = function(e) {
	              var url = e.target.result;
	              this.quill.insertEmbed(range.index, 'image', url);
	            }.bind(this);

	            reader.readAsDataURL(file);
	          }.bind(this);
	        }
	      }
	    }
	  }
	});

	document.getElementById('save').addEventListener('click', function() {
	  var content = quill.root.innerHTML;
	  document.getElementById('content').value = content;
	  document.getElementById('request_form').submit();
	});
  </script>
</body>
</html>
