<%@page import="com.caltech.pojo.Teacher"%>
<%@page import="org.hibernate.internal.build.AllowSysOut"%>
<%@page import="java.text.SimpleDateFormat"%>

<%@page import="com.caltech.dao.TeacherDAO"%>
<%@page import="com.caltech.dao.ClasseDAO"%>
<%@page import="com.caltech.dao.SubjectDAO"%>
<%@page import="com.caltech.pojo.Subject"%>
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
	String classeId = request.getParameter("id");
	ClasseDAO classeDAO = new ClasseDAO();
	SubjectDAO subjectDAO = new SubjectDAO();
	TeacherDAO teacherDAO = new TeacherDAO();
	Classe classe = classeDAO.retrieve(Integer.parseInt(request.getParameter("id")));
	Subject subject = subjectDAO.retrieve(Integer.parseInt(request.getParameter("subject")));
	Teacher teacher = teacherDAO.retrieve(Integer.parseInt(request.getParameter("teacher")));
	subject.setTeacher(teacher);
	//subjectDAO.editSubject(subject);

	Set<Subject> subjects = classe.getSubjects();
	
	
	subjects.add(subject);
	
	String result = classeDAO.editClasse(classe);
	if (result.equals("updated")) {
		response.sendRedirect("assigndata.jsp?id=" + classeId);
	} else {
		response.sendRedirect("fail.jsp");
	}
	%>
</body>
</html>
