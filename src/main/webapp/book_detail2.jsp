<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="solutionwiki.model.ChapterInfoBean" %>
<%@ page import="solutionwiki.model.SolutionBean" %>
<%@ page import="java.util.*" %>
<%
	ChapterInfoBean chapterBean = (ChapterInfoBean)session.getAttribute("chapterBean");	
    String bookId = chapterBean.getBookId();
	String chapterNum = chapterBean.getChpaterNum();
    List<String> problems = chapterBean.getProblems();
    List<List<SolutionBean>> solutions = chapterBean.getSolutions();
%>
<!DOCTYPE html>
<html lang="kr">

<head>
    <meta charset="UTF-8">
    <title>솔루션 미리보기</title>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Jua&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="CSS/book_detail2.css">
    <script src="https://code.jquery.com/jquery-latest.min.js"></script>
    <script>
    	var book_id = <%= bookId %>;
    	var chapter_num = <%= chapterNum %>;
    </script>
</head>

<body>
    <jsp:include page="header.jsp" />
    <main>
        <div id="content">
            <div id="toggle_solution_only">
                솔루션 없는 문제 숨기기 &ensp;
                <input type="checkbox" name="solution_toggle" class="cursor_pointer">
            </div>
            <div id="chapter" class="box_color">
                <p>
                <h2>챕터 <%= chapterNum %></h2> <!-- 챕터명 입력 받아야함 -->
                </p>
            </div>
            <div>
                <span id="solution_list">
                    <ul>
                        <% for (int i = 0; i < problems.size(); i++) { 
                        	String firstSolutionContent = "";
                            if (!solutions.get(i).isEmpty()) {
                                firstSolutionContent = solutions.get(i).get(0).getContent();
                            }
                            firstSolutionContent = firstSolutionContent.replace("\"", "\''");
                        %>
					        <li class="cursor_pointer" data-count="<%=i+1%>" data-solution="<%= firstSolutionContent %>">
					            <span class="problem-item"> <%= (i+1) %>번 문제 </span> 
					            <font size="5">
					            <% 
					                if (firstSolutionContent == "") { 
					                    out.print(" 😟");
					                } else { 
					                    out.print(" 😊");
					                }
					            %></font>
					        </li>
					    <% } %>
                    </ul>
                </span>
                <span id="show_answer" class="box_color"><p><h1 style="font-family: Jua;letter-spacing: 3px;">좌측에서 문제를 골라주세요😌</h1></p></span>
            </div>
        </div>
    </main>
    <script>
    	var count;
    	
	    function handleEditClick() {
	        var form = document.createElement("form");
	        form.setAttribute("method", "get");
	        form.setAttribute("action", "FindSolution");
	
	        var hiddenField1 = document.createElement("input");
	        hiddenField1.setAttribute("type", "hidden");
	        hiddenField1.setAttribute("name", "problem_num");
	        hiddenField1.setAttribute("value", count-1);

	        var hiddenField2 = document.createElement("input");
	        hiddenField2.setAttribute("type", "hidden");
	        hiddenField2.setAttribute("name", "edit");
	        hiddenField2.setAttribute("value", "edit");
	        form.appendChild(hiddenField1);
	        form.appendChild(hiddenField2);
	        
	        document.body.appendChild(form);
	        form.submit();
	    }
        $(function () {
            $('input[name="full_solution"]').click(function () {
                location.href = 'book_detail3.html';
            })
            $('input[name="solution_edit"]').click(function () {
                location.href = 'book_detail5.html';
            })
            $('input[name="solution_toggle"]').change(function () {
                if ($(this).is(":checked")) {
                    // checkbox가 check되었을 때, 😟 표정을 가지는 <li>를 감춤
                    $("li:contains('😟')").hide();
                } else {
                    // checkbox가 uncheck되었을 때, 😟 표정을 가지는 <li>를 보여줌
                    $("li:contains('😟')").show();
                }
            });
            $('#solution_list li').click(function () {
            	count = $(this).data('count');
                currentSolution = $(this).data('solution');
                if (currentSolution != "") {
                    $('#show_answer').html(`
                        <div>
                            <span>
                                <p> 
                                <h2>미리보기: ${'${count}'}번 문제</h2>
                                </p>
                            </span>
                            <span><input type="button" class="solution_btn" name="full_solution" value="이 솔루션 보기"></span>
                        </div>
                        <div>
                        <div/>
                        <div>${'${currentSolution}'} </div>
                        </div>
                        <div><input type="button" class="solution_btn" name="solution_edit" value="내 솔루션 올리기"></div>
                    `);
                } else {
                    $('#show_answer').html(`
                        <div>
                    		<span>
                            <p><h2>미리보기: ${'${count}'}번 문제</h2></p>
                            </span>
                         </div>
                        <div>
                            <div class="solution_btn" id="solution_edit_div">
                                <p>솔루션이 없어요!<br>첫 번째 등록자가 되어보세요.</p>
                            </div>
                        </div>
                    `);
                }
            });
            $(document).on('click', 'input[name="full_solution"]', function () {
                var form = document.createElement("form");
                form.setAttribute("method", "get");
                form.setAttribute("action", "FindSolution");

                var hiddenField1 = document.createElement("input");
                hiddenField1.setAttribute("type", "hidden");
                hiddenField1.setAttribute("name", "problem_num");
                hiddenField1.setAttribute("value", count-1);
                var hiddenField2 = document.createElement("input");
                hiddenField2.setAttribute("type", "hidden");
                hiddenField2.setAttribute("name", "solution_num");
                hiddenField2.setAttribute("value", 0);
                var hiddenField3 = document.createElement("input");
                hiddenField3.setAttribute("type", "hidden");
                hiddenField3.setAttribute("name", "full");
                hiddenField3.setAttribute("value", "full");
                
                form.appendChild(hiddenField1);
    	        form.appendChild(hiddenField2);
    	        form.appendChild(hiddenField3);
    	        
                document.body.appendChild(form);
                form.submit();
            });
            $(document).on('click', 'input[name="solution_edit"]', handleEditClick);
            $(document).on('click', '#solution_edit_div', handleEditClick);
        })
    </script>
</body>

</html>