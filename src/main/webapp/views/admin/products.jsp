<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/common/user/taglib.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Product Page - Admin HTML Template</title>
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Roboto:400,700" />
<!-- https://fonts.google.com/specimen/Roboto -->
<link rel="stylesheet" href="/templates/admin/css/fontawesome.min.css" />
<!-- https://fontawesome.com/ -->
<link rel="stylesheet" href="/templates/admin/css/bootstrap.min.css" />
<!-- https://getbootstrap.com/ -->
<link rel="stylesheet" href="/templates/admin/css/templatemo-style.css">
<!--
	Product Admin CSS Template
	https://templatemo.com/tm-524-product-admin
	-->
</head>
<body id="reportsPage">
	<nav class="navbar navbar-expand-xl">
		<div class="container h-100">
			<a class="navbar-brand" href="/admin">
				<h1 class="tm-site-title mb-0">Product Admin</h1>
			</a>
			<button class="navbar-toggler ml-auto mr-0" type="button"
				data-toggle="collapse" data-target="#navbarSupportedContent"
				aria-controls="navbarSupportedContent" aria-expanded="false"
				aria-label="Toggle navigation">
				<i class="fas fa-bars tm-nav-icon"></i>
			</button>

			<div class="collapse navbar-collapse" id="navbarSupportedContent">
				<ul class="navbar-nav mx-auto h-100">
					<li class="nav-item"><a class="nav-link " href="/admin"> <i
							class="fas fa-tachometer-alt"></i> Users Management <span
							class="sr-only">(current)</span>
					</a></li>
					<li class="nav-item"><a class="nav-link"
						href="/admin/statistical"> <i class="fas fa-tachometer-alt"></i>
							Statistical <span class="sr-only">(current)</span>
					</a></li>
					<li class="nav-item dropdown"><a
						class="nav-link dropdown-toggle" href="#" id="navbarDropdown"
						role="button" data-toggle="dropdown" aria-haspopup="true"
						aria-expanded="false"> <i class="far fa-file-alt"></i> <span>
								Reports <i class="fas fa-angle-down"></i>
						</span>
					</a>
						<div class="dropdown-menu" aria-labelledby="navbarDropdown">
							<a class="dropdown-item" href="#">Daily Report</a> <a
								class="dropdown-item" href="#">Weekly Report</a> <a
								class="dropdown-item" href="#">Yearly Report</a>
						</div></li>
					<li class="nav-item"><a class="nav-link active"
						href="/admin/product"> <i class="fas fa-shopping-cart"></i>
							Products
					</a></li>


					<li class="nav-item dropdown"><a
						class="nav-link dropdown-toggle" href="#" id="navbarDropdown"
						role="button" data-toggle="dropdown" aria-haspopup="true"
						aria-expanded="false"> <i class="fas fa-cog"></i> <span>
								Settings <i class="fas fa-angle-down"></i>
						</span>
					</a>
						<div class="dropdown-menu" aria-labelledby="navbarDropdown">
							<a class="dropdown-item" href="#">Profile</a> <a
								class="dropdown-item" href="#">Billing</a> <a
								class="dropdown-item" href="#">Customize</a>
						</div></li>
				</ul>
				<ul class="navbar-nav">
					<li class="nav-item"><a class="nav-link d-block"
						href="/admin/login"> Admin, <b>Logout</b>
					</a></li>
				</ul>
			</div>
		</div>

	</nav>
	<div class="container mt-5">
		<div class="row tm-content-row">
			<div class="col-sm-12 col-md-12 col-lg-12 col-xl-tm-block-col">
				<div class="tm-bg-primary-dark tm-block tm-block-products">
					<div class="tm-product-table-container">
						<table class="table table-hover tm-table-small tm-product-table">

							<thead>
								<tr>

									<th scope="col">PRODUCT ID</th>
									<th scope="col">CATEGORY ID</th>
									<th scope="col">BRAND ID</th>
									<th scope="col">PRODUCT NAME</th>
									<th scope="col">AVAILABLE</th>
									<th scope="col">Price</th>
									<th scope="col">Image</th>
									<th scope="col">&nbsp;</th>
								</tr>
							</thead>
							<c:forEach items="${allProducts}" var="item">
								<tbody>
									<tr>

										<td class="tm-product-id">${item.productID }</td>
										<td class="">${item.category.getName() }</td>
										<td class="">${item.brand.getName()}</td>
										<td class="tm-product-name">${item.name }</td>
										<td class="tm-product-name">${item.available }</td>
										<td>${item.price}</td>
										<td><img style="width: 50px; height: 50px;"
											src="${item.image}" alt=""></td>
										<td><a
											href="/admin/product/edit-product?id=${item.productID }"
											class="tm-product-delete-link">Edit <i
											class="far fa-pencil-ruler tm-product-delete-icon"></i>
										</a></td>
									</tr>
							</c:forEach>

						</table>
					</div>
					<!-- table container -->
					<a href="/admin/product/add-product"
						class="btn btn-primary btn-block text-uppercase mb-3">Add new
						product</a>
					
				</div>
		
		</div>
	</div>
	<footer class="tm-footer row tm-mt-small">
		<div class="col-12 font-weight-light">
			<p class="text-center text-white mb-0 px-4 small">
				Copyright &copy; <b>2018</b> All rights reserved. Design: <a
					rel="nofollow noopener" href="https://templatemo.com"
					class="tm-footer-link">Template Mo</a>
			</p>
		</div>
	</footer>

	<script src="/templates/admin/js/jquery-3.3.1.min.js"></script>

	<script src="/templates/admin/js/moment.min.js"></script>

	<script src="/templates/admin/js/Chart.min.js"></script>

	<script src="/templates/admin/js/bootstrap.min.js"></script>

	<script src="/templates/admin/js/tooplate-scripts.js"></script>
	<script>
		$(function() {
			$(".tm-product-name").on("click", function() {
				window.location.href = "/admin/product/edit-product";
			});
		});
	</script>
</body>
</html>