<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/views/include/header.jsp"%>
<!-- 
css 적용은 해당페이지이름.css 로 css폴더에 작성 후 style.css 에서 주소 import 작성
html,body 태그 작성 X
-->

<!-- 해당페이지 작성부분 시작 -->
<c:set  var="cartPrice" value="0" />
<c:set  var="cartId" value="${cartList[0].cart_id}" />

<!-- 로그인 상태가 아니면 뒤로보내기 -->
<c:if test="${empty sessionMember}">
	<script>
		alert("로그인 해주세요");
		history.back();
	</script>
</c:if>

<section class="container justify-content-center">
	<br> <br>
	<div id="cart_title" class="text-center">장바구니</div>
	<br> <br>

	<div id="cartItemList">
		<div class="row">

			<!-- 장바구니리스트 -->
			<div class="col-md-9">
				<c:choose>
					<c:when test="${empty cartList}">
						<tr>
							<td colspan=8 class="fixed">
								<strong>장바구니에 상품이 없습니다.</strong>
								<c:set  var="deliveryPrice" value="0" />
							</td>
						</tr>
					</c:when>
					<c:otherwise>
						<c:set  var="deliveryPrice" value="3000" />
						
						<c:forEach var="item" items="${cartList}">
							<!-- 상품 -->
							<div class="row px-3 my-1 align-items-center cart-prod">
								<div class="col-md-2">
									<img class="product_img" src="${contextPath}/img/product/${item.prod_img}" alt="${item.prod_img}">
								</div>
								<div class="col-md-4 text-center px-0 ">
									<a href="${contextPath}/products_detail" class="cart-list-text"> ${item.prod_name} </a>
								</div>
								
								<div class="col-md-2 px-0">
									<div class="text-center quantity_div pt-4">
									
											<button class="btn btn-outline-secondary cartQty_btn cartMinus_btn">-</button>
											<input type="text" value="${item.order_detail_qty}" class="cartQty_input form-control d-inline-flex" style="width: 50px;">	
											
											<button class="btn btn-outline-secondary cartQty_btn cartPlus_btn">+</button>
									</div>
										<a class="cartQty_modify_btn btn btn-sm px-5 pt-2" data-prodid="${item.prod_id}">변경</a>
								</div>
								
								<div class="col-md-3 px-0">
									<div class="text-right cart-list-text">
									<fmt:formatNumber maxFractionDigits="3" value="${item.prod_price*item.order_detail_qty}" type="number" var="sum_price" />
										총 가격 : ₩${sum_price}원 <br> 
									</div>
								</div>

								<div class="col-md-1 ">
									<button type="button" class="delete_btn close" aria-label="Close" data-prodid="${item.prod_id}">
										<span aria-hidden="true">&times;</span>
									</button>
								</div>

							</div>
							<!-- /상품 -->
							<c:set  var="cartPrice" value="${cartPrice + item.prod_price*item.order_detail_qty}" />
						</c:forEach>
					</c:otherwise>
				</c:choose>
			</div>
			<!-- /장바구니리스트 -->



			<div class="col-md-3 cart_result">

				<div class="make-me-sticky">
					<br>
					<br>
					<br>
					<div class="cart-result-border">
							<div class="address p-3">
							<h5>배송지</h5>
								<p class="addr">${sessionMember.mem_add}</p>
							</div>
						
						<div class="cart-amount-view p-3">
							<dl>
								<dd class="d-inline">상품금액</dd>
								<dt class="d-inline float-right">₩<fmt:formatNumber maxFractionDigits="3" value="${cartPrice}" type="number"/> 원</dt>
							</dl>
							<dl>
								<dd class="d-inline">상품할인금액</dd>
								<dt class="d-inline float-right">0 원</dt>
							</dl>
	
							<dl>
								<dd class="d-inline">배송비</dd>
								<dt class="d-inline float-right">₩<fmt:formatNumber maxFractionDigits="3" value="${deliveryPrice}" type="number"/> 원</dt>
							</dl>
							<br>
							<dl>
								<dd class="d-inline">결제예정금액</dd>
								
								<dt class="d-inline float-right">₩<fmt:formatNumber maxFractionDigits="3" value="${cartPrice + deliveryPrice}" type="number"/> 원</dt>
							</dl>
						</div>
					</div>
					
					<div class="btn_submit my-4">
						<button type="button" class="cart-btn-order w-btn">주문하기</button>
					</div>
					<div class="cart-text-sm">
						<span class="txt"><span class="ico">·</span>[배송준비중] 이전까지 주문 취소 가능합니다.</span><br> 
						<span class="txt"><span class="ico">·</span>[마이셀리 &gt; 개인정보수정 페이지] 에서 주소지를 변경하실수 있습니다.</span>
					</div>
				</div>

			</div>

		</div>
	</div>


	<!-- 수량 조정 form -->
	<form action="${contextPath}/myCartUpdate.do" method="post" class="cartQty_update_form">
		<input type="hidden" name="cartId" value="${cartId}">
		<input type="hidden" name="prodQty" class="cartUpdate_prodQty">
		<input type="hidden" name="prodId" class="cartUpdate_prodId">
	</form>

	<!-- 삭제 form -->
	<form action="${contextPath}/myCartDelete.do" method="post" class="cartQty_delete_form">
		<input type="hidden" name="cartId" value="${cartId}">
		<input type="hidden" name="prodId" class="cartDelete_prodId">
	</form>

</section>

<script type="text/javascript">

/* 수량버튼 */
$(".cartPlus_btn").on("click", function(){
	let qty = $(this).parent("div").find("input").val();
	$(this).parent("div").find("input").val(++qty);
});
$(".cartMinus_btn").on("click", function(){
	let qty = $(this).parent("div").find("input").val();
	if(qty > 1){
		$(this).parent("div").find("input").val(--qty);		
	}
});

/* 수량 수정 버튼 */
$(".cartQty_modify_btn").on("click", function(){
	let prodQty = $(this).parent("div").find("input").val();
	let prodId = $(this).data("prodid");
	
	$(".cartUpdate_prodQty").val(prodQty);
	$(".cartUpdate_prodId").val(prodId);
	$(".cartQty_update_form").submit();
	
});


/* 장바구니 삭제 버튼 */
$(".delete_btn").on("click", function(e){
	e.preventDefault();
	
	Swal.fire({
		   text: '삭제하시겠습니까?',
		   
		   showCancelButton: true, // cancel버튼 보이기. 기본은 원래 없음
		   confirmButtonText: '삭제', // confirm 버튼 텍스트 지정
		   cancelButtonText: '취소', // cancel 버튼 텍스트 지정
		   
		   reverseButtons: true, // 버튼 순서 거꾸로
		   
		}).then(result => {
		   // 만약 Promise리턴을 받으면,
		   if (result.isConfirmed) { // 만약 모달창에서 confirm 버튼을 눌렀다면
				let prodId = $(this).data("prodid");
				$(".cartDelete_prodId").val(prodId);
				$(".cartQty_delete_form").submit();
		   }
		});
	
});

/* 주문하기 버튼 */
$(".cart-btn-order").on("click", function() {
	let isProd = "${deliveryPrice}";
	if(isProd == 3000){
		location.href= "${contextPath}/payPage.do";
	}else{
		alert("장바구니에 상품이 없습니다.");
	}
});

</script>


<!-- 해당페이지 작성부분 끝 -->

<%-- 스크립트 적용시 아래에 예시처럼 해당위치에 작성
<script type="text/javascript" src="${pageContext.request.contextPath}/js/해당페이지이름.js"></script> 
--%>

<%@include file="/WEB-INF/views/include/footer.jsp"%>