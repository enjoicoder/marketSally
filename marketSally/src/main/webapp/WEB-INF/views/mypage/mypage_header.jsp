<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div id="mypage-header" class="py-4">

	<div class="container d-flex justify-content-between">
		<div class="col-md-4 mypage-header-box p-4">
			<br>
			<div class="mypage-grade float-left mr-3">${sessionGrade.grade}</div>
			<h5 class="mt-2 font-weight-bold">${sessionMember.mem_name}님</h5>
			<br>
			<p>
				적립 ${sessionGrade.gradeNum}%<br> 최초 1회 무료배송
			</p>
		</div>

		<div class="col-md-4 mypage-header-box mx-2 p-4">
			<br>
			<p>적립금 ></p>
			<br>
			<h5 class="mt-2 font-weight-bold text-color-purple">${sessionMember.mem_point}원</h5>
		</div>

		<div class="col-md-4 mypage-header-box mx-2 p-4">
			<br>
			<p>쿠폰 ></p>
			<br>
			<h5 class="mt-2 font-weight-bold text-color-purple">0개</h5>
		</div>
	</div>

</div>