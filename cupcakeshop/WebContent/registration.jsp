<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="br.com.cupcakeshop.model.*"%>
<%@page import="br.com.cupcakeshop.connection.DbCon"%>
<%@page import="br.com.cupcakeshop.Dao.ProductDao"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%

User auth = (User) request.getSession().getAttribute("auth");
if(auth != null) {
	
	response.sendRedirect("index.jsp");
}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Registration Cupcakeshop</title>
<%@include file="includes/header.jsp"%>
</head>
<body>
	<%@include file="includes/navbar.jsp"%>
	<div class="container">
		<div class="card w-50 mx-auto my-5">
			<div class=" card-header text-center">Register User</div>
			<div class="card-body">
			
			
			
			
				<form action="register" method="post">



					<div class="form-group">
						<label>Name</label> <input type="text" class="form-control"
							name="name" placeholder="Enter Your Name" required>
					</div>

					<div class="form-group">
						<label>Email Address</label> <input type="email"
							class="form-control" name="email"
							placeholder="Enter Your Email" required>
					</div>

					<div class="form-group">
						<label>Password</label> <input type="password"
							class="form-control" name="password"
							placeholder="Enter Your Password" required>
					</div>

					<div class="text-center">
						<button type="submit" class="btn bt-dark">Register</button>
						<a href="login.jsp">Already have an account?</a>
					</div>

				</form>
			</div>
		</div>
	</div>

	<%@include file="includes/footer.jsp"%>
</body>
</html>