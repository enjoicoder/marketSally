// 판매가격
var sell_price;
// 수량
var qty;

// init 구매수량 초기화설정
$(function() {
	sell_price = document.form.sell_price.value;
	qty = document.form.qty.value;
	document.form.sum.value = sell_price;
	change();
});
// 수량 음수 방지 및 총금액 반영
function change() {
	qty = document.form.qty;
	sum = document.form.sum;

	if (qty.value < 1) {
		qty.value = 1;
	} else {
		let price = qty.value * sell_price;
		sum.value = price.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',');
	}

}
// 수량 더하기
function add() {
	qty = document.form.qty;
	sum = document.form.sum;
	qty.value++;

	let price = qty.value * sell_price;
	sum.value = price.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',');
}

// 수량 빼기
function sub() {
	qty = document.form.qty;
	sum = document.form.sum;
	if (qty.value > 1) {
		qty.value--;
		let price = qty.value * sell_price;
		sum.value = price.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',');
	}
}

// 장바구니 상품 추가 Ajax 사용
$("#cart_put").on("click", function(){
	let prodimg = $(this).data("prodimg");
	let prodName = $(this).data("prodname");
	let cart = {
		 prodId :$(this).data("prodid")
		,qty : document.form.qty.value
	}
	
	$.ajax({
		type:"POST",
		url:getContextPath()+"/insertCartProd.do",
		data:cart,
		success: function(res){
			if(res == "1"){
				$('#toast-img').attr({ src: getContextPath()+"/img/product/"+prodimg });
				$('#toast-prodName').text(prodName);				
				$('.toast').toast('show');
			}else{
				alert(res);
			}
		},
		error:function(xhr){
			alert("통신실패");
		}
		
	});

	
});
