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
							<a href="${contextPath}/mypage_prodQna.do">상품문의</a>
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
				<div id="notice_title">
					주문내역<span class="sub"> 최대 지난 3년간의 주문 내역까지 확인할 수 있어요</span>
				</div>
				<div class="v-line"></div>
				<br>
				<table class="mypage-order">
				
					<c:choose>
					
						<c:when test="${empty orderList}">
							<tr>
								<td colspan=5>
									<h3>주문내역이 없습니다.</h3>
								</td>
							</tr>
						</c:when>
						
						<c:otherwise>
							<c:forEach var="item" items="${orderList}">
								<tr>
									<th colspan="5">${item.order_date} 
									<a href="${contextPath}/mypage_order_detail.do?order_id=${item.order_id}"><span class="info float-right pt-2">주문내역 상세보기></span></a>
									</th>
								</tr>
								<tr>

									<td width="100">
										<img class="admin_product_img" src="${contextPath}/img/product/${item.prod_img}" alt="${item.prod_img}">
									</td>


									<td class="thick" width="100">
										상품명<br>주문번호<br>결제방법<br>결제금액
									</td>
									<td class="thick" width="580">
										${item.prod_name} 외 ${item.cnt}건<br> 
										${item.order_id}<br> 
										${item.pay_method}<br> 
										${item.pay_amount}원
									</td>

									<td class="thick" width="100">${item.order_status}</td>


									<td class="thick" width="120">
										<button type="button" class="btn-purple btn btn-outline-primary">1:1문의</button>
									</td>
								</tr>
							</c:forEach>
						</c:otherwise>
					</c:choose>
				</table>

			</div>
		</div>
	</div>
</section>






<!-- 해당페이지 작성부분 끝 -->

<%-- 스크립트 적용시 아래에 예시처럼 해당위치에 작성
<script type="text/javascript" src="${pageContext.request.contextPath}/js/해당페이지이름.js"></script> 
--%>

<%@include file="/WEB-INF/views/include/footer.jsp"%>