<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.Date, java.text.SimpleDateFormat" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<style>
  input.form-control { width: 200px; }
  select.form-control { width: 70px; }
  table.table { width: 500px; }
  thead tr { background-color: #eee; }
</style>
</head>
<body>
<%
String select = request.getParameter("select");
String r1 = request.getParameter("select");
String one_checked = "one".equals(r1) ? "checked" : "";
String two_checked = "two".equals(r1) ? "checked" : "";
String three_checked = "three".equals(r1) ? "checked" : "";
%>
<form>
	<div class="form-group">
        <label>select1:</label> 
        <select name="select" class="form-control">
        <option value="one" <%= "one".equals(select) ? "selected" : "" %>>one</option>
        <option value="two" <%= "two".equals(select) ? "selected" : "" %>>two</option>
        <option value="three" <%= "three".equals(select) ? "selected" : "" %>>three</option>
        </select>
      </div>
      <div class="form-group">
        <label><input type="radio" name="radio" value="one" <%= one_checked %> />one</label>
        <label><input type="radio" name="radio" value="two" <%= two_checked %> />two</label>
        <label><input type="radio" name="radio" value="three" <%= three_checked %> />three</label>
      </div>
      <div class="form-group">
      <input type="text" value="<%= select %>"/>
      </div>
      <div class="form-group">
      <input type="submit" class="btn btn-primary" name="cmd" value="확인">
      </div>
      </form>
</body>
</html>