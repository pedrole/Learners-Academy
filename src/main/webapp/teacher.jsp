<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="com.caltech.pojo.Teacher"%>
<%@page import="com.caltech.dao.TeacherDAO"%>

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

		<form action="addteacher.jsp">
			<input type="submit" value="Add Teacher">
		</form>


		<table border="1" class="table">
			<tr>
				<th>ID</th>
				<th>Teacher Name</th>
				
				<th>Teacher Designation</th>
				<th>Edit</th>
				<th>Delete</th>
			</tr>
			<%
			TeacherDAO teacherDAO = new TeacherDAO();

			List<Teacher> list = teacherDAO.display();
			;
			for (Teacher t : list) {
			%>
			<tr>
				<td><%=t.getId()%></td>
					<td><%=t.getName()%></td>
				<td><%=t.getDesignation()%></td>
			

				<td><a href="editteacher.jsp?id=<%=t.getId()%>">Edit</a></td>
				<td><a href="deleteteacher.jsp?id=<%=t.getId()%>">Delete</a></td>

			</tr>
			<%
			}
			%>
		</table>
	</div>
</body>
</html>