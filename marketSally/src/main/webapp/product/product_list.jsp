<%@page import="kr.or.marketsally.product.vo.ProdVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/views/include/header.jsp"%>


<!-- 내용 -->
<% int cnt = (int)request.getAttribute("cnt"); %>


<section class="container">



	<div class="mt-4 justify-content-center">
		<!-- 상품배너 -->
		<img src="${contextPath}/img/categorybanner/categorybanner1.webp" alt="categorybanner1.jsp">
	</div>

	<h3 class="text-center mt-5">전체보기</h3>

	<div id="product_list_category">

		<ul class="list-group list-group-horizontal-md border justify-content-between p-2 my-4 text-hover-purple">
			<li class="list-group-item border-0"><a href="#" class="<%=request.getContextPath() %>/ProdList.do">전체보기</a></li>
			<li class="list-group-item border-0"><a href="${contextPath}/ProdList_Lprod.do?lprodId=1" class="text-decoration-none">채소</a></li>
			<li class="list-group-item border-0"><a href="${contextPath}/ProdList_Lprod.do?lprodId=2" class="text-decoration-none">과일·견과·쌀</a></li>
			<li class="list-group-item border-0"><a href="${contextPath}/ProdList_Lprod.do?lprodId=3" class="text-decoration-none">수산·해산·건어물</a></li>
			<li class="list-group-item border-0"><a href="${contextPath}/ProdList_Lprod.do?lprodId=4" class="text-decoration-none">정육·계란</a></li>
			<li class="list-group-item border-0"><a href="${contextPath}/ProdList_Lprod.do?lprodId=5" class="text-decoration-none">국·반찬·메인요리</a></li>
		</ul>
	</div>

		<div class="row">
				<div class="col">
						<span class="font-weight-bold"> 총 <%=cnt %>개 </span>
				</div>
				
				<div id="product_list_orderby" class="col text-right mr-5 text-hover-purple text-secondary">
						<a href="#" class="text-decoration-none">신상품순</a> |
						<a href="#" class="text-decoration-none">판매량순</a> |
						<a href="#" class="text-decoration-none">낮은가격순</a> |
						<a href="#" class="text-decoration-none">높은가격순</a>
				</div>
			</div>
			
			
<%
	List<ProdVO> list  = (List<ProdVO>)request.getAttribute("prodList");
%>

		<div class="row">
		
<% 	for(ProdVO prodvo : list){ %>		

			<div class="col-4 my-3">
				<div class="card border-light" style="width: 19rem;">
					<div class="product">
						<a href="<%=request.getContextPath() %>/ProdDetail.do?prodId=<%=prodvo.getProd_id() %>">
							<img src="<%=request.getContextPath() %>/img/product/<%=prodvo.getProd_img() %>" class="card-img-top" alt="<%=prodvo.getProd_img() %>.JPG">
						</a>
						<img class="cart"></img>
					</div>
					<div class="card-body">
						<p class="card-text ">
							<%=prodvo.getProd_name() %> <br> <span class="font-weight-bold"><fmt:formatNumber maxFractionDigits="3" value="<%=prodvo.getProd_price() %>" type="number" /> 원</span>
						</p>
					</div>
				</div>
			</div>
<% } %>
			

		</div> <!-- col-4 my-3 -->



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

</section>
<!-- /내용-->


<%@include file="/WEB-INF/views/include/footer.jsp"%>