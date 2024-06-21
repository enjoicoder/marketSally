<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/views/include/header.jsp"%>
<!-- 
css 적용은 해당페이지이름.css 로 css폴더에 작성 후 style.css 에서 주소 import 작성
html,body 태그 작성 X
-->

<!-- 해당페이지 작성부분 시작 -->

<section class="vh-80">
	<div class="container py-5 h-100">
		<div class="row d-flex align-items-center justify-content-center h-100">

			<div class="col-md-5 col-lg-4 col-xl-4 mx-auto">
				<h5 class="text-center font-weight-bold">로그인</h5>
				
				<form>
					<div class="form-outline mb-4 mt-4">
						<input type="text" id="login-id" class="form-control form-control-lg text-sm" size="20" placeholder="아이디를 입력해주세요" aria-describedby="feedback" required/>
					</div>

					<div class="form-outline mb-4">
						<input type="password" id="login-pass" class="form-control form-control-lg" size="20" placeholder="비밀번호를 입력해주세요" aria-describedby="feedback" required/>
					</div>
					<div class="d-flex justify-content-end align-items-center mb-4">
						<a href="#!" class="link_menu">아이디찾기 </a>
						<span class="mx-1">|</span>
						<a href="#!" class="link_menu">비밀번호찾기 </a>
					</div>
					
					
					<button type="button" class="btn btn-primary btn-lg btn-block" id="loginBtn2">로그인Test</button>
					<button type="submit" class="btn btn-primary btn-lg btn-block" id="loginBtn">로그인</button>
					<button type="button" class="btn btn-primary btn-lg btn-block" id="loginJoin">회원가입</button>
<script type="text/javascript">
$("#loginBtn2").on("click", function() {
	window.location.href = "${pageContext.request.contextPath}/TestLogin.do";
})
</script>
					<div class="divider d-flex align-items-center my-4">
						<p class="text-center fw-bold mx-3 mb-0 text-muted">OR</p>
					</div>

					<a class="btn btn-primary btn-lg btn-block" style="background-color: #3b5998" href="#!" role="button">
						<i class="fab fa-facebook-f me-2"></i>페이스북 로그인
					</a>
					<a class="btn btn-primary btn-lg btn-block" style="background-color: #55acee" href="#!" role="button">
						<i class="fab fa-twitter me-2"></i>트위터 로그인
					</a>

				</form>
			</div>
		</div>
	</div>
</section>





<!-- 해당페이지 작성부분 끝 -->

<%-- 스크립트 적용시 아래에 예시처럼 해당위치에 작성
<script type="text/javascript" src="${pageContext.request.contextPath}/js/해당페이지이름.js"></script> 
--%>

<%@include file="/WEB-INF/views/include/footer.jsp"%>