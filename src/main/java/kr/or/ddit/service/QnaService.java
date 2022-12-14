package kr.or.ddit.service;

import kr.or.ddit.domain.qna.Qna;
import kr.or.ddit.domain.qna.QnaVO;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

public interface QnaService {

	//문의게시판 행의 수 계산
	int getQnaTotalRow();

	//문의게시판 등록
	void qnaSave(Qna qna);

	//문의게시판/검색결과 리스트 출력
	List<Qna> showList();

	// 문의게시판 게시글 검색
	Qna findOne(Long qnaCd);

	//게시글 삭제
    int deleteQ(int qnaCd);

}
