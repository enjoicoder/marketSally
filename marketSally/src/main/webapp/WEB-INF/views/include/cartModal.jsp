<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- 장바구니모달창 -->
<div class="modal fade" id="cartModal" tabindex="-1" aria-labelledby="cartModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered" style="width: 450px;">
    <div class="modal-content">
      <div class="modal-body">
      <br><br>
	      <p class="col-7 float-left thick py-0">
	     <span id="modal-prodName" class="info"></span><br>
	     <span id="modal-prodPrice"></span>원</p>
	       <div class="text-center quantity_div col-5 float-right">
				<button class="btn btn-outline-secondary cartQty_btn cartMinus_btn">-</button>
				<input type="text" value="1" class="cartQty_input form-control d-inline-flex" style="width: 50px;">	
				<button class="btn btn-outline-secondary cartQty_btn cartPlus_btn">+</button>
			</div>
			<br><br><br><br>
			<div>
			<p class="text-left font-weight-bold">&nbsp;&nbsp; 합계 <span class="float-right mr-2"><span id="modal-sumPrice" class="text-lg"></span>원</span></p>
			</div>
        <button type="button" class="btn cart-btn-order b-btn my-2 ml-2" style="width: 200px;" data-dismiss="modal">취소</button>
		<button type="button" class="btn cart-btn-order w-btn" id="modal-insertCart" data-prodid="" style="width: 200px;">장바구니담기</button>
      </div>
    </div>
  </div>
</div>
<!-- /장바구니모달창 -->