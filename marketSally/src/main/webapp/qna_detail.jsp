<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/views/include/header.jsp"%>
<!-- 
css 적용은 해당페이지이름.css 로 css폴더에 작성 후 style.css 에서 주소 import 작성
html,body 태그 작성 X
-->

<!-- 해당페이지 작성부분 시작 -->
<section class="container justify-content-center">
	<br> <br> <br>
	<div id="notice_title" class="text-center">
		1:1 문의<span class="sub"><br> 셀리에게 질문해 주시면 최대한 빠르게 답변해 드립니다.</span>
	</div>
	<br> <br>
	<table class="detail_table">
		<tr>
			<th>제목</th>
			<td colspan="3">
				[배송]<i class="fa-solid fa-lock mx-1"></i>배송이 안옵니다 ㅡㅡ
			</td>
		</tr>
		<tr>
			<th>작성자</th>
			<td colspan="3">DBman</td>
		</tr>
		<tr>
			<th>작성일</th>
			<td style="width: 150px;" class="p-10">2022-07-31</td>

			<th>조회수</th>
			<td class="p-10">329876</td>

		</tr>
		<tr>
			<th>내용</th>
			<td colspan="3" class="content p-10">
				저번달에 시킨거 같은데 아직도 안오네요....<br>
				내용물이 벌써 상했겠네요.
			</td>
		</tr>
	</table>

	<div class="text-right mt-3">

		<button type="button" id="modifyBtn" class="w-btn">수정</button>
		<button type="button" id="removeBtn" class="w-btn">삭제</button>
		<button type="button" id="replyBtn" class="w-btn w-auto">답변쓰기</button>

		<button type="button" id="listBtn" class="w-btn">목록</button>
	</div>


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
<script type="text/javascript" src="${pageContext.request.contextPath}/js/notice_detail.js"></script>

<%@include file="/WEB-INF/views/include/footer.jsp"%>