<%@page import="java.util.List"%>
<%@page import="kr.or.marketsally.freqna.vo.FreqnaVO"%>
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
							<a href="${pageContext.request.contextPath}/noticeList.do">공지사항</a>
						</td>
					</tr>
					<tr>
						<td class="sidebar-active">
							<a id="sidebarActiveFont" href="${pageContext.request.contextPath}/freqnaList.do">자주하는 질문</a>
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
					자주하는 질문<span class="sub"> 고객님들께서 가장 자주하시는 질문을 모두 모았습니다.</span>
				</div>
				<br>

			<form method="post" action="${pageContext.request.contextPath}/freqnaAdd.do">
				<table id="notice_table">
					<tr>
						<th width="100">작성자</th>
						<th width="100">카테고리</th>
						<th width="640">제목</th>
					</tr>
					<!-- <c:forEach var="vo" items="달러{list}"> -->
					<!-- 질문게시글 -->
					<tr data-toggle="" data-target="#qna1" class="accordion-toggle">
						<!-- 번호 -->
						<td><input type="text" class="table-input" name ="mem_id" placeholder="로그인세션으로 수정" style="width:100%; border: 0;"/></td>
						<!-- 카테고리 -->
						<td>
							<select name="freq_cate">
								<option value="서비스 이용">서비스 이용</option>
								<option value="배송">배송</option>
								<option value="취소/교환/환불">취소/교환/환불</option>
								<option value="이벤트/쿠폰/적립금">이벤트/쿠폰/적립금</option>
								<option value="주문/결제">주문/결제</option>
								<option value="회원">회원</option>
								<option value="시스템오류">시스템오류</option>
							</select> 
						</td>
						<!-- 제목 -->
						<td class="text-left" style="padding-left:10px;"> <input type="text" id="freq-title" class="table-input" name ="freq_title" placeholder="제목을 입력해주세요" style="width:100%; border: 0;"/></td>
					</tr>
					<!-- /질문게시글 -->
					
					<!-- 숨겨진내용 -->
					<tr>
							<td colspan="3" class=""><br>
								<!-- id 로 질문글과 답변글이 연결되니 나중에 id="qna달러{질문id}"로 설정하여 가져와야할듯 -->
								<div id="qna1" class="">
									<!-- 나중에 내용입력할때 <br>로 바꿔주는거 기능 잊지않기 -->
									<textarea name="freq_cont" rows="10" style="width:100%; border: 0; resize:none;"></textarea>
								</div>
								<br>
							</td>
					</tr>
					<!-- /숨겨진내용 -->
					<!-- </c:forEach> -->
				</table>
				<!-- 관리자용 버튼 -->
				<div class="text-right mt-3 mr-4">
					<button class="w-btn" type="submit">작성</button>
					<button class="w-btn" type="button" onclick="location.href='${pageContext.request.contextPath}/freqnaList.do'">목록</button>
				</div>
		</form>

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