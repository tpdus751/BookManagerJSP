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
		if (book == null) {
			response.sendRedirect("main.jsp");
		} else {
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>도서 삭제</title>
	
</head>
<body>
	<h3>도서 삭제</h3>
	<ul>
		<li>도서 번호 : <%=book.getNo()%></li>
		<li>도서 제목 : <%=book.getName()%></li>
		<li>저자 : <%=book.getAuthor()%></li>
		<li>출판사 : <%=book.getPublisher()%></li>
		<li>가격 : <%=book.getPrice()%></li>
	</ul>
	<br>
	<a href="remove.jsp?no=<%=book.getNo()%>"><button>삭제</button></a>
	<a href="detailPage.jsp?no=<%=book.getNo()%>"><button>취소</button></a>
</body>
</html>
	<% }
	} %>