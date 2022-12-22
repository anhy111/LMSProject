package kr.or.ddit.service;

import java.util.List;

import kr.or.ddit.domain.Counsel;

public interface CounselService {
	
	//학생의 상담신청 목록
	public List<Counsel> studentApplyList(int stuNo);
	//학생의 상담신청
	public int applyInsert(Counsel counsel);
	//학생의 담당 교수 목록
	public List<Counsel> listOfProfessor(int stuNo);
	//학생의 상담 내용 수정
	public int applyModify(Counsel counsel);
	//학생의 상담 삭제
	public int applyDelete(Long cnslCd);
	//교수의 상담목록 조회
	public List<Counsel> professorCounselList(int proNo);
	//교수의 비대면 상담답변
	public int applyAnswerUpdate(Counsel counsel);
	//교수의 비대면 답변상세
	public Counsel answerDetail(Long cnslCd);
	//해당글의 학생명
	public String studentNameByCounsels(Long cnslCd);
	//교수의 대면 상담 상세
	public Counsel answerNoteDetail(Long cnslCd);
	//교수의 대면 상담 작성 및 업데이트
	public int answerNoteWriteUpdate(Counsel counsel);


}
