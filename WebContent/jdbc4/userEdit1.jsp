<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="lecture1.jdbc4.*, java.util.*"%>
<%
	request.setCharacterEncoding("UTF-8");

	String 에러메시지 = null;
	String s1 = request.getParameter("id");
	int id=Integer.parseInt(s1);
	User user=null;
	String pg = request.getParameter("pg");
	
	if (request.getMethod().equals("GET")) {
		user=UserDAO.findOne(id);
	} else {
		user=new User();
		user.setUserid(request.getParameter("userid"));
		user.setPassword(request.getParameter("password"));
		user.setName(request.getParameter("name"));
		user.setEmail(request.getParameter("email"));
		user.setDepartmentId(Integer.parseInt(request.getParameter("departmentId")));
		user.setUserType(request.getParameter("userType"));
		user.setEnabled(Boolean.parseBoolean(request.getParameter("enabled")));

		UserDAO.update(user);
		response.sendRedirect("userList1.jsp?pg="+pg);
	}
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
</style>
</head>
<body>

	<div class="container">

		<h1><%=user.getName() %>님의 정보 수정</h1>
		<hr />

		<form method="post">
			<div class="form-group">
				<label>아이디</label> <input type="text" class="form-control"
					name="userId" value="<%=user.getUserid()%>" />
			</div>
			<div class="form-group">
				<label>비밀번호</label> <input type="password" class="form-control"
				 name="password" />
			</div>
			<div class="form-group">
				<label>이름</label> <input type="text" class="form-control"
					name="name" value="<%=user.getName()%>" />
			</div>
			<div class="form-group">
				<label>학과</label>
				<select class="form-control" name="departmentId">
					<%	for (Department d : DepartmentDAO.findAll()) {	%>
					<%	String selected = user.getDepartmentId() == d.getId() ? "selected" : ""; %>
					<option value="<%=d.getId()%>" <%= selected %> > <%=d.getDepartmentName()%>	</option>
					<% } %>
				</select>
			</div>
			<div class="form-group">
				<label>이메일</label> <input type="email" class="form-control"
				 name="email" value="<%=user.getEmail()%>" />
			</div>
			<div class="form-group">
				<label>사용자 유형</label>
					<select class="form-control" name="userType">
					<% String admin_checked = (user.getUserType().equals("관리자")? "selected" : ""); %>
					<% String professor_checked = (user.getUserType().equals("교수")? "selected" : ""); %>
					<% String student_checked = (user.getUserType().equals("학생")? "selected" : ""); %>
					    <option value="관리자" <%= admin_checked %>>관리자</option>
					    <option value="교수" <%= professor_checked %>>교수</option>
					    <option value="학생" <%= student_checked %>>학생</option>
				    </select>
			</div>
			<div class="form-group">
				<label>enabled</label>
				<% String true_checked = (user.isEnabled()==true? "checked":""); %>
				<% String false_checked = (user.isEnabled()==false? "checked":""); %>
				<input type="radio" name="enabled" value="1" <%= true_checked %> /> true
				<input type="radio" name="enabled" value="0" <%= false_checked %> /> false
			</div>
			<button type="submit" class="btn btn-primary">
				<i class="glyphicon glyphicon-ok"></i> 저장
			</button>
			<a href="userDelete1.jsp?id=<%=id%>&pg=<%=pg%>"
				class="btn btn-default" onclick="return confirm('삭제하시겠습니까?')"> <i
				class="glyphicon glyphicon-trash"></i> 삭제
			</a>
			<a href="userList1.jsp?pg=<%=pg%>" class="btn btn-default">
				<i class="glyphicon glyphicon-remove"></i> 취소
			</a>
		</form>

		<hr />
	</div>
</body>
</html>
