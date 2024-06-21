<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div class="modal fade" id="reviewModal" data-backdrop="static" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
	<div class="modal-dialog modal-lg modal-dialog-centered modal-dialog-scrollable">
		<div class="modal-content">
			<div class="modal-header">
				<h4 class="modal-title" id="exampleModalLabel">상품 후기</h4>
				<button type="button" class="close" data-dismiss="modal" aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<div class="modal-body">
				<img id="modal-prodImg" class="admin_product_img" src="">
				<h4 id="modal-prodName" class="d-inline-flex p-2"></h4>
				<form id="insertReviewForm" method="post" action="${contextPath}/reviewInsert.do" enctype="multipart/form-data">
					<div class="form-group">
						<input type="hidden" id="insert-Review-prod-detail" name="proddetail" value="n">
						<input type="hidden" id="prod_id" name="prodId" value="">
						<label for="review_title" class="col-form-label">제목:</label>
						<input type="text" class="form-control" name="reviewTitle">
					</div>
					<!-- File Button -->
					<div class="form-group">
						<label class="control-label" for="filebutton">리뷰이미지</label>
						<input name="reviewImg" class="input-file" type="file">
					</div>
					<div class="form-group">
						<label for="review_cont" class="col-form-label">내용:</label>
						<textarea class="form-control" name="reviewCont" style="height: 300px;"></textarea>
					</div>
				</form>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>
				<button type="button" id="insertReviewFormBtn" class="btn btn-primary" type="submit">등록</button>
			</div>
		</div>
	</div>
</div>