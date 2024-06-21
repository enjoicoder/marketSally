<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="kr.or.marketsally.notice.vo.NoticeVO"%>
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
	NoticeVO noticeVo=(NoticeVO)request.getAttribute("getNoticeDetail");
%>

<section class="container justify-content-center">
<form method="post" action="${pageContext.request.contextPath}/noticeUpdate.do?notice_id=<%=noticeVo.getNotice_id()%>&mem_id=<%=noticeVo.getMem_id()%>">

	<br> <br> <br>
	<div id="notice_title" class="text-center">
		공지사항<span class="sub"><br> 셀리의 새로운 소식들과 유용한 정보들을 한곳에서 확인하세요.</span>
	</div>
	<br> <br>
	<table class="detail_table">
		<tr>
			<th>제목</th>
			<td colspan="3"><input type="text" id="notice_title" class="table-input" name ="notice_title" style="width:100%; border: 0;" value="<%=noticeVo.getNotice_title() %>"/></td>
		</tr>
		<tr>
			<th>작성자</th>
			<td colspan="3"><%=noticeVo.getMem_name() %></td>
		</tr>
		<tr>
			<th>작성일</th>
			<td style="width: 150px" class="p-10"><%= sf.format(nowTime) %></td>

		</tr>
		<tr>
			<th>내용</th>
			<td colspan="3" class="detail-content p-10"><textarea name="notice_cont" rows="10" style="width:100%; border: 0; resize:none;"><%=noticeVo.getNotice_cont() %></textarea></td>
		</tr>
	</table>

	<div class="text-right mt-3">

		<button type="button" id="removeBtn" class="w-btn" style="background-color:gray" onClick="location.href='${pageContext.request.contextPath}/noticeList.do'">취소</button>

		<button type="submit" id="submitBtn" class="w-btn" >수정</button>
	</div>


</form>
</section>



<!-- 해당페이지 작성부분 끝 -->

<%-- 스크립트 적용시 아래에 예시처럼 해당위치에 작성
<script type="text/javascript" src="${pageContext.request.contextPath}/js/해당페이지이름.js"></script> 
--%>

<%@include file="/WEB-INF/views/include/footer.jsp"%>