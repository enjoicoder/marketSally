/**
 * 
 */


function getContextPath() {
    var hostIndex = location.href.indexOf( location.host ) + location.host.length;
    return location.href.substring( hostIndex, location.href.indexOf('/', hostIndex + 1) );
};
/* 모달창 수량조절 및 합계 계산 */
$(".cartPlus_btn").on("click", function(){
	let qty = $(this).parent("div").find("input").val();
	let price = $("#modal-prodPrice").text();
	
	$(this).parent("div").find("input").val(++qty);
	$("#modal-sumPrice").text(qty * price);
});
$(".cartMinus_btn").on("click", function(){
	let qty = $(this).parent("div").find("input").val();
	let price = $("#modal-prodPrice").text();
	if(qty > 1){
		$(this).parent("div").find("input").val(--qty);
		$("#modal-sumPrice").text(qty * price);
	}
	
});

// 장바구니 상품 추가 Ajax 사용
$("#modal-insertCart").on("click", function(){
	let prodimg = $(this).data("prodimg");
	let prodName = $(this).data("prodname");
	let cart = {
		 prodId :$(this).data("prodid")
		,qty :$(this).parent("div").find("input").val()
	}
	
	$('#cartModal').modal('hide')
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

// 장바구니 모달창 데이터 집어넣기
$(".cart").on("click", function() {
	let prodId = $(this).data("prodid");
	let prodName = $(this).data("prodname");
	let prodPrice = $(this).data("prodprice");
	let prodimg = $(this).data("prodimg");
	$("#modal-prodName").text(prodName);
	$("#modal-prodPrice").text(prodPrice);
	$("#modal-sumPrice").text(prodPrice);
	$("#modal-insertCart").data("prodid", prodId);
	$("#modal-insertCart").data("prodimg", prodimg);
	$("#modal-insertCart").data("prodname", prodName);
});
