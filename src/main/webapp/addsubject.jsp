<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page import="com.caltech.dao.ClasseDAO"%>
<%@page import="java.util.*"%>
<%@page import="com.caltech.pojo.Classe"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link href="css/style.css" rel="stylesheet" type="text/css">
</head>
<body>

	<div class="center">
		<h1>Add Subject</h1>


		<form action="AddSubjectController.jsp">
			<label>Subject Name:</label><br> <input type="text" name="name"><br>
			<input type="submit" value="OK">
		</form>
	</div>
</body>
</html>
