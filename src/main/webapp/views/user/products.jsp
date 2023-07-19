<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/common/user/taglib.jsp"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>HSHOP</title>

<%@include file="/common/user/head.jsp"%>

</head>
<body>

	<%@include file="/common/user/preloader.jsp"%>

	<%@include file="/common/user/header.jsp"%>



	<!-- ***** Main Banner Area Start ***** -->
	<div class="page-heading" id="top">
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<div class="inner-content">
						<c:choose>
							<c:when test="${uri}">
								<h2>Tìm Kiếm Theo : ${keyword}</h2>
								<span>Awesome &amp; Creative HTML CSS layout by
									TemplateMo</span>
							</c:when>
							<c:otherwise>

								<h2>Check Our Products</h2>
								<span>Awesome &amp; Creative HTML CSS layout by
									TemplateMo</span>
							</c:otherwise>
						</c:choose>

					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- ***** Main Banner Area End ***** -->


	<!-- ***** Products Area Starts ***** -->
	<section class="section" id="products">
		<c:set var="currentUrl" value="${pageContext.request.requestURI}" />

		<c:set var="category" value="" />
		<c:choose>
			<c:when test="${currentUrl.startsWith('/Men')}">
				<c:set var="category" value="Men" />
			</c:when>
			<c:when test="${currentUrl.startsWith('/products')}">
				<c:set var="category" value="products" />
			</c:when>
			<c:when test="${currentUrl.startsWith('/Women')}">
				<c:set var="category" value="Women" />
			</c:when>
			<c:when test="${currentUrl.startsWith('/Accessories')}">
				<c:set var="category" value="Accessories" />
			</c:when>
			<c:when test="${currentUrl.startsWith('/Kid')}">
				<c:set var="category" value="Kid" />
			</c:when>
			<c:when test="${currentUrl.startsWith('/search')}">
				<c:set var="category" value="search" />
			</c:when>
		</c:choose>
		<div class="container ">




			<div class="row">
				<div class="col-lg-12">
					<div class="section-heading">
						<h2>Our Latest Products</h2>
						<span>Check out all of our products.</span>
						<c:choose>
							<c:when test="${uri}">
								<nav class="navbar navbar-expand-lg navbar-light bg-light">
									<ul class="navbar-nav">
										<li class="nav-item"><a class="nav-link"
											href="${category}?field=price&keyword=${param.keyword}">Price</a></li>
										<li class="nav-item"><a class="nav-link"
											href="${category}?field=name&keyword=${param.keyword}">Name</a></li>
									</ul>
								</nav>
							</c:when>
							<c:otherwise>
								<nav class="navbar navbar-expand-lg navbar-light bg-light">
									<ul class="navbar-nav">
										<li class="nav-item"><a class="nav-link"
											href="${category}?field=price">Price</a></li>
										<li class="nav-item"><a class="nav-link"
											href="${category}?field=name">Name</a></li>
									</ul>
								</nav>
							</c:otherwise>
						</c:choose>


					</div>
				</div>
			</div>
		</div>
		<div class="container">
			<div class="row">
				<c:forEach var="item" items="${page.content}">
					<div class="col-lg-4">
						<div class="item">
							<div class="thumb">
								<div class="hover-content">
									<ul>
										<li><a href="single-product"><i class="fa fa-eye"></i></a></li>
										<li><a href="single-product"><i class="fa fa-star"></i></a></li>
										<li><a href="/single-product/${item.productID}"><i
												class="fa fa-shopping-cart"></i></a></li>
									</ul>
								</div>
								<img src="<c:url value='${item.image}"' />" alt="">
							</div>
							<div class="down-content">
								<h4>${item.name}</h4>
								<span>$ ${item.price}</span>
								<ul class="stars">
									<li><i class="fa fa-star"></i></li>
									<li><i class="fa fa-star"></i></li>
									<li><i class="fa fa-star"></i></li>
									<li><i class="fa fa-star"></i></li>
									<li><i class="fa fa-star"></i></li>
								</ul>
							</div>
						</div>
					</div>
				</c:forEach>
				<div class="col-lg-12">
					<div class="pagination">
						<ul>
							<c:choose>
								<c:when test="${uri}">
									<li><a
										href="${category}?p=0&field=${param.field}&keyword=${hello}">&lt;&lt;</a></li>
									<li><a
										href="${category}?p=${page.number-1}&field=${param.field}&keyword=<%= request.getParameter("keyword") %>">&lt;</a></li>
									<li><a
										href="${category}?p=${page.number+1}&field=${param.field}&keyword=<%= request.getParameter("keyword") %>">&gt;</a></li>
									<li><a
										href="${category}?p=${page.totalPages-1}&field=${param.field}&keyword=<%= request.getParameter("keyword") %>">&gt;&gt;</a></li>
								</c:when>
								<c:otherwise>
									<li><a href="${category}?p=0&field=${param.field}">&lt;&lt;</a></li>
									<li><a
										href="${category}?p=${page.number-1}&field=${param.field}">&lt;</a></li>
									<li><a
										href="${category}?p=${page.number+1}&field=${param.field}">&gt;</a></li>
									<li><a
										href="${category}?p=${page.totalPages-1}&field=${param.field}">&gt;&gt;</a></li>
								</c:otherwise>
							</c:choose>
						</ul>
					</div>

				</div>
			</div>
		</div>
	</section>
	<!-- ***** Products Area Ends ***** -->


	<%@include file="/common/user/footer.jsp"%>
	<%@include file="/common/user/jQuery_Bootstrap_Global_Init.jsp"%>

</body>
</html>