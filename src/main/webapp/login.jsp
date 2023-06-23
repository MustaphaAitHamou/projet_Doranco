<%@ page import="java.util.*" %>
<%@ page import="model.User" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%
    User auth = (User) request.getSession().getAttribute("auth");
    if(auth!=null){
    	response.sendRedirect("index.jsp");
    }
    %>
<!DOCTYPE html>
<html>
<head>
<title>Shopping Cart Login</title>
<%@include file="includes/head.jsp" %>
</head>
<body>
<%@include file="includes/navbar.jsp" %>

	<div class="container">
		<div class="card w-50 mx-auto my-5">
			<div class="card-header text-center">
				<div class="card-body">
					<form action ="user-login" method="post">
					
					<div class="form-group">
						<label>Adresse E-mail</label>
						<input type="email" class="form-control" name="login-email" placeholder="Entrez votre E-mail"required>
					</div>
					<div class="form-group">
						<label>Mot de passe</label>
						<input type="password" class="form-control" name="login-password" placeholder="Entrez votre mot de passe"required>
					</div>
					
					<div class="text-center">
						<button type="submit" class="btn btn-primary">Login</button>
					</div>
					</form>
				</div>
			</div>
		</div>
	</div>

<%@include file="includes/footer.jsp" %>
</html>