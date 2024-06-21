<%@page import="kr.or.marketsally.notice.vo.NoticeVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/views/include/header.jsp"%>
<!-- 
css 적용은 해당페이지이름.css 로 css폴더에 작성 후 style.css 에서 주소 import 작성
html,body 태그 작성 X
-->

<!-- 해당페이지 작성부분 시작 -->
<%	
	NoticeVO noticeVo=(NoticeVO)request.getAttribute("getNoticeDetail");
%>
<section class="container justify-content-center">
	<br> <br> <br>
	<div id="notice_title" class="text-center">
		공지사항<span class="sub"><br> 셀리의 새로운 소식들과 유용한 정보들을 한곳에서 확인하세요.</span>
	</div>
	<br> <br>
	<table class="detail_table">
		<tr>
			<th>제목</th>
			<td colspan="3"><%= noticeVo.getNotice_title()%></td>
		</tr>
		<tr>
			<th>작성자</th>
			<td colspan="3"><%=noticeVo.getMem_name() %></td>
		</tr>
		<tr>
			<th>작성일</th>
			<td style="width: 150px;" class="p-10"><%= noticeVo.getNotice_date() %></td>

			<th>조회수</th>
			<td class="p-10"><%= noticeVo.getNotice_cnt()%></td>

		</tr>
		<tr>
			<th>내용</th>
			<td colspan="3" class="detail-content p-10">
				<pre><%= noticeVo.getNotice_cont()%></pre>
			</td>
		</tr>
	</table>

	<div class="text-right mt-3">
		<form method="get" action="/noticeDelete.do?mem_id=<%=noticeVo.getMem_id()%>&notice_id=<%=noticeVo.getNotice_id()%>"></form>
		<button type="button" id="modifyBtn" class="w-btn" onclick="location.href='${pageContext.request.contextPath}/noticeUpdateForm.do?mem_id=<%=noticeVo.getMem_id()%>&notice_id=<%=noticeVo.getNotice_id()%>'">수정</button>
		<button type="button" id="removeBtn" class="w-btn" onClick="location.href='${pageContext.request.contextPath}/noticeDelete.do?mem_id=<%=noticeVo.getMem_id()%>&notice_id=<%=noticeVo.getNotice_id()%>'">삭제</button>

		<button type="button" id="listBtn" class="w-btn" onClick="location.href='${pageContext.request.contextPath}/noticeList.do'">목록</button>
	</div>


	<form method="post" id="menuForm">

		<input type="hidden" name="num" value="7">


		<input type="hidden" name="pageNum" value="1">
	</form>

	<table class="detail_table2 w-100 my-4">
		<tr>
			<th style="width: 100px;" class="p-15"><i class="fa-solid fa-angle-up"></i>이전글</th>
			<td>
				<a href="#" class="text-color-black text-decoration-none">[가격인상공지][탄단지]냉장 닭가슴살 버라이어티 팩(5개입)(2022.8.1~)</a>
			</td>
		</tr>
		<tr>
			<th><i class="fa-solid fa-angle-down"></i>다음글</th>
			<td>
			<a href="#" class="text-color-black text-decoration-none">[가격인상공지][곰표X콜린스그린]그래놀라 요거트 외6건(2022.7.28~)</a>
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