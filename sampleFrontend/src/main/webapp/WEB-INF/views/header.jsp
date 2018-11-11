<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="security"
	uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

<!-- Latest compiled JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<style>
	.topnav{
		background-color:#ad8b65;
		overflow:hidden;
		width:100%;
		height:70px;
		font-size:20px;
		text-align:center;
	}
	.topnav a
	{
		float:top;
		color:#333;
		text-align:center;
		margin:10px;
		text-decoration:none;
		padding:center

	}
	.topnav a:hover
	{
		background-color:darkpink;
	}
</style>
	
</head>
<body>
	<!-- <div class="topnav">
	<br>
	<a class="active" href="#">Home</a>
	<a href="#">AboutUs</a>
	<a href="#">SignIn</a>
	</div>

 -->
 
	<div class="container">
		<nav class="navbar navbar-inverse">
		<div class="container-fluid">
			<div class="navbar-header">
				<a href="" class="navbar-brand"><img src="resources/images/cp1.jpg"
					alt="NIIT" height="40px" width="70px"></a>
			<button type="button" class="navbar-toggle collapsed" 
   data-toggle="collapse" data-target="#navbardemo" aria-expanded="false">
        <span class="sr-only">Toggle navigation</span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
      </button>
			</div>
			<div class="collapse navbar-collapse" id="navbardemo">
			<ul class="nav navbar-nav">
				<li><a href="<c:url value='/home'></c:url>">Home</a></li>
				<li><a href="<c:url value='/about'></c:url>">About Us</a></li>
				<li><a href="<c:url value='/all/getallproducts'></c:url>">Browse
						all products</a>
				<li>
				<li class="dropdown"><a href="#" class="dropdown-toggle"
					data-toggle="dropdown">Select By Category<span class="caret"></span></a>


					<ul class="dropdown-menu">
						<c:forEach items="${categories }" var="category">
							<li><a
								href="<c:url value='/all/searchByCategory?searchCondition=${category.categoryname }'></c:url>">${category.categoryname }</a></li>
						</c:forEach>
						<li><a
							href="<c:url value='/all/searchByCategory?searchCondition=All'></c:url>">All</a>
						</li>
					</ul></li>
				<security:authorize access="hasRole('ROLE_ADMIN')">
					<li><a href="<c:url value='/admin/getproductform'></c:url>">Add
							Product</a></li>
					<%--  <li><a
						href="<c:url value="/admin/getupdateform/{id}"></c:url>">Edit
							Product</a></li>  --%>

 <li><a
						href="<c:url value='/all/getallproducts'></c:url>">Edit
							Product</a></li> 


					<li><a
						href="<c:url value='/category'></c:url>">Add and Edit
							Category</a></li>
							
							
				</security:authorize>

				<security:authorize access="hasRole('ROLE_USER')">
					<li><a href="<c:url value='/cart/getcart'></c:url>"><span
							class="glyphicon glyphicon-shopping-cart"></span></a></li>
				</security:authorize>
				
<li><a href="<c:url value='/contact'></c:url>">Contact us</a></li>
				<c:if test="${pageContext.request.userPrincipal.name==null }">
					<li><a href="<c:url value='/all/registrationform'></c:url>">Sign
							Up</a></li>
					<li><a href="<c:url value='/login'></c:url>">Sign In</a></li>
				</c:if>
				<c:if test="${pageContext.request.userPrincipal.name!=null }">
					<li><a href="#">Welcome
							${pageContext.request.userPrincipal.name }</a></li>
					<li><a
						href="<c:url value='/j_spring_security_logout'></c:url>">Sign
							out</a></li>
				</c:if>

			</ul>
		</div>

		</nav>
	</div>

</body>


</body>
</html>