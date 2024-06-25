<%@ page language="java" contentType="text/html; charset=UTF-8"
	import="book.*"
    pageEncoding="UTF-8"%>
<% 
	String noStr = request.getParameter("no");
	if (noStr == null) {
		response.sendRedirect("main.jsp");
	} else {
		BookService service = new BookService(new BookDAO());
		Book book = service.read(Integer.parseInt(noStr));
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>도서 상세 페이지</title>
</head>
<body>
	<h3>도서 상세 정보</h3>
		<% if (book == null) { %>
			<p>해당 도서 정보가 없습니다.</p>
		<% } else { %>
			<ul>
				<li>도서 번호 : <%= book.getNo() %></li>
				<li>도서 제목 : <%= book.getName() %></li>
				<li>저자 : <%= book.getAuthor() %></li>
				<li>출판사 : <%= book.getPublisher() %></li>
				<li>가격 : <%= book.getPrice() %></li>
			</ul>
			<br>
			<a href="modifyPage.jsp?no=<%= book.getNo() %>"><button>도서 정보 수정</button></a>
			<a href="removePage.jsp?no=<%= book.getNo() %>"><button>도서 삭제</button></a>
			<a href="main.jsp"><button>돌아가기</button></a>
		<% } %>
</body>
</html>
<% } %>