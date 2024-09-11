<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="solutionwiki.model.ChapterInfoBean" %>
<%@ page import="solutionwiki.model.SolutionBean" %>
<%@ page import="java.util.*" %>
<%@ include file="config.jsp" %>

<%
ChapterInfoBean chapterBean=(ChapterInfoBean)request.getAttribute("chapterBean"); 
	String bookId=chapterBean.getBookId(); 
	String chapterNum=chapterBean.getChpaterNum(); 
	List<String> problems = chapterBean.getProblems();
    List<List<SolutionBean>> solutions = chapterBean.getSolutions();

    String problemNum = (String) request.getParameter("problem_num");
    String solutionNum = (String) request.getParameter("solution_num");

    SolutionBean currentSolution = solutions.get(Integer.parseInt(problemNum)).get(Integer.parseInt(solutionNum));
    int solutionId = currentSolution.getSolutionId();
    int likes = currentSolution.getLikes();
%>

<!DOCTYPE html>
<html lang="kr">
    
<head>
    <meta charset="UTF-8">
    <title>솔루션 자세히 보기</title>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Jua&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="CSS/book_detail3.css">
<!--<script src="https://polyfill.io/v3/polyfill.min.js?features=es6"></script>
	<script id="MathJax-script" async src="https://cdn.jsdelivr.net/npm/mathjax@3/es5/tex-mml-chtml.js"></script>-->
    
    <script src="https://code.jquery.com/jquery-latest.min.js"></script>
</head>

<body>
    <jsp:include page="header.jsp" />
    <main>
        <div id="content">
            <div id="toggle_solution_only">
                작성자: <%=currentSolution.getUserName() %>
            </div>
            <div class="recommendation">
                <span class="recommendation_count font_bold">
                    <h2 style="display:inline">👍<%= likes %></h2>
                </span>
            </div>
            <div id="chapter" class="box_color">
                <p>
                <h2>챕터 <%= chapterNum %>: <%=Integer.parseInt(problemNum)+1%>번 문제</h2>
                </p>
                <div class="next_solution">
                    <p>
                    <h1 id="before-button" class="cursor_pointer" style="display:inline">◀</h1>
                    &nbsp;&nbsp;&nbsp;&nbsp;
                    <h1 id="next-button" class="cursor_pointer" style="display:inline">▶</h1>
                    </p>
                </div>
            </div>
            <div class="content_solution background_white">
 				<%=currentSolution.getContent() %>
			</div>
		</div>

		<script>	
        /* window.MathJax = {
		        tex: {
		            inlineMath: [['$', '$'], ['\\(', '\\)']]
		        },
		        svg: {
		            fontCache: 'global'
		        }
		    };
		  
		    window.onload = function() {
		        var content = $('.content_solution').text();
		        $('.content_solution').html(content.replace(/~(.+?)~/g, '$$$1$$'));
		      
		        MathJax.typesetPromise().then(() => {
		            // 문서 내의 모든 LaTeX 문법이 렌더링된 후에 실행됩니다.
		        });
		    }; */
    
        var problemNum = <%= Integer.parseInt(problemNum) %>;
        var solutionId = <%= solutionId %>;
        var solutionNum = <%= Integer.parseInt(solutionNum) %>;
        var solutionSize = <%= solutions.get(Integer.parseInt(problemNum)).size() %>;

          $('#before-button').click(function () {
              solutionNum = (solutionSize + solutionNum - 1) % solutionSize;
              window.location.href = "FindSolution?problem_num=" + problemNum + "&solution_num=" + solutionNum + "&full=full";
          });
          $('#next-button').click(function () {
              solutionNum = (solutionNum + 1) % solutionSize;
              window.location.href = "FindSolution?problem_num=" + problemNum + "&solution_num=" + solutionNum + "&full=full";
          });

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
              $('main').css('height', totalHeight + 200 + 'px');
          }

          $(".recommendation").click(function () {
              $.ajax({
                  url: 'Like', // 이 URL은 실제 서버의 경로에 맞게 변경해야 합니다.
                  type: 'POST',
                  data: {
                      solution_id: solutionId  
				  },
                  success: function (data) {
                      $(".recommendation_count > h2").text('👍'+data.likes); // **** 비동기화 통신으로 추천수 올리는 것 구현할 예정 ****
                  }
              });
          });

      </script>
</body>

</html>