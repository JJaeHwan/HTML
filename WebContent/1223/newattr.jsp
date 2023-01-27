<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%

	String sid = request.getParameter("id");
	String spass = request.getParameter("pass");
	String stel = request.getParameter("tel");
// 	out.print();

%>
<table>
<tr>

<td>아이디</td>
<td><%= sid %></td>

</tr>

<tr>

<td>전화번호</td>
<td><%= stel %></td>

</tr>

</table>


</body>
</html>