<%@page import="java.util.ArrayList"%>
<%@page import="kr.or.marketsally.product.vo.ProdVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/views/include/header.jsp"%>
<!-- 
css 적용은 해당페이지이름.css 로 css폴더에 작성 후 style.css 에서 주소 import 작성
html,body 태그 작성 X
-->
<style> /*왜 나는 css파일 import했는데 적용이 안됨???*/
img.admin_product_img{
	width : 100px;
	height : 120px;
}
</style>


<!-- 해당페이지 작성부분 시작 -->
<section class="container justify-content-center">

	<div class="row">
		<!-- 사이드바 -->
		<div class="col-md-2">
			<br> <br> <br>
			<div id="notice_title">관리자페이지</div>
			<br>

			<table class="table table-hover sidebar-nav">
				<tbody>
					<tr>
						<td class="sidebar-active">
							<a id="sidebarActiveFont" href="${pageContext.request.contextPath}/notice.jsp">상품관리</a>
						</td>
					</tr>
					<tr>
						<td>
							<a href="${pageContext.request.contextPath}/adminMember.do">회원관리</a>
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
					상품관리
				</div>
				<div class="v-line"></div>
				<br>


<!-- 상품 리스트 출력 -->				
<%
List<ProdVO> list  = (List<ProdVO>)request.getAttribute("prodList");
%>

				<table id="notice_table">
					<tr>
						<th width="100">상품코드</th>
						<th width="300">상품명</th>
						<th width="80">상품이미지</th>
						<th width="140">카테고리</th>
						<th width="80">판매가</th>
						<th width="100">등록일</th>
						<th width="100">관리</th>
					</tr>


<% 	for(ProdVO prodvo : list){ %>	
					<tr>
						<td><%=prodvo.getProd_id() %></td>

						<td class="text-center subject">
							<a href="${pageContext.request.contextPath}/ProdDetail.do?prodId=<%=prodvo.getProd_id() %>" class="text-color-black"> <%=prodvo.getProd_name() %> </a>
						</td>

						<td>
							<img class="admin_product_img" src="<%=request.getContextPath() %>/ProdImgView.do?prodID=<%=prodvo.getProd_id() %>">
						</td>

						<td><%=prodvo.getLprod_name() %></td>

						<td><fmt:formatNumber maxFractionDigits="3" value="<%=prodvo.getProd_price() %>" type="number" />
						</td>
						
						<td><%=prodvo.getProd_date() %></td>
						<td>
						<input type="button" value="수정" onclick="location.href = '<%=request.getContextPath()%>/ProdUpdateBefore.do?prodID=<%=prodvo.getProd_id() %>'">
						<input type="button" value="삭제" onclick="location.href = '<%=request.getContextPath()%>/ProdDelete.do?prodID=<%=prodvo.getProd_id() %>'">
						
						</td>
					</tr>
<% } %>					
					

			

		

		
				

				</table>
				
				<!-- 관리자용 버튼 -->
				<div class="text-right mt-3 mr-4">
					<button class="w-btn w-auto" type="button" onclick="location.href='product/product_insert.jsp'">상품등록</button>
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