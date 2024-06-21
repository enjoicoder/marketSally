<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/views/include/header.jsp"%>
<!-- 
css 적용은 해당페이지이름.css 로 css폴더에 작성 후 style.css 에서 주소 import 작성
html,body 태그 작성 X
-->

<!-- 해당페이지 작성부분 시작 -->

<section class="container justify-content-center mt-5">

	<!-- 상품선택 -->
	<div class="row section_view">

		<div class="col-5">
			<div class="p_image1 rounded mx-auto d-block">
				<img src="./img/한돈.webp" />
			</div>
		</div>

		<div class="col-7 pl-5">
			<h1 class="p_name">무한생제 1등급 한돈 앞다리 3종</h1>
			<br>
			<p class="p_price">5,500원</p>

			<table class="content" border="1">
				<tr>
					<td class="content" width="150">제품종류</td>
					<td class="content">FRESH</td>
				</tr>
				<tr>
					<td class="content">용량</td>
					<td class="content">300g</td>
				</tr>
				<tr>
					<td class="content">배송구분</td>
					<td class="content">택배배송</td>
				</tr>
				<tr>
					<td class="content">포장타입</td>
					<td class="content">냉동/스티로폼</td>
				</tr>
				<tr>
					<td class="content">알레르기정보</td>
					<td class="content">- 알류, 우유, 메밀, 땅콩, 대두, 밀, 고등어, 게, 새우, 돼지고기, 복숭아, 토마토, 아황산류, 호두, 닭고기, 쇠고기, 오징어, 조개류(굴,전복,홍합 포함), 잣을 사용한 제품과 같은 제조시설에서 제조</td>
				</tr>
			</table>

			<div>
				<form action="" name="form" method="post">
					<!-- 구매수량 -->
					<div class="quantity">
						<span class="btn_position">구매수량</span> <br>
						<div class="input-group count">
						
							<!-- 눈에 보이지않는 value 가격 설정 나중에 달러{}로 설정 -->
							<input type="hidden" name="sell_price" value="5500">
							
							<span class="input-group-btn"><input type="button" value=" - " onclick="sub();"></span>
							<input type="text" name="qty" value="1" size="3" onchange="change();">
							<span class="input-group-btn"><input type="button" value=" + " onclick="add();"></span>
						</div>
					</div>
					<div class="price">
						총 금액 :
						<input type="text" name="sum" size="7" readonly>
						원
					</div>
					
					<!-- 장바구니 버튼 -->
					<div class="cart_put w-auto mt-2">
						<button class="w-btn w-auto" type="button" id="cart_put" onclick="cartPut();">장바구니 담기</button>
					</div>

				</form>
			</div>
		</div>


	</div>
	<!-- /상품선택 -->


	<!-- 상품후기 -->
	<div class="review_text">
		PRODUCT REVIEW 
		<br> 상품에 대한 문의를 남기는 공간입니다. 해당 게시판의 성격과 다른 글은 사전동의 없이 담당 게시판으로 이동될 수 있습니다. 
		<br> 배송관련, 주문(취소/교환/환불)관련 문의 및 요청사항은 마이컬리 내 1:1 문의에 남겨주세요.
	</div>
	<table id="notice_table">
		<tr>
			<th width="100">번호</th>
			<th width="100">카테고리</th>
			<th width="640">제목</th>
		</tr>

		<!-- <c:forEach var="vo" items="달러{list}"> -->
		<!-- 질문게시글 -->
		<tr data-toggle="collapse" data-target="#prodReivew1" class="accordion-toggle">
			<!-- 번호 -->
			<td>1</td>
			<!-- 카테고리 -->
			<td>서비스 이용</td>
			<!-- 제목 -->
			<td class="text-left">마켓셀리는 어떤 회사인가요?</td>
		</tr>
		<!-- /질문게시글 -->

		<!-- 숨겨진내용 -->
		<tr>
			<td colspan="3" class="hiddenRow text-left">
				<br>
				<!-- id 로 질문글과 답변글이 연결되니 나중에 id="qna달러{질문id}"로 설정하여 가져와야할듯 -->
				<div id="prodReivew1" class="accordian-body collapse ml-5">
					<!-- 나중에 내용입력할때 <br>로 바꿔주는거 기능 잊지않기 -->
					■ About 마켓셀리<br> <br> 마켓셀리에서는 사람을 소중히 하는 마음으로, 산지에서 친환경 혹은 유기농 인증을 받은 제품들을 꼼꼼히 선택하여 판매합니다. <br> <br> 제품을 최대한 신선하게 배송해 드리기 위해, <br> <br> 샛별배송지역은 밤 11시 전까지 주문하신 경우 다음날 아침 7시까지 (대구/부산/울산 샛별배송 지역은 밤 8시 전까지 주문하신 경우 다음날 아침 8시 까지), <br> <br> 낮배송지역은 밤 10시까지 주문한 경우 택배 시스템을 통해 다음날 밤 11시 전까지 제품을 배송해 드립니다.<br> <br> 또한 수령하신 제품에 문제가 발생할 경우를 대비해 고객만족보장제도를 운영하고 있으며, <br> <br> 1:1 문의에 사진 (사진으로 확인할 수 있는 경우) 및 불편사항을 접수해 주시면 확인 후 환불, 교환도 드리고 있습니다. <br> <br> "우리가 곧 고객이다" 라는 신념으로 좋은 제품을 선택하고 검수하며,<br> <br> 문제 발생 시 고객님의 편에서 조치를 드리고 있으니, 안심하고 이용해 주시기 바랍니다.

				</div>
				<br>
			</td>
		</tr>
		<!-- /숨겨진내용 -->
		<!-- </c:forEach> -->

	</table>

	<!-- 관리자용 버튼 -->
	<div class="text-right mt-3 mr-4">
		<button class="w-btn" type="button" onclick="#">글쓰기</button>
	</div>

	<!-- 페이징 -->
	<ul class="pagination justify-content-center">
		<li class="page-item"><a class="page-link text-color-black" href="#">
				<span aria-hidden="true">&laquo;</span>
			</a></li>
		<li class="page-item"><a class="page-link text-color-black" href="#">
				<span aria-hidden="true">&lt;</span>
			</a></li>
		<li class="page-item"><a class="page-link text-color-black" href="#">1</a></li>
		<li class="page-item"><a class="page-link text-color-black" href="#">2</a></li>
		<li class="page-item"><a class="page-link text-color-black" href="#">3</a></li>
		<li class="page-item"><a class="page-link text-color-black" href="#">
				<span aria-hidden="true">&gt;</span>
			</a></li>
		<li class="page-item"><a class="page-link text-color-black" href="#">
				<span aria-hidden="true">&raquo;</span>
			</a></li>
	</ul>
	<!-- /페이징 -->
	<!-- /상품후기 -->
	
	
	
	<!-- 상품QnA -->
	<div class="review_text">
		PRODUCT REVIEW 
		<br> 상품에 대한 문의를 남기는 공간입니다. 해당 게시판의 성격과 다른 글은 사전동의 없이 담당 게시판으로 이동될 수 있습니다. 
		<br> 배송관련, 주문(취소/교환/환불)관련 문의 및 요청사항은 마이컬리 내 1:1 문의에 남겨주세요.
	</div>
	<table id="notice_table">
		<tr>
			<th width="100">번호</th>
			<th width="100">카테고리</th>
			<th width="640">제목</th>
		</tr>

		<!-- <c:forEach var="vo" items="달러{list}"> -->
		<!-- 질문게시글 -->
		<tr data-toggle="collapse" data-target="#prodQna1" class="accordion-toggle">
			<!-- 번호 -->
			<td>1</td>
			<!-- 카테고리 -->
			<td>서비스 이용</td>
			<!-- 제목 -->
			<td class="text-left">마켓셀리는 어떤 회사인가요?</td>
		</tr>
		<!-- /질문게시글 -->

		<!-- 숨겨진내용 -->
		<tr>
			<td colspan="3" class="hiddenRow text-left">
				<br>
				<!-- id 로 질문글과 답변글이 연결되니 나중에 id="qna달러{질문id}"로 설정하여 가져와야할듯 -->
				<div id="prodQna1" class="accordian-body collapse ml-5">
					<!-- 나중에 내용입력할때 <br>로 바꿔주는거 기능 잊지않기 -->
					■ About 마켓셀리<br> <br> 마켓셀리에서는 사람을 소중히 하는 마음으로, 산지에서 친환경 혹은 유기농 인증을 받은 제품들을 꼼꼼히 선택하여 판매합니다. <br> <br> 제품을 최대한 신선하게 배송해 드리기 위해, <br> <br> 샛별배송지역은 밤 11시 전까지 주문하신 경우 다음날 아침 7시까지 (대구/부산/울산 샛별배송 지역은 밤 8시 전까지 주문하신 경우 다음날 아침 8시 까지), <br> <br> 낮배송지역은 밤 10시까지 주문한 경우 택배 시스템을 통해 다음날 밤 11시 전까지 제품을 배송해 드립니다.<br> <br> 또한 수령하신 제품에 문제가 발생할 경우를 대비해 고객만족보장제도를 운영하고 있으며, <br> <br> 1:1 문의에 사진 (사진으로 확인할 수 있는 경우) 및 불편사항을 접수해 주시면 확인 후 환불, 교환도 드리고 있습니다. <br> <br> "우리가 곧 고객이다" 라는 신념으로 좋은 제품을 선택하고 검수하며,<br> <br> 문제 발생 시 고객님의 편에서 조치를 드리고 있으니, 안심하고 이용해 주시기 바랍니다.

				</div>
				<br>
			</td>
		</tr>
		<!-- /숨겨진내용 -->
		<!-- </c:forEach> -->

	</table>

	<!-- 관리자용 버튼 -->
	<div class="text-right mt-3 mr-4">
		<button class="w-btn" type="button" onclick="#">글쓰기</button>
	</div>

	<!-- 페이징 -->
	<ul class="pagination justify-content-center">
		<li class="page-item"><a class="page-link text-color-black" href="#">
				<span aria-hidden="true">&laquo;</span>
			</a></li>
		<li class="page-item"><a class="page-link text-color-black" href="#">
				<span aria-hidden="true">&lt;</span>
			</a></li>
		<li class="page-item"><a class="page-link text-color-black" href="#">1</a></li>
		<li class="page-item"><a class="page-link text-color-black" href="#">2</a></li>
		<li class="page-item"><a class="page-link text-color-black" href="#">3</a></li>
		<li class="page-item"><a class="page-link text-color-black" href="#">
				<span aria-hidden="true">&gt;</span>
			</a></li>
		<li class="page-item"><a class="page-link text-color-black" href="#">
				<span aria-hidden="true">&raquo;</span>
			</a></li>
	</ul>
	<!-- /페이징 -->
	<!-- /상품QnA -->
	
	
	
</section>





<!-- 해당페이지 작성부분 끝 -->

<%-- 스크립트 적용시 아래에 예시처럼 해당위치에 작성
<script type="text/javascript" src="${pageContext.request.contextPath}/js/해당페이지이름.js"></script> 
--%>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/products_detail.js"></script>

<%@include file="/WEB-INF/views/include/footer.jsp"%>