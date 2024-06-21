<%@page import="java.util.List"%>
<%@page import="kr.or.marketsally.oneqna.vo.OneqnaVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/views/include/header.jsp"%>
<!-- 
css 적용은 해당페이지이름.css 로 css폴더에 작성 후 style.css 에서 주소 import 작성
html,body 태그 작성 X
-->

<!-- 해당페이지 작성부분 시작 -->
<%	
	List<OneqnaVO> oneqnaList =(List<OneqnaVO>)request.getAttribute("getOneqnaDetail");
	
	OneqnaVO oneQVo = oneqnaList.get(0);
	OneqnaVO oneAVo=null;
	if(oneqnaList.size()>1){	//답변완료이면 2개 검색됨
		oneAVo = oneqnaList.get(1);
	}
%>
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
				[<%=oneQVo.getOneq_status()%>]  <%=oneQVo.getOneq_title() %><%if(oneQVo.getOneq_sec().equals("on")){ %>  <i class="fa-solid fa-lock"></i><%} %>
			</td>
		</tr>
		<tr>
			<th>작성자</th>
			<td colspan="3"><%=oneQVo.getMem_id() %></td>
		</tr>
		<tr>
			<th>작성일</th>
			<td style="width: 150px;" class="p-10"><%=oneQVo.getOneq_date() %></td>

			<th>조회수</th>
			<td class="p-10"><%=oneQVo.getOneq_cnt() %></td>

		</tr>
		<tr>
			<th>내용</th>
			<td colspan="3" class="content p-10">
				<%=oneQVo.getOneq_cont() %>
			</td>
		</tr>
	</table>

	<div class="text-right mt-3">
		<%if(oneqnaList.size()==1){ %>
			<button type="button" id="modifyBtn" class="w-btn" onclick="location.href='${pageContext.request.contextPath}/oneqnaUpdateFormQ.do?oneq_id=<%=oneQVo.getOneq_id()%>&oneq_title=<%=oneQVo.getOneq_title()%>&mem_id=<%=oneQVo.getMem_id()%>&oneq_status=<%=oneQVo.getOneq_status()%>&oneq_cont=<%=oneQVo.getOneq_cont()%>'">수정</button>	<%} %>
		<button type="button" id="removeBtn" class="w-btn">삭제</button>
		<%if(oneQVo.getMem_id().equals("00")){ //관리자id로 나중에 수정 %>	
			<button type="button" id="replyBtn" class="w-btn w-auto">답변쓰기</button>	<%} %>

		<button type="button" id="listBtn" class="w-btn" onclick="location.href='${pageContext.request.contextPath}/oneqnaList.do'">목록</button>
	</div>


	<form method="post" id="menuForm">

		<input type="hidden" name="num" value="7">


		<input type="hidden" name="pageNum" value="1">
	</form>

<% 
	if(oneqnaList.size()>1){
%>
	<table class="detail_table2 w-100 my-4">
		<tr>
			<th style="width: 100px;" class="p-15">답변글</th>
			<td>
				[<%=oneAVo.getOneq_status() %>]<%=oneAVo.getOneq_title() %><%if(oneAVo.getOneq_sec().equals("on")){ %><i class="fa-solid fa-lock"></i><%} %>
			</td>
		</tr>
		<tr>
			<th>내용</th>
			<td colspan="3" class="content p-10">
				<%=oneAVo.getOneq_cont() %>
			</td>
		</tr>
	</table>
<%
	} 
%>
</section>



<!-- 해당페이지 작성부분 끝 -->

<%-- 스크립트 적용시 아래에 예시처럼 해당위치에 작성
<script type="text/javascript" src="${pageContext.request.contextPath}/js/해당페이지이름.js"></script> 
--%>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/notice_detail.js"></script>

<%@include file="/WEB-INF/views/include/footer.jsp"%>