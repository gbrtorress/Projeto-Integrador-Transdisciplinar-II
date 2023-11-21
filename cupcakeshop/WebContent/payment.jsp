<%@page import="br.com.cupcakeshop.model.Cart"%>
<%@page import="java.util.ArrayList"%>
<%@page import="br.com.cupcakeshop.model.User"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%
	User auth = (User) request.getSession().getAttribute("auth");
if (auth != null) {

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

<div class="container p-0">
        <div class="card px-4">
            <p class="h8 py-3">Payment Details</p>
            <div class="row gx-3">
                <div class="col-12">
                    <div class="d-flex flex-column">
                        <p class="text mb-1">Person Name</p>
                        <input class="form-control mb-3" type="text" placeholder="Name" value="">
                    </div>
                </div>
                <div class="col-12">
                    <div class="d-flex flex-column">
                        <p class="text mb-1">Card Number</p>
                        <input class="form-control mb-3" type="text" placeholder="1234 5678 435678">
                    </div>
                </div>
                <div class="col-6">
                    <div class="d-flex flex-column">
                        <p class="text mb-1">Expiry</p>
                        <input class="form-control mb-3" type="text" placeholder="MM/YYYY">
                    </div>
                </div>
                <div class="col-6">
                    <div class="d-flex flex-column">
                        <p class="text mb-1">CVV/CVC</p>
                        <input class="form-control mb-3 pt-2 " type="password" placeholder="***">
                    </div>
                </div>
                <div class="col-12">
                    <button type="button" class="btn btn-secondary"><a href="address.jsp">Proximo</a></button>
                </div>
            </div>
        </div>
    </div>
    
    
   

  
	<%@include file="/includes/footer.jsp"%>
</body>
</html>