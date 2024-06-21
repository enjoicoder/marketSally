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
						<td class="sidebar-active">
							<a id="sidebarActiveFont" href="${contextPath}/mypage_review.do">상품후기</a>
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
				<h4 class="text-left">상품후기</h4>
				<br> <br>

				<table class="mypage-order-detail">
					<c:forEach var="item" items="${prodList}">
						<tr>
							<td width="100">
								<img class="admin_product_img" src="${contextPath}/img/product/${item.prod_img}" alt="${item.prod_img}">
							</td>

							<td class="thick" width="600">
								${item.prod_name}<br>
								<fmt:formatNumber maxFractionDigits="3" value="${item.prod_price}" type="number" />
								원
							</td>

							<td class="thick" width="110">
								<button type="button" class="btn btn-outline-secondary btn-sm myReview-delete" data-prodid="${item.prod_id}">후기 삭제</button>
							</td>

							<td class="thick" width="110">
								<button type="button" class="btn-purple btn btn-outline-primary btn-sm myReview-insert" data-prodid="${item.prod_id}" data-prodname="${item.prod_name}" data-prodimg="${item.prod_img}">후기 작성</button>
							</td>
						</tr>
					</c:forEach>
				</table>


				<br> <br> <br>

			</div>
		</div>
	</div>

</section>
<!-- 삭제 form -->
<form action="${contextPath}/myReviewDelete.do" method="post" class="review_delete_form">
	<input type="hidden" name="prodId" class="reviewDelete_prodId">
</form>

<!-- 리뷰작성 모달창 -->
<%@include file="/WEB-INF/views/include/reviewModal.jsp" %>
<!-- /리뷰작성 모달창 -->
<script>
	function getContextPath() {
		var hostIndex = location.href.indexOf(location.host)
				+ location.host.length;
		return location.href.substring(hostIndex, location.href.indexOf('/',
				hostIndex + 1));
	};
$("#insertReviewFormBtn").on("click", function() {
	insertReviewForm.submit();
});
	//장바구니 모달창 데이터 집어넣기
	$(".myReview-insert").on("click", function() {
		let prodId = $(this).data("prodid");
		let prodName = $(this).data("prodname");
		let prodimg = $(this).data("prodimg");
		$('#modal-prodImg').attr({
			src : getContextPath() + "/img/product/" + prodimg
		});
		$('#modal-prodName').text(prodName);
		$('#prod_id').val(prodId);
	});

	$(".myReview-delete").on("click", function() {
		let review = {
			prodId : $(this).data("prodid")
		}

		$.ajax({
			type : "POST",
			url : getContextPath() + "/selectMyReview.ajax",
			data : review,
			success : function(res) {
				if (res == "1") {
					Swal.fire({
						   text: '삭제하시겠습니까?',
						   
						   showCancelButton: true, // cancel버튼 보이기. 기본은 원래 없음
						   confirmButtonText: '삭제', // confirm 버튼 텍스트 지정
						   cancelButtonText: '취소', // cancel 버튼 텍스트 지정
						   
						   reverseButtons: true, // 버튼 순서 거꾸로
						   
						}).then(result => {
						   // 만약 Promise리턴을 받으면,
						   if (result.isConfirmed) { // 만약 모달창에서 confirm 버튼을 눌렀다면
								console.log(review.prodId);
								$(".reviewDelete_prodId").val(review.prodId);
								$(".review_delete_form").submit();
						   }
						});
				} else {
					alert("작성한 리뷰가 없습니다.");
				}
			},
			error : function(xhr) {
				alert("통신실패");
			}

		});

	});
	$(".myReview-insert").on("click", function() {
		let review = {
			prodId : $(this).data("prodid")
		}

		$.ajax({
			type : "POST",
			url : getContextPath() + "/selectMyReview.ajax",
			data : review,
			success : function(res) {
				if (res == "1") {
					alert("이미 작성한 리뷰가 존재합니다.");
				} else {
					$('#reviewModal').modal('show')
				}
			},
			error : function(xhr) {
				alert("통신실패");
			}

		});

	});
</script>




<!-- 해당페이지 작성부분 끝 -->

<%-- 스크립트 적용시 아래에 예시처럼 해당위치에 작성
<script type="text/javascript" src="${pageContext.request.contextPath}/js/해당페이지이름.js"></script> 
--%>

<%@include file="/WEB-INF/views/include/footer.jsp"%>