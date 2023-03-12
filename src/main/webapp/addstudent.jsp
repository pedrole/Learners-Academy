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
	<%
	List<Classe> classes = new ClasseDAO().display();
	%>
	<div class="center">
		<h1>Add Student</h1>


		<form action="AddStudentController.jsp">
			<label>Student First Name:</label><br> <input type="text"
				name="firstName"><br> <label>Student Last Name:</label><br>
			<input type="text" name="lastName"><br> <label>Student
				Phone:</label><br> <input type="text" name="phone"><br> <label>Student
				Address:</label><br> <input type="text" name="address"><br>
			<label>Student DOB:</label><br> <input type="date"
				name="dateOfBirth"> <br>
				<label>Select class:</label><br> <select
				name="classe">
				<%
				for (Classe c : classes) {
				%><option value="<%=c.getId()%>">
					<%out.println(c.getName());%>
				</option>
				<%}%>
			</select><br> <input type="submit" value="OK">
		</form>
	</div>
</body>
</html>
