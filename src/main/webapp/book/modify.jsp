<%@ page language="java" contentType="text/html; charset=UTF-8"
	import="book.*"
    pageEncoding="UTF-8"%>
<% 
	String noStr = request.getParameter("no");
	String name = request.getParameter("name");
	String old_price = request.getParameter("old_price");
	String new_price = request.getParameter("new_price");
	
	if (noStr == null) {
		response.sendRedirect("main.jsp");
	}
	// 넷 중 하나라도 null이면
	else if (name == null || new_price == null) {
		response.sendRedirect("modifyPage.jsp?no=" + noStr); // 다시 돌려보냄
	} else {
		BookService service = new BookService(new BookDAO());
		Book book = new Book(name, null, null, Integer.parseInt(new_price));
		book.setNo(Integer.parseInt(noStr));
		if (service.edit(book, Integer.parseInt(old_price))) {
			response.sendRedirect("main.jsp");
		} else {
			response.sendRedirect("modifyPage.jsp?no=" + noStr);
		}
	}
%>