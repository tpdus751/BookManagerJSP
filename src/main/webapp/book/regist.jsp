<%@ page language="java" contentType="text/html; charset=UTF-8"
	import="book.*"
    pageEncoding="UTF-8"%>
<%
	String name = request.getParameter("name");
	String author = request.getParameter("author");
	String publisher = request.getParameter("publisher");
	String price = request.getParameter("price");
	
	// 넷 중 하나라도 null이면
	if (name == null || author == null || publisher == null || price == null) {
		response.sendRedirect("registPage.jsp"); // 다시 돌려보냄
	} else {
		BookService service = new BookService(new BookDAO());
		Book book = new Book(name, author, publisher, Integer.parseInt(price));
		if (service.regist(book)) {
			// 등록 성공하면
			response.sendRedirect("main.jsp");
		} else {
			// 등록 실패 
			response.sendRedirect("registPage");
		}
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>도서 등록</title>
</head>
<body>

</body>
</html>