<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/views/include/header.jsp"%>
<!-- 
css 적용은 해당페이지이름.css 로 css폴더에 작성 후 style.css 에서 주소 import 작성
html,body 태그 작성 X
-->

<!-- 해당페이지 작성부분 시작 -->
<%	
	Date nowTime = new Date();
	SimpleDateFormat sf = new SimpleDateFormat("yyyy년 MM월 dd일");
%>

<section class="container justify-content-center">
	<br> <br> <br>
	<div id="oneqna_title" class="text-center">
		1:1 문의<span class="sub"><br> 셀리에게 질문해 주시면 최대한 빠르게 답변해 드립니다.</span>
	</div>
	<br> <br>
<form method="post" action="${pageContext.request.contextPath}/oneqnaAddQ.do">
	<table class="detail_table">
		<tr>
			<th>제목</th>
			<td colspan="3">
				<input type="text" class="table-input" name ="oneq_title" placeholder="제목을 입력해주세요" style="width:100%; border: 0;"/>
			</td>
		</tr>
		<tr>
			<th>작성자</th>
			<td colspan="3"><input type="text" class="table-input" name ="mem_id" placeholder="로그인 세션 수정" style="width:100%; border: 0;"/></td>
		</tr>
		<tr>
			<th>분류</th>
			<td class="p-10">
				<select name="oneq_status">
					<option value="서비스 이용">서비스 이용</option>
					<option value="배송">배송</option>
					<option value="취소/교환/환불">취소/교환/환불</option>
					<option value="이벤트/쿠폰/적립금">이벤트/쿠폰/적립금</option>
					<option value="주문/결제">주문/결제</option>
					<option value="회원">회원</option>
					<option value="시스템오류">시스템오류</option>
					<option value="기타">기타</option>
				</select>
			</td>
			
			<th>작성일</th>
			<td style="width: 150px;" class="p-10"><%= sf.format(nowTime) %></td>
		</tr>
		<tr>
			<th>내용</th>
				<td colspan="3" class="detail-content p-10">
					<textarea name="oneq_cont" rows="10" style="width:100%; border: 0; resize:none;"></textarea>
				</td>
		</tr>
	</table>

	<div class="text-right mt-3" style="text-align: center;">
		<label><i class="fa-solid fa-lock"> 비밀글</i><input type="checkbox" name="oneq_sec" class="w-btn" style="size:15px; width:15px; height:15px;"></label><br><br>
		<button type="submit" id="" class="w-btn">등록</button>
		<button type="button" id="listBtn" class="w-btn" onclick="location.href='${pageContext.request.contextPath}/oneqnaList.do'">취소</button>
	</div>
</form>

	<form method="post" id="menuForm">

		<input type="hidden" name="num" value="7">


		<input type="hidden" name="pageNum" value="1">
	</form>

	<table class="detail_table2 w-100 my-4">
		<tr>
			<th style="width: 100px;" class="p-15">답변글</th>
			<td>
				<a href="#" class="text-color-black text-decoration-none">
					[답변]<i class="fa-solid fa-lock mx-1"></i>고양이가 배달중이라 좀 걸립니다.
				</a>
			</td>
		</tr>
	</table>

</section>






<!-- 해당페이지 작성부분 끝 -->

<%-- 스크립트 적용시 아래에 예시처럼 해당위치에 작성
<script type="text/javascript" src="${pageContext.request.contextPath}/js/해당페이지이름.js"></script> 
--%>
<%-- <script type="text/javascript" src="${pageContext.request.contextPath}/js/notice_detail.js"></script> --%>

<%@include file="/WEB-INF/views/include/footer.jsp"%>