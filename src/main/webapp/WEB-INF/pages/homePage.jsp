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
			<h3>Classement Tops</h3>
			<div style="flex-direction: row; flex-wrap: wrap;">
			   <c:forEach items="${ideasModel}" var="ideaM" varStatus="loop">
				  <div style="width: 27em;">
				    <div class="col s12 m5">
				      <div class="card">
				        <div class="card-image">
				          
				          <img src='<c:out value="${ideaM.idea.urlImage}" />' />
				          <span class="card-title" style="background-color: black;"><c:out value="${ideaM.idea.title}" /></span>
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
				        		</a> Du classement Tops
				        	</div>
				        	  <div class="collection">
							    <a href="#!" onclick="event.preventDefault();" class="collection-item"><span style="color: white;" class="badge blue"><c:out value="${ideaM.percent}" /> %</span>Pourcentage de vote</a>
							    <a href="#!" onclick="event.preventDefault();" class="collection-item"><span style="color: white;" class="badge green"><c:out value="${ideaM.voteTotal}" /></span>Nombre de vote (Top)</a>
							  </div>
							<p><c:out value="${ideaM.idea.description}" /></p>
				        </div>
				        <div class="card-action">
				          <ul>
				          	<li>Auteur : <c:out value="${ideaM.idea.user.name}" /></li>
				          	<li>Date : <c:out value="${ideaM.idea.subscribe}" /></li>
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