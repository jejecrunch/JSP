<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%  for (int i=1; i <= 10; ++i) { %>
     4 * i = 4 * i
<%  } %>
<!-- 4 * i = 4 * i가 10번 출력됨 -->
<br>
<%  for (int i=1; i <= 10; ++i) { %>
     <%= 4 * i %> = <%= 4 * i %>
<%  } %>
<!-- 4 = 4 부터 40 = 40까지 출력됨 -->
<br>
<%  for (int i=1; i <= 10; ++i) { %>
     <%= 4 %> * <%= i %> = <%= 4 * i %>
<%  } %>
<!-- 4 * 1 = 4 부터 4 * 10 = 40까지 출력됨 -->
<br>
<table border=1>
<tr>
<%  for (int i=1; i <= 10; ++i) { %>
     <td>4 * <%= i %> = <%= 4 * i %></td>
<%  } %>
</tr>
</table>
<!-- 4 * 1 = 4부터 4 * 10 = 40까지 한 줄 열 칸의 테이블로 출력됨 -->
<br>
<table border=1>
<td>
<%  for (int i=1; i <= 10; ++i) { %>
     4 * <%= i %> = <%= 4 * i %><br />
<%  } %>
</td>
</table>
<!-- 4 * 1 = 4부터 4 * 10 = 40까지 한 줄 한 칸의 테이블로 한 줄 씩 출력됨 -->
</body>
</html>