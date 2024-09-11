<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="config.jsp" %>

<%
if (request.getParameter("log_out") != null) { 
	session.invalidate(); // new_logout.jsp로 이동
	response.sendRedirect("new_logout.jsp");
	return;
}
// 위 if 구문을 통해 세션 만료시켜 로그아웃 상태로 함.

String username = (String) session.getAttribute("username");
// 세션에 저장되어 있는 username 정보를 가져옴
%>

<div class="heading">
  <header>
    <span><a href="<%= mainURL %>"><p>
        <h1>Solution Wiki</h1>
        <h3>for all students</h3>
    </p></a></span>
    <span>
        <span id="rank"><a href="<%= rankingURL %>">Ranking</a></span>
        <span id="request"><a href="<%= requestURL %>">Request</a></span>
        <span id="log_in"><a href="<%= myPageURL %>"><%= (username != null) ? username : "Need Log in" %></a>            
        	<input type="button" name="log_out" value="로그아웃"  onclick="window.location.href='<%= guestURL %>'">
        </span>
    </span>
  </header>
</div>
