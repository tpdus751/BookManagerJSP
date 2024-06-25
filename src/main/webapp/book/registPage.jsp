<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>도서 등록 페이지</title>
</head>
<body>
	<h3>도서 등록</h3>
	<form action="regist.jsp" method="post">
		<input type="text" name="name" placeholder="도서 제목 입력"><br>
		<input type="text" name="author" placeholder="저자 입력"><br>
		<input type="text" name="publisher" placeholder="출판사 입력"><br>
		<input type="text" name="price" placeholder="가격 입력"><br>
		<br>
		<input type="submit" value="도서 등록">
		<a href="main.jsp"><input type="button" value="취소"></a>
	</form>
</body>
</html>