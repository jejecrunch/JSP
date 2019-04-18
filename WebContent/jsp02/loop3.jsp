<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
  <tr>
<% for (int i=1; i <= 10; ++i) { %> 
    <td><%= i %></td>
<% } %>
  </tr>
</table> <!-- 1 2 3 4 5 6 7 8 9 10이 한 줄 열 칸의 테이블을 구현 -->

</body>
</html>