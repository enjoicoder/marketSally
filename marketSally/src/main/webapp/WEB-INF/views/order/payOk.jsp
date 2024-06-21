<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/views/include/header.jsp"%>
<!-- 
css 적용은 해당페이지이름.css 로 css폴더에 작성 후 style.css 에서 주소 import 작성
html,body 태그 작성 X
-->

<!-- 해당페이지 작성부분 시작 -->
<style>
#payOk-page {
	background: #f7f7f7;
	height: 800px;
	-ms-user-select: none;
	-moz-user-select: -moz-none;
	-webkit-user-select: none;
	-khtml-user-select: none;
	user-select: none;
}
.payOk-box {
	background: white;
	width: 400px;
	height: 700px;
}
</style>

<div id="payOk-page" class="py-4 text-center">

	<div class="mt-4">
		<div class="payOk-box p-4 mx-auto">
		<br><br><br>
			<i class="fa-regular fa-circle-check fa-2xl text-color-purple"></i> <br>
			<br>
			<h4 class="text-center">${sessionMember.mem_name}님의 주문이 완료되었습니다.</h4>
			<p class="font-weight-bold text-center">내일 아침에 만나요!</p>
			<br><br><br>
			<p class="text-md-left font-weight-bold">결제금액 
			<span class="font-weight-bold float-right"><fmt:formatNumber maxFractionDigits="3" value="${payAmount}" type="number" />원</span>
			</p><br>
			<p class="info text-md-left">
			· [주문완료]상태일 경우에만 주문내역 상세페이지에서 주문 취소가 가능합니다.<br><br>
			· 엘리베이터 이용이 어려운 경우 6층 이상부터는 공동 현관 앞 또는 경비실로 대응 배솔 될 수 있습니다.<br><br>
			· 주문/배송 및 기타 문의가 있을 경우, 1:1 문의에 남겨주시면 신속히 해결해드리겠습니다.
			</p>
			<button type="button" class="cart-btn-order b-btn my-2" onclick="location.href='${contextPath}/mypage_order_detail.do?order_id=${orderId}' ">주문 상세보기</button>
			<br>
			<button type="button" class="cart-btn-order w-btn" onclick="location.href='${contextPath}/index.do'">쇼핑 계속하기</button>
		</div>
	</div>

</div>



<!-- 해당페이지 작성부분 끝 -->

<%-- 스크립트 적용시 아래에 예시처럼 해당위치에 작성
<script type="text/javascript" src="${pageContext.request.contextPath}/js/해당페이지이름.js"></script> 
--%>

<%@include file="/WEB-INF/views/include/footer.jsp"%>