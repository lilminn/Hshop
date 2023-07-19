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
<style>
.far {
	width: 100px;
}
</style>
<body>

	<%@include file="/common/user/preloader.jsp"%>

	<%@include file="/common/user/header.jsp"%>
	<br>
	<br>
	<br>
	<br>

	<div class="container">
		<form:form action="/settingProfile/save" modelAttribute="user"
			method="post" enctype="multipart/form-data">
			<div class="row">
				<div class="col-xl-4">
					<!-- Profile picture card-->
					<div class="card mb-4 mb-xl-0 pb-4">
						<div class="card-header">Profile Picture</div>
						<div class="card-body text-center">
							<!-- Profile picture image-->
							<img style="width: 300px; height: 275px;"
								class="img-account-profile rounded-circle mb-2"
								src="/templates/user/images/avatar.jpg" alt="">
							<!-- Profile picture help block-->
							<div class="small font-italic text-muted mb-4">JPG or PNG
								no larger than 5 MB</div>
							<!-- Profile picture upload button-->

							<div class="btn btn-primary btn-rounded">
								<label class="form-label text-white m-1" for="customFile2">Choose
									file</label> <input type="file" name="chooseimg"
									class="form-control d-none" id="customFile2" />
							</div>

						</div>
					</div>
				</div>
				<div class="col-xl-8">
					<!-- Account details card-->
					<div class="card mb-4">
						<div class="card-header">Account Details</div>
						<div class="card-body">
							<!-- Form Group (username)-->
							<div class="mb-3">
								<label class="small mb-1" for="inputUsername">Fullname</label>
								<form:input path="fullName" class="form-control"
									id="inputUsername" type="text"
									placeholder="Enter your username" />
							</div>

							<!-- Form Row-->
							<div class="row gx-3 mb-3">
								<label class="small mb-1 ml-2">Password new</label>
								<!-- Form Group (first name)-->
								<div class="col-md-6">
									<form:input path="password" name="password" type="password" id="formPassword"
											class="form-control"  />
										<label for="formPassword" class="form-label"></label>
								</div>
								<!-- Form Group (last name)-->
								<div class="col-md-6">
									<label class="small mb-1" for="inputLastName">Re-enter
										Password</label> <input class="form-control" id="formConfirmPassword"
										name="comfirmpass" type="password" for="formConfirmPassword"
										class="form-label" placeholder="Enter your last name"
										value="${user.password}">
								</div>
							</div>
							<!-- Form Row        -->

							<!-- Form Group (email address)-->
							<div class="mb-3">
								<label class="small mb-1" for="inputEmailAddress">Email
									address</label>
								<form:input path="email" class="form-control"
									id="inputEmailAddress" type="email"
									placeholder="Enter your email address" />
							</div>
							<!-- Form Row-->
							<div class="row gx-3 mb-3">
								<!-- Form Group (phone number)-->
								<div class="col-md-6">
									<label class="small mb-1" for="inputPhone">Phone number</label>
									<form:input path="phone" class="form-control" id="inputPhone"
										type="tel" placeholder="Enter your phone number" />
								</div>
								<!-- Form Group (birthday)-->
								<div class="col-md-6">
									<label class="small mb-1" for="inputBirthday">Birthday</label>
									<form:input path="birthday" id="formBirthday"
										class="form-control" />


								</div>
							</div>
							<!-- Save changes button-->
							<button type="submit"
								class="btn btn-primary btn-block text-uppercase">Save
								Now</button>
						</div>
					</div>
				</div>
			</div>
		</form:form>
	</div>




	<%@include file="/common/user/footer.jsp"%>
	<%@include file="/common/user/jQuery_Bootstrap_Global_Init.jsp"%>
</body>
</html>