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

	<div class="container">
		<div class="row justify-content-center ph-4">
			<div class="col-md-6">
				<h1 class="text-center mb-4">Password Reset</h1>

				<form class="templatemo-forgot-password-form" role="form"
					action="${pageContext.request.contextPath}/fogotPassword/submit"
					method="post">
					<div class="form-group">
						<p class="text-center">Please enter your email address that
							you registered on our website.</p>
					</div>
					<div class="form-group">
						<input type="email" class="form-control" name="email" id="email"
							placeholder="Your email">
					</div>


					<c:if test="${not empty errorMessage}">
						<div class="error-messagefont-monospace text-start text-danger">${errorMessage}</div>
					</c:if>


					<div class="form-group">
						<button type="submit" class="btn btn-primary btn-block">Submit</button>
						<p class="text-center mt-3">
							<a href="login">Login</a>
						</p>
					</div>
				</form>
			</div>
		</div>
	</div>


	<%@include file="/common/user/footer.jsp"%>
	<%@include file="/common/user/jQuery_Bootstrap_Global_Init.jsp"%>
</body>
</html>