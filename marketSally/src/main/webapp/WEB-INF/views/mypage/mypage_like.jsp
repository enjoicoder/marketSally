<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/views/include/header.jsp"%>
<!-- 
css 적용은 해당페이지이름.css 로 css폴더에 작성 후 style.css 에서 주소 import 작성
html,body 태그 작성 X
-->

<!-- 해당페이지 작성부분 시작 -->
<style>
#like_price{
	font-weight: bold;
}
#like_top{
	border-top : 1px solid lightgray;
	height : 20px;
}
#like_under{
	height : 20px;
}
.thick{
	margin : 5px;
	padding : 5px;
}
</style>

<% int cnt = (int)request.getAttribute("cnt"); %>


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
						<td>
							<a href="${contextPath}/mypage_order.do">주문내역</a>
						</td>
					</tr>
					<tr>
						<td class="sidebar-active">
							<a id="sidebarActiveFont"  href="${contextPath}/ProdLike.do">찜한상품</a>
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
					찜한 상품 (${cnt}) <span class="sub"> 찜한 상품은 최대 200개까지 저장됩니다.</span>
				</div>
				<div class="v-line"></div>
				<br>
				<table class="mypage-like">
				
					<c:choose>
						<c:when test="${empty likeList}">
							<tr>
								<td colspan=4>
									<h3>주문내역이 없습니다.</h3>
								</td>
							</tr>
						</c:when>
						
						<c:otherwise>
							<c:forEach var="like" items="${likeList}">
								<tr id="like_top">
								</tr>
								<tr>
									<td width="100">
										<img class="admin_product_img" src="${contextPath}/img/product/${like.prod_img}" alt="${like.prod_img}">
									</td>


									<td width="600" style="text-align: left">
										<a href="${contextPath}/ProdDetail.do?prodId=${like.prod_id}">${like.prod_name}</a><br>
										<span id="like_price"><fmt:formatNumber maxFractionDigits="3" value="${like.prod_price}" type="number" />원</span><br><br>
									</td>


									<td class="thick" width="80">
										<button id="del_like" type="button" class="btn-purple btn btn-outline-primary" onclick="location.href = '${contextPath}/DeleteLike.do?prodId=${like.prod_id}&memId=${like.mem_id}'">삭제</button>
									</td>
									
									<td class="thick" width="100">
										<button type="button" class="btn-purple btn btn-outline-primary"><img src="${contextPath}/img/cart.svg">담기</button>
									</td>
								</tr>
								<tr id="like_under">
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