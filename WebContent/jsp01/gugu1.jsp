<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<table border=1>
<% for (int i=1; i <= 9; ++i) { 
     out.println("  <tr>");
     for (int j=2; j <= 9; ++j) {
         out.println("    <td>" + j + " x " + i + " = " + i*j + "</td>");
     }
     out.println("  </tr>");
   }
%>
</table>
</body>
</html>