<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>lecture1</title>
<style>
    table { border-collapse: collapse; }
    td { padding: 5px; border: solid 1px gray; }
</style>
</head>
<body>

<table>
  <% for (int i=0; i <= 3; ++i) { %>
    <tr>  
    <% for (int j=1; j <= 4; ++j) { %>
        <td><%= i * 4 + j %></td>
    <% } %>
    </tr>
  <% } %>
  
  <% 
for (int i=0; i <= 3; ++i) { 
    out.println("<tr>");
    for (int j=1; j <= 4; ++j) {
        out.print("<td>");
        out.print( i * 4 + j );
        out.println("</td>");
    }
    out.println("</tr>");
}
%>
  
</table> <!-- 1 2 3 4 / 5 6 7 8 / 9 10 11 12가 세 줄 네 칸의 테이블로 구현됨 -->

</body>
</html>
