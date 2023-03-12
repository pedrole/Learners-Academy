<%@page import="com.caltech.pojo.Student"%>
<%@page import="org.hibernate.internal.build.AllowSysOut"%>
<%@page import="java.text.SimpleDateFormat"%>

<%@page import="com.caltech.dao.TeacherDAO"%>

<%@page import="com.caltech.pojo.Teacher"%>
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
	TeacherDAO dao = new TeacherDAO();
		Teacher teacher = new Teacher();
		teacher.setName(request.getParameter("name"));
		teacher.setDesignation(request.getParameter("designation"));
		
		
		int row = dao.addTeacher(teacher);
		if (row > 0) {
			response.sendRedirect("successAddTeacher.jsp");
		} else {
			response.sendRedirect("fail.jsp");
		}
	%>
</body>
</html>
