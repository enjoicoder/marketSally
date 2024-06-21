<%@page import="kr.or.marketsally.member.vo.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/views/include/header.jsp"%>
<!-- 
css 적용은 해당페이지이름.css 로 css폴더에 작성 후 style.css 에서 주소 import 작성
html,body 태그 작성 X
-->

<!-- 해당페이지 작성부분 시작 -->
<script>

<%
		
	// JSP문서에서 세션은 'session'이라는 이름으로 이미 생성되어 저장되어 있다.
	MemberVO memVo = (MemberVO)session.getAttribute("sessionMember");
	
%>

<%
if(memVo != null){ // 로그인 성공 했을 때
%>
location.href = "<%=request.getContextPath()%>/index.jsp";
<%
}
%>

$(function(){
	
	// 회원가입 페이지로 이동
	$("#loginJoin").on("click", function(){
		 location.href='${contextPath}/member/join_test.jsp';
	}) // 페이지 이동 끝...
	
	// 아이디 찾기 모달 시작
	$('#findId').on('click', function(){
	   $("#findIdbyName").empty();
	   $("#findIdbyEmail").empty();
	   
	   nameval = $('#findIdbyName').val().trim();
	   emailval = $('#findIdbyEmail').val().trim();
	   
	   if(nameval.length < 1 && emailval.length < 1){
		   alert("빈칸을 채워주세요.")
	      return false;
	   }else if(nameval.length < 1){
	      alert("이름을 입력해주세요.");
	      return false;
	   }else if(emailval.length < 1){
		   alert("이메일을 입력해주세요.");
		   return false;
	   }
		
	   $.ajax({
	      url : "${contextPath}/findIdSally.do",
	      data : {"name" : nameval,
	    	  	  "email" : emailval },
	      type : "get",
	      dataType: 'json',
	      success: function(res){
			  fid = "회원님의 아이디는 " + res + " 입니다."
	    	  $('#residfind').html(fid);		         
	      },
	      
	      error: function(xhr){
	         alert("상태: " + xhr.status);
	      }
	      
	   })     
	}) // 아이디 찾기 모달 끝..
	
	// 비밀번호 찾기 모달 시작
	$('#findPass').on('click', function(){
	   $("#findPassbyId").empty();
	   $("#findPassbyEmail").empty();
	   
	   idval = $('#findPassbyId').val().trim();
	   emailval = $('#findPassbyEmail').val().trim();
	   
	   if(idval.length < 1 && emailval.length < 1){
		   alert("빈칸을 채워주세요.")
	      return false;
	   }else if(idval.length < 1){
	      alert("아이디를 입력해주세요.");
	      return false;
	   }else if(emailval.length < 1){
		   alert("이메일을 입력해주세요.");
		   return false;
	   }
		
	   var temp = "";
	   temp1 = String.fromCharCode(Math.random()*26+97);
	   temp2 = parseInt(Math.random()*9+1);
	   temp3 = String.fromCharCode(Math.random()*26+65);
	   temp4 = parseInt(Math.random()*9+1);
	   temp = temp1 + temp2 + temp3 + temp4;	   
	   $.ajax({
	      url : "${contextPath}/tempPass.do",
	      data : {"id" : idval,
	    	  	  "email" : emailval,
	    	  	  "temp" : temp},
	      type : "get",
	      dataType: 'json',
	      success: function(res){
			 alert(res);	         
	      },
	      
	      error: function(xhr){
	         alert("상태: " + xhr.status);
	      }
	      
	   })     
	}) // 아이디 찾기 모달 끝..
	
})

</script>
<section class="vh-80">
	<div class="container py-5 h-100">
		<div class="row d-flex align-items-center justify-content-center h-100">

			<div class="col-md-5 col-lg-4 col-xl-4 mx-auto">
				<h5 class="text-center font-weight-bold">로그인</h5>
				
				<form action="<%=request.getContextPath() %>/loginSally.do" method="post" id="login">
					<div class="form-outline mb-4 mt-4">
						<input type="text" id="login-id" name = "id" class="form-control form-control-lg text-sm" size="20" placeholder="아이디를 입력해주세요" aria-describedby="feedback" required/>
					</div>

					<div class="form-outline mb-4">
						<input type="password" id="login-pass" name = "pass" class="form-control form-control-lg" size="20" placeholder="비밀번호를 입력해주세요" aria-describedby="feedback" required/>
					</div>
					<div class="d-flex justify-content-end align-items-center mb-4">
						<a href="!#" class="link_menu" data-toggle="modal" data-target="#IdFind">아이디찾기 </a>
						<span class="mx-1">|</span>
						<a href="!#" class="link_menu" data-toggle="modal" data-target="#PassFind">비밀번호찾기 </a>
					</div>
					
					
					<button type="submit" class="btn btn-primary btn-lg btn-block" id="loginBtn">로그인</button>
					<button type="button" class="btn btn-primary btn-lg btn-block" id="loginJoin">회원가입</button>

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
	
		   <!-- 아이디 찾기 모달 -->
    <div class="modal fade" id="IdFind">
       <div class="modal-dialog modal-lg">
         <div class="modal-content">
      
             <!-- Modal Header -->
           <div class="modal-header">
             <h4 class="modal-title">MarketSally 아이디 찾기</h4>
             <button type="button" class="close" data-dismiss="modal">&times;</button>
             </div>
        
             <!-- Modal body -->
           <div class="modal-body">
               
                	<p class="blank">
                  		<label>이름</label>
	                  	<input type="text" id ="findIdbyName">
                	</p>
                	<p class="blank">
                  		<label>이메일</label>
          			     <input type="text" id ="findIdbyEmail">
                	</p>
             		<div id="residfind"></div>
             </div>
        
             <!-- Modal footer -->
           <div class="modal-footer">
             	<input type="button" id ="findId" value="확인" class="btn btn-secondary">
           </div>
        
         </div>
       </div>
   </div>
   
	
	   <!-- 비밀번호 찾기 모달 -->
    <div class="modal fade" id="PassFind">
       <div class="modal-dialog modal-lg">
         <div class="modal-content">
      
             <!-- Modal Header -->
           <div class="modal-header">
             <h4 class="modal-title">MarketSally 비밀번호 찾기</h4>
             <button type="button" class="close" data-dismiss="modal">&times;</button>
             </div>
        
             <!-- Modal body -->
           <div class="modal-body">
               
                	<p class="blank">
                  		<label>아이디</label>
	                  	<input type="text" id ="findPassbyId">
                	</p>
                	<p class="blank">
                  		<label>이메일</label>
          			     <input type="text" id ="findPassbyEmail">
                	</p>
                	<div id="respassfind"></div>
             </div>
        
             <!-- Modal footer -->
           <div class="modal-footer">
             	<input type="button" id = "findPass" value="확인" class="btn btn-secondary">
           </div>
        
         </div>
       </div>
   </div>
</section>

<style>
	.modal-header h4{
		text-align: center;
	}

	.modal-content{
		width : 500px;
		margin : 140px auto;
	}

	.modal .blank{
		padding :4px;
		padding-left : 100px;
	}

	.modal-body label{
		display : inline-block;
		width : 50px;
		height : 20px;
	}
	
	#residfind, #respassfind{
		padding-left : 130px;
	}
</style>

<!-- 해당페이지 작성부분 끝 -->

<%-- 스크립트 적용시 아래에 예시처럼 해당위치에 작성
<script type="text/javascript" src="${pageContext.request.contextPath}/js/해당페이지이름.js"></script> 
--%>
<%-- <script type="text/javascript" src="${pageContext.request.contextPath}/js/logOn.js"></script> --%>
<%@include file="/WEB-INF/views/include/footer.jsp"%>