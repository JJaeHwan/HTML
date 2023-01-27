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
	text-align: center;
}
p{
	font-size : 1.5em;
	text-align: center;
}
table{
	border: 2px solid red;
	margin : 20px auto;
}
td{
	width: 200px;
	height: 50px;
	text-align: center;
}

</style>
</head>
<body>
<h1>JSP : Java Server Page</h1>
<p>서버내에서 실행되는 자바 프로그램</p>
<p>html코드와 자바코드를 같이 기술한다.</p>
<p>자바코드를 기술하기 위해서는 &lt;%	 %&gt; 기호가 필요하다.</p>
<%
	request.setCharacterEncoding("UTF-8");

	String userName = request.getParameter("name");
	String userId = request.getParameter("id");
	String userPass = request.getParameter("pass");
	String uesrMail	= request.getParameter("email");
	String uesrTel = request.getParameter("tel");
	
	//DB연결해서 CRUD처리를 수행하고 결과값을 발생
	//결과값으로 클라이언트 쪽으로 응답
	
%>
<table border="1">
	<tr>
		<td>이름</td>
		<td><%= userName%></td>
	</tr>
	<tr>
		<td>아이디</td>
		<td><%= userId%></td>
	</tr>
	<tr>
		<td>이메일</td>
		<td><%= uesrMail%></td>
	</tr>
	<tr>
		<td>전화번호</td>
		<td><%= uesrTel%></td>
	</tr>


</table>
</body>
</html>








