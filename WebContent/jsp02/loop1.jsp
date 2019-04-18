<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<style>
    table { border-collapse: collapse; }
    td { padding: 5px; border: solid 1px gray; }
</style>

</head>
<body>

<table>
  <tr>
<% 
    for (int i=1; i <= 10; ++i) { 
        out.println("    <td>" + i + "</td>");
    }
%>
  </tr>
  <tr>
<%  for (int i=1; i <= 10; ++i) { %>
<%       out.println("    <td>" + i + "</td>"); %>
<%  } %>
  </tr> <!-- 1 2 3 4 5 6 7 8 9 10이 한 줄 열 칸의 테이블로 구현됨 -->
  <tr>
  <%  
    for (int i=1; i <= 10; ++i) { 
        out.println("i");
    }
%>
  </tr>
  <tr>
  <%  for (int i=1; i <= 10; ++i) { %>
<%       out.println("i"); %>
<%  } %>
  </tr>
  <tr>
  <%  for (int i=1; i <= 10; ++i) { %>
<%= "i" %>
<%  } %>
  </tr>
  <tr>
  <%  for (int i=1; i <= 10; ++i) { %>
   i
<%  } %>
  </tr>
  <tr>
  <%  for (int i=1; i <= 10; ++i) { %>
   <td>i</td>
<%  } %>
  </tr><!-- i i i i i i i i i i이 상수로 구현됨 -->
  <tr>
  <%  for (int i=1; i <= 10; ++i) { %>
   <%= i %>
<%  } %>
  </tr> <!-- 1 2 3 4 5 6 7 8 9 10이 상수로 구현됨 -->
  <tr>
  <%  for (int i=1; i <= 10; ++i) { %>
   <td><%= i %></td>
<%  } %>
  </tr> <!-- 1 2 3 4 5 6 7 8 9 10이 한 줄 열 칸의 테이블로 구현됨 -->
</table>

</body>
</html>