<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/views/include/header.jsp" %>


	<!-- 내용 -->
	<!-- 슬라이드 -->
	<div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel">
		<ol class="carousel-indicators">
			<li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
			<li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
			<li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
		</ol>
		<div class="carousel-inner">
			<div class="carousel-item active">
				<img src="./img/01.png" class="d-block w-100" alt="01.png">
			</div>
			<div class="carousel-item">
				<img src="./img/02.png" class="d-block w-100" alt="02.png">
			</div>
			<div class="carousel-item">
				<img src="./img/03.png" class="d-block w-100" alt="03.png">
			</div>
		</div>
		<button class="carousel-control-prev" type="button" data-target="#carouselExampleIndicators" data-slide="prev">
			<span class="carousel-control-prev-icon" aria-hidden="true"></span> <span class="sr-only">Previous</span>
		</button>
		<button class="carousel-control-next" type="button" data-target="#carouselExampleIndicators" data-slide="next">
			<span class="carousel-control-next-icon" aria-hidden="true"></span> <span class="sr-only">Next</span>
		</button>
	</div>
	<!-- 슬라이드 -->
	
	
	<!-- 내용 -->

	<section class="container">
	<h3 class="text-center mt-5">이 상품 어때요?</h3>

		<div class="row slider-wrap">
			<div class="col-3 my-3">
				<div class="card border-light" style="width: 16rem;">
					<div class="product">
						<a href="${contextPath}/products_detail.jsp">
						<img src="./img/딸기.JPG" class="card-img-top" alt="딸기.JPG"></a> <img class="cart"></img>
					</div>
					<div class="card-body">
						<p class="card-text ">
							냉동딸기 바나나믹스 5kg <br> <span class="font-weight-bold">25000원</span>
						</p>
					</div>
				</div>
			</div>
		</div> <!-- row slider wrap -->
		

	<h3 class="text-center mt-5">이 상품 어때요?</h3>
	
		
		<div class="row slider-wrap">
		<c:forEach var="item" items="${prodList}">
			<div class="col-3 my-3">
				<div class="card border-light" style="width: 16rem;">
					<div class="product">
						<a href="${contextPath}/products_detail.jsp">
						<img src="${contextPath}/img/product/${item.prod_img}" class="card-img-top" alt="딸기.JPG"></a> 
						<img class="cart" data-prodid="${item.prod_id}" data-toggle="modal" data-target="#cartModal"
						 data-prodname="${item.prod_name}" data-prodprice="${item.prod_price}" data-prodimg="${item.prod_img}"></img>
					</div>
					<div class="card-body">
						<p class="card-text ">
							${item.prod_name}<br> <span class="font-weight-bold">${item.prod_price}</span>
						</p>
					</div>
				</div>
			</div>
		</c:forEach>
	</div> <!-- row slider wrap -->		
	

</section>
<!-- /내용 -->

<!-- 장바구니 모달창 -->
<%@include file="/WEB-INF/views/include/cartModal.jsp" %>

<script type="text/javascript" src="${contextPath}/js/index.js"></script>
<script type="text/javascript" src="${contextPath}/js/cartModal.js"></script>


<%@include file="/WEB-INF/views/include/footer.jsp" %>