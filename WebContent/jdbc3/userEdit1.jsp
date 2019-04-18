<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="lecture1.jdbc1.*, java.util.*"%>
<%
	request.setCharacterEncoding("UTF-8");

	String 에러메시지 = null;
	String s1 = request.getParameter("id");
	int id = Integer.parseInt(s1);
	User user = null;

	if (request.getMethod().equals("GET")) {
		user = UserDAO3.findOne(id);
	} else {
		user = new User();
		user.setUserid(request.getParameter("userid"));
		user.setName(request.getParameter("name"));
		user.setDepartmentId(Integer.parseInt(request.getParameter("departmentId")));
		user.setEmail(request.getParameter("email"));
		user.setDepartmentName(request.getParameter("departmentName"));
		user.setEnabled(Boolean.parseBoolean(request.getParameter("enabled")));

		if (user.getUserid() == null || user.getUserid().length() == 0)
			에러메시지 = "아이디를 입력하세요";
		else if (user.getName() == null || user.getName().length() == 0)
			에러메시지 = "이름을 입력하세요";
		else if (user.getEmail() == null || user.getEmail().length() == 0)
			에러메시지 = "이메일을 입력하세요";
		else {
			UserDAO3.update(user);
			response.sendRedirect("userList1.jsp");
			return;
		}
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

		<h1>사용자 등록</h1>
		<hr />

		<form method="post">
			<div class="form-group">
				<label>아이디</label> <input type="text" class="form-control"
					name="userid" value="<%=user.getUserid()%>" />
			</div>
			<div class="form-group">
				<label>이름</label> <input type="text" class="form-control"
					name="name" value="<%=user.getName()%>" />
			</div>
			<div class="form-group">
				<label>학과</label><br>
				<%
					for (Department d : DepartmentDAO.findAll()) {
				%>
				<%
					String checked = user.getDepartmentId() == d.getId() ? "checked" : "";
				%>
				<input type="radio" name="departmentId" value="<%=d.getId()%>"
					checked="<%=checked%>" />
				<%=d.getDepartmentName()%>
				<%
					}
				%>
			</div>
			<div class="form-group">
				<label>이메일</label> <input type="email" class="form-control"
					name="email" value="<%=user.getEmail()%>" />
			</div>
			<div class="form-group">
				<label>enabled</label>
				<%
					String checked2 = user.isEnabled() ? "checked" : "";
				%>
				<input type="radio" name="enabled" value="<%=user.isEnabled()%>"
					checked="<%=checked2%>" /> true <input type="radio" name="enabled"
					value="<%=user.isEnabled()%>" checked="<%=checked2%>" /> false
			</div>
			<%-- <div class="form-group">
				<label>사용자 유형</label>
				<select class="form-control" name="userType">
				<% for(User d : UserDAO.findAll()) { %>
					<option value="<%= user.getUserType() %>">
						<%= user.getUserType() %>
					</option>
				<% } %>
				</select>
			</div> --%>
			<button type="submit" class="btn btn-primary">
				<i class="glyphicon glyphicon-ok"></i> 저장
			</button>
		</form>

		<hr />
		<%
			if (에러메시지 != null) {
		%>
		<div class="alert alert-danger">
			사용자등록 실패:
			<%=에러메시지%>
		</div>
		<%
			}
		%>
	</div>
</body>
</html>
