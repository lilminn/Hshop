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


 <!-- ***** Main Banner Area Start ***** -->
    <div class="main grid h ">
    
		<div class="body grid wide h">
			<div class="product__container">
				<div class="row row-h">
					<div class="col-lg-12 col-12 body__product-inf">
						<div class="row">
							<div class="col-lg-6 col-12 body__img">
								<div class="body__img-box">
								
									<img id="js__img-drewhouse"
										src="<c:url value='${tinhthongminh.image}'/>" alt=""
										class="body__inf-img"> <i
										class="fa-solid
                                        fa-circle-chevron-right
                                        body__img-next js__img-next"></i>
									<i
										class="fa-solid
                                        fa-circle-chevron-left
                                        body__img-prev js__img-prev"></i>
								</div>
								
								<div class="body__share">
									<b class="body__share-header">Chia sẻ: </b> <i
										class="fa-brands
                                        fa-facebook-messenger
                                        body__share-messenger"></i>
									<i
										class="fa-brands fa-youtube
                                        body__share-youtube"></i>
									<i
										class="fa-brands fa-facebook
                                        body__share-facebook"></i>
									<i
										class="fa-brands fa-instagram
                                        body__share-instagram"></i>
									<i
										class="fa-brands
                                        fa-square-twitter
                                        body__share-twitter"></i>
									<div class="body__inf-seperate seperate__share"></div>
									<div class="number__like">
										<i class="fa-regular fa-heart js-heart"></i>
										<!-- <i class="fa-solid fa-heart
                                                        heart-red js-heart-red"></i> -->
										<div class="number__like-123">Còn 12k</div>
									</div>
								</div>
								<div class="body__back">
									<button
										class="btn body__btn-back
                                        js__btn-back">
										<a href="index.html">Trở về</a>
									</button>
								</div>
							</div>
							<div class="col-lg-6 col-12 body__inf">
								
									<div class="body__inf-like">Yêu thích+</div>
									<div
										class="body__inf-name
                                    js__inf-name js_test">${tinhthongminh.name}</div>
								
								<br>
								<div class="body__inf-rate js__rate">
									4.5 <i class="fa-solid fa-star"></i><i class="fa-solid fa-star"></i><i
										class="fa-solid fa-star"></i><i class="fa-solid fa-star"></i><i
										class="fa-regular fa-star-half-stroke"></i>
								</div>
								<div class="body__inf-seperate"></div>
								<div
									class="body__inf-sell-number
                                    js__sell-number">9382.4k</div>
								<div class="body__inf-sell">
									<b
										class="body__inf-price--sale
                                        js__inf-price--sale">₫350.000</b>
									<b
										class="body__inf-price
                                        js__inf-price">₫${tinhthongminh.price}</b>
								</div>
								<div class="body__inf-color-box">
									<b class="body__inf-color">Màu sắc: </b>

									<div
										class="body__inf-color-drewhouse
                                        js__inf-color">
										<a href="#!detail/{{color.id}}" class="js_c body__inf-btn">Đỏ</a>
										<a href="#!detail/{{color.id}}" class="js_c body__inf-btn">Đen</a>
										<a href="#!detail/{{color.id}}" class="js_c body__inf-btn">Trắng</a>
										<a href="#!detail/{{color.id}}" class="js_c body__inf-btn">Cam</a>
									</div>
								</div>
								<b class="body__inf-size">Kích cỡ: </b>
								<div class="body__inf-chart js__chart">
									<div class="body__inf-chart-item" style="--percent: 89%">89%</div>
									<div class="body__inf-chart-item" style="--percent: 32%">32%</div>
									<div class="body__inf-chart-item" style="--percent: 19%">19%</div>
									<div class="body__inf-chart-item" style="--percent: 58%">89%</div>
								</div>
								<div
									class="body__inf-size-list
                                    js__size">
									<a href="#!detail/{{item.id}}" class="body__inf-btn">S</a> <a
										href="#!detail/{{item.id}}" class="body__inf-btn">M</a> <a
										href="#!detail/{{item.id}}" class="body__inf-btn">L</a> <a
										href="#!detail/{{item.id}}" class="body__inf-btn">XL</a>
								</div>
								<b class="body__inf-number">Số lượng: </b>
								<div class="body__inf-number">
									<button class="body__inf-cong">
										<i class="fa-solid fa-plus"></i>
									</button>
									<input type="text" class="body__inf-ipt" placeholder="1">
									<button class="body__inf-tru">
										<i class="fa-solid fa-minus"></i>
									</button>
								</div>
								<div class="body__inf-btns">
									<div
										class="body__inf-btn-cart
                                        btn model__btn-comback"
										> <form action="/single-productz/${tinhthongminh.productID}">
											<button>Thêm vào giỏ</button>
										</form> </div>
									<button
										class="body__inf-btn-pay btn
                                        model__btn-register">Mua
										ngay</button>
								</div>
								<div class="body__inf-guard">
									<i class="fa-solid fa-shield"></i>
									<b class="body__inf-guard-desc">Hexashop đảm bảo</b>
								</div>
							</div>

						</div>
						<div class="body__product-desc">
							👉Cam Kết : <br> ️- Sản phẩm chính hãng 100% như hình . <br>
							️- Nhận hàng hàng TRƯỚC - Thu tiền SAU.. cho kiểm hàng dễ chịu
							khi nhận hàng. <br> -------------------------- <br> 👉
							Bức hình và MÔ TẢ <br> ️- 100% ảnh thật được Cửa Hàng chúng
							tôi chụp bằng máy tính bảng cá nhân <br> ️- Giày đẹp, nhẹ,
							bền. Giá thấp tương thích với những bàn sinh hoạt sinh, sinh
							viên. hoàn toàn có thể làm giày đôi, giày nhóm. phù hợp đi chơi,
							du lịch, chạy bộ, gym, đi học, đi làm... <br> ️- Dễ phối đồ,
							hoàn toàn có thể phối hợp với váy, jeans, sooc…. thích hợp với
							tất cả tiết trời từ đông sang hè. <br>
							
						</div>
						

					</div>
				</div>
			</div>
		</div>
	</div>

<%@include file="/common/user/footer.jsp" %>
<%@include file="/common/user/jQuery_Bootstrap_Global_Init.jsp" %>
</body>
</html>