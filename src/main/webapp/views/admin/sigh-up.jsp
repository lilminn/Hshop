<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login Page - Product Admin Template</title>
  <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto:400,700" />
  <!-- https://fonts.google.com/specimen/Open+Sans -->
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
<body>
	 <div>
    <nav class="navbar navbar-expand-xl">
            <div class="container h-100">
                <a class="navbar-brand" href="/admin">
                    <h1 class="tm-site-title mb-0">Product Admin</h1>
                </a>
                <button class="navbar-toggler ml-auto mr-0" type="button" data-toggle="collapse"
                    data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false"
                    aria-label="Toggle navigation">
                    <i class="fas fa-bars tm-nav-icon"></i>
                </button>

                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <ul class="navbar-nav mx-auto h-100">
                        <li class="nav-item">
                            <a class="nav-link" href="#">
                                <i class="fas fa-tachometer-alt"></i>
                                Users Management
                                <span class="sr-only">(current)</span>
                            </a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="/admin/statistical">
                                <i class="fas fa-tachometer-alt"></i>
                                Statistical
                                <span class="sr-only">(current)</span>
                            </a>
                        </li>
                        <li class="nav-item dropdown">

                            <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button"
                                data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                <i class="far fa-file-alt"></i>
                                <span>
                                    Reports <i class="fas fa-angle-down"></i>
                                </span>
                            </a>
                            <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                                <a class="dropdown-item" href="#">Daily Report</a>
                                <a class="dropdown-item" href="#">Weekly Report</a>
                                <a class="dropdown-item" href="#">Yearly Report</a>
                            </div>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="/admin/product">
                                <i class="fas fa-shopping-cart"></i>
                                Products
                            </a>
                        </li>

                     
                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button"
                                data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                <i class="fas fa-cog"></i>
                                <span>
                                    Settings <i class="fas fa-angle-down"></i>
                                </span>
                            </a>
                            <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                                <a class="dropdown-item" href="#">Profile</a>
                                <a class="dropdown-item" href="#">Billing</a>
                                <a class="dropdown-item" href="#">Customize</a>
                            </div>
                        </li>
                    </ul>
                    <ul class="navbar-nav">
                        <li class="nav-item">
                            <a class="nav-link d-block" href="/admin/login">
                                Admin, <b>Logout</b>
                            </a>
                        </li>
                    </ul>
                </div>
            </div>

        </nav>
  </div>

  <div class="container tm-mt-big tm-mb-big">
    <div class="row">
      <div class="col-12 mx-auto tm-login-col">
        <div class="tm-bg-primary-dark tm-block tm-block-h-auto">
          <div class="row">
            <div class="col-12 text-center">
              <h2 class="tm-block-title mb-4">Welcome, Sign-up</h2>
            </div>
          </div>
          <div class="row mt-2">
            <div class="col-12">
              <form action="index.html" method="post" class="tm-login-form">
                <div class="form-group">
                  <i class="fas fa-user fa-lg me-3 fa-fw"></i>
                  <label for="username">Username</label>
                  <input name="username" type="text" class="form-control validate" id="username" value="" required />
                </div>
                <div class="form-group">
                  <i class="fas fa-user fa-lg me-3 fa-fw"></i>
                  <label for="username">Fullname</label>
                  <input name="username" type="text" class="form-control validate" id="fullname" value="" required />
                </div>
                <div class="form-group">
                  <i class="fas fa-envelope fa-lg me-3 fa-fw"></i>
                  <label for="username">Email</label>
                  <input name="username" type="text" class="form-control validate" id="fullname" value="" required />
                </div>
                <div class="form-group mt-3">
                  <i class="fas fa-lock fa-lg me-3 fa-fw"></i>
                  <label for="password">Password</label>
                  <input name="password" type="password" class="form-control validate" id="password" value=""
                    required />
                </div>
                <div class="form-group mt-3">
                  <i class="fas fa-key fa-lg me-3 fa-fw"></i>
                  <label for="password">ConfirmPassword</label>
                  <input name="password" type="password" class="form-control validate" id="confirmpassword" value=""
                    required />
                </div>
                <div class="form-check d-flex justify-content-center mb-5">
                  <input class="form-check-input me-2" type="checkbox" value="" id="form2Example3c" />
                  <label class="form-check-label" for="form2Example3">
                    I agree all statements in <a href="#!"></a>
                  </label>
                </div>
                <div class="form-group mt-4">
                  <button type="submit" class="btn btn-primary btn-block text-uppercase">
                    Register
                  </button>
                </div>
               
                  
                
               
              </form>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
  <footer class="tm-footer row tm-mt-small">
    <div class="col-12 font-weight-light">
      <p class="text-center text-white mb-0 px-4 small">
        Copyright &copy; <b>2018</b> All rights reserved.

        Design: <a rel="nofollow noopener" href="https://templatemo.com" class="tm-footer-link">Template Mo</a>
      </p>
    </div>
  </footer>
  <script src="templates/admin/js/jquery-3.3.1.min.js"></script>

    <script src="templates/admin/js/moment.min.js"></script>

    <script src="templates/admin/js/Chart.min.js"></script>

    <script src="templates/admin/js/bootstrap.min.js"></script>

    <script src="templates/admin/js/tooplate-scripts.js"></script>
</body>
</html>