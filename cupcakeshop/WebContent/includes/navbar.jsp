<nav class="navbar navbar-expand-lg bg-body-tertiary">
	<div class="container-fluid">
			<a class="navbar-brand" href="index.jsp">Cupcakeshop</a>
			<button class="navbar-toggler" type="button"
				data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent"
				aria-controls="navbarSupportedContent" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarSupportedContent">
				<ul class="navbar-nav ml-auto">
					<li class="nav-item"><a class="nav-link active"
						aria-current="page" href="index.jsp">Home</a></li>
					<li class="nav-item"><a class="nav-link" href="cart.jsp">Cart</a></li>
					<%
					if(auth != null) {%>
					
						<li class="nav-item"><a class="nav-link " href="orders.jsp">Orders</a></li>
						<li class="nav-item"><a class="nav-link " href="log-out">Logout</a></li>
						
					<%}else {%>
						<li class="nav-item"><a class="nav-link " href="login.jsp">Login</a></li>
					<%}
					%>
					
				</ul>

			</div>
		</div>
	
</nav>