<%@page import="br.com.cupcakeshop.model.Cart"%>
<%@page import="java.util.ArrayList"%>
<%@page import="br.com.cupcakeshop.model.User"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	<%
	User auth = (User) request.getSession().getAttribute("auth");
	if(auth != null) {
		
		response.sendRedirect("index.jsp");
	}
	
	ArrayList<Cart> cart_list = (ArrayList<Cart>) session.getAttribute("cart-list");
	if(cart_list != null) {
		request.setAttribute("cart_list", cart_list);
	}
	%>
<!DOCTYPE html>
<html>
<head>
<title>Cupcake Login</title>
<%@include file="includes/header.jsp"%>
</head>
<body>

	<%@include file="includes/navbar.jsp"%>
	<div class="container">
		<div class="card w-50 mx-auto my-5">
			<div class=" card-header text-center">User Login</div>
			<div class="card-body">
				<form action="user-login" method="post">

					<div class="form-group">
						<label>Email Address</label> <input type="email"
							class="form-control" name="login-email"
							placeholder="Enter Your Email" required>
					</div>

					<div class="form-group">
						<label>Password</label> <input type="password"
							class="form-control" name="login-password"
							placeholder="Enter Your Password" required>
					</div>

					<div class="text-center">
						<button type="submit" class="btn btn-primary mt-4 ">Login</button>
					</div>

				</form>
			</div>
		</div>
	</div>
	
	<div class="text-center">
	<a href="registration.jsp " class="btn btn-warning">Register HERE</a>
	</div>




	<%@include file="includes/footer.jsp"%>
</body>
</html>