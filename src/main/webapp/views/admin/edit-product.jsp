<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/common/user/taglib.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Edit Product - Dashboard Admin Template</title>
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Roboto:400,700" />
<!-- https://fonts.google.com/specimen/Roboto -->
<link rel="stylesheet" href="/templates/admin/css/fontawesome.min.css" />
<!-- https://fontawesome.com/ -->
<link rel="stylesheet" href="jquery-ui-datepicker/jquery-ui.min.css"
	type="text/css" />
<!-- http://api.jqueryui.com/datepicker/ -->
<link rel="stylesheet" href="/templates/admin/css/bootstrap.min.css" />
<!-- https://getbootstrap.com/ -->
<link rel="stylesheet" href="/templates/admin/css/templatemo-style.css">
<!--
	Product Admin CSS Template
	https://templatemo.com/tm-524-product-admin
	-->
</head>
<body>
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
	<div class="container tm-mt-big tm-mb-big">
		<div class="row">
			<div class="col-xl-9 col-lg-10 col-md-12 col-sm-12 mx-auto">
				<div class="tm-bg-primary-dark tm-block tm-block-h-auto">
					<div class="row">
						<div class="col-12">
							<h2 class="tm-block-title d-inline-block">Edit Product</h2>
						</div>
					</div>
					<div class="row tm-edit-product-row">
					
						<div class="col-xl-6 col-lg-6 col-md-12">
								<form action="" method="post" modelAttribute="product" class="tm-edit-product-form">
							
								
								<div class="form-group mb-3">
								
									<label for="name">Product ID </label> <input id="productID"
										name="productID" type="text" value="${product.productID }"
										class="form-control validate" />
								</div>
								<div class="form-group mb-3"> 
									<label for="name">Product Name </label> <input id="name"
										name="productName" type="text" value="${product.name }"
										class="form-control validate" />
								</div>
								<div class="form-group mb-3">
									<label  for="description">Description</label>
									<textarea name="description" class="form-control validate tm-small" rows="5"
										required>${product.description }</textarea>
								</div>
								<div class="row">
									<div class="form-group mb-3 col-xs-12 col-sm-6">
										<label for="expire_date">Image</label> <input hidden name="image" value="${product.image }"><img id="image" 
											style="width: 100px; height: 100px;" src="${product.image }"
											alt="">
									</div>
									<div class="form-group mb-3 col-xs-12 col-sm-6">
										<label for="stock">Price</label> <input id="price"
											name="price" type="text" value="${product.price }"
											class="form-control validate" />
									</div>
								</div>
						</div>
						
						<div class="col-xl-6 col-lg-6 col-md-12 mx-auto mb-4">
							
							
							<div class="form-group mb-3">
								<label for="description">Category ID</label> <input id="productID"
										name="categoryID" type="text" value="${product.category.getCategoryID() }"
										class="form-control validate" />
							</div>
							<div class="form-group mb-3">
								<label for="description">Brand ID</label> <input id="productID"
									name="brandID" type="text" value="${product.brand.getBrandID() }"
									class="form-control validate" />
							</div>

						</div>
						<div class="col-12">
							<button type="submit" formaction="/admin/product/update"
								class="btn btn-primary btn-block text-uppercase">Update
								Now</button>
								<button formaction="/admin/product/delete" class="btn btn-primary btn-block text-uppercase">
						Delete</button>
						</div>

						</form>
					</div>
				</div>
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
			$("#expire_date").datepicker({
				defaultDate : "10/22/2020"
			});
		});
	</script>
</body>
</html>