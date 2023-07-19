<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Product Admin - Dashboard HTML Template</title>
    <!-- Font Awesome -->
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto:400,700" />
    <!-- https://fonts.google.com/specimen/Open+Sans -->
    <link rel="stylesheet" href="/templates/admin/css/fontawesome.min.css" />
    <!-- https://fontawesome.com/ -->
    <link rel="stylesheet" href="/templates/admin/css/bootstrap.min.css" />
    <!-- https://getbootstrap.com/ -->
    <link rel="stylesheet" href="/templates/admin/css/templatemo-style.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <!--
 Product Admin CSS Template
 https://templatemo.com/tm-524-product-admin
 -->
</head>
	<body id="reportsPage">
    <div class="" id="home">
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
                            <a class="nav-link active" href="#">
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

        <div class="container">
            <div class="page-header">

            </div>
            <div class="panel panel-default">
                <!-- Bootstrap CSS -->
                <!-- jQuery first, then Bootstrap JS. -->
                <!-- Nav tabs -->
                
                <ul class="nav nav-tabs nav-users" role="tablist">
                    <li class="nav-item">
                        <a class="nav-link user-role user-controller" href="#profile" role="tab" data-toggle="tab">Users Role</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link user-manager user-controller" href="#buzz" role="tab" data-toggle="tab">Users Manager</a>
                    </li>
                    <div class="line"></div>
                </ul>

                <!-- Tab panes -->
                <form action="/admin/user/search" method="post">
				<div class="searchUser">
					<input name="key" class="form-control">
					<button class="btn btn">search</button>
					</div>
				</form>
				
           		<br>
                <div class="tab-content">
                    <div role="tabpanel" class="tab-pane fade" id="profile">
                        <table class="table table-striped">
                            <thead>
                                <tr>
                                    <th scope="col">UserID</th>
                                    <th scope="col">Password</th>
                                    <th scope="col">Fullname</th>
                                    <th scope="col">Email</th>
                                    <th scope="col">Adress</th>
                                    <th scope="col">Phone Number</th>
                                    <th scope="col">Role</th>
                                    <th scope="col">Edit</th>
                                </tr>
                            </thead>
                            <tbody>
                          
                                <c:forEach items="${user}" var="item">
                                <tr>
                                    <td >${item.userID}</td>
                                    <td>${item.password}</td>
                                    <td>${item.fullName}</td>
                                    <td>${item.email}</td>
                                     <td>${item.address}</td>
                                      <td>${item.phone}</td>
                                    <td>
                                        <div class="table--btns none">
                                            ${item.admin}<i class="table--btn-true fa-solid fa-toggle-on"></i>
                                            <i class="table--btn-false fa-solid fa-toggle-off"></i>
                                        </div>
                                    </td>
                                    <td>
                                    <form action="/admin/user/edit/${item.userID}" method="get">
                                    <button type="submit">edit</button></form>
                                   </td>
                                </tr>
                               </c:forEach>
                                
                            </tbody>
                        </table>
                    </div>
                    <div role="tabpanel" class="tab-pane fade" id="buzz">
                        <h4 class="card-title text-center mb-4">User</h4>
                        <form method="post" class="row" modelAttribute="user">
                            <div class="col-6">
                                UsernID: <input readonly value="${users.userID}"  name="userId" class="form-control"><br> Password:
                                <input value="${users.password}" name="password" type="password" 
                                    class="form-control"><br>
                                    <form:errors path="password" class="form-text text-danger" />
                            </div>
                            <div class="col-6">
                            Fullname: <input value="${users.fullName}" name="name" class="form-control"><br>
                            <form:errors path="fullName" class="form-text text-danger" />
                            Email: <input value="${users.email}" name="email" class="form-control"><br>
                            <form:errors path="email" class="form-text text-danger" />
                            </div>
                            <div class="col-6">
                                Address: <input value="${users.address}" name="address" class="form-control"><br>
                            	<form:errors path="address" class="form-text text-danger" />
                            </div>
                            <div class="col-6">
                                Phone Number: <input value="${users.phone}" name="phone" class="form-control"><br>
                          		<form:errors path="phone" class="form-text text-danger" />
                            </div>
                            
                            <div class="col-12 a">
                                <div class="wrapper-btns">
                                    <button type="submit" class="btn btn-primary btn-insert" formaction="/admin/user/insert">Insert</button>
                            		<button type="submit" class="btn btn-danger"formaction="/admin/user/delete/${users.userID}">Delete</button>
                                </div>
                                
                            </div>
                            <div class="col-12 social-tools">
                                <i class="fa-brands fa-square-facebook"></i>
                                <i class="fa-brands fa-telegram"></i>
                                <div class="wrapper-tiktok"><i class="fa-brands fa-tiktok"></i></div>
                                <div class="wrapper-twitter"><i class="fa-brands fa-twitter"></i></div>
                                <div class="wrapper-google"><i class="fa-brands fa-google"></i></div>
                            </div>
                            
                        </form>
                    </div>
                    </form>

                 
                </div>

            </div>
        </div>



        <footer class="tm1-footer row tm-mt-medium">
            <div class="col-12 font-weight-light">
                <p class="text-center text-white mb-0 px-4 medium">
                    Copyright &copy; <b>2018</b> All rights reserved.


                </p>
            </div>
        </footer>
    </div>

    <script src="/templates/admin/js/jquery-3.3.1.min.js"></script>

    <script src="/templates/admin/js/moment.min.js"></script>

    <script src="/templates/admin/js/Chart.min.js"></script>

    <script src="/templates/admin/js/bootstrap.min.js"></script>

    <script src="/templates/admin/js/tooplate-scripts.js"></script>

    <script>
        const btnTrue = document.querySelectorAll(".table--btns");
        const userRole = document.querySelectorAll(".user-controller");
        const line = document.querySelector(".line")
        userRole.forEach((tab) => {
            

            tab.addEventListener("click", () => {
                line.style.left = tab.offsetLeft + "px";
                line.style.width = tab.offsetWidth + "px";
            })
        });

        btnTrue.forEach(btn => {
            btn.addEventListener('click', () => {
                btn.classList.toggle('none');
                btn.classList.toggle('open');
            })
        });
        Chart.defaults.global.defaultFontColor = 'white';
        let ctxLine,
            ctxBar,
            ctxPie,
            optionsLine,
            optionsBar,
            optionsPie,
            configLine,
            configBar,
            configPie,
            lineChart;
        barChart, pieChart;
        // DOM is ready
        $(function () {
            drawLineChart(); // Line Chart
            drawBarChart(); // Bar Chart
            drawPieChart(); // Pie Chart

            $(window).resize(function () {
                updateLineChart();
                updateBarChart();
            });
        })

        

    </script>
</body>
</html>