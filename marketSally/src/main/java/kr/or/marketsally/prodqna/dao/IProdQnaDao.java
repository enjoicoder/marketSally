package kr.or.marketsally.prodqna.dao;

import java.util.List;

import kr.or.marketsally.prodqna.vo.ProdQnaVO;


public interface IProdQnaDao {

	// 상품QnA 리스트 출력
	public List<ProdQnaVO> selectProdQnaList(ProdQnaVO prqnVO);

	// 상품QnA 객체 출력
	public ProdQnaVO selectProdQna(ProdQnaVO prqnVO);
	
	// 상품QnA 추가
	public void insertProdQna(ProdQnaVO prqnVO);
	
	// 상품QnA 삭제
	public void deleteProdQna(ProdQnaVO prqnVO);
	
	// 상품QnA 수정
	public void updateProdQna(ProdQnaVO prqnVO);

	// 상품QnA 답변
	public void answerProdQna(ProdQnaVO prqnVO);
}
