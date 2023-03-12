<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="com.caltech.pojo.Student"%>
<%@page import="com.caltech.dao.StudentDAO"%>

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

		<form action="addstudent.jsp">
			<input type="submit" value="Add Student">
		</form>


		<table border="1" class="table">
			<tr>
				<th>ID</th>
				<th>First Name</th>
				<th>Last Name</th>
				<th>Address</th>
				<th>Phone Number</th>
				<th>Class</th>
				<th>Edit</th>
				<th>Delete</th>
			</tr>
			<%
			StudentDAO studentDAO = new StudentDAO();

			List<Student> list = studentDAO.display();
			;
			for (Student s : list) {
			%>
			<tr>
				<td><%=s.getId()%></td>
				<td><%=s.getFirstName()%></td>
				<td><%=s.getLastName()%></td>
				<td><%=s.getAddress()%></td>
				<td><%=s.getPhoneNumber()%></td>
				<td><%=s.getClasse().getName()%></td>

				<td><a href="editstudent.jsp?id=<%=s.getId()%>">Edit</a></td>
				<td><a href="deletestudent.jsp?id=<%=s.getId()%>">Delete</a></td>

			</tr>
			<%
			}
			%>
		</table>
	</div>
</body>
</html>