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
				
				
				<!-- 상품등록 form -->
				<form id="insertProdForm" method="post" action="<%=request.getContextPath()%>/ProdInsert.do" enctype="multipart/form-data">
				
				

				
				<!-- Text input-->
				<div class="form-group row">
				  <label class="col-md-4 control-label" for="prod_name">상품이름</label>  
				  <div class="col-md-4">
				  <input id="prod_name" name="prod_name" placeholder="" class="form-control input-md" required="required" type="text">
				    
				  </div>
				</div>
				
				<!-- Text input-->
				<div class="form-group row">
				  <label class="col-md-4 control-label" for="prod_id">상품아이디</label>  
				  <div class="col-md-4">
				  <input id="prod_id" name="prod_id" placeholder="F00000000" class="form-control input-md" required="required" type="text">
				    
				  </div>
				</div>
				
				<!-- Text input-->
				<div class="form-group row">
				  <label class="col-md-4 control-label" for="prod_price">상품가격</label>  
				  <div class="col-md-4">
				  <input id="prod_price" name="prod_price" placeholder="" class="form-control input-md" required="required" type="text">
				    
				  </div>
				</div>
				
				<!-- Select Basic -->
				<div class="form-group row">
				  <label class="col-md-4 control-label" for="lprod_id">상품분류</label>
				  <div class="col-md-4">
				    <select id="lprod_id" name="lprod_id" class="form-control">
				    			<option value="1">F101  채소</option>
				      			<option value="2">F201  과일·견과·쌀</option>
				      			<option value="3">F301  수산·해산·건어물</option>
				      			<option value="4">F401  정육·계란</option>
				      			<option value="5">F501  국·반찬·메인요리</option>
				    </select>
				  </div>
				</div>
				
				
				
				<!-- Textarea -->
				<div class="form-group row">
				  <label class="col-md-4 control-label" for="prod_cont">상품설명</label>
				  <div class="col-md-4">                     
				    <textarea class="form-control" id="prod_cont" name="prod_cont"></textarea>
				  </div>
				</div>
				
				   
				 <!-- File Button --> 
				<div class="form-group row">
				  <label class="col-md-4 control-label" for="filebutton">상품이미지</label>
				  <div class="col-md-4">
				    <input id="prod_img" name="prod_img" class="input-file" type="file">
				  </div>
				</div>
				
				
				
				<button class="w-btn w-auto" type="submit" onclick="#">등록하기</button><br><br>
				</form>
			
				<!-- 상품등록 form 끝 -->
				


				
			</div>
		</div>
	</div>
</section>









<!-- 해당페이지 작성부분 끝 -->

<%-- 스크립트 적용시 아래에 예시처럼 해당위치에 작성
<script type="text/javascript" src="${pageContext.request.contextPath}/js/해당페이지이름.js"></script> 
--%>

<%@include file="/WEB-INF/views/include/footer.jsp"%>