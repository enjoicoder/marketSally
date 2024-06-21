<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/views/include/header.jsp"%>
<!-- 
css 적용은 해당페이지이름.css 로 css폴더에 작성 후 style.css 에서 주소 import 작성
html,body 태그 작성 X
-->

<!-- 해당페이지 작성부분 시작 -->
<section class="container-xl justify-content-center">

	<div class="row">
		<!-- 사이드바 -->
		<div class="col-md-2">
			<br> <br> <br>
			<div id="notice_title">관리자페이지</div>
			<br>

			<table class="table table-hover sidebar-nav">
				<tbody>
					<tr>
						<td>
							<a href="${pageContext.request.contextPath}/index.jsp">상품관리</a>
						</td>
					</tr>
					<tr>
						<td class="sidebar-active">
							<a id="sidebarActiveFont" href="#">회원관리</a>
						</td>
					</tr>
					<tr>
						<td>
							<a href="#">쿠폰관리</a>
						</td>
					</tr>
					<tr>
						<td>
							<a href="#">주문현황</a>
						</td>
					</tr>
					<tr>
						<td>
							<a href="#">매출현황</a>
						</td>
					</tr>
					<tr>
						<td>
							<a href="#">상품문의</a>
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
					회원관리
				</div>
				<div class="v-line"></div>
				<br>

				<table id="notice_table">
					<tr>
						<th width="80">회원ID</th>
						<th width="80">이름</th>
						<th width="100">이메일</th>
						<!-- <th width="80">성별</th> -->
						<th width="120">전화번호</th>
						<th width="140">주소</th>
						<th width="100">적립금</th>
						<th width="100">회원등급</th>
						<th width="100">가입일</th>
						<th width="80">관리</th>
					</tr>

					<tr>
						<td>ddit</td>

						<td class="text-center subject">
							홍길동
						</td>

						<td>
							java@gmail.com
						</td>

						<!-- <td>남성</td> -->

						<td>010-1111-2222</td>
						
						<td>안드로메다 오류동</td>
						
						<td>5400</td>
						<!-- 회원등급 -->
						<td>
							<select class="form-control form-control-sm">
								<option>탈퇴</option>
								<option>브론즈</option>
								<option>실버</option>
								<option>골드</option>
								<option>다이아</option>
								<option>관리자</option>
							</select>
						</td>
						<!-- 가입일 -->
						<td>2022-07-03</td>
						<td>
						<input type="button" value="수정">
						<input type="button" value="삭제">
						
						</td>
					</tr>

			

		

		
				

				</table>
				
				<!-- 관리자용 버튼 -->
				<div class="text-right mt-3 mr-4">
					<button class="w-btn w-auto" type="button" onclick="#">상품등록</button>
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