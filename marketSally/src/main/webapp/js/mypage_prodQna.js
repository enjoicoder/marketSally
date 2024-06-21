/**
 * 
 */
	function getContextPath() {
		var hostIndex = location.href.indexOf(location.host)
				+ location.host.length;
		return location.href.substring(hostIndex, location.href.indexOf('/',
				hostIndex + 1));
	};
	
	//상품문의 수정
	$("#updateProdQnaFormBtn").on("click", function() {
		$('#prodQnaForm').attr('action', getContextPath() + '/myProdQnaUpdate.do');
		prodQnaForm.submit();
	});
	
	//상품문의 삭제
	$(".ProdQna-delete").on("click", function() {
		let prodId = $(this).data("prodid");
		let prodImg = $(this).data("prodimg")
		let prodName = $(this).data("prodname")
		$('#prodQna-modal-prodImg').attr({
			src : getContextPath() + "/img/product/" + prodImg
		});
		$('#prodQna-modal-prodName').text(prodName);
		$('#prodQna-prod_id').val(prodId);
		
		Swal.fire({
			   text: '삭제하시겠습니까?',
			   
			   showCancelButton: true, 
			   confirmButtonText: '삭제', 
			   cancelButtonText: '취소', 
			   
			   reverseButtons: true, 
			   
			}).then(result => {
			   if (result.isConfirmed) { 
					$(".prodQnaDelete_prodId").val(prodId);
					$(".prodQna_delete_form").submit();
			   }
			});
	});

	//상품문의 수정창 열기
	$(".ProdQna-update").on("click", function() {
		let prodId = $(this).data("prodid")
		let prodImg = $(this).data("prodimg")
		let prodName = $(this).data("prodname")
		$('#prodQna-modal-prodImg').attr({
			src : getContextPath() + "/img/product/" + prodImg
		});
		$('#prodQna-modal-prodName').text(prodName);
		$('#prodQna-prod_id').val(prodId);
		
		$('#insertProdQnaFormBtn').css("display", "none");
		$('#updateProdQnaFormBtn').css("display", "block");
		$('#answerProdQnaFormBtn').css("display", "none");
		$('#prodQna_Aform').css("display", "none");
		
		// disabled 삭제
		$("#prodQnaTitle").removeAttr("disabled"); 
		$("#prodQnaCont").removeAttr("disabled"); 
			
		$.ajax({
			type:"POST",
			url:getContextPath()+"/ProdQnaSelect.ajax",
			data: { prodId :$(this).data("prodid") },
			success: function(res){
				$('#prodQnaTitle').val(res.prqa_title);
				$('#prodQnaCont').val(res.prqa_qcont);
			},
			error:function(xhr){
				alert("통신실패");
			}
		});
		
		$('#prodQnaModal').modal('show')
	});