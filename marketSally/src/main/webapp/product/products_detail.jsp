<%@page import="kr.or.marketsally.member.vo.MemberVO"%>
<%@page import="kr.or.marketsally.product.vo.ProdVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/views/include/header.jsp"%>
<!-- 
css 적용은 해당페이지이름.css 로 css폴더에 작성 후 style.css 에서 주소 import 작성
html,body 태그 작성 X
-->

<!-- 해당페이지 작성부분 시작 -->

<% ProdVO prodvo = (ProdVO)request.getAttribute("selectedProd"); %>


<section class="container justify-content-center mt-5">

	<!-- 상품선택 -->
	<div class="row section_view">

		<div class="col-5">
			<div class="mx-auto d-block">
				<img class="p_image1 rounded" src="${contextPath}/img/product/${selectedProd.prod_img}" />
			</div>
		</div>

		<div class="col-7 pl-5">
			<p class="p_faint">샛별배송</p>
			<h1 class="p_name">${selectedProd.prod_name}</h1>
			<br>
			<span class="p_price"><fmt:formatNumber maxFractionDigits="3" value="${selectedProd.prod_price}" type="number" /></span>
			<span class="p_won">원</span>
			
			<br><br>

			<table class="content" border="1">
				<tr>
					<td class="content" width="150">제품종류</td>
					<td class="content">FRESH</td>
				</tr>
				<tr>
					<td class="content1">판매자</td>
					<td class="content">셀리</td>
				</tr>
				<tr>
					<td class="content">배송구분</td>
					<td class="content">택배배송</td>
				</tr>
				<tr>
					<td class="content1">포장타입</td>
					<td class="content">택배배송은 친환경 종이포장재를 사용하여 보내드립니다</td>
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
							<div class=" input-group count">
						
							<!-- 눈에 보이지않는 value 가격 설정 나중에 달러{}로 설정 -->
							<input type="hidden" name="sell_price" value="${selectedProd.prod_price}">
							<span class="input-group-btn"><input type="button" value=" - " onclick="sub();"></span>
							<input id="qtyip" type="text" name="qty" value="1" size="3" onchange="change();">
							<span class="input-group-btn"><input type="button" value=" + " onclick="add();"></span>
						</div>
						
					</div>
					<br><br><br>
					<div class="price">
						<span class="p_total">총 상품금액 :</span>
						<input id="i_total" type="text" name="sum" size="7" readonly>
						<span class="p_total_won">원</span>
					</div>
					<br><br>
					<div>
					<!-- 찜하기테스트 버튼 -->
						<i class="fa-solid fa-heart fa-3x icon mr-3" id="like_put"></i>
					<!-- 장바구니 버튼 -->
						<button type="button" id="cart_put" data-prodid="${selectedProd.prod_id}"
						 data-prodimg="${selectedProd.prod_img}" data-prodname="${selectedProd.prod_name}">장바구니 담기</button>
					</div>

				</form>
			</div>
		</div>


	</div>
	<!-- /상품선택 -->
	<br> <br> <br>
	<div id="mdivbx">
		<div class="mdiv">
			<br>
			<a href="#moveDet" class="move">상품설명</a>
		</div>
		<div class="mdiv">
			<br>
			<a href="#moveReview" class="move">후기</a>
		</div>
		<div class="mdiv">
			<br>
			<a href="#moveQnA" class="move">문의</a>
		</div>
	</div>
	<br><hr><br><br>
	<!-- 상품설명 -->
	<img class="detimg" src="<%=request.getContextPath() %>/img/product/<%=prodvo.getProd_img() %>" />
	
	<div id="moveDet"></div>
	<p class="detnm"><%=prodvo.getProd_name() %></p>
	<p class="detcont"><%=prodvo.getProd_cont() %></p>
	
	<hr color="lightgray">
	
	<img class="detimg" src="<%=request.getContextPath() %>/img/product/whysally.PNG" />
	<br> <hr> <br>
	<img class="detimg" src="<%=request.getContextPath() %>/img/product/prodhow.PNG" />
	<br> <br> <br>
	
	<!-- /상품설명 -->
	
	<!-- =================== 상품후기 =================== -->
	<div class="review_text"   id="moveReview">
		PRODUCT REVIEW 
		<br> ·상품에 대한 후기를 남기는 공간입니다. 해당 게시판의 성격과 다른 글은 사전동의 없이 담당 게시판으로 이동될 수 있습니다. 
		<br> ·배송관련, 주문(취소/교환/환불)관련 문의 및 요청사항은 마이셀리 내 1:1 문의에 남겨주세요.
	</div>
	<table id="notice_table2">
		<tr class="text-center">
			<th width="100">번호</th>
			<th width="770">제목</th>
			<th width="110">작성자</th>
			<th width="110">작성일</th>
		</tr>

		<c:forEach var="item" items="${reviewList}" varStatus="status">
		<!-- 질문게시글 -->
		<tr data-toggle="collapse" data-target="#prodReivew${status.index}" class="accordion-toggle">
			<!-- 번호 -->
			<td class="text-center">${item.num}</td>
			<!-- 제목 -->
			<td class="text-left">${item.review_title}</td>
			<!-- 작성자 -->
			<td class="text-center thick">${item.mem_name}</td>
			<!-- 작성일 -->
			<fmt:parseDate value="${item.review_date}" var="dateValue" pattern="yyyy-MM-dd HH:mm:ss"/>
			<td class="text-center thick"><fmt:formatDate value="${dateValue}" pattern="yyyy-MM-dd"/></td>
		</tr>
		<!-- /질문게시글 -->

		<!-- 숨겨진내용 -->
		<tr>
			<td colspan="4" class="hiddenRow text-left">
				<div id="prodReivew${status.index}" class="accordian-body collapse ml-5" data-parent="#notice_table2">
				<br>
				<c:if test="${not empty item.review_img}">
					<img src="${contextPath}/img/review/${item.review_img}" />
				</c:if><br>
					${item.review_cont}
				<br>
					<div class="float-right mr-4">
						<c:if test="${sessionMember.mem_id eq item.mem_id}">
							<button type="button" class="btn myReview-delete" data-prodid ="${item.prod_id}">삭제</button>
						</c:if>
					</div>
				</div>
			</td>
		</tr>
		<!-- /숨겨진내용 -->
		</c:forEach>

	</table>

	<!-- 후기작성 버튼 -->
	<div class="text-right mt-3 mr-4">
		<button type="button" class="btn-purple btn btn-outline-primary btn-sm myReview-insert"
		 data-prodid="${selectedProd.prod_id}" data-prodname="${selectedProd.prod_name}" data-prodimg="${selectedProd.prod_img}">후기 작성</button>
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
	<!-- =================== /상품후기 =================== -->
	
	<br><br><br>
	
	
	<!-- =================== 상품QnA =================== -->
	<div class="review_text" id="moveQnA">
		PRODUCT Q&amp;A 
		<br> ·상품에 대한 문의를 남기는 공간입니다. 해당 게시판의 성격과 다른 글은 사전동의 없이 담당 게시판으로 이동될 수 있습니다. 
		<br> ·배송관련, 주문(취소/교환/환불)관련 문의 및 요청사항은 마이셀리 내 1:1 문의에 남겨주세요.
	</div>
	
	<table id="notice_table">
		<tr class="text-center">
			<th width="770">제목</th>
			<th width="110">작성자</th>
			<th width="110">작성일</th>
			<th width="110">작성상태</th>
		</tr>

		<c:forEach var="item" items="${qnaList}" varStatus="status">
		<!-- 질문게시글 -->
		<tr data-toggle="collapse" data-target="#prodQna${status.index}" class="accordion-toggle">

			<td class="text-left pl-4">
				${item.prqa_title}
			</td>
			<!-- 작성자 -->
			<td class="text-center thick">${item.mem_name}</td>
			<!-- 작성일 -->
			<fmt:parseDate value="${item.prqa_qdate}" var="dateValue" pattern="yyyy-MM-dd HH:mm:ss"/>
			
			<td class="text-center thick"><fmt:formatDate value="${dateValue}" pattern="yyyy-MM-dd"/></td>
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
							<td width="50">
								<i class="fa-solid fa-circle-q fa-lg text-color-purple">q</i>
							</td>
							<!-- 질문 -->
							<td width="800">
								${item.prqa_qcont}
							</td>
						</tr>
						<!-- 답변 -->
						<c:if test="${item.prqa_status eq '답변완료'}">
							<tr>
								<td>
									<i class="fa-solid fa-circle-a fa-lg text-color-purple">a</i>
								</td>
								<td>
									${item.prqa_acont}
									<br> <span class="info">
										<fmt:parseDate value="${item.prqa_adate}" var="dateValue" pattern="yyyy-MM-dd HH:mm:ss"/>
										<fmt:formatDate value="${dateValue}" pattern="yyyy-MM-dd"/>
									</span>
								</td>
							</tr>
						</c:if>
					</table>
					<div class="float-right mr-4">
						<c:if test="${sessionMember.mem_grade eq '9'}">
							<button type="button" class="btn ProdQna-answer" data-prodid ="${item.prod_id}" 
							 data-memid ="${item.mem_id}">답변하기</button>
						</c:if>
						<c:if test="${sessionMember.mem_id eq item.mem_id}">
							<button type="button" class="btn ProdQna-delete" data-prodid ="${item.prod_id}">삭제</button>
						</c:if>
					</div>
				</div>
			</td>
		</tr>
		<!-- /숨겨진내용 -->
		</c:forEach>

	</table>

	
	<div class="text-right mt-3 mr-4">
		<button class="btn-purple btn btn-outline-primary btn-sm prodQna-insert" type="button">문의하기</button>
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
	<!-- =================== /상품QnA =================== -->
	
	
	
</section>


<!-- 상품문의작성 모달창 -->
<%@include file="/WEB-INF/views/include/prodQnaModal.jsp" %>
<!-- /상품문의작성 모달창 -->

<!-- 상품문의 삭제 폼 -->
<form action="${contextPath}/ProdQnaDelete.do" method="post" class="prodQna_delete_form">
	<input type="hidden" name="prodId" class="prodQnaDelete_prodId">
</form>

<!-- 상품후기 삭제 폼 -->
<form action="${contextPath}/ReviewDelete.do" method="post" class="review_delete_form">
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
	
	//상품문의 추가
	$("#insertProdQnaFormBtn").on("click", function() {
		$('#prodQnaForm').attr('action', '${contextPath}/ProdQnaInsert.do');
		prodQnaForm.submit();
	});
	
	//상품문의 수정
	$("#updateProdQnaFormBtn").on("click", function() {
		$('#prodQnaForm').attr('action', '${contextPath}/ProdQnaUpdate.do');
		prodQnaForm.submit();
	});
	
	//상품문의 답변
	$("#answerProdQnaFormBtn").on("click", function() {
		$('#prodQnaForm').attr('action', '${contextPath}/ProdQnaAnswer.do');
		prodQnaForm.submit();
	});
	
	//상품문의 삭제
	$(".ProdQna-delete").on("click", function() {
		let prodId = $(this).data("prodid");
		Swal.fire({
			   text: '삭제하시겠습니까?',
			   
			   showCancelButton: true, 
			   confirmButtonText: '삭제', 
			   cancelButtonText: '취소', 
			   
			   reverseButtons: true, 
			   
			}).then(result => {
			   if (result.isConfirmed) { 
					$(".prodQnaDelete_prodId").val(prodId);
					$(".prodQna_delete_form").submit();
			   }
			});
	});

	//상품문의 모달창 데이터 집어넣기
	$('#prodQnaModal').on('show.bs.modal', function (event) {
		$('#prodQna-modal-prodImg').attr({
			src : getContextPath() + "/img/product/${selectedProd.prod_img}"
		});
		$('#prodQna-modal-prodName').text('${selectedProd.prod_name}');
		$('#prodQna-prod_id').val('${selectedProd.prod_id}');
	});
	
	//상품문의 모달창 열기
	$(".prodQna-insert").on("click", function() {
		if(${empty sessionMember}){
			alert("로그인 후 이용해주세요.")
			location.href= getContextPath()+"/login.jsp";
		}else{
			$('#insertProdQnaFormBtn').css("display", "block");
			$('#updateProdQnaFormBtn').css("display", "none");
			$('#answerProdQnaFormBtn').css("display", "none");
			$('#prodQna_Aform').css("display", "none");
			
			// disabled 삭제
			$("#prodQnaTitle").removeAttr("disabled"); 
			$("#prodQnaCont").removeAttr("disabled"); 
			
			
			$('#prodQnaTitle').val('');
			$('#prodQnaCont').val('');
			$('#prodQnaModal').modal('show')
		}
	});
	
	//상품문의 수정창 열기
	$(".ProdQna-update").on("click", function() {
		$('#insertProdQnaFormBtn').css("display", "none");
		$('#updateProdQnaFormBtn').css("display", "block");
		$('#answerProdQnaFormBtn').css("display", "none");
		$('#prodQna_Aform').css("display", "none");
		
		// disabled 삭제
		$("#prodQnaTitle").removeAttr("disabled"); 
		$("#prodQnaCont").removeAttr("disabled"); 
			
		$.ajax({
			type:"POST",
			url:getContextPath()+"/ProdQnaSelect.ajax",
			data: { prodId :$(this).data("prodid") },
			success: function(res){
				$('#prodQnaTitle').val(res.prqa_title);
				$('#prodQnaCont').val(res.prqa_qcont);
			},
			error:function(xhr){
				alert("통신실패");
			}
		});
		
		$('#prodQnaModal').modal('show')
	});
	
	//상품문의 답변창 열기
	$(".ProdQna-answer").on("click", function() {
		$('#insertProdQnaFormBtn').css("display", "none");
		$('#updateProdQnaFormBtn').css("display", "none");
		$('#answerProdQnaFormBtn').css("display", "block");
		$('#prodQna_Aform').css("display", "block");
		
		$('#prodQna-mem_id').val($(this).data('memid'));
		
		$.ajax({
			type:"POST",
			url:getContextPath()+"/ProdQnaSelect.ajax",
			data: { prodId :$(this).data("prodid") },
			success: function(res){
				$('#prodQnaTitle').val(res.prqa_title);
				$('#prodQnaCont').val(res.prqa_qcont);
			},
			error:function(xhr){
				alert("통신실패");
			}
		});
		
		// disabled 처리
		$("#prodQnaTitle").attr("disabled",true); 
		$("#prodQnaCont").attr("disabled",true); 
		
		$('#prodQnaModal').modal('show')
		
	});
	
	// ============= 상품후기 JS =================

	$("#insertReviewFormBtn").on("click", function() {
		$("#insert-Review-prod-detail").val("y");
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
	
	// 상품후기 삭제
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
	
	// 상품후기 추가
	$(".myReview-insert").on("click", function() {
		if(${empty sessionMember}){
			alert("로그인 후 이용해주세요.")
			location.href= getContextPath()+"/login.jsp";
		}else{
			let review = {
				prodId : $(this).data("prodid")
			}
	
			$.ajax({
				type : "POST",
				url : getContextPath() + "/ReviewCheck.ajax",
				data : review,
				success : function(res) {
					if (res == "0") {
						alert("상품을 구매한적이 없습니다.");
					} else {
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
					}
				},
				error : function(xhr) {
					alert("통신실패");
				}
	
			});
			
			
		}

	});
</script>

<!-- 상품 찜하기 -->
<% MemberVO memVo = (MemberVO)session.getAttribute("sessionMember"); %>
<script>

$(function(){ 
	
	$('#like_put').on('click', function(){
		<%  if(memVo==null) {%>
			alert (" 로그인하셔야 본 서비스를 이용하실 수 있습니다.");
		<% } else { %> 
			location.href = "${pageContext.request.contextPath}/InsertLike.do?prodId=<%=prodvo.getProd_id()%>";
			alert (" 💜 찜하기 성공 💜 ");  
		<% }%>
	})

})


</script>
<!-- 해당페이지 작성부분 끝 -->

<%-- 스크립트 적용시 아래에 예시처럼 해당위치에 작성
<script type="text/javascript" src="${pageContext.request.contextPath}/js/해당페이지이름.js"></script> 
--%>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/products_detail.js"></script>

<%@include file="/WEB-INF/views/include/footer.jsp"%>