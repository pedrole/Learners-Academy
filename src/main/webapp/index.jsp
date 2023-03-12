<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="com.caltech.dbconfig.Main"%>
<%@page import="com.caltech.dao.ClasseDAO"%>
<%@page import="com.caltech.pojo.Classe"%>
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

		<form action="addclass.jsp">
			<input type="submit" value="Add Class">
		</form>


		<table border="1">
			<tr>
				<th>ID</th>
				<th>Class Name</th>
				<th>Assign subject and teacher</th>
				<th>Edit</th>
				<th>Delete</th>
				<th>View subjects, Teacher & Students</th>
			</tr>
			<%
			ClasseDAO classeDAO = new ClasseDAO();

			List<Classe> list = classeDAO.display();
			;
			for (Classe c : list) {
			%>
			<tr>
				<td><%=c.getId()%></td>
				<td><%=c.getName()%></td>
				<td><a href="assigndata.jsp?id=<%=c.getId()%>">subject and
						teacher</a></td>
				<td><a href="editclasse.jsp?id=<%=c.getId()%>">Edit Classe</a></td>
				<td><a href="deleteclasse.jsp?id=<%=c.getId()%>">Delete</a></td>
				<td><a href="viewassigned.jsp?id=<%=c.getId()%>">View
						Report</a></td>
			</tr>
			<%
			}
			%>
		</table>
	</div>
</body>
</html>