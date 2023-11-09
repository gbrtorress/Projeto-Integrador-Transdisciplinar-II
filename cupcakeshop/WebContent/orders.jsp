<%@page import="br.com.cupcakeshop.model.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	<%
	User auth = (User) request.getSession().getAttribute("auth");
	if(auth != null) {
		request.setAttribute("auth", auth);
	}
	%>
<!DOCTYPE html>
<html>
<head>
<title>Cupcake Orders</title>
<%@include file="includes/header.jsp"%>
</head>
<body>
	<%@include file="includes/navbar.jsp"%>
	<h1>Hello Mundo</h1>



	<%@include file="includes/footer.jsp"%>
</body>
</html>