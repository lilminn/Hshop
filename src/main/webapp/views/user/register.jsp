<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>HSHOP</title>
<%@ include file="/common/user/head.jsp"%>
</head>
<body>
	<%@ include file="/common/user/preloader.jsp"%>
	<%@ include file="/common/user/header.jsp"%>
	<section>
		<div class="px-4 py-5 px-md-5 ph-4 text-center text-lg-start"
			style="background-color: hsl(0, 0%, 96%)">
			<div class="container">
				<div class="row gx-lg-5 align-items-center">
					<div class="col-lg-6 mb-5 mb-lg-0">
						<h1 class="my-5 display-3 fw-bold ls-tight">
							The best SHOP <br /> <span class="text-primary">relax
								shopping</span>
						</h1>
						<p style="color: hsl(217, 10%, 50.8%)">Introducing our stylish
							clothing store, where fashion meets affordability! Step into a
							world of trendy outfits, designed to bring out your unique style
							and confidence. Explore our extensive collection of fashionable
							clothing for men, women, and children, carefully curated to suit
							every occasion. From chic dresses and tailored suits to casual
							wear and accessories, we have something for everyone.</p>
					</div>
					<div class="col-lg-6 mb-5 mb-lg-0">
						<div class="card">
							<div class="card-body py-5 px-md-5">
								<form:form
									action="${pageContext.request.contextPath}/register/save"
									modelAttribute="user" method="post">
									<div class="form-outline ">
										<form:input path="fullName" id="formFullName"
											class="form-control" />
										<label for="formFullName" class="form-label">Full Name</label>
									</div>
									<div class="mb-4 font-monospace text-start">
										<form:errors path="fullName" cssClass="text-danger" />
									</div>


									<div class="form-outline text-start">
										<form:input path="phone" id="formPhone" class="form-control" />
										<label for="formPhone" class="form-label">Phone Number</label>

									</div>
									<div class="mb-4 font-monospace text-start">
										<form:errors path="phone" cssClass="text-danger" />
									</div>

									<div class="form-outline">
										<form:input path="email" name="email" id="formEmail" class="form-control" />
										<label for="formEmail" class="form-label">Email
											Address</label>
									</div>
									<div class="mb-4 font-monospace text-start">
										<form:errors path="email" cssClass="text-danger" />
									</div>

									<div class="form-outline">
										<form:input path="birthday" id="formBirthday"
											class="form-control" placeholder="dd/MM/yyyy" />
										<label for="formBirthday" class="form-label">Birthday</label>
									</div>
									<div class="mb-4 font-monospace text-start">
										<c:if test="${not empty errorMessage}">
											<p class="text-danger">${errorMessage}</p>
										</c:if>
										<form:errors path="birthday" cssClass="text-danger"
											errorElement="span" style="display:none;" />
									</div>



									<div
										class="d-md-flex justify-content-start align-items-center  py-2">
										<h6 class="mb-0 me-4">Gender:</h6>
										<form:radiobutton path="gender" value="true" label="Male" />
										<form:radiobutton path="gender" value="false" label="Female" />
									</div>
									<div class="mb-4 font-monospace text-start">
										<form:errors path="gender" cssClass="text-danger" />
									</div>

									<div class="form-outline ">
										<form:input path="password" name="password" type="password" id="formPassword"
											class="form-control" />
										<label for="formPassword" class="form-label">Password</label>
									</div>
									<div class="mb-4 font-monospace text-start">
										<form:errors path="password" cssClass="text-danger" />
									</div>

									<div class="form-outline mb-4">
										<input type="password" name="comfirmpass"
											id="formConfirmPassword" class="form-control" /> <label
											for="formConfirmPassword" class="form-label">Confirm
											Password</label>
									</div>
									<div class="mb-4">
										<c:if test="${not empty errorPass}">
											<p class="font-monospace text-start text-danger">${errorPass}</p>
										</c:if>
									</div>


									<button type="submit" class="btn btn-primary btn-block mb-4">Sign
										up</button>
									<div class="text-center">
										<p>or sign up with:</p>
										<button type="button" class="btn btn-link btn-floating mx-1">
											<i class="fab fa-facebook-f"></i>
										</button>
										<button type="button" class="btn btn-link btn-floating mx-1">
											<i class="fab fa-google"></i>
										</button>
										<button type="button" class="btn btn-link btn-floating mx-1">
											<i class="fab fa-twitter"></i>
										</button>
										<button type="button" class="btn btn-link btn-floating mx-1">
											<i class="fab fa-github"></i>
										</button>
									</div>
								</form:form>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<%@ include file="/common/user/footer.jsp"%>
	<%@ include file="/common/user/jQuery_Bootstrap_Global_Init.jsp"%>
</body>
</html>
