<%@page import="kr.or.marketsally.notice.vo.NoticeVO"%>
<%@page import="java.util.List"%>
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
<%	
	List<NoticeVO> noticeList = (List<NoticeVO>)request.getAttribute("noticeList");
%>
			<div id="notice_title">고객센터</div>
			<br>

			<table class="table table-hover sidebar-nav">
				<tbody>
					<tr>
						<td class="sidebar-active">
							<a id="sidebarActiveFont" href="${pageContext.request.contextPath}/noticeList.do">공지사항</a>
						</td>
					</tr>
					<tr>
						<td>
							<a href="${pageContext.request.contextPath}/freqnaList.do">자주하는 질문</a>
						</td>
					</tr>
					<tr>
						<td>
							<a href="${pageContext.request.contextPath}/oneqnaList.do">1:1 문의</a>
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
<%
	for(NoticeVO noticeVo : noticeList){
%>
					<tr>
						<td><%= noticeVo.getNotice_id() %></td>

						<td class="subject">
							<a href="${pageContext.request.contextPath}/noticeDetail.do?mem_id=<%=noticeVo.getMem_id() %>&notice_id=<%=noticeVo.getNotice_id() %>" class="text-color-black"> <%=noticeVo.getNotice_title() %></a>
						</td>

						<td class="text-color-black"><%=noticeVo.getMem_id()%></td>

						<td><%=noticeVo.getNotice_date() %></td>

						<td><%=noticeVo.getNotice_cnt() %></td>
					</tr>
<%
	}
%>

				</table>
				
				<!-- 관리자용 버튼 -->
				<div class="text-right mt-3 mr-4">
					<button class="w-btn" type="button" onclick="location.href='${pageContext.request.contextPath}/noticeForm.jsp'">글쓰기</button>
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