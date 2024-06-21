<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/views/include/header.jsp"%>
<!-- 
css 적용은 해당페이지이름.css 로 css폴더에 작성 후 style.css 에서 주소 import 작성
html,body 태그 작성 X
-->

<!-- 해당페이지 작성부분 시작 -->

<style>
#pay_page {
	width: 1000px;
	margin: 0 auto;
	text-align: center;
}

#pay_title {
	font-size: 1.5em;
	font-weight: bold;
	text-align: center;
}

.checkout-total-price {
	border-top: 1px solid #dcdcdc;
	font-weight: bold;
	font-size: 1.2em;
}

table {
	margin: 70px auto;
	border: none;
	border-collapse: collapse;
	text-align: left;
	line-height: 30px;
}

th {
	border-bottom: 1px solid black;
	font-size: 1.2em;
	padding-top: 15px;
	padding-bottom: 15px;
	padding-left: none;
	padding-right: none;
}

td {
	border-bottom: 1px solid #dcdcdc;
	text-align: left;
	padding-top: 10px;
	padding-bottom: 10px;
	padding-left: none;
	padding-right: none;
	font-size: 0.9em;
}

.noline {
	border-bottom: none;
}

.second {
	border: none;
	background-color: #fafafa;
	padding: 15px;
	line-height: 20px;
}

.second2 {
	border: none;
	background-color: #fafafa;
	padding: 15px;
	line-height: 20px;
}


</style>
<c:set var="cartPrice" value="0" />
<c:set var="cartId" value="${cartList[0].cart_id}" />
<div id="pay_page">
	<br> <br>
	<div id="pay_title">주문서</div>
	<form action="${contextPath}/orderCheckout.do" method="post" id="pay">

		<table>
			<tr>
				<th colspan="4">주문상품</th>
			</tr>
			<c:forEach var="item" items="${cartList}">
				<tr>

					<td width="100">
						<img class="product_img" src="${contextPath}/img/product/${item.prod_img}" alt="${item.prod_img}">
					</td>


					<td class="thick" width="680">${item.prod_name}</td>


					<td width="100">${item.order_detail_qty}개</td>

					<fmt:formatNumber maxFractionDigits="3" value="${item.prod_price*item.order_detail_qty}" type="number" var="sum_price" />
					<td class="thick" style="text-align: right;" width="120">${sum_price}원</td>
				</tr>
				<c:set var="cartPrice" value="${cartPrice + item.prod_price*item.order_detail_qty}" />
				
			</c:forEach>

		</table>
		<table>
			<tr>
				<th colspan="2">주문자 정보</th>
			</tr>
			<tr>
				<td class="noline font-weight-bold" width="200">받으실 분</td>
				<td class="noline" width="800">${sessionMember.mem_name}</td>
			</tr>
			<tr>
				<td class="noline font-weight-bold" width="200">휴대폰</td>
				<td class="noline" width="800">${sessionMember.mem_tel}</td>
			</tr>
			<tr>
				<td class="noline font-weight-bold" width="200">
					이메일<br> <br>
				</td>
				<td class="noline" width="800">
					<br>${sessionMember.mem_email}<br> <span class="info">이메일을 통해 주문처리 과정을 보내드립니다.<br> 정보 변경은 마이컬리>개인정보 수정 메뉴에서 가능합니다.
					</span>
				</td>
			</tr>
		</table>

		<table>
			<tr>
				<th colspan="2">배송 정보</th>
			</tr>
			<tr>
				<td class="noline font-weight-bold" width="200">
					배송지 <br>
				</td>
				<td class="noline" width="800">
					<br> ${sessionMember.mem_add}
					<input type=hidden name="order_add" value="${sessionMember.mem_add}">
					<br> <span class="purple">샛별배송</span><br>
				</td>

			</tr>

		</table>

		<div style="width: 70%; float: left;">
			<table>
				<tr>
					<th colspan="2">쿠폰 / 적립금</th>
				</tr>
				<tr>
					<td class="font-weight-bold" width="200">
						쿠폰 적용 <br> <br>

					</td>
					<td width="800">
						<select class="form-control">
							<option>사용안함</option>
							<option>첫 가입 10% 할인 쿠폰</option>
							<option>3</option>
							<option>4</option>
							<option>5</option>
						</select>
						<span class="purple">&nbsp;쿠폰사용문의(카카오톡)</span>
					</td>
				</tr>

				<tr>
					<td class="noline font-weight-bold" width="200">
						적립금 적용 <br> <br> <br>

					</td>
					<td width="800" class="noline">
						<input id="input-point" class="form-control w-50 d-inline" type="text" onchange="change();">
						<button type="button" class="btn btn-outline-primary ml-2">모두사용</button>
						<span class="info"> <br>사용가능 적립금 <span class="font-weight-bold">${sessionMember.mem_point}</span>원 <br>적립금 내역: 마이셀리>적립금
						<input type="hidden" id="payPoint" name="pay_point" value="0">
						</span>
					</td>
				</tr>
			</table>

			<table>
				<tr>
					<th colspan="2">결제 수단</th>
				</tr>
				<tr>
					<td class="noline font-weight-bold" width="200">결제수단 선택</td>
					<td class="noline" width="500">
						<img src="${contextPath}/img/kakaoPay_btn.PNG" style="width: 300px; height: 40px;">
					</td>
				</tr>
				<tr>
					<td colspan="2" class="noline" width="700">
						<span class="info">※ 카카오페이 결제 시, 결제하신 수단으로만 환불되는 점 양해부탁드립니다.<br> ※고객님은 안전거래를 위해 현금 등으로 결제시 저희 쇼핑몰에서 가입한토스 페이먼츠의 구매안전(에스크로)서비스를 이용하실수 있습니다.
						</span>
					</td>
				</tr>
			</table>
		</div>
		<div style="width: 30%; float: right;" class="make-me-sticky px-0">

			<table class="px-0 mx-3 w-100">
				<tr>
					<th colspan="2">결제 금액</th>
				</tr>
				<tr>
					<td class="second" width="130">주문금액</td>
					<td style="text-align: right;" class="second2" width="100">
						<fmt:formatNumber maxFractionDigits="3" value="${cartPrice}" type="number" />
						원
					</td>
				</tr>
				<tr>

					<td class="second" width="100">배송비</td>
					<td style="text-align: right;" class="second" width="80"><span id="orderCalParam1">3000</span>원</td>
				</tr>
				<tr>
					<td class="second" width="100">쿠폰할인</td>
					<td style="text-align: right;" class="second" width="80"><span id="orderCalParam2">0</span>원</td>
				</tr>
				<tr>
					<td class="second" width="100">적립금사용</td>
					<td style="text-align: right;" class="second" width="80"><span id="orderCalParam3">0</span>원</td>
				</tr>
				<tr>
					<td class="second checkout-total-price" width="100">최종결제 금액</td>
					<td style="text-align: right;" class="second2 checkout-total-price" width="80"><span class="order-amount-calc-res"></span>원</td>
				</tr>

			</table>
			<input type="hidden" id="payAmount" name="pay_amount" value="0">
			<input type="hidden" name="cart_id" value="${cartId}">
			<input type="hidden" name="mem_id" value="${sessionMember.mem_id}">
			<input type="hidden" name="mem_grade" value="${sessionMember.mem_grade}">
		</div>
		<div style="clear: both">
			<table>
				<tr>
					<th>개인정보 수집/제공</th>
				</tr>
				<tr>
					<th class="noline" width="1000"><label><input type="checkbox" id="ckBox"> &nbsp;결제진행 필수 동의 </label></th>
				</tr>
			</table>
		</div>
		<div>

			<button type="button" id="btn_order_pay" class="cart-btn-order w-btn text-center"><span class="order-amount-calc-res"></span>원 결제하기</button>

		</div>
		<br> <br>
	</form>
</div>
<script type="text/javascript">
$(function() {
	let amount = 0;
	$("#input-point").val('0');
	let price = parseInt("${cartPrice}"); //주문금액
	let delivery = parseInt($("#orderCalParam1").text()); // 배송비
	let coupon = parseInt($("#orderCalParam2").text()); // 쿠폰할인
	let point = parseInt($("#orderCalParam3").text()); // 적립금사용
	amount = price + delivery - coupon - point;
	$(".order-amount-calc-res").text(amount);
	change();

	
	var IMP = window.IMP; // 생략가능
    IMP.init('imp80335303'); // 'iamport' 대신 부여받은 "가맹점 식별코드"를 사용
    var msg;
    $("#btn_order_pay").click(function(e) {
    	if($('#ckBox').is(':checked')){
    		$("#payAmount").val($("#btn_order_pay .order-amount-calc-res").text()); 
        	$("#payPoint").val($("#orderCalParam3").text()); 
        	
        	 IMP.request_pay({
                 pg : 'kakaopay',
                 pay_method : 'card',
                 merchant_uid : 'merchant_' + new Date().getTime(),
                 name : '마켓셀리 주문',
                 amount : $("#payAmount").val(),
                 buyer_email : '${sessionMember.mem_email}',
                 buyer_name : '${sessionMember.mem_name}',
                 buyer_tel : '${sessionMember.mem_tel}',
             }, function(rsp) {
                 if ( rsp.success ) { //결제성공시
                 	 msg = '결제에 성공하였습니다.';
                      alert(msg);
                      $("#pay").submit();
                    
                 } else {
                     msg = '결제에 실패하였습니다.';
                     msg += '에러내용 : ' + rsp.error_msg;
                     //실패시 이동할 페이지
                     alert(msg);
                 }
             });
    	}
    	
    	
	})
	
});

// 수량 음수 방지 및 총금액 반영
function change() {
	let ipoint = $("#input-point");
	if (ipoint.val() < 0) {
		ipoint.val('0');
		init();
	}else if(ipoint.val() > ${sessionMember.mem_point}){
		ipoint.val('${sessionMember.mem_point}');
		init();
	}else {
		init();
		
	}
}
function init() {
	let ipoint = $("#input-point");
	$("#orderCalParam3").text(ipoint.val());
	
	let price = parseInt("${cartPrice}"); //주문금액
	let delivery = parseInt($("#orderCalParam1").text()); // 배송비
	let coupon = parseInt($("#orderCalParam2").text()); // 쿠폰할인
	let point = parseInt($("#orderCalParam3").text()); // 적립금사용
	let amount = price + delivery - coupon - point;
	$(".order-amount-calc-res").text(amount);
}
</script>





<!-- 해당페이지 작성부분 끝 -->

<%-- 스크립트 적용시 아래에 예시처럼 해당위치에 작성
<script type="text/javascript" src="${pageContext.request.contextPath}/js/해당페이지이름.js"></script> 
--%>
<%@include file="/WEB-INF/views/include/footer.jsp"%>