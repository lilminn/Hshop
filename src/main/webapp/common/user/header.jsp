<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- ***** Header Area Start ***** -->
<header class="header-area header-sticky">
	<div class="container">
		<div class="row">
			<div class="col-12">
				<nav class="main-nav">
					<!-- ***** Logo Start ***** -->
					<a href="/index" class="logo"> <img
						src="<c:url value='/templates/user/images/logo.png'/>">
					</a>
					<!-- ***** Logo End ***** -->
					<!-- ***** Menu Start ***** -->
					<ul class="nav">
						<li class="scroll-to-section">
							<form class="form-inline ml-auto" action="/search" method="get">
								<input type="text" name="keyword" class="form-control mr-sm-2"
									placeholder="Search...">
								<button
									class="btn btn-white my-2 my-sm-0 border border-secondary"
									type="submit">
									<i class="fas fa-search"></i>
								</button>
							</form>
						</li>
						<c:choose>
							<c:when test="${not empty sessionScope.currentUser}">
								<c:if test="${sessionScope.currentUser.admin == true}">
									<li class="scroll-to-section pt-2">Hi, Admin</li>
								</c:if>
								<c:if test="${sessionScope.currentUser.admin != true}">
									<li class="scroll-to-section pt-2">Hi,
										${sessionScope.currentUser.fullName}</li>
								</c:if>
							</c:when>
							<c:otherwise>
								<li class="scroll-to-section"><a href="/index"
									class="active">Home</a></li>
							</c:otherwise>
						</c:choose>
						<li class="submenu"><a href="javascript:;">Products</a>
							<ul>
								<li><a href="/products">Products</a></li>
								<li><a href="/Men">Men</a></li>
								<li><a href="/Women">Women</a></li>
								<li><a href="/Kid">Kid's</a></li>
								<li><a href="/Accessories">Accessories</a></li>
							</ul></li>
						<li class="submenu"><a href="javascript:;">Pages</a>
							<ul>
								<li><a href="about">About Us</a></li>
								<li><a href="contact">Contact Us</a></li>
							</ul></li>
						<li class="submenu"><a href="javascript:;"><i
								class="fas fa-user"></i></a>
							<ul>
								<c:choose>
									<c:when test="${not empty sessionScope.currentUser}">
										<li><a href="/logout"><i class="fas fa-sign-out-alt"></i>
												Logout</a></li>
										<li><a href="/settingProfile"><i class="fas fa-cog"></i>Setting
												profile</a></li>
									</c:when>
									<c:otherwise>
										<li><a href="/register"><i class="fas fa-user-plus"></i>
												Register</a></li>
										<li><a href="/login"><i class="fas fa-sign-in-alt"></i>
												Login</a></li>
										<li><a href="/fogotPassword"><i class="fas fa-key"></i>Forgot
												Password</a></li>
									</c:otherwise>

								</c:choose>
							</ul></li>
						<li class="scroll-to-section pl-5">
							<form class action="/cart" method="get">
								<input type="hidden" name="userz" value="2">
								<button class="dai">
									<i class="fas fa-shopping-cart"></i>
								</button>
							</form>

						</li>
						<li class="submenu"><a href="javascript:;"> <i
								class="fas fa-bell"></i> <span
								class="badge rounded-pill bg-danger">${n}</span></a>
							<ul>
								<li><a href="#">
										<div class="notification-content">
											<h6>Thông báo 2</h6>
											<p>Ut cursus massa at nulla fermentum, vitae varius lorem
												finibus.</p>
											<span class="notification-time">2 giờ trước</span>
										</div>
								</a></li>
								<li><a href="#"> <a href="#">
											<div class="notification-content">
												<h6>Thông báo 1</h6>
												<p>Lorem ipsum dolor sit amet, consectetur adipiscing
													elit.</p>
												<span class="notification-time">1 giờ trước</span>
											</div>
									</a>
								</a></li>
							</ul></li>
					</ul>
					<a class='menu-trigger'> <span>Menu</span>
					</a>
					<!-- ***** Menu End ***** -->
				</nav>
			</div>
		</div>
	</div>

</header>
<!-- ***** Header Area End ***** -->