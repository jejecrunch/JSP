<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="lecture1.jdbc4.*, java.util.*, lecture1.*"%>
<%
	request.setCharacterEncoding("UTF-8");

	String 에러메시지 = null;
	User user = new User();
	int recordCount = UserDAO.count();
	String s1 = request.getParameter("id");
	int id = s1==null? 0 : Integer.parseInt(s1);
	String pg = request.getParameter("pg");
	
	if (request.getMethod().equals("GET")) {
		user.setUserid("");
		user.setName("");
		user.setDepartmentId(1);
	} else {
		user = new User();
		user.setUserid(request.getParameter("userid"));
		user.setPassword(request.getParameter("password"));
		user.setName(request.getParameter("name"));
		user.setEmail(request.getParameter("email"));
		user.setDepartmentId(Integer.parseInt(request.getParameter("departmentId")));
		user.setUserType(request.getParameter("userType"));
		boolean enabled = (request.getParameter("enabled").equals(null))? false : true;
		user.setEnabled(enabled);

		if (user.getUserid() == null || user.getUserid().length() == 0)
			에러메시지 = "아이디를 입력하세요";
		else if (user.getPassword() == null || user.getPassword().length() == 0)
			에러메시지 = "비밀번호를 입력하세요";
		else if (user.getName() == null || user.getName().length() == 0)
			에러메시지 = "이름을 입력하세요";
		else if (user.getEmail() == null || user.getEmail().length() == 0)
			에러메시지 = "이메일을 입력하세요";
		else if (user.getUserType() == null || user.getUserType().length() == 0)
			에러메시지 = "사용자 유형을 지정하세요";
		else {
			UserDAO.insert(user);
			response.sendRedirect("userList1.jsp?pg=99999");
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
				<label>아이디</label> <input type="text" class="form-control" name="userid"
					value="<%=user.getUserid()%>" />
			</div>
			<div class="form-group">
				<label>비밀번호</label> <input type="password" class="form-control" name="password" />
			</div>
			<div class="form-group">
				<label>이름</label> <input type="text" class="form-control"
					name="name" />
			</div>
			<div class="form-group">
				<label>학과</label>
					<select class="form-control" name="departmentId">
				      <% for (Department d : DepartmentDAO.findAll()) { %>
				          <% String selected = user.getDepartmentId()==d.getId() ? "selected" : ""; %>
				          <option value="<%= d.getId() %>" <%= selected %>>
				            <%= d.getDepartmentName() %>
				          </option>
				      <% } %>
				    </select>
			</div>
			<div class="form-group">
				<label>이메일</label> <input type="email" class="form-control" name="email" />
			</div>
			<div class="form-group">
				<label>사용자 유형</label>
					<select class="form-control" name="userType">
					    <option value="관리자">관리자</option>
					    <option value="교수">교수</option>
					    <option value="학생" >학생</option>
				    </select>
			</div>
			<div class="form-group">
				<label>enabled</label>
				<input type="radio" name="enabled" value="1"/> true
				<input type="radio" name="enabled" /> false
			</div>
			<button type="submit" class="btn btn-primary">
				<i class="glyphicon glyphicon-ok"></i> 저장
			</button>
			<a href="userList1.jsp?pg=<%=pg%>" class="btn btn-default">
				<i class="glyphicon glyphicon-remove"></i> 취소
			</a>
		</form>

		<hr />
		<%
			if (에러메시지 != null) {
		%>
		<div class="alert alert-danger">
			학생등록 실패:
			<%=에러메시지%>
		</div>
		<%
			}
		%>
	</div>
</body>
</html>

