<%@page import="java.io.PrintWriter"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/views/include/header.jsp"%>
<!-- 
css 적용은 해당페이지이름.css 로 css폴더에 작성 후 style.css 에서 주소 import 작성
html,body 태그 작성 X
-->

<script>
$(function(){
	
	// 아이디 중복검사
	$('#idCheck').on('click', function(){
		inputId = $("#logId").val().trim();
		
		if(inputId.length < 1){
			alert("아이디를 입력하세요");
			return false;
		}
		
		$.ajax({
			
			url : "<%=request.getContextPath()%>/checkID.do",
			type : "get",
			data : {"id" : inputId},
			dataType : "json",
			success: function(checkedId){
				if(checkedId == "ok"){
					$("#spanId").html("사용가능한 아이디 입니다.").css('color', 'yellowgreen');
				}else{
					$("#spanId").html("이미 사용중인 아이디 입니다.").css('color', 'red');
				}
					
			},
			error: function(xhr){
				alert("상태: " + xhr.status);
			}
		})
	}) // 중복검사 끝... 
	
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
	
	// 아이디 정규식 첫글자 소문자 6글자 이상
	$("#logId").on('keyup', function(){
		logValue = $(this).val().trim();
		
		logRule = /^[a-z][a-zA-Z0-9]{5,11}$/
		if(logRule.test(logValue)){
			$(this).css('border', '2px solid yellowgreen');
			$("#idCheck").prop("disabled", false)
		}else{
			$(this).css('border', '2px solid red');
			$("#idCheck").prop("disabled", true)
			
		}
	})
	
	// 비밀번호 확인
	$("#repassword").on("keyup", function(){
		$("#spanPass").empty()
		var pass = $("#password").val().trim();

		var checkpass = $(this).val().trim();
		
		if(checkpass == pass){
			$(this).css('border', '2px solid yellowgreen');
		}else{
			$("#spanPass").html("비밀번호가 일치하지 않습니다.").css('color', 'red');
		}
		
	})
	
	// 주소 검색
	$("#addressNo").click(function() {
		new daum.Postcode({
			oncomplete: function(data) {
				join.zipcode.value = data.zonecode;

				join.address.value = data.roadAddress;
			}
		}).open();
	});
})
	
</script>

<style>
#spanId, #spanEmail{
	margin:auto;
}
</style>


<!-- 해당페이지 작성부분 시작 -->

<section class="container justify-content-center">

	<h3 class="text-center my-5">회원가입</h3>

	<div class="page_article mx-auto text-sm-right">
		<span class="text-color-red">*</span>필수입력사항
	</div>
	<div class="page_article mx-auto">
		<div class="v-line">
			<br>
		</div>
		<div class="type_form member_join mt-1">
			<form action="<%=request.getContextPath() %>/joinMember.do" method="post" id="join">
				<input type="hidden" name="idCheckResult" id="idCheckResult" value="0">
				<input type="hidden" name="emailCheckResult" id="emailCheckResult" value="0">


				<div class="form-group row px-2">
					<label for="id" class="col-sm-3 col-form-label"> 아이디<span class="text-color-red">*</span>
					</label>
					<div class="col-sm-7">
						<input type="text" class="form-control" name="mem_logid" id="logId" placeholder="6자 이상의 영문 혹은 영문과 숫자를 조합">
					</div>
					<div class="col-sm-2 px-1 my-auto">
						<input type = "button" class="btn default" id="idCheck" value = "중복확인">
					</div>
						<span id = "spanId"></span>
				</div>

				<div class="form-group row px-2">
					<label for="password" class="col-sm-3 col-form-label"> 비밀번호<span class="text-color-red">*</span>
					</label>
					<div class="col-sm-7">
						<input type="password" class="form-control" name="mem_pass" id="password" placeholder="비밀번호를 입력해주세요">
					</div>

				</div>

				<div class="form-group row px-2">
					<label for="repassword" class="col-sm-3 col-form-label pr-0"> 비밀번호확인<span class="text-color-red">*</span>
					<br><span class="" id = "spanPass"></span>
					</label>
					<div class="col-sm-7">
						<input type="password" class="form-control" name="repassword" id="repassword" placeholder="비밀번호를 한번 더 입력해주세요">
					</div>

				</div>

				<div class="form-group row px-2">
					<label for="name" class="col-sm-3 col-form-label"> 이름<span class="text-color-red">*</span>
					</label>
					<div class="col-sm-7">
						<input type="text" class="form-control" name="mem_name" id="name" placeholder="이름을 입력해주세요">
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
					<label for="mobile1" class="col-sm-3 col-form-label"> 휴대폰<span class="text-color-red">*</span>
					</label>
					<div class="col-sm-2">
						<input type="text" class="form-control" name="mobile1" id="mobile1" maxlength="3">
					</div>
					<div class="col-sm-3">
						<input type="text" class="form-control" name="mobile2" id="mobile2" maxlength="4">
					</div>
					<div class="col-sm-2">
						<input type="text" class="form-control" name="mobile3" id="mobile3" maxlength="4">
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
					<input type="hidden" name="mem_grade" id="grade" value="1">
					<input type="hidden" name="mem_gender" id="gender" value="male">
					<input type="hidden" name="mem_bir" id="birth" value="2000-01-01">
					<input type="hidden" name="mem_point" id="point" value="0">

				<div class="v-line">
					<br>
				</div>
				<div id="formSubmit" class="form_footer">
					<button type="submit" class="btn active btn_join">가입하기</button>
				</div>
			</form>
		</div>
	</div>




</section>





<!-- 해당페이지 작성부분 끝 -->

<%-- 스크립트 적용시 아래에 예시처럼 해당위치에 작성
<script type="text/javascript" src="${pageContext.request.contextPath}/js/해당페이지이름.js"></script> 
--%>

<!-- 카카오 주소API key 없이 쉽게 가능 -->
<!-- 사용 가이드 https://postcode.map.daum.net/guide -->
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

<script type="text/javascript" src="${pageContext.request.contextPath}/js/join_test.js"></script>

<%@include file="/WEB-INF/views/include/footer.jsp"%>