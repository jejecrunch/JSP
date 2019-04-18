<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="lecture1.form02.*"%>
<%
Student std = (Student)session.getAttribute("student");
%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<style>
body {
	font-family: 굴림체;
}

input.form-control, select.form-control {
	width: 200px;
}
table.table { width: 500px; }
  thead tr { background-color: #eee; }  
</style>
</head>
<body>
<h3>학생등록 성공</h3>
<table class="table table-bordered">
      <tbody>
        <tr>
          <td>ID</td>
          <td><%= std.getId() %></td>
        </tr>
        <tr>
          <td>학번</td>
          <td><%= std.getStudentNumber() %></td>
        </tr>
        <tr>
          <td>이름</td>
          <td><%= std.getName() %></td>
        </tr>
        <tr>
        	<td>학과ID</td>
        	<td><%= std.getDepartmentId() %></td>
        </tr>
        <tr>
        	<td>학년</td>
        	<td><%= std.getYear() %></td>
        </tr>
      </tbody>
    </table>
</body>
</html>