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

table{
	border: 2px solid green;
	
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

<%
	request.setCharacterEncoding("UTF-8");

  String userName = request.getParameter("name");
  String userGender = request.getParameter("gender");
  String foods [] = request.getParameterValues("food");
  
  String vfood ="";
  for(int i = 0; i < foods.length; i++){
	 vfood += foods[i] + "<br>";
  }
  String textInfo = request.getParameter("area");
  
//   System.out.println("textInfo================" + textInfo);
 	//textInfo 에는 엔터기호(\r, \n)가 포함되어 있다
  textInfo = textInfo.replaceAll("\r", "").replaceAll("\n", "<br>");
%>
<table border="1">

  <tr>
    <td>이름</td>
    <td><%= userName %></td>
  </tr>
  
  <tr>
    <td>성별</td>
    <td><%= userGender%></td>
  </tr>
  
  <tr>
    <td>좋아하는음식</td>
    <td><%= vfood %></td>
  </tr>
  
  <tr>
    <td>자기소개</td>
    <td><%= textInfo %></td>
  </tr>
  

</table>



</body>
</html>














