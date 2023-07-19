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
		<section class="vh-100">
			<div class="container py-5 h-100">
				<div
					class="row d-flex align-items-center justify-content-center h-100">
					<div class="col-md-8 col-lg-7 col-xl-6">
						<img
							src="https://mdbcdn.b-cdn.net/img/Photos/new-templates/bootstrap-login-form/draw2.svg"
							class="img-fluid" alt="Phone image">
					</div>
					<div class="col-md-7 col-lg-5 col-xl-5 offset-xl-1">
						<form:form
							action="${pageContext.request.contextPath}/login/submit"
							method="post" modelAttribute="user">
							<!-- Email input -->
							<div class="form-outline mb-4">
								<form:input path="email" type="email" name="email"
									id="form1Example13" class="form-control form-control-lg"
									value="${user.email}" />
								<label class="form-label" for="form1Example13">Email
									address</label>
							</div>
							<div class="mb-4 font-monospace text-start">
								<form:errors path="email" cssClass="text-danger" />
							</div>

							<!-- Password input -->
							<div class="form-outline mb-4">
								<form:input path="password" type="password" id="form1Example23"
									class="form-control form-control-lg" name="password"
									value="${user.password}" />
								<label class="form-label" for="form1Example23">Password</label>
							</div>
						
								<c:if test="${not empty errorMessage}">
									<div class="error-message mb-4 font-monospace text-start text-danger">${errorMessage}</div>
								</c:if>
							<div
								class="d-flex justify-content-around align-items-center mb-4">
								<!-- Checkbox -->
								<div class="form-check">
									<input class="form-check-input" type="checkbox" value=""
										id="form1Example3" name="remember" /> <label
										class="form-check-label" for="form1Example3"> Remember
										me </label>
								</div>
								<a href="/fogotPassword">Forgot password?</a>
							</div>

							<!-- Submit button -->
							<button type="submit" class="btn btn-primary btn-lg btn-block">Sign
								in</button>

							<div class="divider d-flex align-items-center my-4">
								<p class="text-center fw-bold mx-3 mb-0 text-muted">OR</p>
							</div>

							<a class="btn btn-primary btn-lg btn-block"
								style="background-color: #3b5998" href="#!" role="button"> <i
								class="fab fa-facebook-f me-2"></i>Continue with Facebook
							</a>
							<a class="btn btn-primary btn-lg btn-block"
								style="background-color: #55acee" href="#!" role="button"> <i
								class="fab fa-google me-2"></i>Sign in with google
							</a>

						</form:form>
					</div>
				</div>
			</div>
		</section>

	</div>


	<%@include file="/common/user/footer.jsp"%>
	<%@include file="/common/user/jQuery_Bootstrap_Global_Init.jsp"%>
</body>
</html>