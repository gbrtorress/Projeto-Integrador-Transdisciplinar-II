<%@page import="br.com.cupcakeshop.model.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%
	User auth = (User) request.getSession().getAttribute("auth");
if (auth != null) {
	request.setAttribute("auth", auth);
}
%>
<!DOCTYPE html>
<html>
<head>
<title>Cupcake Cart</title>
<%@include file="includes/header.jsp"%>
<style type= "text/css">
.table tbody td{
vertical-align: middle;
}
.btn-incre, .btn-decre{
box-shadow:none;
font-size: 25px;
}

</style>
</head>
<body>

	<%@include file="includes/navbar.jsp"%>
	<div class="container">
		<div class=" d-flex py-3">
			<h3>Total Price : $545</h3>
			<a class=" mx-3 btn btn-dark " href="#">Check Outs</a>
		</div>
		<table class="table table-light">
			<thead>
				<tr>
					<th scope="col">Name</th>
					<th scope="col">Category</th>
					<th scope="col">Price</th>
					<th scope="col">Buy Now</th>
					<th scope="col">Cancel</th>

				</tr>
			</thead>
			<tbody>
				<tr>
					<td>Cupcake Morango</td>
					<td>Cupcake</td>
					<td>5$</td>
					<td>
						<form action="" method="post" class="form-inline">
							<input type="hidden" name="id" value="1" clas="form-input">
							<div class="form-group d-flex justify-content-between">
								<a class="btn btn-sm btn-decre" href=""><i
									class="fas fa-minus-square"></i></a> <input type="text"
									name="quantity" value="1" clas="form-control"> <a
									class="btn btn-sm btn-incre" href=""><i
									class="fas fa-plus-square"></i></a>
							</div>

						</form>
					</td>
					<td><a href="" class="btn btn-sm btn-danger">Remove</a></td>
				</tr>
			</tbody>
		</table>
	</div>


	<%@include file="includes/footer.jsp"%>
</body>
</html>