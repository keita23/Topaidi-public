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
			<h3>Connexion</h3>
			<div class="row">
				<form class="col s12" method="POST" action="j_security_check">
					<div class="row">
						<div class="input-field col s6">
						  <input placeholder="Login" id="first_name" type="text" class="validate" name="j_username">
						</div>
					</div>
					<div class="row">
						<div class="input-field col s12">
						  <input placeholder="Mot de passe" id="password" type="password" class="validate" name="j_password">
						</div>
					</div>
					<div>
						<input type="submit" class="waves-effect waves-light btn green" value="se connecter">
					</div>
				</form>
			</div>
		</div>
	</div>
	
</body>
</html>
