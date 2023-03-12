<%@page import="com.caltech.pojo.Student"%>
<%@page import="org.hibernate.internal.build.AllowSysOut"%>
<%@page import="java.text.SimpleDateFormat"%>

<%@page import="com.caltech.dao.SubjectDAO"%>

<%@page import="com.caltech.pojo.Subject"%>
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
	SubjectDAO dao = new SubjectDAO();
		Subject subject = new Subject();
		subject.setName(request.getParameter("name"));
		
		
		int row = dao.addSubject(subject);
		if (row > 0) {
			response.sendRedirect("successAddSubject.jsp");
		} else {
			response.sendRedirect("fail.jsp");
		}
	%>
</body>
</html>
