<%@page import="br.com.cupcakeshop.model.Cart"%>
<%@page import="java.util.ArrayList"%>
<%@page import="br.com.cupcakeshop.model.User"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%
	User auth = (User) request.getSession().getAttribute("auth");
if (auth != null) {

	
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


  
    <div class="row">
  <div class="col-md-8 mb-4">
    <div class="card mb-4">
      <div class="card-header py-3">
        <h5 class="mb-0">Adress </h5>
      </div>
      <div class="card-body">
        <form>
   
          <div class="row mb-4">
            <div class="col">
              <div class="form-outline">
                <input type="text" id="form7Example1" class="form-control" />
                <label class="form-label" for="form7Example1">First name</label>
              </div>
            </div>
            <div class="col">
              <div class="form-outline">
                <input type="text" id="form7Example2" class="form-control" />
                <label class="form-label" for="form7Example2">Last name</label>
              </div>
            </div>
          </div>

    
          <!-- Text input -->
          <div class="form-outline mb-4">
            <input type="text" id="form7Example4" class="form-control" />
            <label class="form-label" for="form7Example4">Address</label>
          </div>

         

          <!-- Number input -->
          <div class="form-outline mb-4">
            <input type="number" id="form7Example6" class="form-control" />
            <label class="form-label" for="form7Example6">Phone</label>
          </div>

          <!-- Message input -->
          <div class="form-outline mb-4">
            <textarea class="form-control" id="form7Example7" rows="4"></textarea>
            <label class="form-label" for="form7Example7">Additional information</label>
          </div>

         <div class="col-12">
                    <button type="button" class="btn btn-secondary"><a href="index.jsp">Finish</a></button>
                </div>
          </div>
        </form>
      </div>
    </div>
  </div>

  
	<%@include file="/includes/footer.jsp"%>
</body>
</html>