<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Topaidi</title>
<%@include file="commons/header.jsp" %>

</head>
<body>
<%@include file="commons/navbar.jsp" %>

	<div class="container">
		<div>
			<h3>Inscription</h3>
			<div class="row">
				<form class="col s12" method="POST" action="">
					<div class="row">
						<div class="input-field col s6">
						  <input id="first_name" type="text" class="validate" name="">
						  <label for="first_name">Login</label>
						</div>
					</div>
					<div class="row">
						<div class="input-field col s12">
						  <input id="password" type="password" class="validate" name="">
						  <label for="password">Mot de passe</label>
						</div>
					</div>
				      <div class="row">
				        <div class="input-field col s12">
				          <input id="email" type="email" class="validate" name="">
				          <label for="email">Email</label>
				        </div>
				      </div>
					<div>
						<input type="submit" class="waves-effect waves-light btn green" value="s'inscrire">
					</div>
				</form>
			</div>
		</div>
	</div>
</body>
</html>
