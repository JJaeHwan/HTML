<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
h1{
	color : red;
}

</style>

</head>
<body>

<h1>JSP : Java Server Page</h1>
<%

	int qty = Integer.parseInt(request.getParameter("qty"));
	int price = Integer.parseInt(request.getParameter("price"));
	
	String code = request.getParameter("code");
	
	int result = qty * price;
	
%>

<h3>피카츄 키링 뽑기결과</h3>
코드  : <%= code %><br>
수량  : <%= qty %><br>
가격  : <%= price %><br>
결과  : <%= result %>

</body>
</html>