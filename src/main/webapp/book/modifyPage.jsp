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
<title>도서 정보 수정 페이지</title>
</head>
<body>
	<h3>도서 정보 수정</h3>
	<form action="modify.jsp" method="post">
		<input type="hidden" name="no" value="<%= book.getNo() %>">
		<input type="text" name="name" value="" placeholder="도서 제목 입력"><br>
		<input type="text" name="old_price" value="" placeholder="기존 도서 가격 입력"><br>
		<input type="text" name="new_price" value="" placeholder="바꿀 도서 가격 입력"><br>
		<br>
		<input type="submit" value="가격 수정">
		<a href="detailPage.jsp?no=<%= book.getNo() %>"><input type="button" value="취소"></a>
	</form>
</body>
</html>
	<% } 
	} %>