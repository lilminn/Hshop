<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Document</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>

</head>
<body>
	<div class="container">
		<br>
		<table class="table table-light table-hover ">
			<thead class="thead-dark">
				<tr>
					<th scope="col"><a
						class="text-decoration-none text-dark-emphasis">Year</a></th>
					<th scope="col"><a
						class="text-decoration-none text-dark-emphasis">Month</a></th>
					<th scope="col"><a
						class="text-decoration-none text-dark-emphasis">Price</a></th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${stats}" var="item">
					<tr>
						<th scope="row">${item.year}</th>
						<td>${item.month}</td>
						<td>${item.totalAmount}</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
</body>
</html>