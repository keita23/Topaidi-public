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
			<div>
				<h3 style="color: orange;"><c:out value="${message}"/></h3>
			</div>
			<h3>Liste des utilisateurs</h3>
			<div>
		      <table class="highlight" style="width: 35em;">
		        <thead>
		          <tr>
		              <th>N°</th>
		              <th>Nom</th>
		          </tr>
		        </thead>
		
		        <tbody>
			    <c:forEach items="${users}" var="user" varStatus="loop">
			      <tr>
		      		<td><c:out value="${(loop.index + 1)}" /></td>
		          	<td><c:out value="${user.name}" /></td>
			      </tr>
			    </c:forEach>
		        </tbody>
		      </table>
		      <div style="margin-left: 22em; margin-top: 2em;">
		      	<a href="users?action=create" class="btn-floating btn-large waves-effect waves-light red" title="S'inscrire"><i class="material-icons">+</i></a>
		      </div>
			</div>	
		</div>
	</div>
</body>
</html>