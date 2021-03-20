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
			<h3>Classement Buzz</h3>
			<div style="flex-direction: row; flex-wrap: wrap;">
			   <c:forEach items="${buzzIdeasModel}" var="ideaB" varStatus="loop">
				  <div style="width: 27em;">
				    <div class="col s12 m5">
				      <div class="card">
				        <div class="card-image">
				          
				          <img src='<c:out value="${ideaB.idea.urlImage}" />' />
				          <span class="card-title" style="background-color: black;"><c:out value="${ideaB.idea.title}" /></span>
				        </div>
				        <div class="card-content">
				        	<div>
				        		<a class="btn-floating btn-large waves-effect waves-light" 
				        		style='background-color: <c:choose>
											    <c:when test="${loop.index == 0}">green</c:when>
											    <c:when test="${loop.index == 1}">orange</c:when>
											    <c:otherwise>gray</c:otherwise>
											  </c:choose>'>
				        		<i class="material-icons"><c:out value="${(loop.index + 1)}" /></i>
				        		</a> Du classement Buzz
				        	</div>
				        	  <div class="collection">
							    <a href="#!" onclick="event.preventDefault();" class="collection-item"><span style="color: white;" class="badge green"><c:out value="${ideaB.vote}" /></span>Nombre de vote (Top)</a>
							  </div>
							<p><c:out value="${ideaB.idea.description}" /></p>
				        </div>
				        <div class="card-action">
				          <ul>
				          	<li>Auteur : <c:out value="${ideaB.idea.user.name}" /></li>
				          	<li>Date : <c:out value="${ideaB.idea.subscribe}" /></li>
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