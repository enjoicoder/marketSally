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
						<td>
							<a href="${contextPath}/mypage_order.do">주문내역</a>
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
						<td class="sidebar-active">
							<a id="sidebarActiveFont" href="${contextPath}/mypage_prodQna.do">상품문의</a>
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
				<br> <br> <br>
				<h4 class="text-left">상품후기</h4>
				<br>
				<span class="info">·상품에 대한 문의를 남기는 공간입니다. 해당 게시판의 성격과 다른 글은 사전동의 없이 담당 게시판으로 이동될 수 있습니다.
				<br>·배송관련,주문(취소/교환/환불)관련 문의 및 요청사항은 마이컬리 내 1:1문의에 남겨주세요.
				</span>
				<br>

				<table id="notice_table">
					<tr class="text-center">
						<th colspan='2' width="700">제목</th>
						<th width="110">작성일</th>
						<th width="110">작성상태</th>
					</tr>

					<c:forEach var="item" items="${qnaList}" varStatus="status">
					<!-- 질문게시글 -->
					<tr data-toggle="collapse" data-target="#prodQna${status.index}" class="accordion-toggle">
						<td width="100">
								<img class="admin_product_img" src="${contextPath}/img/product/${item.prod_img}" alt="${item.prod_img}">
						</td>

						<td class="text-left thick" width="600">
								<span class="info">${item.prod_name}</span><br>
								${item.prqa_title}
						</td>
						<!-- 작성일 -->
						<td class="text-center thick">
							<fmt:parseDate value="${item.prqa_qdate}" var="dateValue" pattern="yyyy-MM-dd HH:mm:ss"/>
							<fmt:formatDate value="${dateValue}" pattern="yyyy-MM-dd"/>
						</td>
						<!-- 작성상태 -->
						<c:choose>
							<c:when test="${item.prqa_status ne '답변대기'}">
								<td class="text-center thick text-color-purple">${item.prqa_status}</td>
							</c:when>
							<c:otherwise>
								<td class="text-center thick">${item.prqa_status}</td>
							</c:otherwise>
						</c:choose>
					</tr>
					<!-- /질문게시글 -->

					<!-- 숨겨진내용 -->
					<tr class="prodQna">
						<td colspan="4" class="hiddenRow text-left">
							<div id="prodQna${status.index}" class="accordian-body collapse ml-5" data-parent="#notice_table">
								<table>
									<tr>
										<td width="100"><i class="fa-solid fa-circle-q fa-lg text-color-purple">q</i></td>
										<!-- 질문 -->
										<td width="640">
											${item.prqa_qcont}
										</td>
									</tr>
									<!-- 답변 -->
									<c:if test="${item.prqa_status eq '답변완료'}">
										<tr>
											<td><i class="fa-solid fa-circle-a fa-lg text-color-purple">a</i></td>
											<td>
												${item.prqa_acont}
												
												<br><span class="info">
													<fmt:parseDate value="${item.prqa_adate}" var="dateValue" pattern="yyyy-MM-dd HH:mm:ss"/>
													<fmt:formatDate value="${dateValue}" pattern="yyyy-MM-dd"/>
												</span>
											</td>
										</tr>
									</c:if>
								</table>
								<div class="float-right mr-4">
									<button type="button" class="btn ProdQna-update"
									 data-prodid ="${item.prod_id}" 
									 data-prodimg = "${item.prod_img}"
									 data-prodname = "${item.prod_name}">수정</button>
									<button type="button" class="btn ProdQna-delete"
									 data-prodid ="${item.prod_id}"
									 data-prodimg = "${item.prod_img}"
									 data-prodname = "${item.prod_name}">삭제</button>
								</div>
							</div>
						</td>
					</tr>
					<!-- /숨겨진내용 -->
					</c:forEach>

				</table>


				<br> <br> <br>

			</div>
		
	</div>

</section>

<!-- 상품문의작성 모달창 -->
<%@include file="/WEB-INF/views/include/prodQnaModal.jsp" %>

<!-- 상품문의 삭제 폼 -->
<form action="${contextPath}/myProdQnaDelete.do" method="post" class="prodQna_delete_form">
	<input type="hidden" name="prodId" class="prodQnaDelete_prodId">
</form>


<!-- 해당페이지 작성부분 끝 -->

<%-- 스크립트 적용시 아래에 예시처럼 해당위치에 작성
<script type="text/javascript" src="${pageContext.request.contextPath}/js/해당페이지이름.js"></script> 
--%>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/mypage_prodQna.js"></script> 

<%@include file="/WEB-INF/views/include/footer.jsp"%>