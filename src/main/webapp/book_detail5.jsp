<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="solutionwiki.model.ChapterInfoBean" %>
<%@ page import="solutionwiki.model.SolutionBean" %>
<%@ page import="java.util.*" %>
<%
   ChapterInfoBean chapterBean = (ChapterInfoBean)request.getAttribute("chapterBean");   
   String bookId = chapterBean.getBookId();
   String chapterNum = chapterBean.getChpaterNum();
   List<String> problems = chapterBean.getProblems();
   List<List<SolutionBean>> solutions = chapterBean.getSolutions();
   int problemNum = Integer.parseInt((String) request.getParameter("problem_num")) + 1;
   int user_id = (int) request.getAttribute("user_id");
%>
<!DOCTYPE html>
<html lang="kr">

<head>
    <meta charset="UTF-8">
    <title>솔루션 자세히 보기</title>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Jua&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="CSS/book_detail5.css">
    <link href="https://cdn.quilljs.com/1.3.6/quill.snow.css" rel="stylesheet">
    <script src="https://code.jquery.com/jquery-latest.min.js"></script>
    <script src="https://polyfill.io/v3/polyfill.min.js?features=es6"></script>
   <script src="https://cdn.quilljs.com/1.3.6/quill.js"></script>
    <script id="MathJax-script" async src="https://cdn.jsdelivr.net/npm/mathjax@3/es5/tex-mml-chtml.js"></script>
</head>

<body>
    <jsp:include page="header.jsp" />
    <main>
        <div id="content">
            <div id="chapter" class="box_color">
                <p>
                <h2><%= problemNum %>번 문제</h2>
                </p>
                <form id="solution_form" action="SolutionUpload" method="POST" class="next_solution">
               <input type="hidden" id="contents" name="contents">
                <input type="hidden" name="problem_id" value="<%=problems.get(problemNum-1)%>">
                <input type="hidden" name="user_id" value="<%= user_id %>">
                <button id='save' class="solution_btn">제출</button>
            </form>
            </div>
            
            <div class="content_write_solution">
                <div id="editor_area" class="solution-input background_white"></div>
            <!--<div id="solution-preview" class="background_white" readonly></div> -->
            </div>

        </div>
    </main>
    <script>
        $(function () {
            updateMainHeight(); // 페이지 로드 시 높이 업데이트
            // 창 크기가 변경될 때마다 높이 업데이트
            $(window).on('resize', function () {
                updateMainHeight();
            });

            function updateMainHeight() {
                var totalHeight = 0;
                // 내부 요소들의 높이를 합산
                $('#content > div').each(function () {
                    totalHeight += $(this).outerHeight(true);
                });
                // main 요소의 높이를 업데이트
                $('main').css('height', totalHeight+'px');
            }
        })
            var quill = new Quill('#editor_area', {
               theme: 'snow',
              placeholder: '여기에 솔루션을 작성해주세요.',

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
               var contents = quill.root.innerHTML;
               document.getElementById('contents').value = contents;
               document.getElementById('solution_form').submit();
             });
           
    </script>

</body>

</html>