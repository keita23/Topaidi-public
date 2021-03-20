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
			<h4 style="color: red;">Oops mot de passe et/ou login invalide</h4>
		</div>
		<div>
			<div style="margin-left: 22em; margin-top: 2em;">
		      	<a href="users?action=create" class="waves-effect waves-light btn-small blue" title="S'inscrire">S'inscrire</a>
		     </div>
		</div>
	</div>
</body>
</html>