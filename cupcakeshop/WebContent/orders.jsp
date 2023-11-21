<%@page import="java.util.ArrayList"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="br.com.cupcakeshop.model.*"%>
<%@page import="br.com.cupcakeshop.Dao.*"%>
<%@page import="br.com.cupcakeshop.Dao.OrderDao"%>
<%@page import="java.util.*"%>
<%@page import="br.com.cupcakeshop.connection.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%
	DecimalFormat dcf = new DecimalFormat("#.##");
request.setAttribute("dcf", dcf);
User auth = (User) request.getSession().getAttribute("auth");
List<Order> orders = null;
if (auth != null) {
	request.setAttribute("person", auth);
	OrderDao orderDao = new OrderDao(DbCon.getConnetion());
	orders = orderDao.userOrders(auth.getId());
} else {
	response.sendRedirect("login.jsp");
}
ArrayList<Cart> cart_list = (ArrayList<Cart>) session.getAttribute("cart-list");
if (cart_list != null) {
	request.setAttribute("cart_list", cart_list);
}
%>
<!DOCTYPE html>
<html>
<head>
<%@include file="/includes/header.jsp"%>
<title>Cupcakeshop</title>
</head>
<body>
	<%@include file="/includes/navbar.jsp"%>
	<div class="container">
		<div class="card-header my-3">All Orders</div>
		<table class="table table-light">
			<thead>
				<tr>
					<th scope="col">Date</th>
					<th scope="col">Name</th>
					<th scope="col">Category</th>
					<th scope="col">Quantity</th>
					<th scope="col">Price</th>
					<th scope="col">Cancel</th>
				</tr>
			</thead>
			<tbody>

				<%
					if (orders != null) {
					for (Order o : orders) {
				%>
				<tr>
					<td><%=o.getDate()%></td>
					<td><%=o.getName()%></td>
					<td><%=o.getCategory()%></td>
					<td><%=o.getQuantity()%></td>
					<td><%=dcf.format(o.getPrice())%></td>
					<td><a class="btn btn-sm btn-danger"
						href="cancel-order?id=<%=o.getOrderId()%>">Cancel Order</a></td>
				</tr>
				<%
					}
				}
				%>

			</tbody>
		</table>

	</div>

	<div>
		<button type="button" class="btn btn-secondary">
			<a href="payment.jsp">Proximo</a>
		</button>
	</div>
	<%@include file="/includes/footer.jsp"%>
</body>
</html>