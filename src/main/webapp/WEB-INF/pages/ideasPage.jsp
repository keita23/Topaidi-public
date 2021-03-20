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
     <div style="position: fixed; left: 0px; z-index: 999; margin-top: 2em;">
     	
     	<a href="ideas?action=create" class="waves-effect waves-light btn-small red" 
     		title="Ajouter une idée"><i class="material-icons">+</i></a>
     </div>
	<div class="container">
		<div>
			<div>
				<h3 style="color: orange;"><c:out value="${message}"/></h3>
			</div>
			<h3>Liste de toutes les idées</h3>
			<div style="flex-direction: row; flex-wrap: wrap;">
			   <c:forEach items="${ideas}" var="idea" varStatus="loop">
				  <div style="width: 27em;">
				    <div class="col s12 m5">
				      <div class="card">
				        <div class="card-image">
				          <img src='<c:out value="${idea.urlImage}" />' />
				          <span class="card-title" style="background-color: black;"><c:out value="${idea.title}" /></span>
				        </div>
				        <div class="card-content">
				        	<div>
								<a href='ideas?action=add&note=Top&id=<c:out value="${idea.id}"/>' class="waves-effect waves-light btn-small green">Top</a>
				        		
								<a href='ideas?action=add&note=Flop&id=<c:out value="${idea.id}"/>' class="waves-effect waves-light btn-small red">Flop</a>
				        	</div>
				        	<div>
				        		<p><c:out value="${idea.description}" /></p>
				        	</div>
				        </div>
				        <div class="card-action">
				          <ul>
				          	<li>Auteur : <c:out value="${idea.user.name}" /></li>
				          	<li>Date : <c:out value="${idea.subscribe}" /></li>
				          </ul>
				        </div>
				      </div>
				    </div>
				  </div>
				</c:forEach>
			</div>	
		</div>
	</div>
</body>
</html>