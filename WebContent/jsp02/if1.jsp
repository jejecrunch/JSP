<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>lecture1</title>
</head>
<body>

<%
    Date now = new Date();
    Calendar calendar = GregorianCalendar.getInstance();
    calendar.setTime(now); 
    int year = calendar.get(Calendar.YEAR);
    int month = calendar.get(Calendar.MONTH) + 1;
    // calendar.get(Calendar.MONTH) 메소드 리턴 값의 범위가 0~11 이기 때문에, +1 해주었다.
    int day = calendar.get(Calendar.DAY_OF_MONTH);
    int hour = calendar.get(Calendar.HOUR_OF_DAY);
    int minute = calendar.get(Calendar.MINUTE);
    int second = calendar.get(Calendar.SECOND);
%>
<% if (hour < 12) { %>
    Good Morning!
<% } else if (hour < 18){ %>
    Good Afternoon!
<% } else { %>
    Good Evening!    
<% } %>

<br />
지금은 <%= year %>년 <%= month %>월 <%= day %>일 <%= hour %>시 <%= minute %>분 <%= second %> 초 입니다.
<!-- 현재 시각의 연, 월, 일, 시, 분, 초를 구해 원하는 형식에 맞게 출력하는 구현 -->
</body>
</html>
