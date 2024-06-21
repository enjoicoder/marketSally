<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/views/include/header.jsp"%>
<!-- 
css 적용은 해당페이지이름.css 로 css폴더에 작성 후 style.css 에서 주소 import 작성
html,body 태그 작성 X
-->

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
			<form action="" method="post" id="join">
				<input type="hidden" name="idCheckResult" id="idCheckResult" value="0">
				<input type="hidden" name="emailCheckResult" id="emailCheckResult" value="0">


				<div class="form-group row px-2">
					<label for="id" class="col-sm-3 col-form-label"> 아이디<span class="text-color-red">*</span>
					</label>
					<div class="col-sm-7">
						<input type="text" class="form-control" name="id" id="id" placeholder="6자 이상의 영문 혹은 영문과 숫자를 조합">
					</div>
					<div class="col-sm-2 px-1 my-auto">
						<span class="btn default" id="idCheck">중복확인</span>
					</div>

					<div id="idMsg" class="error">아이디를 입력해주세요</div>
					<div id="idRegMsg" class="error">6자 이상의 영문 혹은 영문과 숫자를 조합</div>
					<div id="idCheckMsg" class="error">아이디 중복확인</div>

				</div>

				<div class="form-group row px-2">
					<label for="password" class="col-sm-3 col-form-label"> 비밀번호<span class="text-color-red">*</span>
					</label>
					<div class="col-sm-7">
						<input type="password" class="form-control" name="password" id="password" placeholder="비밀번호를 입력해주세요">
					</div>

					<div id="passwdMsg" class="error">비밀번호를 입력해 주세요</div>
					<div id="passwdRegMsg" class="error">10~16 자리, 영문/숫자/특수문자(공백 제외)만 허용하며, 2개 이상 조합</div>

				</div>

				<div class="form-group row px-2">
					<label for="repassword" class="col-sm-3 col-form-label pr-0"> 비밀번호확인<span class="text-color-red">*</span>
					</label>
					<div class="col-sm-7">
						<input type="password" class="form-control" name="repassword" id="repassword" placeholder="비밀번호를 한번 더 입력해주세요">
					</div>

					<div id="repasswdMsg" class="error">비밀번호 확인을 입력해 주세요.</div>
					<div id="repasswdMatchMsg" class="error">동일한 비밀번호를 입력해주세요.</div>

				</div>

				<div class="form-group row px-2">
					<label for="name" class="col-sm-3 col-form-label"> 이름<span class="text-color-red">*</span>
					</label>
					<div class="col-sm-7">
						<input type="text" class="form-control" name="name" id="name" placeholder="이름을 입력해주세요">
					</div>

					<div id="nameMsg" class="error">이름을 입력해 주세요.</div>

				</div>

				<div class="form-group row px-2">
					<label for="email" class="col-sm-3 col-form-label"> 이메일<span class="text-color-red">*</span>
					</label>
					<div class="col-sm-7">
						<input type="text" class="form-control" name="email" class="email" id="email" placeholder="예: marketsally@sally.com">
					</div>
					<div class="col-sm-2 px-1 my-auto">
						<span class="btn default" id="emailCheck">중복확인</span>
					</div>

					<div id="emailMsg" class="error">이메일을 입력해 주세요.</div>
					<div id="emailRegMsg" class="error">올바른 이메일 주소를 입력해해주세요.</div>
					<div id="example_email" class="error">예시 : marketsally@gmail.com</div>
					<div id="emailCheckMsg" class="error">이메일 중복확인</div>

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

					<div id="mobileMsg" class="error">전화번호를 입력해 주세요.</div>
					<div id="mobileRegMsg" class="error">11~12자리 숫자로만 입력해 주세요.</div>
				</div>

				<div class="form-group row px-2">
					<label for="zipcode" class="col-sm-3 col-form-label"> 주소<span class="text-color-red">*</span>
					</label>


					<div class="col-sm-7">
						<input type="text" class="form-control" name="address" id="address" readonly="readonly" placeholder="주소를 검색해주세요."><br>
						<input type="text" class="form-control" name="zipcode" id="zipcode" size="7" readonly="readonly" placeholder="번지를 검색해 주세요.">
					</div>
					<div class="col-sm-2 px-0">
						<span class="btn default address_no" data-text="재검색" id="addressNo">주소 검색</span>
					</div>

					<div id="addressMsg" class="error">번지 또는 주소를 검색해주세요.</div>
					<div id="addressEmpty" class="error">상세 주소를 입력해주세요.</div>

				</div>


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

<script type="text/javascript" src="${pageContext.request.contextPath}/js/join.js"></script>

<%@include file="/WEB-INF/views/include/footer.jsp"%>