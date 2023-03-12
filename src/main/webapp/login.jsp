<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="com.caltech.pojo.*"%>
<%@page import="com.caltech.dao.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link href="css/style.css" rel="stylesheet" type="text/css">
</head>
<body>
	<%
	UserDao userDAO = new UserDao();

	userDAO.addDefaultUser();
	%>
	<div class="center">
		<h1>Learner Academy</h1>
		<h2>Login</h2>

		<form action="LoginController.jsp">
			<label>User:</label><br> <input type="text" name="user"><br>
			<label>Password:</label><br> <input type="text" name="pwd"><br>
			<input type="submit" value="login">
		</form>
	</div>
</body>
</html>



