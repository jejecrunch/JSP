<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>구현실습2</title>
</head>
<body>
<table border=1>
<% for(int i=0;i<=1;i++){%>
	<tr>
	<%for(int j=2;j<=5;j++) {%>
	<td>
	<% for(int k=1;k<=9;k++) { %>
	<%=(i*4+j) + " x " + k +" = " + (i*4+j)*k +"<br/>" %>
	<% } %>
	</td>
	<% } %>
	</tr>
<%}%>



 <%-- <tr>
<% for(int i=2;i<=5;i++) { %>
<td>
		<% for(int j=1;j<=9;j++) { %>
			<% out.print(i + " x " + j + " = " + i*j + "<br/>"); %>
		<% } %>
		</td>
	<% } %>
</tr>
<tr>
<% for(int i=6;i<=9;i++) { %>
		<td>
		<% for(int j=1;j<=9;j++) { %>
			<% out.print(i + " x " + j + " = " + i*j + "<br/>"); %>
		<% } %>
		</td>
	<% } %>
	</tr> --%>
</table>
</body>
</html>