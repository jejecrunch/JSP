<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>연습문제</title>
</head>
<body>

<%
    String s1 = "hello";
    String s2 = "world";

    out.println(s1); // hello
    out.println(s2); // world
    out.println(s1 + s2); // helloworld
    out.println("s1"); // s1
    out.println("s2"); // s2
    out.println("s1" + "s2"); // s1s2
    out.println("s1 + s2"); // s1 + s2
%>
<%= s1 %> <!-- hello -->
<%= s2 %> <!-- world -->
<%= s1 + s2 %> <!-- hello world -->
<%= "s1" %> <!-- s1 -->
<%= "s2" %> <!-- s2 -->
<%= "s1" + "s2" %> <!-- s1s2 -->
<%= "s1 + s2" %> <!-- s1 + s2 -->
<br>
4 x 7 = <%= 4 * 7 %> <!-- 4 x 7 = 28 -->
4 x 8 = <%= 4 * 8 %> <!-- 4 x 8 = 32 -->
4 x 9 = <%= 4 * 9 %> <!-- 4 x 9 = 36 -->
<br>
<%
    for (int i=1; i <= 10; ++i) {
        out.print("4 x " + i);
        out.print(" = ");
        out.println(4 * i);
    }
%> <!-- 4 x 1 = 4 ~ 4 x 10 = 40 -->
<br>
<table border=1>
  <tr>
<% 
      for (int i=1; i <= 10; ++i) { 
        out.print("    ");
        out.print("<td>");
        out.print(i);
        out.println("</td>");
      }
%> <!-- 1 2 3 4 5 6 7 8 9 10이 한 줄 열 칸의 표로 -->
  </tr>
</table> 
<br>
<table border=1>
  <tr>
<% 
      for (int i=1; i <= 10; ++i) { 
        out.println("    <td>" + i + "</td>");
      }
%> <!-- 1 2 3 4 5 6 7 8 9 10이 한 줄 열 칸의 표로 -->
  </tr>
</table> 
<br>
<table border=1>
<% for (int i=0; i <= 3; ++i) { 
     out.println("  <tr>");
     for (int j=1; j <= 4; ++j) {
         out.println("    <td>" + (i * 4 + j) + "</td>");
     }
     out.println("  </tr>");
   }
%> <!-- 1 2 3 4 / 5 6 7 8 / 9 10 11 12이 세 줄 네 칸의 표로 -->
</table>


</body>
</html>