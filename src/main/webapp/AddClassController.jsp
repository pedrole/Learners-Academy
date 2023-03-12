<%@page import="com.caltech.pojo.Classe"%>
<%@page import="org.hibernate.internal.build.AllowSysOut"%>
<%@page import="java.text.SimpleDateFormat"%>

<%@page import="com.caltech.dao.ClasseDAO"%>
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
	ClasseDAO dao = new ClasseDAO();
		Classe classe = new Classe();
		classe.setName(request.getParameter("name"));
		
		
		int row = dao.addClasse(classe);
		if (row > 0) {
			response.sendRedirect("success.jsp");
		} else {
			response.sendRedirect("fail.jsp");
		}
	%>
</body>
</html>
