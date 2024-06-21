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
		
<%-- 		// 현재 비밀번호 확인
		$("#check").on("click", function(){
			var presentPass = $("#pass").val().trim();
			
			if(presentPass.length < 1){
				alert("비밀번호를 입력하세요");
				return false;
			}
			
			$.ajax({
				url : "<%=request.getContextPath()%>/checkPass.do",
				type : "get",
				data : {"pass" : presentPass},
				dataType : "json",
				success : function(res){
					if(res == "ok"){
						 location.href=""
					}else{
						alert("현재비밀번호를 확인해주세요.")
					}
						
				},
				error : function(xhr){
					alert("상태: " + xhr.status);
				}
			})
		}) // 현재 비밀번호 확인 끝
		 --%>
		// 새비밀번호 확인
		$("#repassword").on("keyup", function(){
			$("#spanPass").empty()
			var pass = $("#newpassword").val().trim();
	
			var checkpass = $(this).val().trim();
			
			if(checkpass == pass){
				$(this).css('border', '2px solid yellowgreen');
			}else{
				$("#spanPass").html("비밀번호가 일치하지 않습니다.").css('color', 'red');
			}
			
		}) // 새비밀번호 확인 끝
		
		$("#addressNo").click(function() {
			new daum.Postcode({
				oncomplete: function(data) {
					update.zipcode.value = data.zonecode;

					update.address.value = data.roadAddress;
				}
			}).open();
		}); // 주소 입력 끝
		
		// 이메일 중복검사
		$('#emailCheck').on('click', function(){
			inputEmail = $("#email").val().trim();
			
			if(inputEmail.length < 1){
				alert("email을 입력하세요");
				return false;
			}
			
			$.ajax({
				
				url : "<%=request.getContextPath()%>/checkEmail.do",
				type : "get",
				data : {"email" : inputEmail},
				dataType : "json",
				success: function(checkedIEmail){
					if(checkedIEmail == "ok"){
						$("#spanEmail").html("사용가능한 이메일 입니다.").css('color', 'yellowgreen');
					}else{
						$("#spanEmail").html("이미 사용중인 이메일 입니다.").css('color', 'red');
					}
						
				},
				error: function(xhr){
					alert("상태: " + xhr.status);
				}
			})
		}) // 중복검사 끝... 
		
		
		
		
		// 수정하기 
		$(".submit").on("click", function(){
			var submitResult = true;
			
			if(presentPass == pass){
				alert("기존 비밀번호와 다른 비밀번호를 사용해주세요.");
				submitResult = false;
			}
			
			return sumitResult;
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
				<br>
				
				<div class="page_article mx-auto text-sm-right">
					<span class="text-color-red">*</span>수정가능항목
				</div>
				<div class="page_article mx-auto">
					<div class="v-line">
						<br>
					</div>
					<div class="type_form member_join mt-1">
						<form action="<%=request.getContextPath() %>/updateSally.do" method="post" id="update">
							<input type="hidden" name="idCheckResult" id="idCheckResult" value="0">
							<input type="hidden" name="emailCheckResult" id="emailCheckResult" value="0">
			
			
							<div class="form-group row px-2">
								<label for="id" class="col-sm-3 col-form-label"> 아이디
								</label>
								<div class="col-sm-7">
									<input type="text" class="form-control" name="mem_logid" id="logId" value= "${sessionMember.mem_logid}" placeholder="${sessionMember.mem_logid}" readonly>
								</div>
							</div>
							<!-- 
							<div class="form-group row px-2">
								<label for="password" class="col-sm-3 col-form-label"> 현재비밀번호<span class="text-color-red">*</span>
								</label>
								<div class="col-sm-7">
									<input type="password" class="form-control" name="pass" id="pass" placeholder="현재비밀번호를 입력해주세요">
								</div>
							</div>
							 -->
							 
							<div class="form-group row px-2">
								<label for="password" class="col-sm-3 col-form-label"> 새비밀번호<span class="text-color-red">*</span>
								</label>
								<div class="col-sm-7">
									<input type="password" class="form-control" name="mem_pass" id="newpassword" placeholder="새비밀번호를 입력해주세요">
								</div>
			
							</div>
			
							<div class="form-group row px-2">
								<label for="repassword" class="col-sm-3 col-form-label pr-0"> 새비밀번호확인<span class="text-color-red">*</span>
								<br><span class="" id = "spanPass"></span>
								</label>
								<div class="col-sm-7">
									<input type="password" class="form-control" name="repassword" id="repassword" placeholder="새비밀번호를 한번 더 입력해주세요">
								</div>
			
							</div>
			
							<div class="form-group row px-2">
								<label for="name" class="col-sm-3 col-form-label"> 이름
								</label>
								<div class="col-sm-7">
									<input type="text" class="form-control" name="mem_name" id="name" placeholder="${sessionMember.mem_name}" readonly>
								</div>
			
							</div>
			
							<div class="form-group row px-2">
								<label for="email" class="col-sm-3 col-form-label"> 이메일<span class="text-color-red">*</span>
								</label>
								<div class="col-sm-7">
									<input type="text" class="form-control" name="mem_email" class="email" id="email" placeholder="예: marketsally@sally.com">
								</div>
								<div class="col-sm-2 px-1 my-auto">
									<span class="btn default" id="emailCheck">중복확인</span>
								</div>
								<span id = "spanEmail"></span>
			
							</div>
			
							<div class="form-group row px-2">
								<label for="mobile1" class="col-sm-3 col-form-label"> 휴대폰
								</label>
								<div class="col-sm-7">
									<input type="text" class="form-control" name="mem_tel" class="tel" id="tel" placeholder="${sessionMember.mem_tel}" readonly>
								</div>
			
							</div>
			
							<div class="form-group row px-2">
								<label for="zipcode" class="col-sm-3 col-form-label"> 주소<span class="text-color-red">*</span>
								</label>
			
			
								<div class="col-sm-7">
									<input type="text" class="form-control" name="mem_add" id="address" readonly="readonly" placeholder="주소를 검색해주세요." value = "ddit"><br>
									<input type="text" class="form-control" name="zipcode" id="zipcode" size="7" readonly="readonly" placeholder="번지를 검색해 주세요.">
								</div>
								<div class="col-sm-2 px-0">
									<span class="btn default address_no" data-text="재검색" id="addressNo">주소 검색</span>
								</div>
			
							</div>
								<input type="hidden" name="mem_grade" id="grade" value="${sessionMember.mem_grade}">
								<input type="hidden" name="mem_gender" id="gender" value="${sessionMember.mem_gender}">
								<input type="hidden" name="mem_bir" id="birth" value="${sessionMember.mem_bir}">
								<input type="hidden" name="mem_point" id="point" value="${sessionMember.mem_point}">
			
							<div class="v-line">
								<br>
							</div>
							<div id="formSubmit" class="form_footer">
								<button type="submit" class="btn active btn_join">수정</button>
							</div>
						</form>
					</div>
				</div>

			</div>
		</div>
	</div>
</section>

			

<!-- 해당페이지 작성부분 끝 -->

<%-- 스크립트 적용시 아래에 예시처럼 해당위치에 작성
<script type="text/javascript" src="${pageContext.request.contextPath}/js/해당페이지이름.js"></script> 
--%>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<%@include file="/WEB-INF/views/include/footer.jsp"%>