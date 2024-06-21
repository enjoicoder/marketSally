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
						<td class="sidebar-active">
							<a id="sidebarActiveFont" href="${pageContext.request.contextPath}/notice.jsp">공지사항</a>
						</td>
					</tr>
					<tr>
						<td>
							<a href="${pageContext.request.contextPath}/questions.jsp">자주하는 질문</a>
						</td>
					</tr>
					<tr>
						<td>
							<a href="${pageContext.request.contextPath}/qna.jsp">1:1 문의</a>
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
					공지사항<span class="sub"> 셀리의 새로운 소식들과 유용한 정보들을 한곳에서 확인하세요.</span>
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
						<td>7</td>

						<td class="subject">
							<a href="${pageContext.request.contextPath}/notice_detail.jsp" class="text-color-black"> 마켓셀리 오프라인 매장 안내 </a>
						</td>

						<td class="text-color-black">MarketSally</td>

						<td>2022-07-03</td>

						<td>329876</td>
					</tr>

					<tr>
						<td>6</td>

						<td class="subject">
							<a href="#"> 마켓셀리 식품유형변경 안내 공지 </a>
						</td>

						<td style="color: black">MarketSally</td>

						<td>2022-07-03</td>

						<td>7</td>
					</tr>

					<tr>
						<td>5</td>

						<td class="subject">
							<a href="#"> 품절된 제품 재입고 신청하는 방법 </a>
						</td>

						<td style="color: black">MarketSally</td>

						<td>2022-07-03</td>
					</tr>

					<tr>
						<td>4</td>

						<td class="subject">
							<a href="#"> 온라인 구매 시 온라인에서만 교환반품 가능합니다 </a>
						</td>

						<td style="color: black">MarketSally</td>

						<td>2022-07-03</td>
					</tr>

					<tr>
						<td>3</td>

						<td class="subject">
							<a href="#"> 선물포장 서비스 안내 </a>
						</td>

						<td style="color: black">MarketSally</td>

						<td>2022-07-03</td>
					</tr>

					<tr>
						<td>2</td>

						<td class="subject">
							<a href="#"> 마켓셀리 배송 안내 </a>
						</td>

						<td style="color: black">MarketSally</td>

						<td>2022-07-03</td>
					</tr>

					<tr>

						<td>1</td>

						<td class="subject">
							<a href="#"> 종이박스 포장재 회수 종료 안내 </a>
						</td>

						<td class="text-color-black">MarketSally</td>

						<td>2022-07-03</td>
					</tr>

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
			</div>
		</div>
	</div>
</section>






<!-- 해당페이지 작성부분 끝 -->

<%-- 스크립트 적용시 아래에 예시처럼 해당위치에 작성
<script type="text/javascript" src="${pageContext.request.contextPath}/js/해당페이지이름.js"></script> 
--%>

<%@include file="/WEB-INF/views/include/footer.jsp"%>