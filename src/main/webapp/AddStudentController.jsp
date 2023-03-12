<%@page import="com.caltech.pojo.Student"%>
<%@page import="org.hibernate.internal.build.AllowSysOut"%>
<%@page import="java.text.SimpleDateFormat"%>

<%@page import="com.caltech.dao.StudentDAO"%>
<%@page import="com.caltech.dao.ClasseDAO"%>
<%@page import="com.caltech.pojo.Classe"%>
<%@page import="java.util.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<%
	StudentDAO dao = new StudentDAO();
		Student student = new Student();
		student.setFirstName((request.getParameter("firstName")));
		student.setLastName(((request.getParameter("lastName"))));
		student.setPhoneNumber(request.getParameter("phone"));
		student.setAddress(request.getParameter("address"));
		String dateOfBirth = request.getParameter("dateOfBirth");
		//convert string into a java date [yyyy-MM-dd]-mysql db date format
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
		Date date = dateFormat.parse(dateOfBirth);
		student.setDateOfBirth(date);
		
		Classe classe = new ClasseDAO().retrieve(Integer.parseInt(request.getParameter("classe")));
		
		student.setClasse(classe);
		
		
		int row = dao.addStudent(student);
		if (row > 0) {
			response.sendRedirect("success.jsp");
		} else {
			response.sendRedirect("fail.jsp");
		}
	%>
</body>
</html>
