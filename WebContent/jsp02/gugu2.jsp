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
<tr>
<%
	for(int i=2;i<=9;i++) {
		out.print("		<td>");
		for(int j=1;j<=9;j++) {
			out.print(i + " x " + j + " = " + i*j + "<br/>");
		}
		out.println("</td>");
	}
%>
</tr>
</table>
</body>
</html>