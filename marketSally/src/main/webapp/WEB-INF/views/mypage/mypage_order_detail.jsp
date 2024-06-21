<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/views/include/header.jsp"%>
<!-- 
css 적용은 해당페이지이름.css 로 css폴더에 작성 후 style.css 에서 주소 import 작성
html,body 태그 작성 X
-->

<!-- 해당페이지 작성부분 시작 -->
<c:if test="${empty sessionMember}">
	<script>
		alert("로그인 해주세요");
		history.back();
	</script>
</c:if>

<!-- 마이페이지 회원등급창 -->
<%@include file="/WEB-INF/views/mypage/mypage_header.jsp"%>
<!-- /마이페이지 회원등급창 -->

<section class="container justify-content-center">

	<div class="row">
		<!-- 사이드바 -->
		<div class="col-md-2">
			<br> <br> <br>
			<div id="notice_title">마이셀리</div>
			<br>

			<table class="table table-hover sidebar-nav">
				<tbody>
					<tr>
						<td class="sidebar-active">
							<a id="sidebarActiveFont" href="${contextPath}/mypage_order.do">주문내역</a>
						</td>
					</tr>
					<tr>
						<td>
							<a href="${contextPath}/ProdLike.do">찜한상품</a>
						</td>
					</tr>
					<tr>
						<td>
							<a href="${contextPath}/mypage_review.do">상품후기</a>
						</td>
					</tr>
					<tr>
						<td>
							<a href="#">상품문의</a>
						</td>
					</tr>
					<tr>
						<td>
							<a href="#">적립금</a>
						</td>
					</tr>
					<tr>
						<td>
							<a href="#">쿠폰</a>
						</td>
					</tr>
					<tr>
						<td>
							<a href="#">개인정보수정</a>
						</td>
					</tr>
					<tr>
						<td>
							<a href="#">1:1문의</a>
						</td>
					</tr>
				</tbody>
			</table>


		</div>
		<!-- /사이드바 -->


		<div class="col-md-9">
			<div id="notice_list">
				<br> <br> <br>
				<h4 class="text-left">주문 내역 상세</h4>
				<br>
				<div id="notice_title">
					주문번호 ${order.order_id} <span class="sub float-right pt-2"> 배송 또는 상품에 문제가 있나요 ? <a class="text-color-purple" href="#">1:1 문의하기 ></a>
					</span>
				</div>
				<div class="v-line"></div>
				<br>

				<table class="mypage-order-detail">
					<c:forEach var="item" items="${prodList}">
						<tr>
							<td width="100">
								<img class="admin_product_img"  src="${contextPath}/img/product/${item.prod_img}" alt="${item.prod_img}">
							</td>

							<td class="thick" width="650">
								${item.prod_name}<br>
								<fmt:formatNumber maxFractionDigits="3" value="${item.prod_price}" type="number" />
								원 | ${item.order_detail_qty}개
							</td>
							<c:choose>
								<c:when test="${order.order_status ne '주문취소'}">
									<td class="thick text-color-purple" width="100">${order.order_status}</td>
								</c:when>
								<c:otherwise>
									<td class="thick" width="100">${order.order_status}</td>
								</c:otherwise>
							</c:choose>

							<td class="thick" width="150">
								<button type="button" class="btn-purple btn btn-outline-primary btn-sm">장바구니 담기</button>
							</td>
						</tr>
					</c:forEach>
				</table>


				<br> <br> <br>
				<div id="notice_title">결제정보</div>
				<div class="v-line"></div>
				<table class="mypage-order-detail mt-2">
					<tr>
						<td class="sub font-weight-bold pl-1" width="200">결제금액</td>
						<td class="font-weight-bold" width="800">
							<fmt:formatNumber maxFractionDigits="3" value="${pay.pay_amount}" type="number" />원
						</td>
					</tr>
					<tr>
						<td class="sub font-weight-bold pl-1" width="200">결제방법</td>
						<td class="font-weight-bold" width="800">${pay.pay_method}</td>
					</tr>

				</table>

				<br> <br> <br>
				<div id="notice_title">주문정보</div>
				<div class="v-line"></div>
				<table class="mypage-order-detail mt-2">
					<tr>
						<td class="sub font-weight-bold pl-1" width="200">주문번호</td>
						<td class="font-weight-bold" width="800">${order.order_id}</td>
					</tr>
					<tr>
						<td class="sub font-weight-bold pl-1" width="200">보내는 분</td>
						<td class="font-weight-bold" width="800">${sessionMember.mem_name}</td>
					</tr>
					<tr>
						<td class="sub font-weight-bold pl-1" width="200">결제일시</td>
						<td class="font-weight-bold" width="800">${pay.pay_date}</td>
					</tr>

				</table>
				<br> <br> <br>
				<div id="notice_title">배송정보</div>
				<div class="v-line"></div>
				<table class="mypage-order-detail mt-2">
					<tr>
						<td class="sub font-weight-bold pl-1" width="200">받는분</td>
						<td class="font-weight-bold" width="800">${sessionMember.mem_name}</td>
					</tr>
					<tr>
						<td class="sub font-weight-bold pl-1" width="200">핸드폰</td>
						<td class="font-weight-bold" width="800">${sessionMember.mem_tel}</td>
					</tr>
					<tr>
						<td class="sub font-weight-bold pl-1" width="200">주소</td>
						<td class="font-weight-bold" width="800">${order.order_add}</td>
					</tr>
					<tr>
						<td class="sub font-weight-bold pl-1" width="200">받으실 장소</td>
						<td class="font-weight-bold" width="800">문 앞</td>
					</tr>
					<tr>
						<td class="sub font-weight-bold pl-1" width="200">공동현관 출입방법</td>
						<td class="font-weight-bold" width="800">자유 출입 가능</td>
					</tr>
					<tr>
						<td class="sub font-weight-bold pl-1" width="200">포장 방법</td>
						<td class="font-weight-bold" width="800">종이 포장재</td>

					</tr>

				</table>

				<br> <br> <br>
				<div id="notice_title">추가정보</div>
				<div class="v-line"></div>

				<table class="mypage-order-detail mt-2">

					<tr>
						<td class="sub font-weight-bold pl-1" width="200">미배송 시 조치방법</td>
						<td class="font-weight-bold" width="800">결제수단으로 환불</td>
					</tr>
					<tr>
						<td class="sub font-weight-bold pl-1" width="200">메시지 전송시점</td>
						<td class="font-weight-bold" width="800">배송 직후</td>
					</tr>

				</table>
				<br>
				<button type="button" class="btn btn-outline-secondary w-5">주문취소</button>
				<br>
				<br>
				<h5 class="info font-weight-bold pl-1">주문취소는 [주문완료] 상태일 경우에만 가능합니다.</h5>
				<br>
				<br>
			</div>
		</div>
	</div>
</section>






<!-- 해당페이지 작성부분 끝 -->

<%-- 스크립트 적용시 아래에 예시처럼 해당위치에 작성
<script type="text/javascript" src="${pageContext.request.contextPath}/js/해당페이지이름.js"></script> 
--%>

<%@include file="/WEB-INF/views/include/footer.jsp"%>