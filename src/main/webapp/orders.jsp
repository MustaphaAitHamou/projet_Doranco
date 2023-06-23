<%@ page import="model.dao.OrderDao"%>
<%@ page import="model.*"%>
<%@ page import="java.text.DecimalFormat"%>
<%@ page import="java.util.*"%>
<%@ page import="connection.DbCon" %>
<%@ page import="model.User" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    DecimalFormat dcf = new DecimalFormat("#.##");
    request.setAttribute("dcf", dcf);
    User auth = (User) request.getSession().getAttribute("auth");
    List<Order> orders = null;
    if(auth!=null){
    	request.setAttribute("auth", auth);
    	orders = new OrderDao(DbCon.getConnection()).userOrders(auth.getId());
    }
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">	
<title>Shopping cart login</title>
<%@include file="includes/head.jsp" %>
</head>
<body>
<%@include file="includes/navbar.jsp" %>

	<div class="container">
		<div class="card-header my-3">
			All Orders
		</div>
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
				if(order != null){
					for(Order o:orders){%>
					<tr><%= o.getDate() %></tr>
					<tr><%= o.getName() %></tr>
					<tr><%= o.getCategory() %></tr>
					<tr><%= o.getQuantity() %></tr>
					<tr><%= o.getPrice() %></tr>
					<tr><a class="btn btn-sm btn-danger" href="cancel-order?id=
						<%= o.getDate() %>">Cancel</a></tr>						
					<%}
				}
			%>
			</tbody>
		</table>
	</div>

<%@include file="includes/footer.jsp" %>
</html>