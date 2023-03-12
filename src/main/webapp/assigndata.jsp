<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page import="com.caltech.dao.ClasseDAO"%>
<%@page import="java.util.*"%>
<%@page import="com.caltech.pojo.Classe"%>
<%@page import="com.caltech.pojo.Teacher"%>
<%@page import="com.caltech.pojo.Subject"%>
<%@page import="com.caltech.dao.TeacherDAO"%>
<%@page import="com.caltech.dao.SubjectDAO"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link href="css/style.css" rel="stylesheet" type="text/css">
</head>
<body>
	<%
	List<Teacher> teachers = new TeacherDAO().display();
	List<Subject> subjects = new SubjectDAO().display();
	%>
	<div class="center">
		<h1>Assign Teacher and Subject</h1>


		<form action="AssignController.jsp">
		<input type="Hidden" name="id" value=<%=request.getParameter("id") %>>
			 <br>
			 <label>Select Teacher:</label><br> <select
				name="teacher">
				<%
				for (Teacher t : teachers) {
				%><option value="<%=t.getId()%>">
					<%out.println(t.getName());%>
				</option>
				<%}%>
			</select><br> 
				<label>Select Subject:</label><br> <select
				name="subject">
				<%
				for (Subject s : subjects) {
				%><option value="<%=s.getId()%>">
					<%out.println(s.getName());%>
				</option>
				<%}%>
			</select><br> <input type="submit" value="OK">
		</form>
	</div>
	
	<table border="1" class="table">
			<tr>
				<th>ID</th>
				<th>Class Name</th>
				<th>Subject Name</th>
				<th>Teacher Name</th>
				<th>Action</th>
				
			</tr>
			<%
		     ClasseDAO classeDAO = new ClasseDAO();
		Classe classe =	classeDAO.retrieve(Integer.parseInt(request.getParameter("id")));
		String classeName = classe.getName();
		Set<Subject> subjectsClasse = classe.getSubjects();

			
			for (Subject s : subjectsClasse) {
			%>
			<tr>
				<td><%=s.getId()%></td>
				<td><%=classeName%></td>
				<td><%=s.getName()%></td>
				<td><%=s.getTeacher().getName()%></td>
				

				
				<td><a href="deleteSubjectClasse.jsp?subjectId=<%=s.getId()%>
				&classeId=<%=classe.getId()%>">Delete</a></td>

			</tr>
			<%
			}
			%>
		</table>
</body>
</html>
