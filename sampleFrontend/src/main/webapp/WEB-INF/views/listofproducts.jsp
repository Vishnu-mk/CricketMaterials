<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ include file="header.jsp"%>
    <%@ page isELIgnored="false" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<script type="text/javascript">
	$(document).ready(function() {
		var searchCondition = '${searchCondition}'
		$('.table').DataTable({
			"lengthMenu" : [ [ 5, 7, -1 ], [ 5, 7, "All" ] ],
			"oSearch" : {
				"sSearch" : searchCondition

			}

		})
	})
</script>
<style>
body {
    background-color: #f49841;
}

h1 {
    color: white;
    text-align: center;
}

p {
    font-family: verdana;
    font-size: 20px;
}
  table, th, td,tr {
    border: 1px solid black;
}  
</style>
</head>

<body>
<div class="container">
	<b>List of Products</b>
		<table class="table table-striped" border="1">
			<thead>
				<tr>
				    <th>Id</th>
				    <th>Image</th>
					<th>Product Name</th>
					<th>Price</th>
					<th>Category</th>
					<th>Action</th>
				</tr>
			</thead>
			<tbody>
			<!-- For each object in the list, tr has to be repeated -->
			<!--  items refers to the collection of objects -->
			<!-- var is local variable ,takes objects one by one from the collection -->
			<c:forEach var="p" items="${productsList}" >
				<tr>
				<td><a href="<c:url value='/all/getproduct/${p.id}'></c:url>">${p.id}</a></td>
                <td><img src="<c:url value='/resources/images/${p.id}.jpg'></c:url>" height="100px" width="100px"></td>            
                <td><a href="<c:url value='/all/getproduct/${p.id}'></c:url>">${p.productName}</a></td>
                <td>${p.price}</td>
                	<td>${p.category.categoryname }</td>
			
						<td><a
							href="<c:url value='/all/getproduct/${p.id }'></c:url>"><span
								class="glyphicon glyphicon-info-sign"></span></a> <security:authorize
								access="hasRole('ROLE_ADMIN')">
								<a href="<c:url value='/admin/deleteproduct/${p.id }'></c:url>"><span
									class="glyphicon glyphicon-trash"></span></a>
								<a href="<c:url value='/admin/getupdateform/${p.id }'></c:url>"><span
									class="glyphicon glyphicon-pencil"></span></a>
									
									
							</security:authorize></td>
				</tr>
			</c:forEach>
			</tbody>
		</table>

	</div>
</body>
</html>