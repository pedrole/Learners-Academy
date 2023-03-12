<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="com.caltech.pojo.Subject"%>
<%@page import="com.caltech.dao.SubjectDAO"%>

<%@page import="java.util.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link href="css/style.css" rel="stylesheet" type="text/css">
</head>
<body>
	<jsp:include page="topnav.jsp" />
	<div class="center">

		<form action="addsubject.jsp">
			<input type="submit" value="Add Subject">
		</form>


		<table border="1" class="table">
			<tr>
				<th>ID</th>
				<th>Subject Name</th>
				
				<th>Edit</th>
				<th>Delete</th>
			</tr>
			<%
			SubjectDAO subjectDAO = new SubjectDAO();

			List<Subject> list = subjectDAO.display();
			;
			for (Subject s : list) {
			%>
			<tr>
				<td><%=s.getId()%></td>
				<td><%=s.getName()%></td>
			

				<td><a href="editsubject.jsp?id=<%=s.getId()%>">Edit</a></td>
				<td><a href="deletesubject.jsp?id=<%=s.getId()%>">Delete</a></td>

			</tr>
			<%
			}
			%>
		</table>
	</div>
</body>
</html>