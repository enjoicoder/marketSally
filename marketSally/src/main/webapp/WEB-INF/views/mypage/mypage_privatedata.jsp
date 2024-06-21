<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/views/include/header.jsp"%>
<!-- 
css 적용은 해당페이지이름.css 로 css폴더에 작성 후 style.css 에서 주소 import 작성
html,body 태그 작성 X
-->

<!-- 해당페이지 작성부분 시작 -->
<c:if test="${empty sessionMember}">
	<script>
		alert("로그인 해주세요");
		history.back();
	</script>
</c:if>

<script>
	$(function(){
		
		// 비밀번호 확인
		$("#check").on("click", function(){
			checkPass = $("#password").val().trim();
			
			if(checkPass.length < 1){
				alert("비밀번호를 입력하세요");
				return false;
			}
			
			$.ajax({
				url : "<%=request.getContextPath()%>/checkPass.do",
				type : "get",
				data : {"pass" : checkPass},
				dataType : "json",
				success : function(res){
					if(res == "ok"){
						 location.href="<%= request.getContextPath()%>/mypage_privateupdate.do"
					}else{
						alert("비밀번호를 확인해주세요.")
					}
						
				},
				error : function(xhr){
					alert("비밀번호를 확인해주세요.")
					location.href="<%= request.getContextPath()%>/mypage_privatedata.do"
				}
			})
		})
	})
</script>

<!-- 마이페이지 회원등급창 -->
<%@include file="/WEB-INF/views/mypage/mypage_header.jsp"%>
<!-- /마이페이지 회원등급창 -->

<section class="container justify-content-center">

	<div class="row">
		<!-- 사이드바 -->
		<div class="col-md-2">
			<br> <br> <br>
			<div id="notice_title">마이셀리</div>
			<br>

			<table class="table table-hover sidebar-nav">
				<tbody>
					<tr>
						<td class="sidebar-active">
							<a id="sidebarActiveFont" href="${contextPath}/mypage_order.do">주문내역</a>
						</td>
					</tr>
					<tr>
						<td>
							<a href="#">찜한상품</a>
						</td>
					</tr>
					<tr>
						<td>
							<a href="${contextPath}/mypage_review.do">상품후기</a>
						</td>
					</tr>
					<tr>
						<td>
							<a href="#">상품문의</a>
						</td>
					</tr>
					<tr>
						<td>
							<a href="#">적립금</a>
						</td>
					</tr>
					<tr>
						<td>
							<a href="#">쿠폰</a>
						</td>
					</tr>
					<tr>
						<td>
							<a href="${contextPath}/mypage_privatedata.do">개인정보수정</a>
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
					개인정보 수정<span class="sub"></span>
				</div>
				<div class="v-line"></div>
				<br><br><br><br><br><br>
				
			    비밀번호 <input type = "password" name = "mem_pass" id = "password">
			    <button type="submit" class="btn active btn_join" id = "check">확인</button>

			</div>
		</div>
	</div>
</section>

			

<!-- 해당페이지 작성부분 끝 -->

<%-- 스크립트 적용시 아래에 예시처럼 해당위치에 작성
<script type="text/javascript" src="${pageContext.request.contextPath}/js/해당페이지이름.js"></script> 
--%>

<%@include file="/WEB-INF/views/include/footer.jsp"%>