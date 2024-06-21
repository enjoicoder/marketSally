<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/views/include/header.jsp"%>
<!-- 
css 적용은 해당페이지이름.css 로 css폴더에 작성 후 style.css 에서 주소 import 작성
html,body 태그 작성 X
-->

<!-- 해당페이지 작성부분 시작 -->
<section class="container justify-content-center">

	<div class="row">
		<!-- 사이드바 -->
		<div class="col-md-2">
			<br> <br> <br>
			<div id="notice_title">고객센터</div>
			<br>

			<table class="table table-hover sidebar-nav">
				<tbody>
					<tr>
						<td>
							<a href="${pageContext.request.contextPath}/notice.jsp">공지사항</a>
						</td>
					</tr>
					<tr>
						<td>
							<a href="${pageContext.request.contextPath}/questions.jsp">자주하는 질문</a>
						</td>
					</tr>
					<tr>
						<td class="sidebar-active">
							<a id="sidebarActiveFont" href="${pageContext.request.contextPath}/qna.jsp">1:1 문의</a>
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
					1:1 문의<span class="sub"> 컬리에게 질문해 주시면 최대한 빠르게 답변해 드립니다.</span>
				</div>
				<br>

				<table id="notice_table">
					<tr>
						<th width="100">번호</th>
						<th width="500">제목</th>
						<th width="80">작성자</th>
						<th width="100">작성일</th>
						<th width="60">조회수</th>
					</tr>

					<tr>
						<td>4</td>

						<td class="subject">
							[배송] 
							<i class="fa-solid fa-lock"></i>
							<a href="${pageContext.request.contextPath}/qna_detail.jsp" class="text-color-black">배송이 안옵니다 ㅡㅡ </a>
						</td>

						<td class="text-color-black">DBman</td>

						<td>2022-07-31</td>

						<td>329876</td>
					</tr>

					<tr>
						<td>3</td>

						<td class="subject">
							<span class="ml-2">└[답변] </span>
							<i class="fa-solid fa-lock"></i>
							<a href="#" class="text-color-black"> 고양이가 배달중이라 좀 걸립니다. </a>
						</td>

						<td class="text-color-black">MarketSally</td>

						<td>2022-07-03</td>

						<td>7</td>
					</tr>

					<tr>
						<td>2</td>

						<td class="subject">
							[상품] 
							<a href="${pageContext.request.contextPath}/notice_detail.jsp" class="text-color-black">김밥 맛이 구려요</a>
						</td>

						<td class="text-color-black">homeLove</td>

						<td>2022-07-31</td>

						<td>3</td>
					</tr>

					<tr>
						<td>1</td>

						<td class="subject">
							<span class="ml-2">└[답변] </span>
							<a href="#" class="text-color-black"> 김밥천국을 가세요. </a>
						</td>

						<td class="text-color-black">MarketSally</td>

						<td>2022-07-31</td>

						<td>1</td>
					</tr>

					

				</table>
				
				
				<div class="text-right mt-3 mr-4">
					<button class="w-btn w-auto" type="button" onclick="#">문의하기</button>
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
			</div>
		</div>
	</div>
</section>






<!-- 해당페이지 작성부분 끝 -->

<%-- 스크립트 적용시 아래에 예시처럼 해당위치에 작성
<script type="text/javascript" src="${pageContext.request.contextPath}/js/해당페이지이름.js"></script> 
--%>

<%@include file="/WEB-INF/views/include/footer.jsp"%>