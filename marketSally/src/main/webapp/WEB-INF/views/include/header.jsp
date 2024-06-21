<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%> 

<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<!-- Favicon 설정 -->
<link rel="shortcut icon" href="${contextPath}/img/favicon-16x16.png">
<link rel="icon" type="image/png" sizes="16x16"  href="${pageContext.request.contextPath}/img/favicon-16x16.png">
<meta name="msapplication-TileColor" content="#ffffff">
<meta name="theme-color" content="#ffffff">

<!-- jquery -->
<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<!-- Bootstrap CSS -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">
<!-- slick -->
<link rel="stylesheet" type="text/css" href="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.css" />
<!-- FontAwesome -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.2/css/all.min.css" integrity="sha512-1sCRPdkRXhBV2PBLUdRb4tMg1w2YPf37qatUFeS7zlBy7jJI8Lf4VHwWfZZfpXtYSLy85pkm9GaYVYMfw5BC1A==" crossorigin="anonymous" referrerpolicy="no-referrer" />
<!-- SweetAlert2 -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.css">
<!-- 카카오 결제API -->
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>


<link rel="stylesheet" type="text/css" href="${contextPath}/css/style.css">

<title>Maketsally</title>
</head>


<body>
	<!-- 헤더 -->
	<div class="container">
		<ul class="nav justify-content-end nav-sm">
		<!-- JSTL if-else문 주석처리 나중에 사용예정 -->
			<c:choose>
				<c:when test="${!empty sessionMember}">
				<script> let memId =${sessionMember.mem_id}; </script>
					<li class="nav-item dropdown">
					<a class="nav-link dropdown-toggle link_menu" data-toggle="dropdown" role="button" aria-expanded="false">${sessionMember.mem_name} 님,환영합니다.</a>
						<div class="dropdown-menu dropdown-menu-right">
							<a class="dropdown-item dropfont" href="${contextPath}/mypage_order.do">주문내역</a>
							<a class="dropdown-item dropfont" href="${contextPath}/ProdLike.do">찜한상품</a>
							<a class="dropdown-item dropfont" href="${contextPath}/mypage_review.do">상품후기</a>
							<a class="dropdown-item dropfont" href="${contextPath}/mypage_prodQna.do">상품문의</a>
							<a class="dropdown-item dropfont" href="#">쿠폰</a>
							<a class="dropdown-item dropfont" href="#">개인정보수정</a>
							<a class="dropdown-item dropfont" href="${contextPath}/logoutSally.do">로그아웃</a>
							<a class="dropdown-item dropfont" href="${contextPath}/adminProd.do">관리자</a>
						</div></li>
				</c:when>
				
				<c:otherwise>
				<script> let memId = null; </script>
					<li class="nav-item"><a class="nav-link link_menu" href="${contextPath}/member/join_test.jsp">회원가입</a></li>
					<li class="nav-item"><a class="nav-link link_menu" href="${contextPath}/member/logOn.jsp">로그인</a></li>
			 	</c:otherwise>
				
			</c:choose>
			<li class="nav-item dropdown"><a class="nav-link dropdown-toggle link_menu" data-toggle="dropdown" href="#" role="button" aria-expanded="false">고객센터</a>
				<div class="dropdown-menu dropdown-menu-right">
					<a class="dropdown-item dropfont" href="${contextPath}/noticeList.do">공지사항</a>
					<a class="dropdown-item dropfont" href="${contextPath}/freqnaList.do">자주하는 질문</a>
					<a class="dropdown-item dropfont" href="${contextPath}/oneqnaList.do">1:1 문의</a>
				</div></li>
		</ul>
	</div>
	<a href="${contextPath}/index.jsp">
		<img id="logoimg" src="${contextPath}/img/임시로고.png" class="rounded mx-auto d-block h-auto" alt="임시로고.png">
	</a>
	<!-- Navbar -->
	<nav class="navbar shadow-sm sticky-top navbar-expand-lg navbar-light" id="navbarBack">
		<div class="container">
			<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNavDropdown" aria-controls="navbarNavDropdown" aria-expanded="false" aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>

			<div class="collapse navbar-collapse justify-content-between" id="navbarNavDropdown">
				<ul class="navbar-nav font-weight-bold ">
					<li class="nav-item dropdown active"><a class="nav-link dropdown-toggle mr-5" href="#" role="button" data-toggle="dropdown" aria-expanded="false">
							<i class="fa-solid fa-bars fa-lg mr-3"></i>전체 카테고리
						</a>
						<div class="dropdown-menu dropdown-menu-right dropdown-menu-lg-left">
							<a class="dropdown-item" href="${contextPath}/ProdList_Lprod.do?lprodId=1">채소</a>
							<a class="dropdown-item" href="${contextPath}/ProdList_Lprod.do?lprodId=2">과일·견과·쌀</a>
							<a class="dropdown-item" href="${contextPath}/ProdList_Lprod.do?lprodId=3">수산·해산·건어물</a>
							<a class="dropdown-item" href="${contextPath}/ProdList_Lprod.do?lprodId=4">정육·계란</a>
							<a class="dropdown-item" href="${contextPath}/ProdList_Lprod.do?lprodId=5">국·반찬·메인요리</a>
						</div></li>
					<li class="nav-item active mr-5"><a class="nav-link" href="${contextPath}/ProdList_New.do">신상품</a></li>
					<li class="nav-item active mr-5"><a class="nav-link" href="${contextPath}/ProdList_Best.do">베스트</a></li>
					<li class="nav-item active mr-5"><a class="nav-link" href="#">알뜰쇼핑</a></li>
					<li class="nav-item active"><a class="nav-link" href="#">특가/혜택</a></li>
				</ul>
				<form class="form-inline" method="get" action="${contextPath}/ProdSearch.do">
					<input class="form-control mr-sm-2" name="searched" type="search" placeholder="검색어를 입력해주세요." aria-label="Search">
					<button id="headerSearch" class="btn btn-outline-success my-2 my-sm-0" type="submit">
						<i class="fa fa-search"></i>
					</button>
				</form>

				<div>
					<i class="fa-regular fa-heart fa-2x icon mr-3"></i> 
					<i class="fa-solid fa-cart-shopping fa-2x icon"></i>
				</div>
			</div>
		</div>
		
		<!-- 장바구니토스트 -->
		<div aria-live="polite" aria-atomic="true" style="position: relative; min-height: 0px;">
		  <div class="toast" style="position: absolute; top: 40px; right: 390px; width: 300px; height: 90px;" data-delay="3000">
		    <div class="toast-body">
		    	<img id="toast-img" src="" class="float-left mx-2" alt="...">
		    	<div class="mt-2">
			    	<span class="info" id="toast-prodName"></span>
			      	<br>장바구니에 상품을 담았습니다.
		    	</div>
		    </div>
		  </div>
		</div>
		<!-- /장바구니토스트 -->
		
	</nav>
	<!-- /Navbar -->

	<script type="text/javascript">
		$(".fa-cart-shopping").on("click", function(){
			if(${empty sessionMember}){
				alert("로그인 후 이용해주세요.")
			}else{
				location.href= "${contextPath}/myCart.do";
			}
		})
		
		$(".fa-heart").on("click", function(){
			if(${empty sessionMember}){
				alert("로그인 후 이용해주세요.")
			}else{
				location.href= "${contextPath}/ProdLike.do";
			}
		})
	</script>
	<script type="text/javascript" src="${contextPath}/js/header.js"></script>

	<!-- /헤더 -->