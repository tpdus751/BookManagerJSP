<%@ page language="java" contentType="text/html; charset=UTF-8"
	import="book.*"
	import="java.util.List"
    pageEncoding="UTF-8"%>
<% 
	BookService service = new BookService(new BookDAO());
	List<Book> bookList = service.listAll();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>도서 관리 메인 페이지</h1>
	<a href="registPage.jsp"><button>도서 등록</button></a>
	<br>
	<h3>도서 목록</h3>
	<% if (bookList.size() == 0) { %>
	<p>등록되어 있는 도서가 없습니다.</p>
	<% } else { %>
	<table>
		<tr><th>도서번호</th><th>도서이름</th><th>저자</th><th>출판사</th><th>가격</th>
		<% for (Book b : bookList) { %>
			<tr>
				<td><%= b.getNo() %></td>
				<td><a href="detailPage.jsp?no=<%= b.getNo() %>"><%= b.getName() %></a></td>
				<td><%= b.getAuthor() %></td>
				<td><%= b.getPublisher() %></td>
				<td><%= b.getPrice() %></td>
			</tr>	
		<% } %>
	</table>
	<% } %>
</body>
</html>