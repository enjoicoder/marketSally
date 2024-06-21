<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!-- 상품문의작성 모달창 -->
<div class="modal fade" id="prodQnaModal" data-backdrop="static" tabindex="-1" aria-labelledby="prodQnaModalLabel" aria-hidden="true">
	<div class="modal-dialog modal-lg modal-dialog-centered modal-dialog-scrollable">
		<div class="modal-content">
			<div class="modal-header">
				<h4 class="modal-title" id="prodQnaModalLabel">상품 문의</h4>
				<button type="button" class="close" data-dismiss="modal" aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<div class="modal-body">
				<img id="prodQna-modal-prodImg" class="admin_product_img" src="">
				<h4 id="prodQna-modal-prodName" class="d-inline-flex p-2"></h4>
				<form id="prodQnaForm" method="post" action="${contextPath}/ProdQnaInsert.do">
					<div class="form-group">
						<input type="hidden" id="prodQna-prod_id" name="prodQnaProdId" value="">
						<label for="review_title" class="col-form-label">제목:</label>
						<input type="text" class="form-control" name="prodQnaTitle" id="prodQnaTitle">
					</div>
					<div class="form-group">
						<label for="prodQna_cont" class="col-form-label">내용:</label>
						<textarea class="form-control" name="prodQnaCont" id="prodQnaCont" style="height: 300px;"></textarea>
					</div>
					<div class="form-group" id="prodQna_Aform">
						<input type="hidden" id="prodQna-mem_id" name="prodQnaMemId" value="">
						<label for="prodQna_Acont" class="col-form-label">답변:</label>
						<textarea class="form-control" name="prodQnaACont" id="prodQnaACont" style="height: 300px;"></textarea>
					</div>
				</form>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>
				<button type="button" id="insertProdQnaFormBtn" class="btn btn-primary" type="submit">등록</button>
				<button type="button" id="updateProdQnaFormBtn" class="btn btn-primary" type="submit">수정</button>
				<button type="button" id="answerProdQnaFormBtn" class="btn btn-primary" type="submit">답변</button>
			</div>
		</div>
	</div>
</div>
<!-- /상품문의작성 모달창 -->