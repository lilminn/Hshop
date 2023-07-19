<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/common/user/taglib.jsp"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>HSHOP</title>

<%@include file="/common/user/head.jsp" %>

</head>
<body>

<%@include file="/common/user/preloader.jsp" %>

<%@include file="/common/user/header.jsp" %>
<c:forEach items="${listIDT}" var="item">
	<h1>${item.price}</h1>
</c:forEach>

    <!-- ***** Main Banner Area Start ***** -->
    <div class="page-heading about-page-heading" id="top">
      <div class="container">
        <div class="row">
            <section class="h-50 gradient-custom">
                <div class="container py-5">
                  <div class="row d-flex justify-content-center my-4">
                    <div class="col-md-8">
                      <div class="card mb-4">
                        <div class="card-header py-3">
                          <h5 class="mb-0">Cart - 2 items</h5>
                        </div>
                        <div class="card-body">
                          <!-- Single item -->
							<c:forEach items="${listProduct}" var="item">
							<div class="row">
                            <div class="col-lg-3 col-md-12 mb-4 mb-lg-0">
                              <!-- Image -->
                              <div class="bg-image hover-overlay hover-zoom ripple rounded" data-mdb-ripple-color="light">
                                <img src="<c:url value='${item.product.image}'/>"
                                  class="w-100" alt="Blue Jeans Jacket" />
                                <a href="#!">
                                  <div class="mask" style="background-color: rgba(251, 251, 251, 0.2)"></div>
                                </a>
                              </div>
                              <!-- Image -->
                            </div>
              
                            <div class="col-lg-5 col-md-6 mb-4 mb-lg-0">
                              <!-- Data -->
                              <p><strong>${item.product.name}</strong></p>
                              <p>Color: blue</p>
                              <p>Size: M</p>
                              <form action="/remove/cart/${item.detailID}" method="post">
                              <button type="submit" class="btn btn-primary btn-sm me-1 mb-2" data-mdb-toggle="tooltip"
                                title="Remove item">
                                <i class="fas fa-trash"></i>
                              </button>
                              </form>
                              
                              <button type="button" class="btn btn-danger btn-sm mb-2" data-mdb-toggle="tooltip"
                                title="Move to the wish list">
                                <i class="fas fa-heart"></i>
                              </button>
                              <!-- Data -->
                            </div>
              
                            <div class="col-lg-4 col-md-6 mb-4 mb-lg-0">
                              <!-- Quantity -->
                              <div class="d-flex mb-4" style="max-width: 300px">
                              <form action="/single-productzzz/${item.product.productID}" method="get">
                              <input type="hidden" name="emty" value="${item.detailID}">
                              <button type="submit" class="btn btn-primary px-3 me-2">
                                  
                                  <i class="fas fa-minus"></i>
                                </button>
                              </form>
                                
              
                                <div class="form-outline">
                                  <input id="form1" min="0" name="quantity" value="${item.quantity}" type="number" class="form-control" />
                                  <label class="form-label" for="form1">Quantity</label>
                                </div>
              				<form action="/single-productzz/${item.product.productID}" method="get">
                              <button class="btn btn-primary px-3 ms-2"
                                  type="submit">
                                  <i class="fas fa-plus"></i>
                                </button>
                              </form>
                                
                              </div>
                              <!-- Quantity -->
              
                              <!-- Price -->
                              <p class="text-start text-md-center">
                                <strong>${item.price}</strong>
                              </p>
                              <!-- Price -->
                            </div>
                          </div>
							</c:forEach>
                          
                          <!-- Single item -->
              
                          <hr class="my-4" />
              
                          <!-- Single item -->
                          
                          <!-- Single item -->
                        </div>
                      </div>
                      <div class="card mb-4">
                        <div class="card-body">
                          <p><strong>Expected shipping delivery</strong></p>
                          <p class="mb-0">12.10.2020 - 14.10.2020</p>
                        </div>
                      </div>
                      <div class="card mb-4 mb-lg-0">
                        <div class="card-body">
                          <p><strong>We accept</strong></p>
                          <img class="me-2" width="45px"
                            src="https://mdbcdn.b-cdn.net/wp-content/plugins/woocommerce-gateway-stripe/assets/images/visa.svg"
                            alt="Visa" />
                          <img class="me-2" width="45px"
                            src="https://mdbcdn.b-cdn.net/wp-content/plugins/woocommerce-gateway-stripe/assets/images/amex.svg"
                            alt="American Express" />
                          <img class="me-2" width="45px"
                            src="https://mdbcdn.b-cdn.net/wp-content/plugins/woocommerce-gateway-stripe/assets/images/mastercard.svg"
                            alt="Mastercard" />
                          <img class="me-2" width="45px"
                            src="https://mdbcdn.b-cdn.net/wp-content/plugins/woocommerce/includes/gateways/paypal/assets/images/paypal.webp"
                            alt="PayPal acceptance mark" />
                        </div>
                      </div>
                    </div>
                    <div class="col-md-4">
                      <div class="card mb-4">
                        <div class="card-header py-3">
                          <h5 class="mb-0">Summary</h5>
                        </div>
                        <div class="card-body">
                          <ul class="list-group list-group-flush">
                            <li
                              class="list-group-item d-flex justify-content-between align-items-center border-0 px-0 pb-0">
                              Products
                              <span>${sum}</span>
                            </li>
                            <li class="list-group-item d-flex justify-content-between align-items-center px-0">
                              Shipping
                              <span>Gratis</span>
                            </li>
                            <li
                              class="list-group-item d-flex justify-content-between align-items-center border-0 px-0 mb-3">
                              <div>
                                <strong>Total amount</strong>
                                <strong>
                                  <p class="mb-0">(including VAT)</p>
                                </strong>
                              </div>
                              <span><strong>${sum}</strong></span>
                            </li>
                          </ul>
                          
              	<form action="/user/pay" method="post">
              	<input type="hidden" name="total" value="1">
              	<button type="submit" class="btn btn-primary btn-lg btn-block">
                            Go to checkout
                          </button>
              	</form>
                          
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
              </section>
        </div>
      </div>
    </div>
    <!-- ***** Main Banner Area End ***** -->

<%@include file="/common/user/footer.jsp" %>
<%@include file="/common/user/jQuery_Bootstrap_Global_Init.jsp" %>
</body>
</html>